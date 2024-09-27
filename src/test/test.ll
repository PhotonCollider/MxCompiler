;Definition Of Structs

;Definition Of Global Variables

;Definition Of String Literals
@stringLiteral.0 = private unnamed_addr constant [4 x i8] c"aaa\00"
@stringLiteral.1 = private unnamed_addr constant [4 x i8] c"bbb\00"
@stringLiteral.2 = private unnamed_addr constant [4 x i8] c"ccc\00"
@stringLiteral.3 = private unnamed_addr constant [4 x i8] c"ddd\00"
@stringLiteral.4 = private unnamed_addr constant [4 x i8] c"eee\00"

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
define i32 @main () {
main:
	call void @global.init()
	%a.1 = alloca i32
	%0 = call i32 @getInt()
	store i32 %0, ptr %a.1
	%b.1 = alloca i32
	%1 = call i32 @getInt()
	store i32 %1, ptr %b.1
	%c.1 = alloca i32
	%2 = call i32 @getInt()
	store i32 %2, ptr %c.1
	%3 = load i32, ptr %a.1
	%4 = add i32 %3, 1
	store i32 %4, ptr %a.1
	%5 = load i32, ptr %b.1
	%6 = call i1 @builtin.string_eq(i32 %3, i32 %5)
	br i1 %6, label %cond.then.0, label %cond.else.0
cond.then.0:
	%7 = load i32, ptr %a.1
	%8 = add i32 %7, 1
	store i32 %8, ptr %a.1
	%9 = load i32, ptr %b.1
	%10 = call i1 @builtin.string_eq(i32 %7, i32 %9)
	br i1 %10, label %cond.then.1, label %cond.else.1
cond.then.1:
	call void @foo1()
	br label %cond.end.1
cond.else.1:
	call void @foo2()
	br label %cond.end.1
cond.end.1:
	br label %cond.end.0
cond.else.0:
	%11 = load i32, ptr %a.1
	%12 = add i32 %11, 1
	store i32 %12, ptr %a.1
	%13 = load i32, ptr %b.1
	%14 = call i1 @builtin.string_eq(i32 %11, i32 %13)
	br i1 %14, label %cond.then.2, label %cond.else.2
cond.then.2:
	%15 = load i32, ptr %b.1
	%16 = add i32 %15, 1
	store i32 %16, ptr %b.1
	%17 = load i32, ptr %b.1
	%18 = load i32, ptr %c.1
	%19 = add i32 %18, 1
	store i32 %19, ptr %c.1
	%20 = call i1 @builtin.string_eq(i32 %17, i32 %18)
	br i1 %20, label %cond.then.3, label %cond.else.3
cond.then.3:
	call void @foo3()
	br label %cond.end.3
cond.else.3:
	call void @foo4()
	br label %cond.end.3
cond.end.3:
	br label %cond.end.2
cond.else.2:
	call void @foo5()
	br label %cond.end.2
cond.end.2:
	br label %cond.end.0
cond.end.0:
	%21 = load i32, ptr %a.1
	call void @printlnInt(i32 %21)
	%22 = load i32, ptr %b.1
	call void @printlnInt(i32 %22)
	%23 = load i32, ptr %c.1
	call void @printlnInt(i32 %23)
	ret i32 0
}

define void @foo1 () {
foo1:
	call void @println(ptr @stringLiteral.0)
	ret void
}

define void @global.init () {
global.init:
	ret void
}

define void @foo2 () {
foo2:
	call void @println(ptr @stringLiteral.1)
	ret void
}

define void @foo3 () {
foo3:
	call void @println(ptr @stringLiteral.2)
	ret void
}

define void @foo4 () {
foo4:
	call void @println(ptr @stringLiteral.3)
	ret void
}

define void @foo5 () {
foo5:
	call void @println(ptr @stringLiteral.4)
	ret void
}

