;Definition Of Structs

;Definition Of Global Variables
@a = global ptr null
@str = global ptr null

;Definition Of String Literals
@stringLiteral.0 = private unnamed_addr constant [5 x i8] c"str1\00"
@stringLiteral.1 = private unnamed_addr constant [5 x i8] c"str2\00"
@stringLiteral.2 = private unnamed_addr constant [5 x i8] c"str3\00"
@stringLiteral.3 = private unnamed_addr constant [5 x i8] c"str4\00"
@stringLiteral.4 = private unnamed_addr constant [5 x i8] c"str5\00"
@stringLiteral.5 = private unnamed_addr constant [5 x i8] c"str6\00"
@stringLiteral.6 = private unnamed_addr constant [5 x i8] c"str7\00"
@stringLiteral.7 = private unnamed_addr constant [5 x i8] c"str8\00"
@stringLiteral.8 = private unnamed_addr constant [5 x i8] c"str9\00"
@stringLiteral.9 = private unnamed_addr constant [6 x i8] c"str10\00"

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
	%j.1 = alloca i32
	store i32 0, ptr %i.1
	br label %for.cond.0
for.cond.0:
	%9 = load i32, ptr %i.1
	%10 = icmp sle i32 %9, 29
	br i1 %10, label %for.body.0, label %for.end.0
for.body.0:
	%sum.1 = alloca i32
	store i32 0, ptr %sum.1
	%11 = load ptr, ptr @a
	%12 = load i32, ptr %i.1
	%13 = getelementptr ptr, ptr %11, i32 %12
	%14 = load ptr, ptr %13
	%15 = getelementptr i32, ptr %14, i32 0
	%16 = load i32, ptr %15
	%17 = call ptr @toString(i32 %16)
	%18 = load ptr, ptr @str
	%19 = load i32, ptr %i.1
	%20 = getelementptr ptr, ptr %18, i32 %19
	store ptr %17, ptr %20
	store i32 0, ptr %j.1
	br label %for.cond.1
for.cond.1:
	%21 = load i32, ptr %j.1
	%22 = load i32, ptr %i.1
	%23 = icmp slt i32 %21, %22
	br i1 %23, label %for.body.1, label %for.end.1
for.body.1:
	%24 = load i32, ptr %j.1
	%25 = and i32 %24, 1
	%26 = icmp eq i32 %25, 0
	br i1 %26, label %if.then.0, label %if.else.0
if.then.0:
	%27 = load i32, ptr %sum.1
	%28 = load ptr, ptr @a
	%29 = load i32, ptr %i.1
	%30 = getelementptr ptr, ptr %28, i32 %29
	%31 = load ptr, ptr %30
	%32 = getelementptr i32, ptr %31, i32 0
	%33 = load i32, ptr %32
	%34 = add i32 %27, %33
	store i32 %34, ptr %sum.1
	br label %if.endif.0
if.else.0:
	br label %if.endif.0
if.endif.0:
	%35 = load i32, ptr %j.1
	%36 = and i32 %35, 1
	%37 = icmp eq i32 %36, 1
	br i1 %37, label %if.then.1, label %if.else.1
if.then.1:
	%38 = load i32, ptr %sum.1
	%39 = load ptr, ptr @a
	%40 = load i32, ptr %i.1
	%41 = getelementptr ptr, ptr %39, i32 %40
	%42 = load ptr, ptr %41
	%43 = getelementptr i32, ptr %42, i32 29
	%44 = load i32, ptr %43
	%45 = add i32 %38, %44
	store i32 %45, ptr %sum.1
	br label %if.endif.1
if.else.1:
	br label %if.endif.1
if.endif.1:
	br label %for.update.1
for.update.1:
	%46 = load i32, ptr %j.1
	%47 = add i32 %46, 1
	store i32 %47, ptr %j.1
	br label %for.cond.1
for.end.1:
	%48 = call ptr @builtin.string_add(ptr @stringLiteral.0, ptr @stringLiteral.1)
	%49 = call ptr @builtin.string_add(ptr %48, ptr @stringLiteral.2)
	%50 = call ptr @builtin.string_add(ptr %49, ptr @stringLiteral.3)
	%51 = call ptr @builtin.string_add(ptr %50, ptr @stringLiteral.4)
	%52 = call ptr @builtin.string_add(ptr %51, ptr @stringLiteral.5)
	%53 = call ptr @builtin.string_add(ptr %52, ptr @stringLiteral.6)
	%54 = call ptr @builtin.string_add(ptr %53, ptr @stringLiteral.7)
	%55 = call ptr @builtin.string_add(ptr %54, ptr @stringLiteral.8)
	%56 = call ptr @builtin.string_add(ptr %55, ptr @stringLiteral.9)
	call void @println(ptr %56)
	br label %for.update.0
for.update.0:
	%57 = load i32, ptr %i.1
	%58 = add i32 %57, 1
	store i32 %58, ptr %i.1
	br label %for.cond.0
for.end.0:
	ret i32 0
}

define void @global.init () {
global.init:
	%0 = call ptr @builtin.calloc_array(i32 4, i32 30)
	%1 = alloca i32
	store i32 0, ptr %1
	br label %allocateArrayFor.cond0
allocateArrayFor.cond0:
	%2 = load i32, ptr %1
	%3 = icmp slt i32 %2, 30
	br i1 %3, label %allocateArrayFor.body.0, label %allocateArrayFor.end.0
allocateArrayFor.body.0:
	%4 = getelementptr ptr, ptr %0, i32 %2
	%5 = call ptr @builtin.calloc_array(i32 4, i32 30)
	store ptr %5, ptr %4
	%6 = load i32, ptr %1
	%7 = add i32 %6, 1
	store i32 %7, ptr %1
	br label %allocateArrayFor.cond0
allocateArrayFor.end.0:
	store ptr %0, ptr @a
	%8 = call ptr @builtin.calloc_array(i32 4, i32 30)
	store ptr %8, ptr @str
	ret void
}

