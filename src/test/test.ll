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
define void @point.printPoint (ptr %14) {
point.printPoint:
	%15 = getelementptr %struct.point, ptr %14, i32 0, i32 0
	%16 = load i32, ptr %15
	%17 = call ptr @toString(i32 %16)
	%18 = call ptr @builtin.string_add(ptr @stringLiteral.0, ptr %17)
	%19 = call ptr @builtin.string_add(ptr %18, ptr @stringLiteral.1)
	%20 = getelementptr %struct.point, ptr %14, i32 0, i32 1
	%21 = load i32, ptr %20
	%22 = call ptr @toString(i32 %21)
	%23 = call ptr @builtin.string_add(ptr %19, ptr %22)
	%24 = call ptr @builtin.string_add(ptr %23, ptr @stringLiteral.2)
	%25 = getelementptr %struct.point, ptr %14, i32 0, i32 2
	%26 = load i32, ptr %25
	%27 = call ptr @toString(i32 %26)
	%28 = call ptr @builtin.string_add(ptr %24, ptr %27)
	%29 = call ptr @builtin.string_add(ptr %28, ptr @stringLiteral.3)
	call void @println(ptr %29)
	ret void
}

define i32 @main () {
main:
	call void @global.init()
	%a.1 = alloca ptr
	%0 = call ptr @builtin.calloc(i32 12)
	call void @point.point()
	store ptr %0, ptr %a.1
	%1 = load ptr, ptr %a.1
	%2 = sub i32 0, 463
	call void @point.set(ptr %1, i32 849, i32 %2, i32 480)
	%3 = load ptr, ptr %a.1
	call void @point.printPoint(ptr %3)
	ret i32 0
}

define void @point.set (ptr %4, i32 %5, i32 %6, i32 %7) {
point.set:
	%a_x.1 = alloca i32
	store i32 %5, ptr %a_x.1
	%a_y.1 = alloca i32
	store i32 %6, ptr %a_y.1
	%a_z.1 = alloca i32
	store i32 %7, ptr %a_z.1
	%8 = load i32, ptr %a_x.1
	%9 = getelementptr %struct.point, ptr %4, i32 0, i32 0
	store i32 %8, ptr %9
	%10 = load i32, ptr %a_y.1
	%11 = getelementptr %struct.point, ptr %4, i32 0, i32 1
	store i32 %10, ptr %11
	%12 = load i32, ptr %a_z.1
	%13 = getelementptr %struct.point, ptr %4, i32 0, i32 2
	store i32 %12, ptr %13
	ret void
}

define void @point.point (ptr %this) {
point.point.entry:
	%30 = getelementptr %struct.point, ptr %this, i32 0, i32 0
	store i32 0, ptr %30
	%31 = getelementptr %struct.point, ptr %this, i32 0, i32 1
	store i32 0, ptr %31
	%32 = getelementptr %struct.point, ptr %this, i32 0, i32 2
	store i32 0, ptr %32
	ret void
}

define void @global.init () {
global.init:
	ret void
}

