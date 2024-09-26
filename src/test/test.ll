;Definition Of Structs

;Definition Of Global Variables

;Definition Of String Literals

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
define i32 @gcd (i32 %0, i32 %1) {
gcd:
	%x.1 = alloca i32
	store i32 %0, ptr %x.1
	%y.1 = alloca i32
	store i32 %1, ptr %y.1

	%2 = load i32, ptr %x.1
	%3 = load i32, ptr %y.1
	%4 = srem i32 %2, %3
	%5 = icmp eq i32 %4, 0
	br i1 %5, label if.then.0, label if.else.0
if.then.0:
	%6 = load i32, ptr %y.1
	ret i32 %6
if.else.0:
	%7 = load i32, ptr %y.1
	%8 = load i32, ptr %x.1
	%9 = load i32, ptr %y.1
	%10 = srem i32 %8, %9
	%11 = call i32 @gcd(i32 %7, i32 %10)
	ret i32 %11
if.endif.0:
}

define i32 @main () {
main:
	call void @global.init()
	%12 = call i32 @gcd(i32 10, i32 1)
	%13 = call ptr @toString(i32 %12)
	call void @println(ptr %13)
	ret i32 0
}

define void @global.init () {
global.init:
	ret void
}

