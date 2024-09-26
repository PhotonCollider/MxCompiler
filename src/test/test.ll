;Definition Of Structs

;Definition Of Global Variables
@t.1 = global i32 0
@l.1 = global i32 0
@i.1 = global i32 0
@s.1 = global ptr null

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
	%0 = call i32 @getInt()
	store i32 %0, ptr @t.1
	store i32 0, ptr @i.1
	br label %for.cond0
for.cond0:
	%1 = load i32, ptr @i.1
	%2 = load i32, ptr @t.1
	%3 = icmp slt i32 %1, %2
	br i1 %3, label %for.body.0, label %for.end.0
for.body.0:
	%4 = call ptr @getString()
	store ptr %4, ptr @s.1
	%5 = load ptr, ptr @s.1
	%6 = call i32 @string.length(ptr %5)
	store i32 %6, ptr @l.1
	%7 = load i32, ptr @l.1
	%8 = icmp sgt i32 %7, 10
	br i1 %8, label %if.then.0, label %if.else.0
if.then.0:
	%9 = load ptr, ptr @s.1
	%10 = call ptr @string.substring(ptr %9, i32 0, i32 1)
	%11 = load i32, ptr @l.1
	%12 = sub i32 %11, 2
	%13 = call ptr @toString(i32 %12)
	%14 = call ptr @builtin.string_add(ptr %10, ptr %13)
	%15 = load ptr, ptr @s.1
	%16 = load i32, ptr @l.1
	%17 = sub i32 %16, 1
	%18 = load i32, ptr @l.1
	%19 = call ptr @string.substring(ptr %15, i32 %17, i32 %18)
	%20 = call ptr @builtin.string_add(ptr %14, ptr %19)
	call void @println(ptr %20)
	br label %if.endif.0
if.else.0:
	%21 = load ptr, ptr @s.1
	call void @println(ptr %21)
	br label %if.endif.0
if.endif.0:
	%22 = load i32, ptr @i.1
	%23 = add i32 %22, 1
	store i32 %23, ptr @i.1
	br label %for.cond0
for.end.0:
	ret i32 0
}

define void @global.init () {
global.init:
	ret void
}

