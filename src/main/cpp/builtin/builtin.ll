; ModuleID = 'builtin.c'
source_filename = "builtin.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-unknown-elf"

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"true\00", align 1
@.str.5 = private unnamed_addr constant [6 x i8] c"false\00", align 1

; Function Attrs: nounwind
define dso_local void @print(i8* %0) local_unnamed_addr #0 {
  %2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8* %0) #10
  ret void
}

declare dso_local i32 @printf(i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
define dso_local void @println(i8* %0) local_unnamed_addr #0 {
  %2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* %0) #10
  ret void
}

; Function Attrs: nounwind
define dso_local void @printInt(i32 %0) local_unnamed_addr #0 {
  %2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32 %0) #10
  ret void
}

; Function Attrs: nounwind
define dso_local void @printlnInt(i32 %0) local_unnamed_addr #0 {
  %2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i32 %0) #10
  ret void
}

; Function Attrs: nofree nounwind
define dso_local i8* @getString() local_unnamed_addr #2 {
  %1 = tail call dereferenceable_or_null(1024) i8* @malloc(i32 1024) #11
  %2 = tail call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8* %1) #11
  ret i8* %1
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: nofree nounwind
declare dso_local noalias i8* @malloc(i32) local_unnamed_addr #4

; Function Attrs: nofree nounwind
declare dso_local i32 @scanf(i8* nocapture readonly, ...) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: nounwind
define dso_local i32 @getInt() local_unnamed_addr #0 {
  %1 = alloca i32, align 4
  %2 = bitcast i32* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %2) #12
  %3 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* nonnull %1) #11
  %4 = load i32, i32* %1, align 4, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %2) #12
  ret i32 %4
}

; Function Attrs: nofree nounwind
define dso_local noalias i8* @toString(i32 %0) local_unnamed_addr #2 {
  %2 = tail call dereferenceable_or_null(12) i8* @malloc(i32 12) #11
  %3 = tail call i32 (i8*, i8*, ...) @sprintf(i8* nonnull dereferenceable(1) %2, i8* nonnull dereferenceable(1) getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32 %0) #11
  ret i8* %2
}

; Function Attrs: nofree nounwind
declare dso_local i32 @sprintf(i8* noalias nocapture, i8* nocapture readonly, ...) local_unnamed_addr #4

; Function Attrs: nounwind
define dso_local i8* @array.copy(i32* %0, i32 %1) local_unnamed_addr #0 {
  %3 = icmp eq i32* %0, null
  br i1 %3, label %31, label %4

4:                                                ; preds = %2
  %5 = getelementptr inbounds i32, i32* %0, i32 -1
  %6 = load i32, i32* %5, align 4, !tbaa !3
  %7 = shl i32 %6, 2
  %8 = add i32 %7, 4
  %9 = tail call i8* @malloc(i32 %8) #11
  %10 = getelementptr inbounds i8, i8* %9, i32 4
  %11 = bitcast i8* %10 to i32*
  %12 = icmp eq i32 %1, 1
  br i1 %12, label %13, label %16

13:                                               ; preds = %4
  %14 = bitcast i32* %5 to i8*
  %15 = tail call i8* @memcpy(i8* %9, i8* nonnull %14, i32 %8) #10
  br label %31

16:                                               ; preds = %4
  %17 = bitcast i8* %9 to i32*
  store i32 %6, i32* %17, align 4, !tbaa !3
  %18 = icmp eq i32 %6, 0
  br i1 %18, label %31, label %19

19:                                               ; preds = %16
  %20 = add i32 %1, -1
  br label %21

21:                                               ; preds = %21, %19
  %22 = phi i32 [ 0, %19 ], [ %29, %21 ]
  %23 = getelementptr inbounds i32, i32* %0, i32 %22
  %24 = bitcast i32* %23 to i32**
  %25 = load i32*, i32** %24, align 4, !tbaa !3
  %26 = tail call i8* @array.copy(i32* %25, i32 %20) #11
  %27 = ptrtoint i8* %26 to i32
  %28 = getelementptr inbounds i32, i32* %11, i32 %22
  store i32 %27, i32* %28, align 4, !tbaa !3
  %29 = add nuw i32 %22, 1
  %30 = icmp eq i32 %29, %6
  br i1 %30, label %31, label %21

31:                                               ; preds = %21, %16, %13, %2
  %32 = phi i8* [ null, %2 ], [ %10, %13 ], [ %10, %16 ], [ %10, %21 ]
  ret i8* %32
}

declare dso_local i8* @memcpy(i8*, i8*, i32) local_unnamed_addr #1

; Function Attrs: norecurse nounwind readonly
define dso_local i32 @array.size(i32* nocapture readonly %0) local_unnamed_addr #5 {
  %2 = getelementptr inbounds i32, i32* %0, i32 -1
  %3 = load i32, i32* %2, align 4, !tbaa !3
  ret i32 %3
}

; Function Attrs: nounwind readonly
define dso_local i32 @string.length(i8* nocapture readonly %0) local_unnamed_addr #6 {
  %2 = tail call i32 @strlen(i8* nonnull dereferenceable(1) %0) #11
  ret i32 %2
}

; Function Attrs: argmemonly nofree nounwind readonly
declare dso_local i32 @strlen(i8* nocapture) local_unnamed_addr #7

; Function Attrs: norecurse nounwind readonly
define dso_local i32 @string.ord(i8* nocapture readonly %0, i32 %1) local_unnamed_addr #5 {
  %3 = getelementptr inbounds i8, i8* %0, i32 %1
  %4 = load i8, i8* %3, align 1, !tbaa !7
  %5 = zext i8 %4 to i32
  ret i32 %5
}

; Function Attrs: nounwind
define dso_local i32 @string.parseInt(i8* nocapture readonly %0) local_unnamed_addr #0 {
  %2 = alloca i32, align 4
  %3 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %3) #12
  %4 = call i32 (i8*, i8*, ...) @sscanf(i8* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* nonnull %2) #11
  %5 = load i32, i32* %2, align 4, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %3) #12
  ret i32 %5
}

; Function Attrs: nofree nounwind
declare dso_local i32 @sscanf(i8* nocapture readonly, i8* nocapture readonly, ...) local_unnamed_addr #4

; Function Attrs: nounwind
define dso_local i8* @string.substring(i8* %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = sub nsw i32 %2, %1
  %5 = add nsw i32 %4, 1
  %6 = tail call i8* @malloc(i32 %5) #11
  %7 = getelementptr inbounds i8, i8* %0, i32 %1
  %8 = tail call i8* @memcpy(i8* %6, i8* %7, i32 %4) #10
  %9 = getelementptr inbounds i8, i8* %6, i32 %4
  store i8 0, i8* %9, align 1, !tbaa !7
  ret i8* %6
}

; Function Attrs: norecurse nounwind readnone
define dso_local i8* @builtin.bool_to_string(i1 zeroext %0) local_unnamed_addr #8 {
  %2 = select i1 %0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.5, i32 0, i32 0)
  ret i8* %2
}

; Function Attrs: nofree nounwind
define dso_local noalias i8* @builtin.calloc(i32 %0) local_unnamed_addr #2 {
  %2 = tail call i8* @calloc(i32 %0, i32 1) #11
  ret i8* %2
}

; Function Attrs: nofree nounwind
declare dso_local noalias i8* @calloc(i32, i32) local_unnamed_addr #4

; Function Attrs: nofree nounwind
define dso_local noalias nonnull i8* @builtin.calloc_array(i32 %0, i32 %1) local_unnamed_addr #2 {
  %3 = mul nsw i32 %1, %0
  %4 = add nsw i32 %3, 4
  %5 = tail call i8* @calloc(i32 %4, i32 1) #11
  %6 = bitcast i8* %5 to i32*
  store i32 %1, i32* %6, align 4, !tbaa !3
  %7 = getelementptr inbounds i8, i8* %5, i32 4
  ret i8* %7
}

; Function Attrs: nofree nounwind
define dso_local noalias i8* @builtin.malloc(i32 %0) local_unnamed_addr #2 {
  %2 = tail call i8* @malloc(i32 %0) #11
  ret i8* %2
}

; Function Attrs: nofree nounwind
define dso_local noalias nonnull i8* @builtin.malloc_array(i32 %0, i32 %1) local_unnamed_addr #2 {
  %3 = mul nsw i32 %1, %0
  %4 = add nsw i32 %3, 4
  %5 = tail call i8* @malloc(i32 %4) #11
  %6 = bitcast i8* %5 to i32*
  store i32 %1, i32* %6, align 4, !tbaa !3
  %7 = getelementptr inbounds i8, i8* %5, i32 4
  ret i8* %7
}

; Function Attrs: nofree nounwind
define dso_local i8* @builtin.string_add(i8* nocapture readonly %0, i8* nocapture readonly %1) local_unnamed_addr #2 {
  %3 = tail call i32 @strlen(i8* nonnull dereferenceable(1) %0) #11
  %4 = tail call i32 @strlen(i8* nonnull dereferenceable(1) %1) #11
  %5 = add i32 %3, 1
  %6 = add i32 %5, %4
  %7 = tail call i8* @malloc(i32 %6) #11
  %8 = tail call i8* @strcpy(i8* nonnull dereferenceable(1) %7, i8* nonnull dereferenceable(1) %0) #11
  %9 = tail call i32 @strlen(i8* nonnull dereferenceable(1) %0) #11
  %10 = getelementptr inbounds i8, i8* %7, i32 %9
  %11 = tail call i8* @strcpy(i8* nonnull dereferenceable(1) %10, i8* nonnull dereferenceable(1) %1) #11
  ret i8* %7
}

; Function Attrs: nofree nounwind
declare dso_local i8* @strcpy(i8* noalias returned, i8* noalias nocapture readonly) local_unnamed_addr #4

; Function Attrs: nounwind readonly
define dso_local zeroext i1 @builtin.string.eq(i8* nocapture readonly %0, i8* nocapture readonly %1) local_unnamed_addr #6 {
  %3 = tail call i32 @strcmp(i8* nonnull dereferenceable(1) %0, i8* nonnull dereferenceable(1) %1) #11
  %4 = icmp eq i32 %3, 0
  ret i1 %4
}

; Function Attrs: nofree nounwind readonly
declare dso_local i32 @strcmp(i8* nocapture, i8* nocapture) local_unnamed_addr #9

; Function Attrs: nounwind readonly
define dso_local zeroext i1 @builtin.string.ge(i8* nocapture readonly %0, i8* nocapture readonly %1) local_unnamed_addr #6 {
  %3 = tail call i32 @strcmp(i8* nonnull dereferenceable(1) %0, i8* nonnull dereferenceable(1) %1) #11
  %4 = icmp sgt i32 %3, 0
  ret i1 %4
}

; Function Attrs: nounwind readonly
define dso_local zeroext i1 @builtin.string.geq(i8* nocapture readonly %0, i8* nocapture readonly %1) local_unnamed_addr #6 {
  %3 = tail call i32 @strcmp(i8* nonnull dereferenceable(1) %0, i8* nonnull dereferenceable(1) %1) #11
  %4 = icmp sgt i32 %3, -1
  ret i1 %4
}

; Function Attrs: nounwind readonly
define dso_local zeroext i1 @builtin.string.le(i8* nocapture readonly %0, i8* nocapture readonly %1) local_unnamed_addr #6 {
  %3 = tail call i32 @strcmp(i8* nonnull dereferenceable(1) %0, i8* nonnull dereferenceable(1) %1) #11
  %4 = icmp slt i32 %3, 0
  ret i1 %4
}

; Function Attrs: nounwind readonly
define dso_local zeroext i1 @builtin.string.leq(i8* nocapture readonly %0, i8* nocapture readonly %1) local_unnamed_addr #6 {
  %3 = tail call i32 @strcmp(i8* nonnull dereferenceable(1) %0, i8* nonnull dereferenceable(1) %1) #11
  %4 = icmp slt i32 %3, 1
  ret i1 %4
}

; Function Attrs: nounwind readonly
define dso_local zeroext i1 @builtin.string.ne(i8* nocapture readonly %0, i8* nocapture readonly %1) local_unnamed_addr #6 {
  %3 = tail call i32 @strcmp(i8* nonnull dereferenceable(1) %0, i8* nonnull dereferenceable(1) %1) #11
  %4 = icmp ne i32 %3, 0
  ret i1 %4
}

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-builtin-memcpy" "no-builtin-printf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+m,+relax" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-builtin-memcpy" "no-builtin-printf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+m,+relax" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-builtin-memcpy" "no-builtin-printf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+m,+relax" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-builtin-memcpy" "no-builtin-printf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+m,+relax" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { norecurse nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-builtin-memcpy" "no-builtin-printf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+m,+relax" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-builtin-memcpy" "no-builtin-printf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+m,+relax" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { argmemonly nofree nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-builtin-memcpy" "no-builtin-printf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+m,+relax" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { norecurse nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-builtin-memcpy" "no-builtin-printf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+m,+relax" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nofree nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-builtin-memcpy" "no-builtin-printf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+m,+relax" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { nobuiltin nounwind "no-builtin-memcpy" "no-builtin-printf" }
attributes #11 = { "no-builtin-memcpy" "no-builtin-printf" }
attributes #12 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32"}
!2 = !{!"clang version 10.0.0-4ubuntu1 "}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!5, !5, i64 0}
