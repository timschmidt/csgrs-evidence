use hyperlimit::Point3;
use hyperreal::Real;
use hypersdf::{
    SdfVoxelBatch, SdfVoxelCell, SdfVoxelCellGrid, SdfVoxelOccupancy,
    continuous_field_batch_from_sdf,
};
use hypervoxel::{GridFrame, MaterialRegionId};
use std::{
    collections::hash_map::DefaultHasher,
    hash::{Hash, Hasher},
    hint::black_box,
    time::Instant,
};
#[path = "../../hyperlattice-interval/conformance/allocations.rs"]
mod allocations;
fn main() {
    for depth in [0, 1, 3, 4] {
        let n = 1u32 << depth;
        let batch = SdfVoxelBatch {
            grid: SdfVoxelCellGrid::new(
                Point3::new(0.into(), 0.into(), 0.into()),
                Point3::new(1.into(), 1.into(), 1.into()),
                [n; 3],
            ),
            cells: (0..n)
                .flat_map(|z| {
                    (0..n).flat_map(move |y| {
                        (0..n).map(move |x| SdfVoxelCell {
                            index: [x, y, z],
                            occupancy: if (x + y + z) % 2 == 0 {
                                SdfVoxelOccupancy::Filled
                            } else {
                                SdfVoxelOccupancy::Empty
                            },
                        })
                    })
                })
                .collect(),
        };
        let frame = GridFrame::unit(depth).unwrap();
        let run = || {
            let converted = continuous_field_batch_from_sdf(
                black_box(&batch),
                frame.clone(),
                MaterialRegionId(7),
            )
            .unwrap();
            let grid = converted.materialize_exact_sparse_grid().unwrap();
            black_box((converted, grid))
        };
        let ((converted, grid), allocs, bytes) = allocations::measure(run);
        let mut hash = DefaultHasher::new();
        for cell in &converted.cells {
            cell.address.hash(&mut hash);
            cell.cell.hash(&mut hash);
            assert_eq!(grid.get(cell.address).unwrap(), cell.cell);
        }
        println!(
            "semantic,{depth},{},{:x},allocations,{allocs},bytes,{bytes}",
            converted.cells.len(),
            hash.finish()
        );
        drop((converted, grid));
        let iterations = if depth < 3 { 20000 } else { 128 };
        for _ in 0..16 {
            drop(run());
        }
        let start = Instant::now();
        for _ in 0..iterations {
            drop(run());
        }
        println!("timing,{depth},{iterations},{}", start.elapsed().as_nanos());
    }
    black_box(Real::zero());
}
