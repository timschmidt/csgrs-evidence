    fn evolve(
        &self,
        report: &mut AdaptiveTaylorEvolution<N>,
        budget: &mut EnclosureBudget,
    ) -> Result<AdaptiveTaylorStatus, AdaptiveTaylorFailure> {
        budget.graph.charge(1)?;
        if self.options.minimum_order > self.options.maximum_order
            || self.options.maximum_order.checked_add(1).is_none()
        {
            return Err(AdaptiveTaylorFailure::InvalidOrderRange);
        }
        for (coordinate, limit) in self.options.remainder_limits.iter().enumerate() {
            budget.graph.charge(1)?;
            if !limit.is_singleton()
                || !matches!(
                    limit.signs(),
                    hyperinterval::SignSet::Zero | hyperinterval::SignSet::Positive
                )
            {
                return Err(AdaptiveTaylorFailure::InvalidRemainderLimit { coordinate });
            }
        }
        let mut cap = self.options.native.maximum_step.clone();
        let mut quality_halvings = 0;
        let mut native_records = 0usize;
        let mut refinements = 0usize;
        loop {
            budget.graph.charge(0)?;
            if !report.attempts.is_empty()
                && report.segments.len() == self.options.native.maximum_steps
            {
                return Err(EvolutionFailure::StepLimit {
                    limit: self.options.native.maximum_steps,
                }
                .into());
            }
            report.check_records(native_records, refinements, 1, budget)?;
            let start = report
                .reached_time()
                .checked_pow(1, &mut budget.arithmetic)?;
            let end = report.request.end.checked_pow(1, &mut budget.arithmetic)?;
            let initial = copy_state(
                report
                    .prefix_end_enclosure()
                    .unwrap_or(&report.request.initial),
                budget,
            )?;
            budget.graph.charge(1)?;
            let mut options = self.options.native.clone();
            options.maximum_steps = usize::from(self.options.native.maximum_steps != 0);
            options.maximum_step = cap.clone();
            // The first native search validates times/cap before empty/identity shortcuts.
            let search = self.field.integrate(
                EvolutionRequest {
                    start,
                    end,
                    initial,
                },
                options,
                budget,
            );
            let records = search.attempts().len().checked_add(search.segments().len());
            let a = report.attempts.len();
            report.attempts.push(AdaptiveTaylorAttempt {
                quality_halvings,
                search,
                refinements: Vec::new(),
            });
            native_records = records
                .and_then(|n| native_records.checked_add(n))
                .ok_or(ExpressionError::SizeExhausted)?;
            report.check_records(native_records, refinements, 0, budget)?;
            match report.attempts[a].search.status() {
                EvolutionStatus::Empty => {
                    budget.graph.charge(0)?;
                    return Ok(AdaptiveTaylorStatus::Empty);
                }
                EvolutionStatus::Identity => {
                    budget.graph.charge(0)?;
                    return Ok(AdaptiveTaylorStatus::Identity);
                }
                EvolutionStatus::Completed
                | EvolutionStatus::Stopped(EvolutionFailure::StepLimit { limit: 1 }) => {}
                EvolutionStatus::Stopped(e) => return Err(e.clone().into()),
            }
            let mut accepted = false;
            for order in self.options.minimum_order..=self.options.maximum_order {
                budget.graph.charge(
                    report
                        .programs
                        .len()
                        .checked_add(1)
                        .ok_or(ExpressionError::SizeExhausted)?,
                )?;
                let program = match report.programs.iter().position(|p| p.order() == order) {
                    Some(i) => i,
                    None => {
                        report.check_records(native_records, refinements, 1, budget)?;
                        let prepared = self.field.flow_taylor(order, budget)?;
                        budget.graph.charge(1)?;
                        let i = report.programs.len();
                        report.programs.push(prepared);
                        i
                    }
                };
                report.check_records(native_records, refinements, 1, budget)?;
                budget.graph.charge(1)?;
                let attempt = &mut report.attempts[a];
                let mut evidence = FlowTaylorEvidence::default();
                let status = match report.programs[program].verify(
                    attempt.search.segment(0).expect("accepted native prefix"),
                    &mut evidence,
                    budget,
                ) {
                    Ok(status) => status,
                    Err(e) => FlowTaylorStatus::Rejected(e),
                };
                let r = attempt.refinements.len();
                attempt.refinements.push(AdaptiveTaylorRefinement {
                    program,
                    evidence,
                    status,
                    magnitudes: None,
                    quality: None,
                });
                refinements = refinements
                    .checked_add(1)
                    .ok_or(ExpressionError::SizeExhausted)?;
                report.check_records(native_records, refinements, 0, budget)?;
                let refinement = &mut report.attempts[a].refinements[r];
                if let FlowTaylorStatus::Rejected(e) = &refinement.status {
                    return Err(e.clone().into());
                }
                let remainder = refinement
                    .evidence
                    .end_terms
                    .last()
                    .expect("positive-duration Taylor remainder")
                    .lanes()
                    .expect("nonempty remainder");
                budget.graph.check_entries(&[N, N])?;
                budget.graph.charge(N)?;
                let mut magnitudes = Vec::with_capacity(N);
                let mut quality = true;
                let zero = DyadicInterval::new(0.into(), 0.into(), 0)?;
                for (value, limit) in remainder.iter().zip(&self.options.remainder_limits) {
                    budget.graph.charge(1)?;
                    let magnitude = value.abs(&mut budget.arithmetic)?;
                    let allowed = zero.hull(limit, &mut budget.arithmetic)?;
                    quality &= magnitude.subset_of(&allowed, &mut budget.arithmetic)?;
                    magnitudes.push(magnitude);
                }
                budget.graph.charge(1)?;
                refinement.magnitudes =
                    Some(magnitudes.try_into().expect("fixed coordinate count"));
                refinement.quality = Some(quality);
                if quality {
                    report.check_records(native_records, refinements, 1, budget)?;
                    budget.graph.charge(1)?;
                    report.segments.push((a, r));
                    accepted = true;
                    break;
                }
            }
            let duration = report.attempts[a]
                .search
                .segment(0)
                .expect("accepted native prefix")
                .evidence()
                .duration()
                .expect("positive duration");
            if accepted {
                match report
                    .reached_time()
                    .compare_singleton(&report.request.end, &mut budget.arithmetic)?
                {
                    Ordering::Equal => {
                        budget.graph.charge(0)?;
                        return Ok(AdaptiveTaylorStatus::Completed);
                    }
                    Ordering::Greater => return Err(EvolutionFailure::NonProgress.into()),
                    Ordering::Less => {}
                }
                let two = DyadicInterval::new(2.into(), 2.into(), 0)?;
                let grown = duration.mul(&two, &mut budget.arithmetic)?;
                cap = Some(match &self.options.native.maximum_step {
                    Some(maximum) => grown.min_image(maximum, &mut budget.arithmetic)?,
                    None => grown,
                });
                quality_halvings = 0;
            } else {
                if quality_halvings == self.options.maximum_quality_halvings {
                    return Err(AdaptiveTaylorFailure::QualityHalvingLimit {
                        limit: self.options.maximum_quality_halvings,
                    });
                }
                let half = DyadicInterval::new(1.into(), 1.into(), -1)?;
                let smaller = duration.mul(&half, &mut budget.arithmetic)?;
                if smaller.compare_singleton(duration, &mut budget.arithmetic)? != Ordering::Less
                    || smaller.signs() != hyperinterval::SignSet::Positive
                {
                    return Err(EvolutionFailure::NonProgress.into());
                }
                cap = Some(smaller);
                quality_halvings += 1;
            }
        }
    }
