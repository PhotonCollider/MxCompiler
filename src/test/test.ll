;Definition Of Structs

;Definition Of Global Variables
@N = global i32 0
@head = global i32 0
@startx = global i32 0
@starty = global i32 0
@targetx = global i32 0
@targety = global i32 0
@x = global i32 0
@y = global i32 0
@xlist = global ptr null
@ylist = global ptr null
@tail = global i32 0
@ok = global i32 0
@now = global i32 0
@dx = global ptr null
@dy = global ptr null
@step = global ptr null
@i = global i32 0
@j = global i32 0

;Definition Of String Literals
@stringLiteral.0 = private unnamed_addr constant [14 x i8] c"no solution!\0A\00"

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
define void @origin (i32 %4) {
origin:
	%N.1 = alloca i32
	store i32 %4, ptr %N.1
	store i32 0, ptr @head
	store i32 0, ptr @tail
	%5 = load i32, ptr %N.1
	%6 = call ptr @builtin.calloc_array(i32 4, i32 %5)
	store ptr %6, ptr @step
	store i32 0, ptr @i
	br label %for.cond.0
for.cond.0:
	%7 = load i32, ptr @i
	%8 = load i32, ptr %N.1
	%9 = icmp slt i32 %7, %8
	br i1 %9, label %for.body.0, label %for.end.0
for.body.0:
	%10 = load i32, ptr %N.1
	%11 = call ptr @builtin.calloc_array(i32 4, i32 %10)
	%12 = load ptr, ptr @step
	%13 = load i32, ptr @i
	%14 = getelementptr ptr, ptr %12, i32 %13
	store ptr %11, ptr %14
	store i32 0, ptr @j
	br label %for.cond.1
for.cond.1:
	%15 = load i32, ptr @j
	%16 = load i32, ptr %N.1
	%17 = icmp slt i32 %15, %16
	br i1 %17, label %for.body.1, label %for.end.1
for.body.1:
	%18 = load ptr, ptr @step
	%19 = load i32, ptr @i
	%20 = getelementptr ptr, ptr %18, i32 %19
	%21 = load ptr, ptr %20
	%22 = load i32, ptr @j
	%23 = getelementptr i32, ptr %21, i32 %22
	store i32 0, ptr %23
	br label %for.update.1
for.update.1:
	%24 = load i32, ptr @j
	%25 = add i32 %24, 1
	store i32 %25, ptr @j
	br label %for.cond.1
for.end.1:
	br label %for.update.0
for.update.0:
	%26 = load i32, ptr @i
	%27 = add i32 %26, 1
	store i32 %27, ptr @i
	br label %for.cond.0
for.end.0:
	ret void
}

define void @addList (i32 %36, i32 %37) {
addList:
	%x.1 = alloca i32
	store i32 %36, ptr %x.1
	%y.1 = alloca i32
	store i32 %37, ptr %y.1
	%38 = load i32, ptr %x.1
	%39 = call i1 @check(i32 %38)
	%40 = alloca i1
	store i1 false, ptr %40
	br i1 %39, label %LogicBinary.second.3, label %LogicBinary.end.3
LogicBinary.second.3:
	%41 = load i32, ptr %y.1
	%42 = call i1 @check(i32 %41)
	store i1 %42, ptr %40
	br label %LogicBinary.end.3
LogicBinary.end.3:
	%43 = load i1, ptr %40
	%44 = alloca i1
	store i1 false, ptr %44
	br i1 %43, label %LogicBinary.second.2, label %LogicBinary.end.2
LogicBinary.second.2:
	%45 = load ptr, ptr @step
	%46 = load i32, ptr %x.1
	%47 = getelementptr ptr, ptr %45, i32 %46
	%48 = load ptr, ptr %47
	%49 = load i32, ptr %y.1
	%50 = getelementptr i32, ptr %48, i32 %49
	%51 = load i32, ptr %50
	%52 = sub i32 0, 1
	%53 = icmp eq i32 %51, %52
	store i1 %53, ptr %44
	br label %LogicBinary.end.2
LogicBinary.end.2:
	%54 = load i1, ptr %44
	br i1 %54, label %if.then.1, label %if.else.1
if.then.1:
	%55 = load i32, ptr @tail
	%56 = add i32 %55, 1
	store i32 %56, ptr @tail
	%57 = load i32, ptr %x.1
	%58 = load ptr, ptr @xlist
	%59 = load i32, ptr @tail
	%60 = getelementptr i32, ptr %58, i32 %59
	store i32 %57, ptr %60
	%61 = load i32, ptr %y.1
	%62 = load ptr, ptr @ylist
	%63 = load i32, ptr @tail
	%64 = getelementptr i32, ptr %62, i32 %63
	store i32 %61, ptr %64
	%65 = load i32, ptr @now
	%66 = add i32 %65, 1
	%67 = load ptr, ptr @step
	%68 = load i32, ptr %x.1
	%69 = getelementptr ptr, ptr %67, i32 %68
	%70 = load ptr, ptr %69
	%71 = load i32, ptr %y.1
	%72 = getelementptr i32, ptr %70, i32 %71
	store i32 %66, ptr %72
	%73 = load i32, ptr %x.1
	%74 = load i32, ptr @targetx
	%75 = icmp eq i32 %73, %74
	%76 = alloca i1
	store i1 false, ptr %76
	br i1 %75, label %LogicBinary.second.6, label %LogicBinary.end.6
LogicBinary.second.6:
	%77 = load i32, ptr %y.1
	%78 = load i32, ptr @targety
	%79 = icmp eq i32 %77, %78
	store i1 %79, ptr %76
	br label %LogicBinary.end.6
LogicBinary.end.6:
	%80 = load i1, ptr %76
	br i1 %80, label %if.then.0, label %if.else.0
if.then.0:
	store i32 1, ptr @ok
	br label %if.endif.0
if.else.0:
	br label %if.endif.0
if.endif.0:
	br label %if.endif.1
if.else.1:
	br label %if.endif.1
if.endif.1:
	ret void
}

define i32 @main () {
main:
	call void @global.init()
	call void @origin(i32 106)
	%81 = call i32 @getInt()
	store i32 %81, ptr @N
	%82 = load i32, ptr @N
	%83 = sub i32 %82, 1
	store i32 %83, ptr @targety
	%84 = load i32, ptr @targety
	store i32 %84, ptr @targetx
	store i32 0, ptr @i
	br label %for.cond.2
for.cond.2:
	%85 = load i32, ptr @i
	%86 = load i32, ptr @N
	%87 = icmp slt i32 %85, %86
	br i1 %87, label %for.body.2, label %for.end.2
for.body.2:
	store i32 0, ptr @j
	br label %for.cond.3
for.cond.3:
	%88 = load i32, ptr @j
	%89 = load i32, ptr @N
	%90 = icmp slt i32 %88, %89
	br i1 %90, label %for.body.3, label %for.end.3
for.body.3:
	%91 = sub i32 0, 1
	%92 = load ptr, ptr @step
	%93 = load i32, ptr @i
	%94 = getelementptr ptr, ptr %92, i32 %93
	%95 = load ptr, ptr %94
	%96 = load i32, ptr @j
	%97 = getelementptr i32, ptr %95, i32 %96
	store i32 %91, ptr %97
	br label %for.update.3
for.update.3:
	%98 = load i32, ptr @j
	%99 = add i32 %98, 1
	store i32 %99, ptr @j
	br label %for.cond.3
for.end.3:
	br label %for.update.2
for.update.2:
	%100 = load i32, ptr @i
	%101 = add i32 %100, 1
	store i32 %101, ptr @i
	br label %for.cond.2
for.end.2:
	%102 = sub i32 0, 2
	%103 = load ptr, ptr @dx
	%104 = getelementptr i32, ptr %103, i32 0
	store i32 %102, ptr %104
	%105 = sub i32 0, 1
	%106 = load ptr, ptr @dy
	%107 = getelementptr i32, ptr %106, i32 0
	store i32 %105, ptr %107
	%108 = sub i32 0, 2
	%109 = load ptr, ptr @dx
	%110 = getelementptr i32, ptr %109, i32 1
	store i32 %108, ptr %110
	%111 = load ptr, ptr @dy
	%112 = getelementptr i32, ptr %111, i32 1
	store i32 1, ptr %112
	%113 = load ptr, ptr @dx
	%114 = getelementptr i32, ptr %113, i32 2
	store i32 2, ptr %114
	%115 = sub i32 0, 1
	%116 = load ptr, ptr @dy
	%117 = getelementptr i32, ptr %116, i32 2
	store i32 %115, ptr %117
	%118 = load ptr, ptr @dx
	%119 = getelementptr i32, ptr %118, i32 3
	store i32 2, ptr %119
	%120 = load ptr, ptr @dy
	%121 = getelementptr i32, ptr %120, i32 3
	store i32 1, ptr %121
	%122 = sub i32 0, 1
	%123 = load ptr, ptr @dx
	%124 = getelementptr i32, ptr %123, i32 4
	store i32 %122, ptr %124
	%125 = sub i32 0, 2
	%126 = load ptr, ptr @dy
	%127 = getelementptr i32, ptr %126, i32 4
	store i32 %125, ptr %127
	%128 = sub i32 0, 1
	%129 = load ptr, ptr @dx
	%130 = getelementptr i32, ptr %129, i32 5
	store i32 %128, ptr %130
	%131 = load ptr, ptr @dy
	%132 = getelementptr i32, ptr %131, i32 5
	store i32 2, ptr %132
	%133 = load ptr, ptr @dx
	%134 = getelementptr i32, ptr %133, i32 6
	store i32 1, ptr %134
	%135 = sub i32 0, 2
	%136 = load ptr, ptr @dy
	%137 = getelementptr i32, ptr %136, i32 6
	store i32 %135, ptr %137
	%138 = load ptr, ptr @dx
	%139 = getelementptr i32, ptr %138, i32 7
	store i32 1, ptr %139
	%140 = load ptr, ptr @dy
	%141 = getelementptr i32, ptr %140, i32 7
	store i32 2, ptr %141
	br label %while.cond.0
while.cond.0:
	%142 = load i32, ptr @head
	%143 = load i32, ptr @tail
	%144 = icmp sle i32 %142, %143
	br i1 %144, label %while.body.0, label %while.end.0
while.body.0:
	%145 = load ptr, ptr @xlist
	%146 = load i32, ptr @head
	%147 = getelementptr i32, ptr %145, i32 %146
	%148 = load i32, ptr %147
	store i32 %148, ptr @x
	%149 = load ptr, ptr @ylist
	%150 = load i32, ptr @head
	%151 = getelementptr i32, ptr %149, i32 %150
	%152 = load i32, ptr %151
	store i32 %152, ptr @y
	%153 = load ptr, ptr @step
	%154 = load i32, ptr @x
	%155 = getelementptr ptr, ptr %153, i32 %154
	%156 = load ptr, ptr %155
	%157 = load i32, ptr @y
	%158 = getelementptr i32, ptr %156, i32 %157
	%159 = load i32, ptr %158
	store i32 %159, ptr @now
	store i32 0, ptr @j
	br label %for.cond.4
for.cond.4:
	%160 = load i32, ptr @j
	%161 = icmp slt i32 %160, 8
	br i1 %161, label %for.body.4, label %for.end.4
for.body.4:
	%162 = load i32, ptr @x
	%163 = load ptr, ptr @dx
	%164 = load i32, ptr @j
	%165 = getelementptr i32, ptr %163, i32 %164
	%166 = load i32, ptr %165
	%167 = add i32 %162, %166
	%168 = load i32, ptr @y
	%169 = load ptr, ptr @dy
	%170 = load i32, ptr @j
	%171 = getelementptr i32, ptr %169, i32 %170
	%172 = load i32, ptr %171
	%173 = add i32 %168, %172
	call void @addList(i32 %167, i32 %173)
	br label %for.update.4
for.update.4:
	%174 = load i32, ptr @j
	%175 = add i32 %174, 1
	store i32 %175, ptr @j
	br label %for.cond.4
for.end.4:
	%176 = load i32, ptr @ok
	%177 = icmp eq i32 %176, 1
	br i1 %177, label %if.then.2, label %if.else.2
if.then.2:
	br label %while.end.0
if.else.2:
	br label %if.endif.2
if.endif.2:
	%178 = load i32, ptr @head
	%179 = add i32 %178, 1
	store i32 %179, ptr @head
	br label %while.cond.0
while.end.0:
	%180 = load i32, ptr @ok
	%181 = icmp eq i32 %180, 1
	br i1 %181, label %if.then.3, label %if.else.3
if.then.3:
	%182 = load ptr, ptr @step
	%183 = load i32, ptr @targetx
	%184 = getelementptr ptr, ptr %182, i32 %183
	%185 = load ptr, ptr %184
	%186 = load i32, ptr @targety
	%187 = getelementptr i32, ptr %185, i32 %186
	%188 = load i32, ptr %187
	%189 = call ptr @toString(i32 %188)
	call void @println(ptr %189)
	br label %if.endif.3
if.else.3:
	call void @print(ptr @stringLiteral.0)
	br label %if.endif.3
if.endif.3:
	ret i32 0
}

define i1 @check (i32 %28) {
check:
	%a.1 = alloca i32
	store i32 %28, ptr %a.1
	%29 = load i32, ptr %a.1
	%30 = load i32, ptr @N
	%31 = icmp slt i32 %29, %30
	%32 = alloca i1
	store i1 false, ptr %32
	br i1 %31, label %LogicBinary.second.0, label %LogicBinary.end.0
LogicBinary.second.0:
	%33 = load i32, ptr %a.1
	%34 = icmp sge i32 %33, 0
	store i1 %34, ptr %32
	br label %LogicBinary.end.0
LogicBinary.end.0:
	%35 = load i1, ptr %32
	ret i1 %35
}

define void @global.init () {
global.init:
	%0 = call ptr @builtin.calloc_array(i32 4, i32 12000)
	store ptr %0, ptr @xlist
	%1 = call ptr @builtin.calloc_array(i32 4, i32 12000)
	store ptr %1, ptr @ylist
	%2 = call ptr @builtin.calloc_array(i32 4, i32 8)
	store ptr %2, ptr @dx
	%3 = call ptr @builtin.calloc_array(i32 4, i32 9)
	store ptr %3, ptr @dy
	ret void
}

