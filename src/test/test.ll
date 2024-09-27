;Definition Of Structs

;Definition Of Global Variables
@n = global i32 0
@a = global ptr null

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
define i32 @main () {
main:
	call void @global.init()
	%0 = load i32, ptr @n
	%1 = load i32, ptr @n
	%2 = call ptr @builtin.calloc_array(i32 4, i32 %0)
	%3 = alloca i32
	store i32 0, ptr %3
	br label %allocateArrayFor.cond0
allocateArrayFor.cond0:
	%4 = load i32, ptr %3
	%5 = icmp slt i32 %4, %0
	br i1 %5, label %allocateArrayFor.body.0, label %allocateArrayFor.end.0
allocateArrayFor.body.0:
	%6 = getelementptr ptr, ptr %2, i32 %4
	%7 = call ptr @builtin.calloc_array(i32 4, i32 %1)
	store ptr %7, ptr %6
	%8 = load i32, ptr %3
	%9 = add i32 %8, 1
	store i32 %9, ptr %3
	br label %allocateArrayFor.cond0
allocateArrayFor.end.0:
	store ptr %2, ptr @a
	ret i32 0
}

define void @global.init () {
global.init:
	store i32 5, ptr @n
	ret void
}

