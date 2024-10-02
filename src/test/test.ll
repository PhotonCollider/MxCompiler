;Definition Of Structs

;Definition Of Global Variables
@i = global i32 0
@j = global i32 0

;Definition Of String Literals
@stringLiteral.0 = private unnamed_addr constant [1 x i8] c"\00"

;Definition Of Formatted String Fragments
@FString.0.Literal.0 = private unnamed_addr constant [1 x i8] c"\00"
@FString.0.Literal.1 = private unnamed_addr constant [2 x i8] c"*\00"
@FString.0.Literal.2 = private unnamed_addr constant [2 x i8] c"=\00"
@FString.0.Literal.3 = private unnamed_addr constant [2 x i8] c" \00"

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
	store i32 1, ptr @i
	br label %for.cond.0
for.cond.0:
	%0 = load i32, ptr @i
	%1 = icmp slt i32 %0, 10
	br i1 %1, label %for.body.0, label %for.end.0
for.body.0:
	%line.1 = alloca ptr
	store ptr @stringLiteral.0, ptr %line.1
	store i32 1, ptr @j
	br label %for.cond.1
for.cond.1:
	%2 = load i32, ptr @j
	%3 = icmp slt i32 %2, 10
	br i1 %3, label %for.body.1, label %for.end.1
for.body.1:
	%4 = load ptr, ptr %line.1
	%5 = load i32, ptr @i
	%6 = call ptr @toString(i32 %5)
	%7 = load i32, ptr @j
	%8 = call ptr @toString(i32 %7)
	%9 = load i32, ptr @i
	%10 = load i32, ptr @j
	%11 = mul i32 %9, %10
	%12 = call ptr @toString(i32 %11)
	%13 = call ptr @builtin.string_add(ptr @FString.0.Literal.0, ptr %6)
	%14 = call ptr @builtin.string_add(ptr %13, ptr @FString.0.Literal.1)
	%15 = call ptr @builtin.string_add(ptr %14, ptr %8)
	%16 = call ptr @builtin.string_add(ptr %15, ptr @FString.0.Literal.2)
	%17 = call ptr @builtin.string_add(ptr %16, ptr %12)
	%18 = call ptr @builtin.string_add(ptr %17, ptr @FString.0.Literal.3)
	%19 = call ptr @builtin.string_add(ptr %4, ptr %18)
	store ptr %19, ptr %line.1
	br label %for.update.1
for.update.1:
	%20 = load i32, ptr @j
	%21 = add i32 %20, 1
	store i32 %21, ptr @j
	br label %for.cond.1
for.end.1:
	%22 = load ptr, ptr %line.1
	call void @println(ptr %22)
	br label %for.update.0
for.update.0:
	%23 = load i32, ptr @i
	%24 = add i32 %23, 1
	store i32 %24, ptr @i
	br label %for.cond.0
for.end.0:
	ret i32 0
}

define void @global.init () {
global.init:
	store i32 0, ptr @i
	store i32 0, ptr @j
	ret void
}

