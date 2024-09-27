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
define i32 @gcd (i32 %0, i32 %1) {
gcd:
	%x.1 = alloca i32
	store i32 %0, ptr %x.1
	%y.1 = alloca i32
	store i32 %1, ptr %y.1
	%2 = load i32, ptr %x.1
	%3 = load i32, ptr %y.1
	%4 = srem i32 %2, %3
	%5 = icmp eq i32 %4, 0
	br i1 %5, label %if.then.0, label %if.else.0
if.then.0:
	%6 = load i32, ptr %y.1
	ret i32 %6
if.else.0:
	%7 = load i32, ptr %y.1
	%8 = load i32, ptr %x.1
	%9 = load i32, ptr %y.1
	%10 = srem i32 %8, %9
	%11 = call i32 @gcd5(i32 %7, i32 %10)
	ret i32 %11
}

define i32 @gcd1 (i32 %12, i32 %13) {
gcd1:
	%x.2 = alloca i32
	store i32 %12, ptr %x.2
	%y.2 = alloca i32
	store i32 %13, ptr %y.2
	%14 = load i32, ptr %x.2
	%15 = load i32, ptr %y.2
	%16 = srem i32 %14, %15
	%17 = icmp eq i32 %16, 0
	br i1 %17, label %if.then.1, label %if.else.1
if.then.1:
	%18 = load i32, ptr %y.2
	ret i32 %18
if.else.1:
	%19 = load i32, ptr %y.2
	%20 = load i32, ptr %x.2
	%21 = load i32, ptr %y.2
	%22 = srem i32 %20, %21
	%23 = call i32 @gcd(i32 %19, i32 %22)
	ret i32 %23
}

define i32 @gcd2 (i32 %24, i32 %25) {
gcd2:
	%x.3 = alloca i32
	store i32 %24, ptr %x.3
	%y.3 = alloca i32
	store i32 %25, ptr %y.3
	%26 = load i32, ptr %x.3
	%27 = load i32, ptr %y.3
	%28 = srem i32 %26, %27
	%29 = icmp eq i32 %28, 0
	br i1 %29, label %if.then.2, label %if.else.2
if.then.2:
	%30 = load i32, ptr %y.3
	ret i32 %30
if.else.2:
	%31 = load i32, ptr %y.3
	%32 = load i32, ptr %x.3
	%33 = load i32, ptr %y.3
	%34 = srem i32 %32, %33
	%35 = call i32 @gcd1(i32 %31, i32 %34)
	ret i32 %35
}

define i32 @main () {
main:
	call void @global.init()
	%72 = call i32 @gcd(i32 10, i32 1)
	%73 = call ptr @toString(i32 %72)
	call void @println(ptr %73)
	%74 = call i32 @gcd(i32 34986, i32 3087)
	%75 = call ptr @toString(i32 %74)
	call void @println(ptr %75)
	%76 = call i32 @gcd(i32 2907, i32 1539)
	%77 = call ptr @toString(i32 %76)
	call void @println(ptr %77)
	ret i32 0
}

define i32 @gcd3 (i32 %36, i32 %37) {
gcd3:
	%x.4 = alloca i32
	store i32 %36, ptr %x.4
	%y.4 = alloca i32
	store i32 %37, ptr %y.4
	%38 = load i32, ptr %x.4
	%39 = load i32, ptr %y.4
	%40 = srem i32 %38, %39
	%41 = icmp eq i32 %40, 0
	br i1 %41, label %if.then.3, label %if.else.3
if.then.3:
	%42 = load i32, ptr %y.4
	ret i32 %42
if.else.3:
	%43 = load i32, ptr %y.4
	%44 = load i32, ptr %x.4
	%45 = load i32, ptr %y.4
	%46 = srem i32 %44, %45
	%47 = call i32 @gcd2(i32 %43, i32 %46)
	ret i32 %47
}

define void @global.init () {
global.init:
	ret void
}

define i32 @gcd4 (i32 %48, i32 %49) {
gcd4:
	%x.5 = alloca i32
	store i32 %48, ptr %x.5
	%y.5 = alloca i32
	store i32 %49, ptr %y.5
	%50 = load i32, ptr %x.5
	%51 = load i32, ptr %y.5
	%52 = srem i32 %50, %51
	%53 = icmp eq i32 %52, 0
	br i1 %53, label %if.then.4, label %if.else.4
if.then.4:
	%54 = load i32, ptr %y.5
	ret i32 %54
if.else.4:
	%55 = load i32, ptr %y.5
	%56 = load i32, ptr %x.5
	%57 = load i32, ptr %y.5
	%58 = srem i32 %56, %57
	%59 = call i32 @gcd(i32 %55, i32 %58)
	ret i32 %59
}

define i32 @gcd5 (i32 %60, i32 %61) {
gcd5:
	%x.6 = alloca i32
	store i32 %60, ptr %x.6
	%y.6 = alloca i32
	store i32 %61, ptr %y.6
	%62 = load i32, ptr %x.6
	%63 = load i32, ptr %y.6
	%64 = srem i32 %62, %63
	%65 = icmp eq i32 %64, 0
	br i1 %65, label %if.then.5, label %if.else.5
if.then.5:
	%66 = load i32, ptr %y.6
	ret i32 %66
if.else.5:
	%67 = load i32, ptr %y.6
	%68 = load i32, ptr %x.6
	%69 = load i32, ptr %y.6
	%70 = srem i32 %68, %69
	%71 = call i32 @gcd2(i32 %67, i32 %70)
	ret i32 %71
}

