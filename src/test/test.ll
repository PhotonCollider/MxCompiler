;Definition Of Structs
%struct.node = type {i32, i32, ptr}

;Definition Of Global Variables
@hashsize = global i32 0
@table = global ptr null

;Definition Of String Literals
@stringLiteral.0 = private unnamed_addr constant [2 x i8] c" \00"

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
define i32 @getHash (i32 %0) {
getHash:
	%n.1 = alloca i32
	store i32 %0, ptr %n.1
	%1 = load i32, ptr %n.1
	%2 = mul i32 %1, 237
	%3 = load i32, ptr @hashsize
	%4 = srem i32 %2, %3
	ret i32 %4
}

define i32 @get (i32 %66) {
get:
	%key.2 = alloca i32
	store i32 %66, ptr %key.2
	%ptr.2 = alloca ptr
	store ptr null, ptr %ptr.2
	%67 = load ptr, ptr @table
	%68 = load i32, ptr %key.2
	%69 = call i32 @getHash(i32 %68)
	%70 = getelementptr ptr, ptr %67, i32 %69
	%71 = load ptr, ptr %70
	store ptr %71, ptr %ptr.2
	br label %while.cond.1
while.cond.1:
	%72 = load ptr, ptr %ptr.2
	%73 = getelementptr %struct.node, ptr %72, i32 0, i32 0
	%74 = load i32, ptr %73
	%75 = load i32, ptr %key.2
	%76 = icmp ne i32 %74, %75
	br i1 %76, label %while.body.1, label %while.end.1
while.body.1:
	%77 = load ptr, ptr %ptr.2
	%78 = getelementptr %struct.node, ptr %77, i32 0, i32 2
	%79 = load ptr, ptr %78
	store ptr %79, ptr %ptr.2
	br label %while.cond.1
while.end.1:
	%80 = load ptr, ptr %ptr.2
	%81 = getelementptr %struct.node, ptr %80, i32 0, i32 1
	%82 = load i32, ptr %81
	ret i32 %82
}

define i32 @main () {
main:
	call void @global.init()
	%i.1 = alloca i32
	%83 = call ptr @builtin.calloc_array(i32 4, i32 100)
	store ptr %83, ptr @table
	store i32 0, ptr %i.1
	br label %for.cond.0
for.cond.0:
	%84 = load i32, ptr %i.1
	%85 = load i32, ptr @hashsize
	%86 = icmp slt i32 %84, %85
	br i1 %86, label %for.body.0, label %for.end.0
for.body.0:
	%87 = load ptr, ptr @table
	%88 = load i32, ptr %i.1
	%89 = getelementptr ptr, ptr %87, i32 %88
	store ptr null, ptr %89
	br label %for.update.0
for.update.0:
	%90 = load i32, ptr %i.1
	%91 = add i32 %90, 1
	store i32 %91, ptr %i.1
	br label %for.cond.0
for.end.0:
	store i32 0, ptr %i.1
	br label %for.cond.1
for.cond.1:
	%92 = load i32, ptr %i.1
	%93 = icmp slt i32 %92, 1000
	br i1 %93, label %for.body.1, label %for.end.1
for.body.1:
	%94 = load i32, ptr %i.1
	%95 = load i32, ptr %i.1
	call void @put(i32 %94, i32 %95)
	br label %for.update.1
for.update.1:
	%96 = load i32, ptr %i.1
	%97 = add i32 %96, 1
	store i32 %97, ptr %i.1
	br label %for.cond.1
for.end.1:
	store i32 0, ptr %i.1
	br label %for.cond.2
for.cond.2:
	%98 = load i32, ptr %i.1
	%99 = icmp slt i32 %98, 1000
	br i1 %99, label %for.body.2, label %for.end.2
for.body.2:
	%100 = load i32, ptr %i.1
	%101 = call ptr @toString(i32 %100)
	%102 = call ptr @builtin.string_add(ptr %101, ptr @stringLiteral.0)
	%103 = load i32, ptr %i.1
	%104 = call i32 @get(i32 %103)
	%105 = call ptr @toString(i32 %104)
	%106 = call ptr @builtin.string_add(ptr %102, ptr %105)
	call void @println(ptr %106)
	br label %for.update.2
for.update.2:
	%107 = load i32, ptr %i.1
	%108 = add i32 %107, 1
	store i32 %108, ptr %i.1
	br label %for.cond.2
for.end.2:
	ret i32 0
}

define void @global.init () {
global.init:
	store i32 100, ptr @hashsize
	ret void
}

define void @put (i32 %5, i32 %6) {
put:
	%key.1 = alloca i32
	store i32 %5, ptr %key.1
	%data.1 = alloca i32
	store i32 %6, ptr %data.1
	%p.1 = alloca i32
	%ptr.1 = alloca ptr
	store ptr null, ptr %ptr.1
	%7 = load i32, ptr %key.1
	%8 = call i32 @getHash(i32 %7)
	store i32 %8, ptr %p.1
	%9 = load ptr, ptr @table
	%10 = load i32, ptr %p.1
	%11 = getelementptr ptr, ptr %9, i32 %10
	%12 = load ptr, ptr %11
	%13 = call i1 @builtin.string_eq(ptr %12, ptr null)
	br i1 %13, label %if.then.0, label %if.else.0
if.then.0:
	%14 = call ptr @builtin.calloc(i32 12)
	%15 = load ptr, ptr @table
	%16 = load i32, ptr %p.1
	%17 = getelementptr ptr, ptr %15, i32 %16
	store ptr %14, ptr %17
	%18 = load i32, ptr %key.1
	%19 = load ptr, ptr @table
	%20 = load i32, ptr %p.1
	%21 = getelementptr ptr, ptr %19, i32 %20
	%22 = load ptr, ptr %21
	%23 = getelementptr %struct.node, ptr %22, i32 0, i32 0
	store i32 %18, ptr %23
	%24 = load i32, ptr %data.1
	%25 = load ptr, ptr @table
	%26 = load i32, ptr %p.1
	%27 = getelementptr ptr, ptr %25, i32 %26
	%28 = load ptr, ptr %27
	%29 = getelementptr %struct.node, ptr %28, i32 0, i32 1
	store i32 %24, ptr %29
	%30 = load ptr, ptr @table
	%31 = load i32, ptr %p.1
	%32 = getelementptr ptr, ptr %30, i32 %31
	%33 = load ptr, ptr %32
	%34 = getelementptr %struct.node, ptr %33, i32 0, i32 2
	store ptr null, ptr %34
	ret void
if.else.0:
	br label %if.endif.0
if.endif.0:
	%35 = load ptr, ptr @table
	%36 = load i32, ptr %p.1
	%37 = getelementptr ptr, ptr %35, i32 %36
	%38 = load ptr, ptr %37
	store ptr %38, ptr %ptr.1
	br label %while.cond.0
while.cond.0:
	%39 = load ptr, ptr %ptr.1
	%40 = getelementptr %struct.node, ptr %39, i32 0, i32 0
	%41 = load i32, ptr %40
	%42 = load i32, ptr %key.1
	%43 = icmp ne i32 %41, %42
	br i1 %43, label %while.body.0, label %while.end.0
while.body.0:
	%44 = load ptr, ptr %ptr.1
	%45 = getelementptr %struct.node, ptr %44, i32 0, i32 2
	%46 = load ptr, ptr %45
	%47 = call i1 @builtin.string_eq(ptr %46, ptr null)
	br i1 %47, label %if.then.1, label %if.else.1
if.then.1:
	%48 = call ptr @builtin.calloc(i32 12)
	%49 = load ptr, ptr %ptr.1
	%50 = getelementptr %struct.node, ptr %49, i32 0, i32 2
	store ptr %48, ptr %50
	%51 = load i32, ptr %key.1
	%52 = load ptr, ptr %ptr.1
	%53 = getelementptr %struct.node, ptr %52, i32 0, i32 2
	%54 = load ptr, ptr %53
	%55 = getelementptr %struct.node, ptr %54, i32 0, i32 0
	store i32 %51, ptr %55
	%56 = load ptr, ptr %ptr.1
	%57 = getelementptr %struct.node, ptr %56, i32 0, i32 2
	%58 = load ptr, ptr %57
	%59 = getelementptr %struct.node, ptr %58, i32 0, i32 2
	store ptr null, ptr %59
	br label %if.endif.1
if.else.1:
	br label %if.endif.1
if.endif.1:
	%60 = load ptr, ptr %ptr.1
	%61 = getelementptr %struct.node, ptr %60, i32 0, i32 2
	%62 = load ptr, ptr %61
	store ptr %62, ptr %ptr.1
	br label %while.cond.0
while.end.0:
	%63 = load i32, ptr %data.1
	%64 = load ptr, ptr %ptr.1
	%65 = getelementptr %struct.node, ptr %64, i32 0, i32 1
	store i32 %63, ptr %65
	ret void
}

