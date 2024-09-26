;Definition Of Structs

;Definition Of Global Variables
@a.1 = global ptr null

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
	%1 = load ptr, ptr @a.1
	%2 = getelementptr i32, ptr %1, i32 0
	store i32 0, ptr %2
	%3 = load ptr, ptr @a.1
	%4 = getelementptr i32, ptr %3, i32 1
	store i32 1, ptr %4
	%5 = load ptr, ptr @a.1
	%6 = getelementptr i32, ptr %5, i32 2
	store i32 2, ptr %6
	%7 = load ptr, ptr @a.1
	%8 = getelementptr i32, ptr %7, i32 3
	store i32 3, ptr %8
	%9 = load ptr, ptr @a.1
	%10 = getelementptr i32, ptr %9, i32 1
	%11 = load i32, ptr %10
	%12 = call ptr @toString(i32 %11)
	%13 = load ptr, ptr @a.1
	%14 = getelementptr i32, ptr %13, i32 1
	%15 = load i32, ptr %14
	%16 = call ptr @toString(i32 %15)
	call void @println(ptr %16)
	%17 = load ptr, ptr @a.1
	%18 = getelementptr i32, ptr %17, i32 2
	%19 = load i32, ptr %18
	%20 = call ptr @toString(i32 %19)
	call void @println(ptr %20)
	%21 = load ptr, ptr @a.1
	%22 = getelementptr i32, ptr %21, i32 3
	%23 = load i32, ptr %22
	%24 = call ptr @toString(i32 %23)
	call void @println(ptr %24)
	%i.1 = alloca i32
	store i32 0, ptr %i.1
	br label %for.cond0
for.cond0:
	%25 = load i32, ptr %i.1
	%26 = icmp slt i32 %25, 4
	br i1 %26, label %for.body.0, label %for.end.0
for.body.0:
	%27 = load ptr, ptr @a.1
	%28 = load i32, ptr %i.1
	%29 = getelementptr i32, ptr %27, i32 %28
	%30 = load i32, ptr %29
	%31 = call ptr @toString(i32 %30)
	call void @println(ptr %31)
	%32 = load i32, ptr %i.1
	%33 = add i32 %32, 1
	store i32 %33, ptr %i.1
	br label %for.cond0
for.end.0:
	ret i32 0
}

define void @global.init () {
global.init:
	%0 = call ptr @builtin.calloc_array(i32 4, i32 4)
	store ptr %0, ptr @a.1
	ret void
}

