;Definition Of Structs

;Definition Of Global Variables
@n.1 = global i32 0

;Definition Of String Literals
@stringLiteral.0.1 = private unnamed_addr constant [4 x i8] c"YES\00"
@stringLiteral.1.1 = private unnamed_addr constant [3 x i8] c"NO\00"

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
	%0 = call i32 @getInt()
	store i32 %0, ptr @n.1
	%1 = load i32, ptr @n.1
	%2 = srem i32 %1, 4
	%3 = icmp eq i32 %2, 0
	%4 = alloca i1
	store i1 true, ptr %4
	br i1 %3, label %LogicBinary.end.3, label %LogicBinary.second.3
LogicBinary.second.3:
	%5 = load i32, ptr @n.1
	%6 = srem i32 %5, 7
	%7 = icmp eq i32 %6, 0
	store i1 %7, ptr %4
	br label %LogicBinary.end.3
LogicBinary.end.3:
	%8 = load i1, ptr %4
	%9 = alloca i1
	store i1 true, ptr %9
	br i1 %8, label %LogicBinary.end.2, label %LogicBinary.second.2
LogicBinary.second.2:
	%10 = load i32, ptr @n.1
	%11 = srem i32 %10, 47
	%12 = icmp eq i32 %11, 0
	store i1 %12, ptr %9
	br label %LogicBinary.end.2
LogicBinary.end.2:
	%13 = load i1, ptr %9
	%14 = alloca i1
	store i1 true, ptr %14
	br i1 %13, label %LogicBinary.end.1, label %LogicBinary.second.1
LogicBinary.second.1:
	%15 = load i32, ptr @n.1
	%16 = srem i32 %15, 74
	%17 = icmp eq i32 %16, 0
	store i1 %17, ptr %14
	br label %LogicBinary.end.1
LogicBinary.end.1:
	%18 = load i1, ptr %14
	%19 = alloca i1
	store i1 true, ptr %19
	br i1 %18, label %LogicBinary.end.0, label %LogicBinary.second.0
LogicBinary.second.0:
	%20 = load i32, ptr @n.1
	%21 = srem i32 %20, 477
	%22 = icmp eq i32 %21, 0
	store i1 %22, ptr %19
	br label %LogicBinary.end.0
LogicBinary.end.0:
	%23 = load i1, ptr %19
	br i1 %23, label %if.then.0, label %if.else.0
if.then.0:
	call void @print(ptr @stringLiteral.0.1)
	br label %if.endif.0
if.else.0:
	call void @print(ptr @stringLiteral.1.1)
	br label %if.endif.0
if.endif.0:
	ret i32 0
}

define void @global.init () {
global.init:
	ret void
}

