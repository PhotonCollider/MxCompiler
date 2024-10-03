;Definition Of Structs

;Definition Of Global Variables
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
	%b.1 = alloca ptr
	%1 = call ptr @builtin.calloc_array(i32 4, i32 4)
	store ptr %1, ptr %b.1
	%2 = load ptr, ptr %b.1

	%3 = getelementptr i32, ptr %2, i32 2

	store i32 2, ptr %3

	%4 = load ptr, ptr %b.1

	store ptr %4, ptr @a

	%5 = load ptr, ptr @a

	%6 = getelementptr i32, ptr %5, i32 2

	%7 = load i32, ptr %6

	%8 = call ptr @toString(i32 %7)

	call void @println(ptr %8)
	ret i32 0
}

define void @global.init () {
global.init:
	%0 = call ptr @builtin.calloc_array(i32 4, i32 4)
	store ptr %0, ptr @a
	ret void
}

