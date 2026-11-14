
impl<const N: usize> FlowTaylorProgram<N> {
    /// Prepare additional polynomial orders while sharing every existing coefficient.
    ///
    /// `additional == 0` shares the complete program. Otherwise only the missing
    /// normalized Lie stages are generated, through the new mandatory remainder
    /// order. Source guards, time/state interpretation and derivative associations
    /// stay authoritative. This is preparation, not a trajectory certificate.
    ///
    /// Prefix stage handles/output positions and new structural work spend the
    /// supplied budget. Existing graph storage, exact scalar payload/refinement
    /// and total heap bytes retain the exclusions of `EnclosureBudget`. Failure
    /// leaves this input unchanged and publishes no partial program or cache.
    pub fn extend_order(
        &self,
        additional: usize,
        budget: &mut EnclosureBudget,
    ) -> Result<Self, FlowTaylorError> {
        budget.graph.charge(0)?;
        if additional == 0 {
            budget.graph.charge(1)?;
            let result = self.clone();
            budget.graph.charge(0)?;
            return Ok(result);
        }
        let order = self.order.checked_add(additional).ok_or(FlowTaylorError::OrderOverflow)?;
        let count = order.checked_add(1).ok_or(FlowTaylorError::OrderOverflow)?;
        let columns = N.checked_add(1).ok_or(ExpressionError::SizeExhausted)?;
        let requests_len = N.checked_mul(columns).ok_or(ExpressionError::SizeExhausted)?;
        let outputs = count.checked_mul(N).ok_or(ExpressionError::SizeExhausted)?;
        budget.graph.check_entries(&[count, outputs, N, columns, requests_len, requests_len])?;
        let copy_work = N.checked_add(8).ok_or(ExpressionError::SizeExhausted)?;
        let mut stages = Vec::with_capacity(count);
        for stage in self.stages.iter() {
            budget.graph.charge(copy_work)?;
            stages.push(stage.clone());
        }
        let first = self.stages.len().checked_add(1).ok_or(FlowTaylorError::OrderOverflow)?;
        let field = &self.field;
        append_flow_stages!(field, stages, first, count, columns, requests_len, budget, N);
        budget.graph.charge(count)?;
        let result = Self { field: self.field.clone(), order, stages: stages.into() };
        budget.graph.charge(0)?;
        Ok(result)
    }
}
