//! Typed per-part failures and the certainty summary shown for each part.
//!
//! A failure keeps the csgrs error that caused it and the `OpenSCAD` source
//! span of the statement that produced it. Text is rendered only for display.

use std::fmt;

use csgrs::errors::ValidationErrorKind;
use openscad_rs::Span;

/// Why a part failed.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum FailureKind {
    /// csgrs or a Hyper crate rejected the operation; csgrs classifies it.
    Kernel(ValidationErrorKind),
    /// An `OpenSCAD` argument has the wrong type or shape.
    InvalidArgument,
    /// 2D geometry was used where 3D geometry is required, or the reverse.
    MixedDimensions,
    /// An evaluator decision, such as truthiness or ordering, is undecided.
    Undecided,
    /// The operation is not supported by `SynapsCAD`'s exact pipeline.
    Unsupported,
    /// The exact result could not be projected to the renderer's finite mesh.
    RenderConversion,
}

impl FailureKind {
    /// Short machine-readable name, used in the part badge and AI context.
    #[must_use]
    pub const fn as_str(self) -> &'static str {
        match self {
            Self::Kernel(kind) => kind.as_str(),
            Self::InvalidArgument => "invalid_argument",
            Self::MixedDimensions => "mixed_dimensions",
            Self::Undecided => "undecided",
            Self::Unsupported => "unsupported",
            Self::RenderConversion => "render_conversion",
        }
    }

    /// Whether this failure most likely comes from a defect in `SynapsCAD`
    /// or its dependencies rather than from the user's model.
    #[must_use]
    pub const fn suggests_bug_report(self) -> bool {
        matches!(
            self,
            Self::Kernel(ValidationErrorKind::Geometry) | Self::RenderConversion
        )
    }
}

impl fmt::Display for FailureKind {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        f.write_str(self.as_str())
    }
}

/// A typed failure of one shape, kept until it is displayed.
#[derive(Clone, Debug)]
pub struct ShapeFailure {
    kind: FailureKind,
    message: String,
    source: Option<csgrs::Error>,
    span: Option<Span>,
}

impl ShapeFailure {
    /// An evaluator failure without an underlying csgrs error.
    #[must_use]
    pub fn new(kind: FailureKind, message: impl Into<String>) -> Self {
        Self {
            kind,
            message: message.into(),
            source: None,
            span: None,
        }
    }

    /// A failure caused by csgrs or a Hyper crate, classified by csgrs.
    #[must_use]
    pub fn kernel(context: impl Into<String>, error: impl Into<csgrs::Error>) -> Self {
        let error = error.into();
        Self {
            kind: FailureKind::Kernel(error.kind()),
            message: context.into(),
            source: Some(error),
            span: None,
        }
    }

    /// An invalid `OpenSCAD` argument.
    #[must_use]
    pub fn invalid_argument(message: impl Into<String>) -> Self {
        Self::new(FailureKind::InvalidArgument, message)
    }

    /// Adds `context` in front of the message, keeping kind, source and span.
    #[must_use]
    pub fn context(mut self, context: &str) -> Self {
        self.message = format!("{context}: {}", self.message);
        self
    }

    /// Records the span of the statement that produced this failure, unless
    /// an inner statement already did.
    pub const fn attach_span(&mut self, span: Span) {
        if self.span.is_none() {
            self.span = Some(span);
        }
    }

    /// Records `span` unless an inner statement already did.
    #[must_use]
    pub const fn with_span(mut self, span: Span) -> Self {
        self.attach_span(span);
        self
    }

    /// The failure's classification.
    #[must_use]
    pub const fn kind(&self) -> FailureKind {
        self.kind
    }

    /// The human context, without the underlying error.
    #[must_use]
    pub fn message(&self) -> &str {
        &self.message
    }

    /// The csgrs error that caused this failure, when there is one.
    #[must_use]
    pub const fn kernel_error(&self) -> Option<&csgrs::Error> {
        self.source.as_ref()
    }

    /// The source span of the statement that produced this failure.
    #[must_use]
    pub const fn span(&self) -> Option<Span> {
        self.span
    }
}

impl fmt::Display for ShapeFailure {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match &self.source {
            Some(source) => write!(f, "{}: {source}", self.message),
            None => f.write_str(&self.message),
        }
    }
}

impl std::error::Error for ShapeFailure {
    fn source(&self) -> Option<&(dyn std::error::Error + 'static)> {
        self.source
            .as_ref()
            .map(|source| source as &(dyn std::error::Error + 'static))
    }
}

/// 1-based line and column (in characters) of a byte offset in the source.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct SourceLocation {
    pub line: usize,
    pub column: usize,
}

impl SourceLocation {
    /// Locates `offset` in `source`; offsets past the end clamp to the end.
    #[must_use]
    pub fn of_offset(source: &str, offset: usize) -> Self {
        let mut end = offset.min(source.len());
        while !source.is_char_boundary(end) {
            end -= 1;
        }
        let before = &source[..end];
        let line_start = before.rfind('\n').map_or(0, |index| index + 1);
        Self {
            line: before.matches('\n').count() + 1,
            column: before[line_start..].chars().count() + 1,
        }
    }
}

impl fmt::Display for SourceLocation {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "line {}:{}", self.line, self.column)
    }
}

/// What a successful part's mesh records about how it was constructed.
///
/// `SynapsCAD` evaluates every operation under `GeometryContext::STRICT`, so
/// a successful part's topology decisions are certified. These flags are the
/// mesh's inherited `construction_evidence()`, kept separately (P9).
#[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
#[allow(clippy::struct_excessive_bools)]
pub struct PartEvidence {
    /// A predicate consumed Hyperlimit's terminal 512-bit interpretation.
    pub approximate_512_consumed: bool,
    /// The mesh was constructed from samples of a continuous source.
    pub source_sampled: bool,
    /// The dependency chain contains a coordinate projection.
    pub coordinates_projected: bool,
    /// Some preceding construction history is unavailable.
    pub source_history_missing: bool,
}

impl PartEvidence {
    /// Reads the evidence recorded on an exact mesh.
    #[must_use]
    pub fn of_mesh(mesh: &csgrs::TriangleMesh) -> Self {
        let evidence = mesh.construction_evidence();
        Self {
            approximate_512_consumed: evidence.approximate_512_consumed(),
            source_sampled: evidence.source_sampled(),
            coordinates_projected: evidence.coordinates_projected(),
            source_history_missing: evidence.source_history_missing(),
        }
    }

    /// The names of the recorded qualifications, in a fixed order.
    #[must_use]
    pub fn flags(self) -> Vec<&'static str> {
        [
            (self.approximate_512_consumed, "approximate_512_consumed"),
            (self.source_sampled, "source_sampled"),
            (self.coordinates_projected, "coordinates_projected"),
            (self.source_history_missing, "source_history_missing"),
        ]
        .into_iter()
        .filter_map(|(set, name)| set.then_some(name))
        .collect()
    }

    /// One-line summary for the part badge and the AI context.
    #[must_use]
    pub fn summary(self) -> String {
        let flags = self.flags();
        if flags.is_empty() {
            "certified".into()
        } else {
            format!("certified; mesh evidence: {}", flags.join(", "))
        }
    }
}

/// A top-level part that produced no geometry.
#[derive(Clone, Debug)]
pub struct FailedPart {
    /// 1-based part number, shared with the successful parts.
    pub part: usize,
    /// The typed failure.
    pub failure: ShapeFailure,
    /// Line and column of the failure's span in the compiled source.
    pub location: Option<SourceLocation>,
}

impl FailedPart {
    /// One-line summary for the part badge and the AI context.
    #[must_use]
    pub fn summary(&self) -> String {
        self.location.map_or_else(
            || format!("failed ({}): {}", self.failure.kind(), self.failure),
            |location| {
                format!(
                    "failed ({}) at {location}: {}",
                    self.failure.kind(),
                    self.failure
                )
            },
        )
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn source_locations_are_one_based_and_count_characters() {
        let source = "a = 1;\n  é cube(-1);";
        assert_eq!(
            SourceLocation::of_offset(source, 0),
            SourceLocation { line: 1, column: 1 }
        );
        let offset = source.find("cube").unwrap();
        assert_eq!(
            SourceLocation::of_offset(source, offset),
            SourceLocation { line: 2, column: 5 }
        );
        assert_eq!(
            SourceLocation::of_offset(source, usize::MAX).line,
            2,
            "offsets past the end clamp to the last line"
        );
    }

    #[test]
    fn kernel_failures_keep_their_typed_source_until_display() {
        let failure = ShapeFailure::kernel(
            "cube() failed",
            csgrs::Error::NegativeParameter { name: "width" },
        );
        assert_eq!(
            failure.kind(),
            FailureKind::Kernel(ValidationErrorKind::InvalidInput)
        );
        assert!(matches!(
            failure.kernel_error(),
            Some(csgrs::Error::NegativeParameter { name: "width" })
        ));
        assert!(std::error::Error::source(&failure).is_some());
        assert_eq!(
            failure.to_string(),
            "cube() failed: width must be nonnegative"
        );
    }
}
