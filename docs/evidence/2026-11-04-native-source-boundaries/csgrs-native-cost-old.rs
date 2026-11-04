use csgrs::TriangleMesh;

use crate::compiler::failure::{FailureKind, ShapeFailure};
use crate::compiler::types::MeshData;

fn render_failure(message: impl Into<String>) -> ShapeFailure {
    ShapeFailure::new(FailureKind::RenderConversion, message)
}

/// Converts exact native triangle geometry at the renderer's finite boundary.
///
/// # Errors
///
/// Returns an error when the mesh is empty or an exact coordinate or normal
/// cannot be represented as a finite `f32`.
pub fn triangle_mesh_to_mesh_data(mesh: &TriangleMesh) -> Result<MeshData, ShapeFailure> {
    let valid = mesh
        .has_unique_nondegenerate_triangles(&csgrs::GeometryContext::STRICT.mesh_context())
        .map_err(|error| ShapeFailure::kernel("exact triangle validation failed", error))?;
    if !valid.value {
        return Err(render_failure(
            "mesh contains duplicate or degenerate exact triangles",
        ));
    }
    let vertex_capacity = mesh
        .triangles
        .len()
        .checked_mul(3)
        .ok_or_else(|| render_failure("finite mesh projection exceeds addressable memory"))?;
    let mut positions = Vec::with_capacity(vertex_capacity);
    let mut normals = Vec::with_capacity(vertex_capacity);
    let mut indices = Vec::with_capacity(vertex_capacity);
    for (triangle_index, triangle) in mesh.triangles.iter().enumerate() {
        let finite_position = |index: usize| -> Result<[f32; 3], ShapeFailure> {
            mesh.positions
                .get(index)
                .ok_or_else(|| {
                    render_failure(format!(
                        "triangle {triangle_index} references missing position {index}"
                    ))
                })?
                .to_f32_array_lossy()
                .ok_or_else(|| {
                    render_failure(format!(
                        "triangle {triangle_index} has an unrepresentable finite position"
                    ))
                })
        };
        let [a, b, c] = triangle.indices().map(finite_position);
        let [a, b, c] = [a?, b?, c?];
        let ab = [b[0] - a[0], b[1] - a[1], b[2] - a[2]];
        let ac = [c[0] - a[0], c[1] - a[1], c[2] - a[2]];
        let cross = [
            ab[1].mul_add(ac[2], -(ab[2] * ac[1])),
            ab[2].mul_add(ac[0], -(ab[0] * ac[2])),
            ab[0].mul_add(ac[1], -(ab[1] * ac[0])),
        ];
        let squared_norm =
            cross[0].mul_add(cross[0], cross[1].mul_add(cross[1], cross[2] * cross[2]));
        if !squared_norm.is_finite() || squared_norm <= 0.0 {
            return Err(render_failure(format!(
                "triangle {triangle_index} collapses at the finite rendering boundary"
            )));
        }
        let inverse_norm = squared_norm.sqrt().recip();
        let normal = cross.map(|component| component * inverse_norm);
        let base = u32::try_from(positions.len())
            .map_err(|_| render_failure("finite mesh projection exceeds u32 indexing"))?;
        let second = base
            .checked_add(1)
            .ok_or_else(|| render_failure("finite mesh projection exceeds u32 indexing"))?;
        let third = base
            .checked_add(2)
            .ok_or_else(|| render_failure("finite mesh projection exceeds u32 indexing"))?;
        positions.extend([a, b, c]);
        normals.extend([normal; 3]);
        indices.extend([base, second, third]);
    }
    if positions.is_empty() {
        return Err(render_failure("mesh has no vertices"));
    }

    // OpenSCAD Z-up -> Bevy Y-up (a proper rotation).
    let positions = positions.into_iter().map(|[x, y, z]| [x, z, -y]).collect();
    let normals = normals.into_iter().map(|[x, y, z]| [x, z, -y]).collect();

    Ok(MeshData {
        source: mesh.clone(),
        positions,
        normals,
        indices,
        color: None,
        part: 0,
        evidence: crate::compiler::failure::PartEvidence::of_mesh(mesh),
    })
}

