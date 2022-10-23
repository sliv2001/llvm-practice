; ModuleID = 'Particles.c'
source_filename = "Particles.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.33.31630"

%struct.Canva = type { i32, i32 }
%struct.Particles = type { i32, ptr }
%struct.Particle = type { %struct.Vector, %struct.Vector, %struct.Vector, i32, i8 }
%struct.Vector = type { i32, i32 }

$sprintf = comdat any

$vsprintf = comdat any

$_snprintf = comdat any

$_vsnprintf = comdat any

$_vsprintf_l = comdat any

$_vsnprintf_l = comdat any

$__local_stdio_printf_options = comdat any

$"??_C@_07JMGDFJEK@Gravity?$AA@" = comdat any

@"??_C@_07JMGDFJEK@Gravity?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"Gravity\00", comdat, align 1
@window = internal global %struct.Canva zeroinitializer, align 4
@__local_stdio_printf_options._OptionsStorage = internal global i64 0, align 8

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i32 @sprintf(ptr noundef %0, ptr noundef %1, ...) #0 comdat {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  store ptr %1, ptr %3, align 8
  store ptr %0, ptr %4, align 8
  call void @llvm.va_start(ptr %6)
  %7 = load ptr, ptr %6, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = call i32 @_vsprintf_l(ptr noundef %9, ptr noundef %8, ptr noundef null, ptr noundef %7)
  store i32 %10, ptr %5, align 4
  call void @llvm.va_end(ptr %6)
  %11 = load i32, ptr %5, align 4
  ret i32 %11
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i32 @vsprintf(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 comdat {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %2, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %0, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load ptr, ptr %6, align 8
  %10 = call i32 @_vsnprintf_l(ptr noundef %9, i64 noundef -1, ptr noundef %8, ptr noundef null, ptr noundef %7)
  ret i32 %10
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i32 @_snprintf(ptr noundef %0, i64 noundef %1, ptr noundef %2, ...) #0 comdat {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  store ptr %2, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store ptr %0, ptr %6, align 8
  call void @llvm.va_start(ptr %8)
  %9 = load ptr, ptr %8, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = load i64, ptr %5, align 8
  %12 = load ptr, ptr %6, align 8
  %13 = call i32 @_vsnprintf(ptr noundef %12, i64 noundef %11, ptr noundef %10, ptr noundef %9)
  store i32 %13, ptr %7, align 4
  call void @llvm.va_end(ptr %8)
  %14 = load i32, ptr %7, align 4
  ret i32 %14
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i32 @_vsnprintf(ptr noundef %0, i64 noundef %1, ptr noundef %2, ptr noundef %3) #0 comdat {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  store ptr %3, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  store i64 %1, ptr %7, align 8
  store ptr %0, ptr %8, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = load ptr, ptr %6, align 8
  %11 = load i64, ptr %7, align 8
  %12 = load ptr, ptr %8, align 8
  %13 = call i32 @_vsnprintf_l(ptr noundef %12, i64 noundef %11, ptr noundef %10, ptr noundef null, ptr noundef %9)
  ret i32 %13
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @initAll(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4) #0 {
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  store i32 %4, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  store i32 %2, ptr %9, align 4
  store i32 %1, ptr %10, align 4
  store ptr %0, ptr %11, align 8
  %13 = load i32, ptr %7, align 4
  %14 = load i32, ptr %8, align 4
  %15 = call i32 @initDrawManager(ptr noundef @window, i32 noundef %14, i32 noundef %13, ptr noundef @"??_C@_07JMGDFJEK@Gravity?$AA@")
  store i32 %15, ptr %12, align 4
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %19

17:                                               ; preds = %5
  %18 = load i32, ptr %12, align 4
  store i32 %18, ptr %6, align 4
  br label %28

19:                                               ; preds = %5
  %20 = load i32, ptr %9, align 4
  %21 = load i32, ptr %10, align 4
  %22 = load ptr, ptr %11, align 8
  %23 = call i32 @initParticles(ptr noundef %22, i32 noundef %21, i32 noundef %20)
  store i32 %23, ptr %12, align 4
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %25, label %27

25:                                               ; preds = %19
  %26 = load i32, ptr %12, align 4
  store i32 %26, ptr %6, align 4
  br label %28

27:                                               ; preds = %19
  store i32 0, ptr %6, align 4
  br label %28

28:                                               ; preds = %27, %25, %17
  %29 = load i32, ptr %6, align 4
  ret i32 %29
}

declare dso_local i32 @initDrawManager(ptr noundef, i32 noundef, i32 noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @initParticles(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32 %2, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store ptr %0, ptr %7, align 8
  %12 = load i32, ptr %6, align 4
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %16

14:                                               ; preds = %3
  %15 = load i32, ptr %6, align 4
  br label %17

16:                                               ; preds = %3
  br label %17

17:                                               ; preds = %16, %14
  %18 = phi i32 [ %15, %14 ], [ 25, %16 ]
  store i32 %18, ptr %8, align 4
  %19 = load i32, ptr %5, align 4
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %23

21:                                               ; preds = %17
  %22 = load i32, ptr %5, align 4
  br label %24

23:                                               ; preds = %17
  br label %24

24:                                               ; preds = %23, %21
  %25 = phi i32 [ %22, %21 ], [ 10, %23 ]
  store i32 %25, ptr %9, align 4
  %26 = load i32, ptr %8, align 4
  %27 = icmp sgt i32 %26, 1000
  br i1 %27, label %28, label %29

28:                                               ; preds = %24
  store i32 -1, ptr %4, align 4
  br label %111

29:                                               ; preds = %24
  %30 = load i32, ptr %8, align 4
  %31 = sext i32 %30 to i64
  %32 = mul i64 %31, 32
  %33 = call noalias ptr @malloc(i64 noundef %32) #6
  %34 = load ptr, ptr %7, align 8
  %35 = getelementptr inbounds %struct.Particles, ptr %34, i32 0, i32 1
  store ptr %33, ptr %35, align 8
  store i32 0, ptr %10, align 4
  br label %36

36:                                               ; preds = %104, %29
  %37 = load i32, ptr %10, align 4
  %38 = load i32, ptr %8, align 4
  %39 = icmp slt i32 %37, %38
  br i1 %39, label %40, label %107

40:                                               ; preds = %36
  %41 = call i32 @rand()
  %42 = load i32, ptr %9, align 4
  %43 = sub nsw i32 %42, 2
  %44 = srem i32 %41, %43
  %45 = add nsw i32 %44, 2
  store i32 %45, ptr %11, align 4
  %46 = load i32, ptr %11, align 4
  %47 = load ptr, ptr %7, align 8
  %48 = getelementptr inbounds %struct.Particles, ptr %47, i32 0, i32 1
  %49 = load ptr, ptr %48, align 8
  %50 = load i32, ptr %10, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds %struct.Particle, ptr %49, i64 %51
  %53 = getelementptr inbounds %struct.Particle, ptr %52, i32 0, i32 3
  store i32 %46, ptr %53, align 4
  %54 = call i32 @rand()
  %55 = load i32, ptr @window, align 4
  %56 = load i32, ptr %11, align 4
  %57 = sub i32 %55, %56
  %58 = sub i32 %57, 1
  %59 = load i32, ptr %11, align 4
  %60 = sub i32 %58, %59
  %61 = urem i32 %54, %60
  %62 = load i32, ptr %11, align 4
  %63 = add i32 %61, %62
  %64 = load ptr, ptr %7, align 8
  %65 = getelementptr inbounds %struct.Particles, ptr %64, i32 0, i32 1
  %66 = load ptr, ptr %65, align 8
  %67 = load i32, ptr %10, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds %struct.Particle, ptr %66, i64 %68
  %70 = getelementptr inbounds %struct.Particle, ptr %69, i32 0, i32 0
  %71 = getelementptr inbounds %struct.Vector, ptr %70, i32 0, i32 0
  store i32 %63, ptr %71, align 4
  %72 = call i32 @rand()
  %73 = load i32, ptr getelementptr inbounds (%struct.Canva, ptr @window, i32 0, i32 1), align 4
  %74 = load i32, ptr %11, align 4
  %75 = sub i32 %73, %74
  %76 = sub i32 %75, 1
  %77 = load i32, ptr %11, align 4
  %78 = sub i32 %76, %77
  %79 = urem i32 %72, %78
  %80 = load i32, ptr %11, align 4
  %81 = add i32 %79, %80
  %82 = load ptr, ptr %7, align 8
  %83 = getelementptr inbounds %struct.Particles, ptr %82, i32 0, i32 1
  %84 = load ptr, ptr %83, align 8
  %85 = load i32, ptr %10, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds %struct.Particle, ptr %84, i64 %86
  %88 = getelementptr inbounds %struct.Particle, ptr %87, i32 0, i32 0
  %89 = getelementptr inbounds %struct.Vector, ptr %88, i32 0, i32 1
  store i32 %81, ptr %89, align 4
  %90 = load ptr, ptr %7, align 8
  %91 = getelementptr inbounds %struct.Particles, ptr %90, i32 0, i32 1
  %92 = load ptr, ptr %91, align 8
  %93 = load i32, ptr %10, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds %struct.Particle, ptr %92, i64 %94
  %96 = getelementptr inbounds %struct.Particle, ptr %95, i32 0, i32 1
  call void @llvm.memset.p0.i64(ptr align 4 %96, i8 0, i64 8, i1 false)
  %97 = load ptr, ptr %7, align 8
  %98 = getelementptr inbounds %struct.Particles, ptr %97, i32 0, i32 1
  %99 = load ptr, ptr %98, align 8
  %100 = load i32, ptr %10, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds %struct.Particle, ptr %99, i64 %101
  %103 = getelementptr inbounds %struct.Particle, ptr %102, i32 0, i32 4
  store i8 1, ptr %103, align 4
  br label %104

104:                                              ; preds = %40
  %105 = load i32, ptr %10, align 4
  %106 = add nsw i32 %105, 1
  store i32 %106, ptr %10, align 4
  br label %36, !llvm.loop !4

107:                                              ; preds = %36
  %108 = load i32, ptr %8, align 4
  %109 = load ptr, ptr %7, align 8
  %110 = getelementptr inbounds %struct.Particles, ptr %109, i32 0, i32 0
  store i32 %108, ptr %110, align 8
  store i32 0, ptr %4, align 4
  br label %111

111:                                              ; preds = %107, %28
  %112 = load i32, ptr %4, align 4
  ret i32 %112
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @freeAll(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = call i32 @freeDrawManager()
  %4 = load ptr, ptr %2, align 8
  %5 = call i32 @freeParticles(ptr noundef %4)
  ret i32 0
}

declare dso_local i32 @freeDrawManager(...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @freeParticles(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.Particles, ptr %3, i32 0, i32 0
  %5 = load i32, ptr %4, align 8
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %20

7:                                                ; preds = %1
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds %struct.Particles, ptr %8, i32 0, i32 1
  %10 = load ptr, ptr %9, align 8
  %11 = icmp ne ptr %10, null
  br i1 %11, label %12, label %20

12:                                               ; preds = %7
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds %struct.Particles, ptr %13, i32 0, i32 1
  %15 = load ptr, ptr %14, align 8
  call void @free(ptr noundef %15)
  %16 = load ptr, ptr %2, align 8
  %17 = getelementptr inbounds %struct.Particles, ptr %16, i32 0, i32 1
  store ptr null, ptr %17, align 8
  %18 = load ptr, ptr %2, align 8
  %19 = getelementptr inbounds %struct.Particles, ptr %18, i32 0, i32 0
  store i32 0, ptr %19, align 8
  br label %20

20:                                               ; preds = %12, %7, %1
  ret i32 0
}

; Function Attrs: allocsize(0)
declare dso_local noalias ptr @malloc(i64 noundef) #2

declare dso_local i32 @rand() #1

; Function Attrs: argmemonly nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @free(ptr noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @drawCircle(i64 %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca %struct.Vector, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i64 %0, ptr %4, align 4
  store i32 %2, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  %9 = getelementptr inbounds %struct.Vector, ptr %4, i32 0, i32 0
  %10 = load i32, ptr %9, align 4
  %11 = load i32, ptr %6, align 4
  %12 = sub nsw i32 %10, %11
  store i32 %12, ptr %7, align 4
  br label %13

13:                                               ; preds = %66, %3
  %14 = load i32, ptr %7, align 4
  %15 = getelementptr inbounds %struct.Vector, ptr %4, i32 0, i32 0
  %16 = load i32, ptr %15, align 4
  %17 = load i32, ptr %6, align 4
  %18 = add nsw i32 %16, %17
  %19 = icmp sle i32 %14, %18
  br i1 %19, label %20, label %69

20:                                               ; preds = %13
  %21 = getelementptr inbounds %struct.Vector, ptr %4, i32 0, i32 1
  %22 = load i32, ptr %21, align 4
  %23 = load i32, ptr %6, align 4
  %24 = sub nsw i32 %22, %23
  store i32 %24, ptr %8, align 4
  br label %25

25:                                               ; preds = %62, %20
  %26 = load i32, ptr %8, align 4
  %27 = getelementptr inbounds %struct.Vector, ptr %4, i32 0, i32 1
  %28 = load i32, ptr %27, align 4
  %29 = load i32, ptr %6, align 4
  %30 = add nsw i32 %28, %29
  %31 = icmp sle i32 %26, %30
  br i1 %31, label %32, label %65

32:                                               ; preds = %25
  %33 = load i32, ptr %8, align 4
  %34 = getelementptr inbounds %struct.Vector, ptr %4, i32 0, i32 1
  %35 = load i32, ptr %34, align 4
  %36 = sub nsw i32 %33, %35
  %37 = load i32, ptr %8, align 4
  %38 = getelementptr inbounds %struct.Vector, ptr %4, i32 0, i32 1
  %39 = load i32, ptr %38, align 4
  %40 = sub nsw i32 %37, %39
  %41 = mul nsw i32 %36, %40
  %42 = load i32, ptr %7, align 4
  %43 = getelementptr inbounds %struct.Vector, ptr %4, i32 0, i32 0
  %44 = load i32, ptr %43, align 4
  %45 = sub nsw i32 %42, %44
  %46 = load i32, ptr %7, align 4
  %47 = getelementptr inbounds %struct.Vector, ptr %4, i32 0, i32 0
  %48 = load i32, ptr %47, align 4
  %49 = sub nsw i32 %46, %48
  %50 = mul nsw i32 %45, %49
  %51 = add nsw i32 %41, %50
  %52 = load i32, ptr %6, align 4
  %53 = load i32, ptr %6, align 4
  %54 = mul nsw i32 %52, %53
  %55 = icmp sle i32 %51, %54
  br i1 %55, label %56, label %61

56:                                               ; preds = %32
  %57 = load i32, ptr %5, align 4
  %58 = load i32, ptr %8, align 4
  %59 = load i32, ptr %7, align 4
  %60 = call i32 @putPixel(i32 noundef %59, i32 noundef %58, i32 noundef %57)
  br label %61

61:                                               ; preds = %56, %32
  br label %62

62:                                               ; preds = %61
  %63 = load i32, ptr %8, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, ptr %8, align 4
  br label %25, !llvm.loop !6

65:                                               ; preds = %25
  br label %66

66:                                               ; preds = %65
  %67 = load i32, ptr %7, align 4
  %68 = add nsw i32 %67, 1
  store i32 %68, ptr %7, align 4
  br label %13, !llvm.loop !7

69:                                               ; preds = %13
  ret void
}

declare dso_local i32 @putPixel(i32 noundef, i32 noundef, i32 noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @drawParticles(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca %struct.Vector, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %6

6:                                                ; preds = %39, %1
  %7 = load i32, ptr %3, align 4
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds %struct.Particles, ptr %8, i32 0, i32 0
  %10 = load i32, ptr %9, align 8
  %11 = icmp slt i32 %7, %10
  br i1 %11, label %12, label %42

12:                                               ; preds = %6
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds %struct.Particles, ptr %13, i32 0, i32 1
  %15 = load ptr, ptr %14, align 8
  %16 = load i32, ptr %3, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds %struct.Particle, ptr %15, i64 %17
  %19 = call zeroext i1 @exists(ptr noundef %18)
  br i1 %19, label %21, label %20

20:                                               ; preds = %12
  br label %39

21:                                               ; preds = %12
  %22 = load ptr, ptr %2, align 8
  %23 = getelementptr inbounds %struct.Particles, ptr %22, i32 0, i32 1
  %24 = load ptr, ptr %23, align 8
  %25 = load i32, ptr %3, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds %struct.Particle, ptr %24, i64 %26
  %28 = getelementptr inbounds %struct.Particle, ptr %27, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %4, ptr align 4 %28, i64 8, i1 false)
  %29 = load ptr, ptr %2, align 8
  %30 = getelementptr inbounds %struct.Particles, ptr %29, i32 0, i32 1
  %31 = load ptr, ptr %30, align 8
  %32 = load i32, ptr %3, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds %struct.Particle, ptr %31, i64 %33
  %35 = getelementptr inbounds %struct.Particle, ptr %34, i32 0, i32 3
  %36 = load i32, ptr %35, align 4
  store i32 %36, ptr %5, align 4
  %37 = load i32, ptr %5, align 4
  %38 = load i64, ptr %4, align 4
  call void @drawCircle(i64 %38, i32 noundef %37, i32 noundef 255)
  br label %39

39:                                               ; preds = %21, %20
  %40 = load i32, ptr %3, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, ptr %3, align 4
  br label %6, !llvm.loop !8

42:                                               ; preds = %6
  %43 = call i32 @flush()
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal zeroext i1 @exists(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.Particle, ptr %3, i32 0, i32 4
  %5 = load i8, ptr %4, align 4
  %6 = trunc i8 %5 to i1
  ret i1 %6
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local i32 @flush(...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @stepParticles(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call i32 @setAcceleration(ptr noundef %3)
  %5 = load ptr, ptr %2, align 8
  %6 = call i32 @setVelocity(ptr noundef %5)
  %7 = load ptr, ptr %2, align 8
  %8 = call i32 @setOrigin(ptr noundef %7)
  %9 = load ptr, ptr %2, align 8
  %10 = call i32 @collideParticles(ptr noundef %9)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @setAcceleration(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %11

11:                                               ; preds = %147, %1
  %12 = load i32, ptr %3, align 4
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds %struct.Particles, ptr %13, i32 0, i32 0
  %15 = load i32, ptr %14, align 8
  %16 = icmp slt i32 %12, %15
  br i1 %16, label %17, label %150

17:                                               ; preds = %11
  %18 = load ptr, ptr %2, align 8
  %19 = getelementptr inbounds %struct.Particles, ptr %18, i32 0, i32 1
  %20 = load ptr, ptr %19, align 8
  %21 = load i32, ptr %3, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds %struct.Particle, ptr %20, i64 %22
  %24 = call zeroext i1 @exists(ptr noundef %23)
  br i1 %24, label %26, label %25

25:                                               ; preds = %17
  br label %147

26:                                               ; preds = %17
  %27 = load ptr, ptr %2, align 8
  %28 = getelementptr inbounds %struct.Particles, ptr %27, i32 0, i32 1
  %29 = load ptr, ptr %28, align 8
  %30 = load i32, ptr %3, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds %struct.Particle, ptr %29, i64 %31
  %33 = getelementptr inbounds %struct.Particle, ptr %32, i32 0, i32 2
  %34 = getelementptr inbounds %struct.Vector, ptr %33, i32 0, i32 0
  store i32 0, ptr %34, align 4
  %35 = load ptr, ptr %2, align 8
  %36 = getelementptr inbounds %struct.Particles, ptr %35, i32 0, i32 1
  %37 = load ptr, ptr %36, align 8
  %38 = load i32, ptr %3, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds %struct.Particle, ptr %37, i64 %39
  %41 = getelementptr inbounds %struct.Particle, ptr %40, i32 0, i32 2
  %42 = getelementptr inbounds %struct.Vector, ptr %41, i32 0, i32 1
  store i32 0, ptr %42, align 4
  store i32 0, ptr %4, align 4
  br label %43

43:                                               ; preds = %143, %26
  %44 = load i32, ptr %4, align 4
  %45 = load ptr, ptr %2, align 8
  %46 = getelementptr inbounds %struct.Particles, ptr %45, i32 0, i32 0
  %47 = load i32, ptr %46, align 8
  %48 = icmp slt i32 %44, %47
  br i1 %48, label %49, label %146

49:                                               ; preds = %43
  %50 = load ptr, ptr %2, align 8
  %51 = getelementptr inbounds %struct.Particles, ptr %50, i32 0, i32 1
  %52 = load ptr, ptr %51, align 8
  %53 = load i32, ptr %4, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds %struct.Particle, ptr %52, i64 %54
  %56 = call zeroext i1 @exists(ptr noundef %55)
  br i1 %56, label %58, label %57

57:                                               ; preds = %49
  br label %143

58:                                               ; preds = %49
  %59 = load i32, ptr %3, align 4
  %60 = load i32, ptr %4, align 4
  %61 = icmp eq i32 %59, %60
  br i1 %61, label %62, label %63

62:                                               ; preds = %58
  br label %143

63:                                               ; preds = %58
  %64 = load ptr, ptr %2, align 8
  %65 = getelementptr inbounds %struct.Particles, ptr %64, i32 0, i32 1
  %66 = load ptr, ptr %65, align 8
  %67 = load i32, ptr %3, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds %struct.Particle, ptr %66, i64 %68
  store ptr %69, ptr %5, align 8
  %70 = load ptr, ptr %2, align 8
  %71 = getelementptr inbounds %struct.Particles, ptr %70, i32 0, i32 1
  %72 = load ptr, ptr %71, align 8
  %73 = load i32, ptr %4, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds %struct.Particle, ptr %72, i64 %74
  store ptr %75, ptr %6, align 8
  %76 = load ptr, ptr %6, align 8
  %77 = getelementptr inbounds %struct.Particle, ptr %76, i32 0, i32 0
  %78 = getelementptr inbounds %struct.Vector, ptr %77, i32 0, i32 0
  %79 = load i32, ptr %78, align 4
  %80 = load ptr, ptr %5, align 8
  %81 = getelementptr inbounds %struct.Particle, ptr %80, i32 0, i32 0
  %82 = getelementptr inbounds %struct.Vector, ptr %81, i32 0, i32 0
  %83 = load i32, ptr %82, align 4
  %84 = sub nsw i32 %79, %83
  store i32 %84, ptr %7, align 4
  %85 = load ptr, ptr %6, align 8
  %86 = getelementptr inbounds %struct.Particle, ptr %85, i32 0, i32 0
  %87 = getelementptr inbounds %struct.Vector, ptr %86, i32 0, i32 1
  %88 = load i32, ptr %87, align 4
  %89 = load ptr, ptr %5, align 8
  %90 = getelementptr inbounds %struct.Particle, ptr %89, i32 0, i32 0
  %91 = getelementptr inbounds %struct.Vector, ptr %90, i32 0, i32 1
  %92 = load i32, ptr %91, align 4
  %93 = sub nsw i32 %88, %92
  store i32 %93, ptr %8, align 4
  %94 = load i32, ptr %7, align 4
  %95 = load i32, ptr %7, align 4
  %96 = mul nsw i32 %94, %95
  %97 = load i32, ptr %8, align 4
  %98 = load i32, ptr %8, align 4
  %99 = mul nsw i32 %97, %98
  %100 = add nsw i32 %96, %99
  store i32 %100, ptr %9, align 4
  %101 = load i32, ptr %9, align 4
  %102 = icmp eq i32 %101, 0
  br i1 %102, label %103, label %104

103:                                              ; preds = %63
  store i32 1, ptr %9, align 4
  br label %104

104:                                              ; preds = %103, %63
  %105 = load ptr, ptr %6, align 8
  %106 = getelementptr inbounds %struct.Particle, ptr %105, i32 0, i32 3
  %107 = load i32, ptr %106, align 4
  %108 = mul nsw i32 10000000, %107
  %109 = load i32, ptr %9, align 4
  %110 = sdiv i32 %108, %109
  store i32 %110, ptr %10, align 4
  %111 = load ptr, ptr %6, align 8
  %112 = getelementptr inbounds %struct.Particle, ptr %111, i32 0, i32 0
  %113 = getelementptr inbounds %struct.Vector, ptr %112, i32 0, i32 0
  %114 = load i32, ptr %113, align 4
  %115 = load ptr, ptr %5, align 8
  %116 = getelementptr inbounds %struct.Particle, ptr %115, i32 0, i32 0
  %117 = getelementptr inbounds %struct.Vector, ptr %116, i32 0, i32 0
  %118 = load i32, ptr %117, align 4
  %119 = sub nsw i32 %114, %118
  %120 = load i32, ptr %10, align 4
  %121 = mul nsw i32 %119, %120
  %122 = load ptr, ptr %5, align 8
  %123 = getelementptr inbounds %struct.Particle, ptr %122, i32 0, i32 2
  %124 = getelementptr inbounds %struct.Vector, ptr %123, i32 0, i32 0
  %125 = load i32, ptr %124, align 4
  %126 = add nsw i32 %125, %121
  store i32 %126, ptr %124, align 4
  %127 = load ptr, ptr %6, align 8
  %128 = getelementptr inbounds %struct.Particle, ptr %127, i32 0, i32 0
  %129 = getelementptr inbounds %struct.Vector, ptr %128, i32 0, i32 1
  %130 = load i32, ptr %129, align 4
  %131 = load ptr, ptr %5, align 8
  %132 = getelementptr inbounds %struct.Particle, ptr %131, i32 0, i32 0
  %133 = getelementptr inbounds %struct.Vector, ptr %132, i32 0, i32 1
  %134 = load i32, ptr %133, align 4
  %135 = sub nsw i32 %130, %134
  %136 = load i32, ptr %10, align 4
  %137 = mul nsw i32 %135, %136
  %138 = load ptr, ptr %5, align 8
  %139 = getelementptr inbounds %struct.Particle, ptr %138, i32 0, i32 2
  %140 = getelementptr inbounds %struct.Vector, ptr %139, i32 0, i32 1
  %141 = load i32, ptr %140, align 4
  %142 = add nsw i32 %141, %137
  store i32 %142, ptr %140, align 4
  br label %143

143:                                              ; preds = %104, %62, %57
  %144 = load i32, ptr %4, align 4
  %145 = add nsw i32 %144, 1
  store i32 %145, ptr %4, align 4
  br label %43, !llvm.loop !9

146:                                              ; preds = %43
  br label %147

147:                                              ; preds = %146, %25
  %148 = load i32, ptr %3, align 4
  %149 = add nsw i32 %148, 1
  store i32 %149, ptr %3, align 4
  br label %11, !llvm.loop !10

150:                                              ; preds = %11
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @setVelocity(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %4

4:                                                ; preds = %165, %1
  %5 = load i32, ptr %3, align 4
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.Particles, ptr %6, i32 0, i32 0
  %8 = load i32, ptr %7, align 8
  %9 = icmp slt i32 %5, %8
  br i1 %9, label %10, label %168

10:                                               ; preds = %4
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds %struct.Particles, ptr %11, i32 0, i32 1
  %13 = load ptr, ptr %12, align 8
  %14 = load i32, ptr %3, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds %struct.Particle, ptr %13, i64 %15
  %17 = call zeroext i1 @exists(ptr noundef %16)
  br i1 %17, label %19, label %18

18:                                               ; preds = %10
  br label %165

19:                                               ; preds = %10
  %20 = load ptr, ptr %2, align 8
  %21 = getelementptr inbounds %struct.Particles, ptr %20, i32 0, i32 1
  %22 = load ptr, ptr %21, align 8
  %23 = load i32, ptr %3, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds %struct.Particle, ptr %22, i64 %24
  %26 = getelementptr inbounds %struct.Particle, ptr %25, i32 0, i32 2
  %27 = getelementptr inbounds %struct.Vector, ptr %26, i32 0, i32 0
  %28 = load i32, ptr %27, align 4
  %29 = sdiv i32 %28, 60000
  %30 = load ptr, ptr %2, align 8
  %31 = getelementptr inbounds %struct.Particles, ptr %30, i32 0, i32 1
  %32 = load ptr, ptr %31, align 8
  %33 = load i32, ptr %3, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds %struct.Particle, ptr %32, i64 %34
  %36 = getelementptr inbounds %struct.Particle, ptr %35, i32 0, i32 1
  %37 = getelementptr inbounds %struct.Vector, ptr %36, i32 0, i32 0
  %38 = load i32, ptr %37, align 4
  %39 = add nsw i32 %38, %29
  store i32 %39, ptr %37, align 4
  %40 = load ptr, ptr %2, align 8
  %41 = getelementptr inbounds %struct.Particles, ptr %40, i32 0, i32 1
  %42 = load ptr, ptr %41, align 8
  %43 = load i32, ptr %3, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds %struct.Particle, ptr %42, i64 %44
  %46 = getelementptr inbounds %struct.Particle, ptr %45, i32 0, i32 2
  %47 = getelementptr inbounds %struct.Vector, ptr %46, i32 0, i32 1
  %48 = load i32, ptr %47, align 4
  %49 = sdiv i32 %48, 60000
  %50 = load ptr, ptr %2, align 8
  %51 = getelementptr inbounds %struct.Particles, ptr %50, i32 0, i32 1
  %52 = load ptr, ptr %51, align 8
  %53 = load i32, ptr %3, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds %struct.Particle, ptr %52, i64 %54
  %56 = getelementptr inbounds %struct.Particle, ptr %55, i32 0, i32 1
  %57 = getelementptr inbounds %struct.Vector, ptr %56, i32 0, i32 1
  %58 = load i32, ptr %57, align 4
  %59 = add nsw i32 %58, %49
  store i32 %59, ptr %57, align 4
  %60 = load ptr, ptr %2, align 8
  %61 = getelementptr inbounds %struct.Particles, ptr %60, i32 0, i32 1
  %62 = load ptr, ptr %61, align 8
  %63 = load i32, ptr %3, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds %struct.Particle, ptr %62, i64 %64
  %66 = getelementptr inbounds %struct.Particle, ptr %65, i32 0, i32 1
  %67 = getelementptr inbounds %struct.Vector, ptr %66, i32 0, i32 0
  %68 = load i32, ptr %67, align 4
  %69 = icmp sgt i32 %68, 1073741822
  br i1 %69, label %70, label %108

70:                                               ; preds = %19
  %71 = load ptr, ptr %2, align 8
  %72 = getelementptr inbounds %struct.Particles, ptr %71, i32 0, i32 1
  %73 = load ptr, ptr %72, align 8
  %74 = load i32, ptr %3, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds %struct.Particle, ptr %73, i64 %75
  %77 = getelementptr inbounds %struct.Particle, ptr %76, i32 0, i32 1
  %78 = getelementptr inbounds %struct.Vector, ptr %77, i32 0, i32 1
  %79 = load i32, ptr %78, align 4
  %80 = mul nsw i32 1, %79
  %81 = load ptr, ptr %2, align 8
  %82 = getelementptr inbounds %struct.Particles, ptr %81, i32 0, i32 1
  %83 = load ptr, ptr %82, align 8
  %84 = load i32, ptr %3, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds %struct.Particle, ptr %83, i64 %85
  %87 = getelementptr inbounds %struct.Particle, ptr %86, i32 0, i32 1
  %88 = getelementptr inbounds %struct.Vector, ptr %87, i32 0, i32 0
  %89 = load i32, ptr %88, align 4
  %90 = sdiv i32 %80, %89
  %91 = sub nsw i32 1073741823, %90
  %92 = load ptr, ptr %2, align 8
  %93 = getelementptr inbounds %struct.Particles, ptr %92, i32 0, i32 1
  %94 = load ptr, ptr %93, align 8
  %95 = load i32, ptr %3, align 4
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds %struct.Particle, ptr %94, i64 %96
  %98 = getelementptr inbounds %struct.Particle, ptr %97, i32 0, i32 1
  %99 = getelementptr inbounds %struct.Vector, ptr %98, i32 0, i32 1
  store i32 %91, ptr %99, align 4
  %100 = load ptr, ptr %2, align 8
  %101 = getelementptr inbounds %struct.Particles, ptr %100, i32 0, i32 1
  %102 = load ptr, ptr %101, align 8
  %103 = load i32, ptr %3, align 4
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds %struct.Particle, ptr %102, i64 %104
  %106 = getelementptr inbounds %struct.Particle, ptr %105, i32 0, i32 1
  %107 = getelementptr inbounds %struct.Vector, ptr %106, i32 0, i32 0
  store i32 1073741822, ptr %107, align 4
  br label %108

108:                                              ; preds = %70, %19
  %109 = load ptr, ptr %2, align 8
  %110 = getelementptr inbounds %struct.Particles, ptr %109, i32 0, i32 1
  %111 = load ptr, ptr %110, align 8
  %112 = load i32, ptr %3, align 4
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds %struct.Particle, ptr %111, i64 %113
  %115 = getelementptr inbounds %struct.Particle, ptr %114, i32 0, i32 1
  %116 = getelementptr inbounds %struct.Vector, ptr %115, i32 0, i32 1
  %117 = load i32, ptr %116, align 4
  %118 = icmp sgt i32 %117, 1073741822
  br i1 %118, label %119, label %157

119:                                              ; preds = %108
  %120 = load ptr, ptr %2, align 8
  %121 = getelementptr inbounds %struct.Particles, ptr %120, i32 0, i32 1
  %122 = load ptr, ptr %121, align 8
  %123 = load i32, ptr %3, align 4
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds %struct.Particle, ptr %122, i64 %124
  %126 = getelementptr inbounds %struct.Particle, ptr %125, i32 0, i32 1
  %127 = getelementptr inbounds %struct.Vector, ptr %126, i32 0, i32 0
  %128 = load i32, ptr %127, align 4
  %129 = mul nsw i32 1, %128
  %130 = load ptr, ptr %2, align 8
  %131 = getelementptr inbounds %struct.Particles, ptr %130, i32 0, i32 1
  %132 = load ptr, ptr %131, align 8
  %133 = load i32, ptr %3, align 4
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds %struct.Particle, ptr %132, i64 %134
  %136 = getelementptr inbounds %struct.Particle, ptr %135, i32 0, i32 1
  %137 = getelementptr inbounds %struct.Vector, ptr %136, i32 0, i32 1
  %138 = load i32, ptr %137, align 4
  %139 = sdiv i32 %129, %138
  %140 = sub nsw i32 1073741823, %139
  %141 = load ptr, ptr %2, align 8
  %142 = getelementptr inbounds %struct.Particles, ptr %141, i32 0, i32 1
  %143 = load ptr, ptr %142, align 8
  %144 = load i32, ptr %3, align 4
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds %struct.Particle, ptr %143, i64 %145
  %147 = getelementptr inbounds %struct.Particle, ptr %146, i32 0, i32 1
  %148 = getelementptr inbounds %struct.Vector, ptr %147, i32 0, i32 0
  store i32 %140, ptr %148, align 4
  %149 = load ptr, ptr %2, align 8
  %150 = getelementptr inbounds %struct.Particles, ptr %149, i32 0, i32 1
  %151 = load ptr, ptr %150, align 8
  %152 = load i32, ptr %3, align 4
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds %struct.Particle, ptr %151, i64 %153
  %155 = getelementptr inbounds %struct.Particle, ptr %154, i32 0, i32 1
  %156 = getelementptr inbounds %struct.Vector, ptr %155, i32 0, i32 1
  store i32 1073741822, ptr %156, align 4
  br label %157

157:                                              ; preds = %119, %108
  %158 = load ptr, ptr %2, align 8
  %159 = getelementptr inbounds %struct.Particles, ptr %158, i32 0, i32 1
  %160 = load ptr, ptr %159, align 8
  %161 = load i32, ptr %3, align 4
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds %struct.Particle, ptr %160, i64 %162
  %164 = call i32 @checkBorderIntersection(ptr noundef %163)
  br label %165

165:                                              ; preds = %157, %18
  %166 = load i32, ptr %3, align 4
  %167 = add nsw i32 %166, 1
  store i32 %167, ptr %3, align 4
  br label %4, !llvm.loop !11

168:                                              ; preds = %4
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @setOrigin(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %4

4:                                                ; preds = %60, %1
  %5 = load i32, ptr %3, align 4
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.Particles, ptr %6, i32 0, i32 0
  %8 = load i32, ptr %7, align 8
  %9 = icmp slt i32 %5, %8
  br i1 %9, label %10, label %63

10:                                               ; preds = %4
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds %struct.Particles, ptr %11, i32 0, i32 1
  %13 = load ptr, ptr %12, align 8
  %14 = load i32, ptr %3, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds %struct.Particle, ptr %13, i64 %15
  %17 = call zeroext i1 @exists(ptr noundef %16)
  br i1 %17, label %19, label %18

18:                                               ; preds = %10
  br label %60

19:                                               ; preds = %10
  %20 = load ptr, ptr %2, align 8
  %21 = getelementptr inbounds %struct.Particles, ptr %20, i32 0, i32 1
  %22 = load ptr, ptr %21, align 8
  %23 = load i32, ptr %3, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds %struct.Particle, ptr %22, i64 %24
  %26 = getelementptr inbounds %struct.Particle, ptr %25, i32 0, i32 1
  %27 = getelementptr inbounds %struct.Vector, ptr %26, i32 0, i32 0
  %28 = load i32, ptr %27, align 4
  %29 = sdiv i32 %28, 280
  %30 = load ptr, ptr %2, align 8
  %31 = getelementptr inbounds %struct.Particles, ptr %30, i32 0, i32 1
  %32 = load ptr, ptr %31, align 8
  %33 = load i32, ptr %3, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds %struct.Particle, ptr %32, i64 %34
  %36 = getelementptr inbounds %struct.Particle, ptr %35, i32 0, i32 0
  %37 = getelementptr inbounds %struct.Vector, ptr %36, i32 0, i32 0
  %38 = load i32, ptr %37, align 4
  %39 = add nsw i32 %38, %29
  store i32 %39, ptr %37, align 4
  %40 = load ptr, ptr %2, align 8
  %41 = getelementptr inbounds %struct.Particles, ptr %40, i32 0, i32 1
  %42 = load ptr, ptr %41, align 8
  %43 = load i32, ptr %3, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds %struct.Particle, ptr %42, i64 %44
  %46 = getelementptr inbounds %struct.Particle, ptr %45, i32 0, i32 1
  %47 = getelementptr inbounds %struct.Vector, ptr %46, i32 0, i32 1
  %48 = load i32, ptr %47, align 4
  %49 = sdiv i32 %48, 280
  %50 = load ptr, ptr %2, align 8
  %51 = getelementptr inbounds %struct.Particles, ptr %50, i32 0, i32 1
  %52 = load ptr, ptr %51, align 8
  %53 = load i32, ptr %3, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds %struct.Particle, ptr %52, i64 %54
  %56 = getelementptr inbounds %struct.Particle, ptr %55, i32 0, i32 0
  %57 = getelementptr inbounds %struct.Vector, ptr %56, i32 0, i32 1
  %58 = load i32, ptr %57, align 4
  %59 = add nsw i32 %58, %49
  store i32 %59, ptr %57, align 4
  br label %60

60:                                               ; preds = %19, %18
  %61 = load i32, ptr %3, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, ptr %3, align 4
  br label %4, !llvm.loop !12

63:                                               ; preds = %4
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @collideParticles(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %7

7:                                                ; preds = %65, %1
  %8 = load i32, ptr %3, align 4
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds %struct.Particles, ptr %9, i32 0, i32 0
  %11 = load i32, ptr %10, align 8
  %12 = icmp slt i32 %8, %11
  br i1 %12, label %13, label %68

13:                                               ; preds = %7
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds %struct.Particles, ptr %14, i32 0, i32 1
  %16 = load ptr, ptr %15, align 8
  %17 = load i32, ptr %3, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds %struct.Particle, ptr %16, i64 %18
  %20 = call zeroext i1 @exists(ptr noundef %19)
  br i1 %20, label %22, label %21

21:                                               ; preds = %13
  br label %65

22:                                               ; preds = %13
  %23 = load i32, ptr %3, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %4, align 4
  br label %25

25:                                               ; preds = %61, %22
  %26 = load i32, ptr %3, align 4
  %27 = load ptr, ptr %2, align 8
  %28 = getelementptr inbounds %struct.Particles, ptr %27, i32 0, i32 0
  %29 = load i32, ptr %28, align 8
  %30 = icmp slt i32 %26, %29
  br i1 %30, label %31, label %64

31:                                               ; preds = %25
  %32 = load ptr, ptr %2, align 8
  %33 = getelementptr inbounds %struct.Particles, ptr %32, i32 0, i32 1
  %34 = load ptr, ptr %33, align 8
  %35 = load i32, ptr %4, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds %struct.Particle, ptr %34, i64 %36
  %38 = call zeroext i1 @exists(ptr noundef %37)
  br i1 %38, label %40, label %39

39:                                               ; preds = %31
  br label %61

40:                                               ; preds = %31
  %41 = load ptr, ptr %2, align 8
  %42 = getelementptr inbounds %struct.Particles, ptr %41, i32 0, i32 1
  %43 = load ptr, ptr %42, align 8
  %44 = load i32, ptr %3, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds %struct.Particle, ptr %43, i64 %45
  store ptr %46, ptr %5, align 8
  %47 = load ptr, ptr %2, align 8
  %48 = getelementptr inbounds %struct.Particles, ptr %47, i32 0, i32 1
  %49 = load ptr, ptr %48, align 8
  %50 = load i32, ptr %4, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds %struct.Particle, ptr %49, i64 %51
  store ptr %52, ptr %6, align 8
  %53 = load ptr, ptr %6, align 8
  %54 = load ptr, ptr %5, align 8
  %55 = call zeroext i1 @intersectParticles(ptr noundef %54, ptr noundef %53)
  br i1 %55, label %56, label %60

56:                                               ; preds = %40
  %57 = load ptr, ptr %6, align 8
  %58 = load ptr, ptr %5, align 8
  %59 = call i32 @collideParticle(ptr noundef %58, ptr noundef %57)
  br label %60

60:                                               ; preds = %56, %40
  br label %61

61:                                               ; preds = %60, %39
  %62 = load i32, ptr %3, align 4
  %63 = add nsw i32 %62, 1
  store i32 %63, ptr %3, align 4
  br label %25, !llvm.loop !13

64:                                               ; preds = %25
  br label %65

65:                                               ; preds = %64, %21
  %66 = load i32, ptr %3, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, ptr %3, align 4
  br label %7, !llvm.loop !14

68:                                               ; preds = %7
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_start(ptr) #5

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i32 @_vsprintf_l(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 comdat {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %3, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store ptr %0, ptr %8, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = load ptr, ptr %6, align 8
  %11 = load ptr, ptr %7, align 8
  %12 = load ptr, ptr %8, align 8
  %13 = call i32 @_vsnprintf_l(ptr noundef %12, i64 noundef -1, ptr noundef %11, ptr noundef %10, ptr noundef %9)
  ret i32 %13
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_end(ptr) #5

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i32 @_vsnprintf_l(ptr noundef %0, i64 noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4) #0 comdat {
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i64, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  store ptr %4, ptr %6, align 8
  store ptr %3, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store i64 %1, ptr %9, align 8
  store ptr %0, ptr %10, align 8
  %12 = load ptr, ptr %6, align 8
  %13 = load ptr, ptr %7, align 8
  %14 = load ptr, ptr %8, align 8
  %15 = load i64, ptr %9, align 8
  %16 = load ptr, ptr %10, align 8
  %17 = call ptr @__local_stdio_printf_options()
  %18 = load i64, ptr %17, align 8
  %19 = or i64 %18, 1
  %20 = call i32 @__stdio_common_vsprintf(i64 noundef %19, ptr noundef %16, i64 noundef %15, ptr noundef %14, ptr noundef %13, ptr noundef %12)
  store i32 %20, ptr %11, align 4
  %21 = load i32, ptr %11, align 4
  %22 = icmp slt i32 %21, 0
  br i1 %22, label %23, label %24

23:                                               ; preds = %5
  br label %26

24:                                               ; preds = %5
  %25 = load i32, ptr %11, align 4
  br label %26

26:                                               ; preds = %24, %23
  %27 = phi i32 [ -1, %23 ], [ %25, %24 ]
  ret i32 %27
}

declare dso_local i32 @__stdio_common_vsprintf(i64 noundef, ptr noundef, i64 noundef, ptr noundef, ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local ptr @__local_stdio_printf_options() #0 comdat {
  ret ptr @__local_stdio_printf_options._OptionsStorage
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @checkBorderIntersection(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca %struct.Vector, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds %struct.Particle, ptr %6, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %4, ptr align 4 %7, i64 8, i1 false)
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.Particle, ptr %8, i32 0, i32 3
  %10 = load i32, ptr %9, align 4
  store i32 %10, ptr %5, align 4
  %11 = load ptr, ptr %3, align 8
  %12 = call zeroext i1 @exists(ptr noundef %11)
  br i1 %12, label %14, label %13

13:                                               ; preds = %1
  store i32 0, ptr %2, align 4
  br label %109

14:                                               ; preds = %1
  %15 = getelementptr inbounds %struct.Vector, ptr %4, i32 0, i32 0
  %16 = load i32, ptr %15, align 4
  %17 = load i32, ptr %5, align 4
  %18 = sub nsw i32 %16, %17
  %19 = icmp sle i32 %18, 0
  br i1 %19, label %20, label %32

20:                                               ; preds = %14
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds %struct.Particle, ptr %21, i32 0, i32 1
  %23 = getelementptr inbounds %struct.Vector, ptr %22, i32 0, i32 0
  %24 = load i32, ptr %23, align 4
  %25 = icmp slt i32 %24, 0
  br i1 %25, label %26, label %32

26:                                               ; preds = %20
  %27 = load ptr, ptr %3, align 8
  %28 = getelementptr inbounds %struct.Particle, ptr %27, i32 0, i32 1
  %29 = getelementptr inbounds %struct.Vector, ptr %28, i32 0, i32 0
  %30 = load i32, ptr %29, align 4
  %31 = mul nsw i32 %30, -1
  store i32 %31, ptr %29, align 4
  br label %32

32:                                               ; preds = %26, %20, %14
  %33 = getelementptr inbounds %struct.Vector, ptr %4, i32 0, i32 0
  %34 = load i32, ptr %33, align 4
  %35 = load i32, ptr %5, align 4
  %36 = add nsw i32 %34, %35
  %37 = load i32, ptr @window, align 4
  %38 = icmp uge i32 %36, %37
  br i1 %38, label %39, label %51

39:                                               ; preds = %32
  %40 = load ptr, ptr %3, align 8
  %41 = getelementptr inbounds %struct.Particle, ptr %40, i32 0, i32 1
  %42 = getelementptr inbounds %struct.Vector, ptr %41, i32 0, i32 0
  %43 = load i32, ptr %42, align 4
  %44 = icmp sgt i32 %43, 0
  br i1 %44, label %45, label %51

45:                                               ; preds = %39
  %46 = load ptr, ptr %3, align 8
  %47 = getelementptr inbounds %struct.Particle, ptr %46, i32 0, i32 1
  %48 = getelementptr inbounds %struct.Vector, ptr %47, i32 0, i32 0
  %49 = load i32, ptr %48, align 4
  %50 = mul nsw i32 %49, -1
  store i32 %50, ptr %48, align 4
  br label %51

51:                                               ; preds = %45, %39, %32
  %52 = getelementptr inbounds %struct.Vector, ptr %4, i32 0, i32 1
  %53 = load i32, ptr %52, align 4
  %54 = load i32, ptr %5, align 4
  %55 = sub nsw i32 %53, %54
  %56 = icmp sle i32 %55, 0
  br i1 %56, label %57, label %69

57:                                               ; preds = %51
  %58 = load ptr, ptr %3, align 8
  %59 = getelementptr inbounds %struct.Particle, ptr %58, i32 0, i32 1
  %60 = getelementptr inbounds %struct.Vector, ptr %59, i32 0, i32 1
  %61 = load i32, ptr %60, align 4
  %62 = icmp slt i32 %61, 0
  br i1 %62, label %63, label %69

63:                                               ; preds = %57
  %64 = load ptr, ptr %3, align 8
  %65 = getelementptr inbounds %struct.Particle, ptr %64, i32 0, i32 1
  %66 = getelementptr inbounds %struct.Vector, ptr %65, i32 0, i32 1
  %67 = load i32, ptr %66, align 4
  %68 = mul nsw i32 %67, -1
  store i32 %68, ptr %66, align 4
  br label %69

69:                                               ; preds = %63, %57, %51
  %70 = getelementptr inbounds %struct.Vector, ptr %4, i32 0, i32 1
  %71 = load i32, ptr %70, align 4
  %72 = load i32, ptr %5, align 4
  %73 = add nsw i32 %71, %72
  %74 = load i32, ptr getelementptr inbounds (%struct.Canva, ptr @window, i32 0, i32 1), align 4
  %75 = icmp uge i32 %73, %74
  br i1 %75, label %76, label %88

76:                                               ; preds = %69
  %77 = load ptr, ptr %3, align 8
  %78 = getelementptr inbounds %struct.Particle, ptr %77, i32 0, i32 1
  %79 = getelementptr inbounds %struct.Vector, ptr %78, i32 0, i32 1
  %80 = load i32, ptr %79, align 4
  %81 = icmp sgt i32 %80, 0
  br i1 %81, label %82, label %88

82:                                               ; preds = %76
  %83 = load ptr, ptr %3, align 8
  %84 = getelementptr inbounds %struct.Particle, ptr %83, i32 0, i32 1
  %85 = getelementptr inbounds %struct.Vector, ptr %84, i32 0, i32 1
  %86 = load i32, ptr %85, align 4
  %87 = mul nsw i32 %86, -1
  store i32 %87, ptr %85, align 4
  br label %88

88:                                               ; preds = %82, %76, %69
  %89 = getelementptr inbounds %struct.Vector, ptr %4, i32 0, i32 0
  %90 = load i32, ptr %89, align 4
  %91 = icmp slt i32 %90, 0
  br i1 %91, label %92, label %98

92:                                               ; preds = %88
  %93 = load i32, ptr %5, align 4
  %94 = add nsw i32 %93, 1
  %95 = load ptr, ptr %3, align 8
  %96 = getelementptr inbounds %struct.Particle, ptr %95, i32 0, i32 0
  %97 = getelementptr inbounds %struct.Vector, ptr %96, i32 0, i32 0
  store i32 %94, ptr %97, align 4
  br label %98

98:                                               ; preds = %92, %88
  %99 = getelementptr inbounds %struct.Vector, ptr %4, i32 0, i32 1
  %100 = load i32, ptr %99, align 4
  %101 = icmp slt i32 %100, 0
  br i1 %101, label %102, label %108

102:                                              ; preds = %98
  %103 = load i32, ptr %5, align 4
  %104 = add nsw i32 %103, 1
  %105 = load ptr, ptr %3, align 8
  %106 = getelementptr inbounds %struct.Particle, ptr %105, i32 0, i32 0
  %107 = getelementptr inbounds %struct.Vector, ptr %106, i32 0, i32 1
  store i32 %104, ptr %107, align 4
  br label %108

108:                                              ; preds = %102, %98
  store i32 0, ptr %2, align 4
  br label %109

109:                                              ; preds = %108, %13
  %110 = load i32, ptr %2, align 4
  ret i32 %110
}

; Function Attrs: noinline nounwind optnone uwtable
define internal zeroext i1 @intersectParticles(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %1, ptr %3, align 8
  store ptr %0, ptr %4, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = getelementptr inbounds %struct.Particle, ptr %8, i32 0, i32 3
  %10 = load i32, ptr %9, align 4
  %11 = load ptr, ptr %3, align 8
  %12 = getelementptr inbounds %struct.Particle, ptr %11, i32 0, i32 3
  %13 = load i32, ptr %12, align 4
  %14 = add nsw i32 %10, %13
  store i32 %14, ptr %5, align 4
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds %struct.Particle, ptr %15, i32 0, i32 0
  %17 = getelementptr inbounds %struct.Vector, ptr %16, i32 0, i32 0
  %18 = load i32, ptr %17, align 4
  %19 = load ptr, ptr %4, align 8
  %20 = getelementptr inbounds %struct.Particle, ptr %19, i32 0, i32 0
  %21 = getelementptr inbounds %struct.Vector, ptr %20, i32 0, i32 0
  %22 = load i32, ptr %21, align 4
  %23 = sub nsw i32 %18, %22
  store i32 %23, ptr %6, align 4
  %24 = load ptr, ptr %3, align 8
  %25 = getelementptr inbounds %struct.Particle, ptr %24, i32 0, i32 0
  %26 = getelementptr inbounds %struct.Vector, ptr %25, i32 0, i32 1
  %27 = load i32, ptr %26, align 4
  %28 = load ptr, ptr %4, align 8
  %29 = getelementptr inbounds %struct.Particle, ptr %28, i32 0, i32 0
  %30 = getelementptr inbounds %struct.Vector, ptr %29, i32 0, i32 1
  %31 = load i32, ptr %30, align 4
  %32 = sub nsw i32 %27, %31
  store i32 %32, ptr %7, align 4
  %33 = load i32, ptr %6, align 4
  %34 = load i32, ptr %6, align 4
  %35 = mul nsw i32 %33, %34
  %36 = load i32, ptr %7, align 4
  %37 = load i32, ptr %7, align 4
  %38 = mul nsw i32 %36, %37
  %39 = add nsw i32 %35, %38
  %40 = load i32, ptr %5, align 4
  %41 = load i32, ptr %5, align 4
  %42 = mul nsw i32 %40, %41
  %43 = icmp sle i32 %39, %42
  ret i1 %43
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @collideParticle(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %struct.Vector, align 4
  store ptr %1, ptr %3, align 8
  store ptr %0, ptr %4, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = getelementptr inbounds %struct.Particle, ptr %6, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %5, ptr align 4 %7, i64 8, i1 false)
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.Particle, ptr %8, i32 0, i32 1
  %10 = getelementptr inbounds %struct.Vector, ptr %9, i32 0, i32 0
  %11 = load i32, ptr %10, align 4
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds %struct.Particle, ptr %12, i32 0, i32 3
  %14 = load i32, ptr %13, align 4
  %15 = mul nsw i32 %11, %14
  %16 = load ptr, ptr %4, align 8
  %17 = getelementptr inbounds %struct.Particle, ptr %16, i32 0, i32 3
  %18 = load i32, ptr %17, align 4
  %19 = sdiv i32 %15, %18
  %20 = load ptr, ptr %4, align 8
  %21 = getelementptr inbounds %struct.Particle, ptr %20, i32 0, i32 1
  %22 = getelementptr inbounds %struct.Vector, ptr %21, i32 0, i32 0
  store i32 %19, ptr %22, align 4
  %23 = load ptr, ptr %3, align 8
  %24 = getelementptr inbounds %struct.Particle, ptr %23, i32 0, i32 1
  %25 = getelementptr inbounds %struct.Vector, ptr %24, i32 0, i32 1
  %26 = load i32, ptr %25, align 4
  %27 = load ptr, ptr %3, align 8
  %28 = getelementptr inbounds %struct.Particle, ptr %27, i32 0, i32 3
  %29 = load i32, ptr %28, align 4
  %30 = mul nsw i32 %26, %29
  %31 = load ptr, ptr %4, align 8
  %32 = getelementptr inbounds %struct.Particle, ptr %31, i32 0, i32 3
  %33 = load i32, ptr %32, align 4
  %34 = sdiv i32 %30, %33
  %35 = load ptr, ptr %4, align 8
  %36 = getelementptr inbounds %struct.Particle, ptr %35, i32 0, i32 1
  %37 = getelementptr inbounds %struct.Vector, ptr %36, i32 0, i32 1
  store i32 %34, ptr %37, align 4
  %38 = getelementptr inbounds %struct.Vector, ptr %5, i32 0, i32 0
  %39 = load i32, ptr %38, align 4
  %40 = load ptr, ptr %4, align 8
  %41 = getelementptr inbounds %struct.Particle, ptr %40, i32 0, i32 3
  %42 = load i32, ptr %41, align 4
  %43 = mul nsw i32 %39, %42
  %44 = load ptr, ptr %3, align 8
  %45 = getelementptr inbounds %struct.Particle, ptr %44, i32 0, i32 3
  %46 = load i32, ptr %45, align 4
  %47 = sdiv i32 %43, %46
  %48 = load ptr, ptr %3, align 8
  %49 = getelementptr inbounds %struct.Particle, ptr %48, i32 0, i32 1
  %50 = getelementptr inbounds %struct.Vector, ptr %49, i32 0, i32 0
  store i32 %47, ptr %50, align 4
  %51 = getelementptr inbounds %struct.Vector, ptr %5, i32 0, i32 1
  %52 = load i32, ptr %51, align 4
  %53 = load ptr, ptr %4, align 8
  %54 = getelementptr inbounds %struct.Particle, ptr %53, i32 0, i32 3
  %55 = load i32, ptr %54, align 4
  %56 = mul nsw i32 %52, %55
  %57 = load ptr, ptr %3, align 8
  %58 = getelementptr inbounds %struct.Particle, ptr %57, i32 0, i32 3
  %59 = load i32, ptr %58, align 4
  %60 = sdiv i32 %56, %59
  %61 = load ptr, ptr %3, align 8
  %62 = getelementptr inbounds %struct.Particle, ptr %61, i32 0, i32 1
  %63 = getelementptr inbounds %struct.Vector, ptr %62, i32 0, i32 1
  store i32 %60, ptr %63, align 4
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { allocsize(0) "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nocallback nofree nounwind willreturn writeonly }
attributes #4 = { argmemonly nocallback nofree nounwind willreturn }
attributes #5 = { nocallback nofree nosync nounwind willreturn }
attributes #6 = { allocsize(0) }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 2}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 2}
!3 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project.git e17ec8e9baa81d82cb1dde612b760dec72663d7b)"}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.mustprogress"}
!6 = distinct !{!6, !5}
!7 = distinct !{!7, !5}
!8 = distinct !{!8, !5}
!9 = distinct !{!9, !5}
!10 = distinct !{!10, !5}
!11 = distinct !{!11, !5}
!12 = distinct !{!12, !5}
!13 = distinct !{!13, !5}
!14 = distinct !{!14, !5}
