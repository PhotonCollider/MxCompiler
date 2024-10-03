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
define i32 @main () {
main:
	call void @global.init()
	%i.1 = alloca i32
	store i32 0, ptr %i.1
	br label %for.cond.0
for.cond.0:
	%0 = load i32, ptr %i.1
	%1 = icmp slt i32 %0, 5
	br i1 %1, label %for.body.0, label %for.end.0
for.body.0:
	br label %for.update.0
for.update.0:
	%2 = load i32, ptr %i.1
	%3 = add i32 %2, 1
	store i32 %3, ptr %i.1
	br label %for.cond.0
for.end.0:
	ret i32 0
}

define void @global.init () {
global.init:
	ret void
}

