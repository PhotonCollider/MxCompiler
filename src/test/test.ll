;Definition Of Structs
%struct.Edge = type {i32, i32, i32}
%struct.EdgeList = type {ptr}

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
define void @EdgeList.init (ptr %0, i32 %1, i32 %2) {
EdgeList.init:
	%n.1 = alloca i32
	store i32 %1, ptr %n.1
	%m.1 = alloca i32
	store i32 %2, ptr %m.1
	%3 = load i32, ptr %m.1
	%4 = call ptr @builtin.calloc_array(i32 4, i32 %3)
	%5 = getelementptr %struct.EdgeList, ptr %0, i32 0, i32 0
	store ptr %4, ptr %5
	ret void
}

define i32 @main () {
main:
	call void @global.init()
	ret i32 0
}

define void @global.init () {
global.init:
	ret void
}

