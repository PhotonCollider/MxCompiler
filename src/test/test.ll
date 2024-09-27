;Definition Of Structs

;Definition Of Global Variables

;Definition Of String Literals
@stringLiteral.0 = private unnamed_addr constant [4 x i8] c"uyy\00"
@stringLiteral.1 = private unnamed_addr constant [4 x i8] c"yuy\00"
@stringLiteral.2 = private unnamed_addr constant [4 x i8] c"uyy\00"
@stringLiteral.3 = private unnamed_addr constant [4 x i8] c"yuv\00"

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
	%t.1 = alloca i1
	%3 = alloca ptr
	%4 = load i32, ptr %a.1
	%5 = add i32 %4, 1
	store i32 %5, ptr %a.1
	%6 = load i32, ptr %a.1
	%7 = load i32, ptr %b.1
	%8 = call i1 @builtin.string_eq(i32 %6, i32 %7)
	br i1 %8, label %cond.then.0, label %cond.else.0
cond.then.0:
	store ptr @stringLiteral.0, ptr %3
	br label %cond.end.0
cond.else.0:
	store ptr @stringLiteral.1, ptr %3
	br label %cond.end.0
cond.end.0:
	%9 = load ptr, ptr %3
	%10 = alloca ptr
	%11 = load i32, ptr %b.1
	%12 = load i32, ptr %c.1
	%13 = add i32 %12, -1
	store i32 %13, ptr %c.1
	%14 = load i32, ptr %c.1
	%15 = call i1 @builtin.string_eq(i32 %11, i32 %14)
	br i1 %15, label %cond.then.1, label %cond.else.1
cond.then.1:
	store ptr @stringLiteral.2, ptr %10
	br label %cond.end.1
cond.else.1:
	store ptr @stringLiteral.3, ptr %10
	br label %cond.end.1
cond.end.1:
	%16 = load ptr, ptr %10
	%17 = call i1 @builtin.string_eq(ptr %9, ptr %16)
	store i1 %17, ptr %t.1
	%18 = load i1, ptr %t.1
	br i1 %18, label %if.then.0, label %if.else.0
if.then.0:
	%19 = load i32, ptr %a.1
	call void @printlnInt(i32 %19)
	br label %if.endif.0
if.else.0:
	br label %if.endif.0
if.endif.0:
	ret i32 0
}

define void @global.init () {
global.init:
	ret void
}

