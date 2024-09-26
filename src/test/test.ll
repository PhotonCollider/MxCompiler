;Definition Of Structs

;Definition Of Global Variables
@n.1 = global i32 0
@a.1 = global ptr null
@i.1 = global i32 0

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
define i32 @jud (i32 %1) {
jud:
	%x.1 = alloca i32
	store i32 %1, ptr %x.1
	%i.1 = alloca i32
	%j.1 = alloca i32
	store i32 0, ptr %i.1
	br label %for.cond0
for.cond0:
	%2 = load i32, ptr %i.1
	%3 = load i32, ptr @n.1
	%4 = load i32, ptr %x.1
	%5 = sdiv i32 %3, %4
	%6 = icmp slt i32 %2, %5
	br i1 %6, label %for.body.0, label %for.end.0
for.body.0:
	%flag.1 = alloca i1
	store i1 false, ptr %flag.1
	store i32 0, ptr %j.1
	br label %for.cond1
for.cond1:
	%7 = load i32, ptr %j.1
	%8 = load i32, ptr %x.1
	%9 = sub i32 %8, 1
	%10 = icmp slt i32 %7, %9
	br i1 %10, label %for.body.1, label %for.end.1
for.body.1:
	%11 = load ptr, ptr @a.1
	%12 = load i32, ptr %i.1
	%13 = load i32, ptr %x.1
	%14 = mul i32 %12, %13
	%15 = load i32, ptr %j.1
	%16 = add i32 %14, %15
	%17 = getelementptr i32, ptr %11, i32 %16
	%18 = load i32, ptr %17
	%19 = load ptr, ptr @a.1
	%20 = load i32, ptr %i.1
	%21 = load i32, ptr %x.1
	%22 = mul i32 %20, %21
	%23 = load i32, ptr %j.1
	%24 = add i32 %22, %23
	%25 = add i32 %24, 1
	%26 = getelementptr i32, ptr %19, i32 %25
	%27 = load i32, ptr %26
	%28 = icmp sgt i32 %18, %27
	br i1 %28, label %if.then.0, label %if.else.0
if.then.0:
	store i1 true, ptr %flag.1
	br label %if.endif.0
if.else.0:
	br label %if.endif.0
if.endif.0:
	%29 = load i32, ptr %j.1
	%30 = add i32 %29, 1
	store i32 %30, ptr %j.1
	br label %for.cond1
for.end.1:
	%31 = load i1, ptr %flag.1
	%32 = xor i1 %31, true
	br i1 %32, label %if.then.1, label %if.else.1
if.then.1:
	ret i32 1
if.else.1:
	br label %if.endif.1
if.endif.1:
	%33 = load i32, ptr %i.1
	%34 = add i32 %33, 1
	store i32 %34, ptr %i.1
	br label %for.cond0
for.end.0:
	ret i32 0
}

define i32 @main () {
main:
	call void @global.init()
	%35 = call i32 @getInt()
	store i32 %35, ptr @n.1
	store i32 0, ptr @i.1
	br label %for.cond2
for.cond2:
	%36 = load i32, ptr @i.1
	%37 = load i32, ptr @n.1
	%38 = icmp slt i32 %36, %37
	br i1 %38, label %for.body.2, label %for.end.2
for.body.2:
	%39 = call i32 @getInt()
	%40 = load ptr, ptr @a.1
	%41 = load i32, ptr @i.1
	%42 = getelementptr i32, ptr %40, i32 %41
	store i32 %39, ptr %42
	%43 = load i32, ptr @i.1
	%44 = add i32 %43, 1
	store i32 %44, ptr @i.1
	br label %for.cond2
for.end.2:
	%45 = load i32, ptr @n.1
	store i32 %45, ptr @i.1
	br label %for.cond3
for.cond3:
	%46 = load i32, ptr @i.1
	%47 = icmp sgt i32 %46, 0
	br i1 %47, label %for.body.3, label %for.end.3
for.body.3:
	%48 = load i32, ptr @i.1
	%49 = call i32 @jud(i32 %48)
	%50 = icmp sgt i32 %49, 0
	br i1 %50, label %if.then.2, label %if.else.2
if.then.2:
	%51 = load i32, ptr @i.1
	%52 = call ptr @toString(i32 %51)
	call void @print(ptr %52)
	ret i32 0
if.else.2:
	br label %if.endif.2
if.endif.2:
	%53 = load i32, ptr @i.1
	%54 = sdiv i32 %53, 2
	store i32 %54, ptr @i.1
	br label %for.cond3
for.end.3:
	ret i32 0
}

define void @global.init () {
global.init:
	%0 = call ptr @builtin.calloc(i32 4, i32 20)
	store ptr %0, ptr @a.1
	ret void
}

