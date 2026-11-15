; ModuleID = 'unsupported_thumb.f86cd1fe7ae069a1-cgu.0'
source_filename = "unsupported_thumb.f86cd1fe7ae069a1-cgu.0"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "thumbv7em-unknown-none-eabihf"

; Function Attrs: nounwind
define dso_local noundef zeroext i1 @f32_rejected() unnamed_addr #0 {
start:
  %_2 = alloca [12 x i8], align 4
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %_2)
; call hyperinterval::float::F32Enclosure::point
  call void @_ZN13hyperinterval5float12F32Enclosure5point17h46bb7a72194b84ccE(ptr noalias nocapture noundef nonnull sret([12 x i8]) align 4 dereferenceable(12) %_2, float noundef 1.000000e+00) #2
  %_2.val = load i32, ptr %_2, align 4, !range !1, !noundef !2
  %0 = getelementptr inbounds nuw i8, ptr %_2, i32 4
  %_2.val1 = load i8, ptr %0, align 4
  %1 = icmp eq i32 %_2.val, 2
  %_0.i.i = icmp eq i8 %_2.val1, 12
  %spec.select.i = select i1 %1, i1 %_0.i.i, i1 false
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %_2)
  ret i1 %spec.select.i
}

; Function Attrs: nounwind
define dso_local noundef zeroext i1 @f64_rejected() unnamed_addr #0 {
start:
  %_2 = alloca [24 x i8], align 8
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %_2)
; call hyperinterval::float::F64Enclosure::point
  call void @_ZN13hyperinterval5float12F64Enclosure5point17hfce0c2537c43d271E(ptr noalias nocapture noundef nonnull sret([24 x i8]) align 8 dereferenceable(24) %_2, double noundef 1.000000e+00) #2
  %_2.val = load i64, ptr %_2, align 8, !range !3, !noundef !2
  %0 = getelementptr inbounds nuw i8, ptr %_2, i32 8
  %_2.val1 = load i8, ptr %0, align 8
  %1 = icmp eq i64 %_2.val, 2
  %_0.i.i = icmp eq i8 %_2.val1, 12
  %spec.select.i = select i1 %1, i1 %_0.i.i, i1 false
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %_2)
  ret i1 %spec.select.i
}

; hyperinterval::float::F32Enclosure::point
; Function Attrs: nounwind
declare dso_local void @_ZN13hyperinterval5float12F32Enclosure5point17h46bb7a72194b84ccE(ptr dead_on_unwind noalias nocapture noundef writable sret([12 x i8]) align 4 dereferenceable(12), float noundef) unnamed_addr #0

; hyperinterval::float::F64Enclosure::point
; Function Attrs: nounwind
declare dso_local void @_ZN13hyperinterval5float12F64Enclosure5point17hfce0c2537c43d271E(ptr dead_on_unwind noalias nocapture noundef writable sret([24 x i8]) align 8 dereferenceable(24), double noundef) unnamed_addr #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

attributes #0 = { nounwind "frame-pointer"="all" "target-cpu"="generic" "target-features"="+vfp4d16sp" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"rustc version 1.88.0 (6b00bc388 2025-06-23)"}
!1 = !{i32 0, i32 3}
!2 = !{}
!3 = !{i64 0, i64 3}
