;Definition Of Structs
%struct.point = type {i32, i32, i32}

;Definition Of Global Variables

;Definition Of String Literals
@stringLiteral.0 = private unnamed_addr constant [2 x i8] c"(\00"
@stringLiteral.1 = private unnamed_addr constant [3 x i8] c", \00"
@stringLiteral.2 = private unnamed_addr constant [3 x i8] c", \00"
@stringLiteral.3 = private unnamed_addr constant [2 x i8] c")\00"

;Definition Of Formatted String Fragments

;Definition Of Array Literals

;Declarations Of Functions
declare void @print(ptr)
declare void @println(ptr)
declare void @printInt(i32)
declare void @printlnInt(i32)
declare ptr @getString()
declare i32 @getInt()
declare ptr @toString(i32)
declare ptr @array.copy(ptr, i32)
declare i32 @array.size(ptr)
declare i32 @string.length(ptr)
declare i32 @string.ord(ptr, i32)
declare i32 @string.parseInt(ptr)
declare ptr @string.substring(ptr, i32, i32)
declare ptr @builtin.bool_to_string(i1)
declare ptr @builtin.calloc(i32)
declare ptr @builtin.calloc_array(i32, i32)
declare ptr @builtin.malloc(i32)
declare ptr @builtin.malloc_array(i32, i32)
declare ptr @builtin.string_add(ptr, ptr)
declare i1 @builtin.string_eq(ptr, ptr)
declare i1 @builtin.string_ge(ptr, ptr)
declare i1 @builtin.string_geq(ptr, ptr)
declare i1 @builtin.string_le(ptr, ptr)
declare i1 @builtin.string_leq(ptr, ptr)
declare i1 @builtin.string_ne(ptr, ptr)

;Definition Of Functions
define void @point.printPoint (ptr %26) {
point.printPoint:
	%27 = getelementptr %struct.point, ptr %26, i32 0, i32 0
	%28 = load i32, ptr %27
	%29 = call ptr @toString(i32 %28)
	%30 = call ptr @builtin.string_add(ptr @stringLiteral.0, ptr %29)
	%31 = call ptr @builtin.string_add(ptr %30, ptr @stringLiteral.1)
	%32 = getelementptr %struct.point, ptr %26, i32 0, i32 1
	%33 = load i32, ptr %32
	%34 = call ptr @toString(i32 %33)
	%35 = call ptr @builtin.string_add(ptr %31, ptr %34)
	%36 = call ptr @builtin.string_add(ptr %35, ptr @stringLiteral.2)
	%37 = getelementptr %struct.point, ptr %26, i32 0, i32 2
	%38 = load i32, ptr %37
	%39 = call ptr @toString(i32 %38)
	%40 = call ptr @builtin.string_add(ptr %36, ptr %39)
	%41 = call ptr @builtin.string_add(ptr %40, ptr @stringLiteral.3)
	call void @println(ptr %41)
	ret void
}

define ptr @point.cross (ptr %21, ptr %22) {
point.cross:
	%other.1 = alloca ptr

	store ptr %22, ptr %other.1

	%retval.1 = alloca ptr

	%23 = call ptr @builtin.calloc(i32 12)

	call void @point.point()

	store ptr %23, ptr %retval.1

	%24 = load ptr, ptr %retval.1

	call void @point.set(ptr %24, i32 7, i32 7, i32 7)

	%25 = load ptr, ptr %retval.1
	ret ptr %25
}

define i32 @main () {
main:
	call void @global.init()
	%a.1 = alloca ptr
	%0 = call ptr @builtin.calloc(i32 12)
	call void @point.point()
	store ptr %0, ptr %a.1
	%b.1 = alloca ptr
	%1 = call ptr @builtin.calloc(i32 12)
	call void @point.point()
	store ptr %1, ptr %b.1
	%2 = load ptr, ptr %a.1
	call void @point.set(ptr %2, i32 1, i32 2, i32 3)
	%3 = load ptr, ptr %b.1
	call void @point.set(ptr %3, i32 4, i32 5, i32 6)
	%4 = load ptr, ptr %a.1
	call void @point.printPoint(ptr %4)
	%5 = load ptr, ptr %b.1
	call void @point.printPoint(ptr %5)

	%6 = load ptr, ptr %a.1
	%7 = load ptr, ptr %b.1
	%8 = call ptr @point.cross(ptr %6, ptr %7)
	call void @point.printPoint(ptr %8)

	%9 = load ptr, ptr %a.1
	call void @point.printPoint(ptr %9)
	%10 = load ptr, ptr %b.1
	call void @point.printPoint(ptr %10)
	ret i32 0
}

define void @point.set (ptr %11, i32 %12, i32 %13, i32 %14) {
point.set:
	%a_x.1 = alloca i32
	store i32 %12, ptr %a_x.1
	%a_y.1 = alloca i32
	store i32 %13, ptr %a_y.1
	%a_z.1 = alloca i32
	store i32 %14, ptr %a_z.1
	%15 = load i32, ptr %a_x.1
	%16 = getelementptr %struct.point, ptr %11, i32 0, i32 0
	store i32 %15, ptr %16
	%17 = load i32, ptr %a_y.1
	%18 = getelementptr %struct.point, ptr %11, i32 0, i32 1
	store i32 %17, ptr %18
	%19 = load i32, ptr %a_z.1
	%20 = getelementptr %struct.point, ptr %11, i32 0, i32 2
	store i32 %19, ptr %20
	ret void
}

define void @point.point (ptr %this) {
point.point.entry:
	%42 = getelementptr %struct.point, ptr %this, i32 0, i32 0
	store i32 0, ptr %42
	%43 = getelementptr %struct.point, ptr %this, i32 0, i32 1
	store i32 0, ptr %43
	%44 = getelementptr %struct.point, ptr %this, i32 0, i32 2
	store i32 0, ptr %44
	ret void
}

define void @global.init () {
global.init:
	ret void
}

