;Definition Of Structs

;Definition Of Global Variables

;Definition Of String Literals
@stringLiteral.0.1 = private unnamed_addr constant [2 x i8] c" \00"
@stringLiteral.1.1 = private unnamed_addr constant [1 x i8] c"\00"

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
	%n.1 = alloca i32
	%44 = call i32 @getInt()
	store i32 %44, ptr %n.1
	%a.1 = alloca ptr
	%45 = load i32, ptr %n.1
	%46 = call ptr @builtin.calloc_array(i32 4, i32 %45)
	store ptr %46, ptr %a.1
	%i.1 = alloca i32
	store i32 0, ptr %i.1
	br label %for.cond.2
for.cond.2:
	%47 = load i32, ptr %i.1
	%48 = load i32, ptr %n.1
	%49 = icmp slt i32 %47, %48
	br i1 %49, label %for.body.2, label %for.end.2
for.body.2:
	%50 = call i32 @getInt()
	%51 = load ptr, ptr %a.1
	%52 = load i32, ptr %i.1
	%53 = getelementptr i32, ptr %51, i32 %52
	store i32 %50, ptr %53
	br label %for.update.2
for.update.2:
	%54 = load i32, ptr %i.1
	%55 = add i32 %54, 1
	store i32 %55, ptr %i.1
	br label %for.cond.2
for.end.2:
	%56 = load ptr, ptr %a.1
	call void @bubble_sort(ptr %56)
	store i32 0, ptr %i.1
	br label %for.cond.3
for.cond.3:
	%57 = load i32, ptr %i.1
	%58 = load i32, ptr %n.1
	%59 = icmp slt i32 %57, %58
	br i1 %59, label %for.body.3, label %for.end.3
for.body.3:
	%60 = load ptr, ptr %a.1
	%61 = load i32, ptr %i.1
	%62 = getelementptr i32, ptr %60, i32 %61
	%63 = load i32, ptr %62
	%64 = call ptr @toString(i32 %63)
	%65 = call ptr @builtin.string_add(ptr %64, ptr @stringLiteral.0.1)
	call void @print(ptr %65)
	br label %for.update.3
for.update.3:
	%66 = load i32, ptr %i.1
	%67 = add i32 %66, 1
	store i32 %67, ptr %i.1
	br label %for.cond.3
for.end.3:
	call void @println(ptr @stringLiteral.1.1)
	ret i32 0
}

define void @global.init () {
global.init:
	ret void
}

define void @bubble_sort (ptr %0) {
bubble_sort:
	%a.1 = alloca ptr
	store ptr %0, ptr %a.1
	%i.1 = alloca i32
	%j.1 = alloca i32
	%n.1 = alloca i32
	%1 = load ptr, ptr %a.1
	%2 = call i32 @array.size(ptr %1)
	store i32 %2, ptr %n.1
	store i32 0, ptr %i.1
	br label %for.cond.0
for.cond.0:
	%3 = load i32, ptr %i.1
	%4 = load i32, ptr %n.1
	%5 = sub i32 %4, 1
	%6 = icmp slt i32 %3, %5
	br i1 %6, label %for.body.0, label %for.end.0
for.body.0:
	store i32 0, ptr %j.1
	br label %for.cond.1
for.cond.1:
	%7 = load i32, ptr %j.1
	%8 = load i32, ptr %n.1
	%9 = load i32, ptr %i.1
	%10 = sub i32 %8, %9
	%11 = sub i32 %10, 1
	%12 = icmp slt i32 %7, %11
	br i1 %12, label %for.body.1, label %for.end.1
for.body.1:
	%13 = load ptr, ptr %a.1
	%14 = load i32, ptr %j.1
	%15 = getelementptr i32, ptr %13, i32 %14
	%16 = load i32, ptr %15
	%17 = load ptr, ptr %a.1
	%18 = load i32, ptr %j.1
	%19 = add i32 %18, 1
	%20 = getelementptr i32, ptr %17, i32 %19
	%21 = load i32, ptr %20
	%22 = icmp slt i32 %16, %21
	br i1 %22, label %if.then.0, label %if.else.0
if.then.0:
	br label %for.update.1
if.else.0:
	br label %if.endif.0
if.endif.0:
	%t.1 = alloca i32
	%23 = load ptr, ptr %a.1
	%24 = load i32, ptr %j.1
	%25 = getelementptr i32, ptr %23, i32 %24
	%26 = load i32, ptr %25
	store i32 %26, ptr %t.1
	%27 = load ptr, ptr %a.1
	%28 = load i32, ptr %j.1
	%29 = add i32 %28, 1
	%30 = getelementptr i32, ptr %27, i32 %29
	%31 = load i32, ptr %30
	%32 = load ptr, ptr %a.1
	%33 = load i32, ptr %j.1
	%34 = getelementptr i32, ptr %32, i32 %33
	store i32 %31, ptr %34
	%35 = load i32, ptr %t.1
	%36 = load ptr, ptr %a.1
	%37 = load i32, ptr %j.1
	%38 = add i32 %37, 1
	%39 = getelementptr i32, ptr %36, i32 %38
	store i32 %35, ptr %39
	br label %for.update.1
for.update.1:
	%40 = load i32, ptr %j.1
	%41 = add i32 %40, 1
	store i32 %41, ptr %j.1
	br label %for.cond.1
for.end.1:
	br label %for.update.0
for.update.0:
	%42 = load i32, ptr %i.1
	%43 = add i32 %42, 1
	store i32 %43, ptr %i.1
	br label %for.cond.0
for.end.0:
	ret void
}

