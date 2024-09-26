;Definition Of Structs
%struct.Slice_int = type {ptr, i32, i32}

;Definition Of Global Variables

;Definition Of String Literals
@stringLiteral.0 = private unnamed_addr constant [2 x i8] c" \00"
@stringLiteral.1 = private unnamed_addr constant [1 x i8] c"\00"
@stringLiteral.2 = private unnamed_addr constant [40 x i8] c"Warning: Slice_int::slice: out of range\00"
@stringLiteral.3 = private unnamed_addr constant [46 x i8] c"Warning: Slice_int::copy: size() < arr.size()\00"

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
define ptr @Slice_int.cloneArray (ptr %201) {
Slice_int.cloneArray:
	%res.4 = alloca ptr
	%202 = call i32 @Slice_int.size(ptr %201)
	%203 = call ptr @builtin.calloc_array(i32 4, i32 %202)
	store ptr %203, ptr %res.4
	%i.3 = alloca i32
	store i32 0, ptr %i.3
	br label %for.cond.1
for.cond.1:
	%204 = load i32, ptr %i.3
	%205 = call i32 @Slice_int.size(ptr %201)
	%206 = icmp slt i32 %204, %205
	br i1 %206, label %for.body.1, label %for.end.1
for.body.1:
	%207 = getelementptr %struct.Slice_int, ptr %201, i32 0, i32 0
	%208 = load ptr, ptr %207
	%209 = getelementptr %struct.Slice_int, ptr %201, i32 0, i32 1
	%210 = load i32, ptr %209
	%211 = load i32, ptr %i.3
	%212 = add i32 %210, %211
	%213 = getelementptr i32, ptr %208, i32 %212
	%214 = load i32, ptr %213
	%215 = load ptr, ptr %res.4
	%216 = load i32, ptr %i.3
	%217 = getelementptr i32, ptr %215, i32 %216
	store i32 %214, ptr %217
	br label %for.update.1
for.update.1:
	%218 = load i32, ptr %i.3
	%219 = add i32 %218, 1
	store i32 %219, ptr %i.3
	br label %for.cond.1
for.end.1:
	%220 = load ptr, ptr %res.4
	ret ptr %220
}

define ptr @makeSlice_int (ptr %0) {
makeSlice_int:
	%arr.1 = alloca ptr
	store ptr %0, ptr %arr.1
	%res.1 = alloca ptr
	%1 = call ptr @builtin.malloc(i32 12)
	store ptr %1, ptr %res.1
	%2 = load ptr, ptr %res.1
	%3 = load ptr, ptr %arr.1
	call void @Slice_int.init(ptr %2, ptr %3)
	%4 = load ptr, ptr %res.1
	ret ptr %4
}

define i32 @Slice_int.get (ptr %118, i32 %119) {
Slice_int.get:
	%n.3 = alloca i32
	store i32 %119, ptr %n.3
	%120 = getelementptr %struct.Slice_int, ptr %118, i32 0, i32 0
	%121 = load ptr, ptr %120
	%122 = getelementptr %struct.Slice_int, ptr %118, i32 0, i32 1
	%123 = load i32, ptr %122
	%124 = load i32, ptr %n.3
	%125 = add i32 %123, %124
	%126 = getelementptr i32, ptr %121, i32 %125
	%127 = load i32, ptr %126
	ret i32 %127
}

define ptr @Slice_int.tail (ptr %176) {
Slice_int.tail:
	%177 = call i32 @Slice_int.size(ptr %176)
	%178 = call ptr @Slice_int.slice(ptr %176, i32 1, i32 %177)
	ret ptr %178
}

define i32 @main () {
main:
	call void @global.init()
	%n.2 = alloca i32
	%80 = call i32 @getInt()
	store i32 %80, ptr %n.2
	%a.3 = alloca ptr
	%81 = load i32, ptr %n.2
	%82 = call ptr @builtin.calloc_array(i32 4, i32 %81)
	store ptr %82, ptr %a.3
	%i.1 = alloca i32
	store i32 0, ptr %i.1
	br label %for.cond.2
for.cond.2:
	%83 = load i32, ptr %i.1
	%84 = load i32, ptr %n.2
	%85 = icmp slt i32 %83, %84
	br i1 %85, label %for.body.2, label %for.end.2
for.body.2:
	%86 = call i32 @getInt()
	%87 = load ptr, ptr %a.3
	%88 = load i32, ptr %i.1
	%89 = getelementptr i32, ptr %87, i32 %88
	store i32 %86, ptr %89
	br label %for.update.2
for.update.2:
	%90 = load i32, ptr %i.1
	%91 = add i32 %90, 1
	store i32 %91, ptr %i.1
	br label %for.cond.2
for.end.2:
	%92 = load ptr, ptr %a.3
	call void @mergeSortInf(ptr %92)
	store i32 0, ptr %i.1
	br label %for.cond.3
for.cond.3:
	%93 = load i32, ptr %i.1
	%94 = load i32, ptr %n.2
	%95 = icmp slt i32 %93, %94
	br i1 %95, label %for.body.3, label %for.end.3
for.body.3:
	%96 = load ptr, ptr %a.3
	%97 = load i32, ptr %i.1
	%98 = getelementptr i32, ptr %96, i32 %97
	%99 = load i32, ptr %98
	%100 = call ptr @toString(i32 %99)
	%101 = call ptr @builtin.string_add(ptr %100, ptr @stringLiteral.0)
	call void @print(ptr %101)
	br label %for.update.3
for.update.3:
	%102 = load i32, ptr %i.1
	%103 = add i32 %102, 1
	store i32 %103, ptr %i.1
	br label %for.cond.3
for.end.3:
	call void @println(ptr @stringLiteral.1)
	ret i32 0
}

define ptr @Slice_int.slice (ptr %139, i32 %140, i32 %141) {
Slice_int.slice:
	%l.2 = alloca i32
	store i32 %140, ptr %l.2
	%r.2 = alloca i32
	store i32 %141, ptr %r.2
	%res.3 = alloca ptr
	%142 = call ptr @builtin.malloc(i32 12)
	store ptr %142, ptr %res.3
	%143 = getelementptr %struct.Slice_int, ptr %139, i32 0, i32 0
	%144 = load ptr, ptr %143
	%145 = load ptr, ptr %res.3
	%146 = getelementptr %struct.Slice_int, ptr %145, i32 0, i32 0
	store ptr %144, ptr %146
	%147 = getelementptr %struct.Slice_int, ptr %139, i32 0, i32 1
	%148 = load i32, ptr %147
	%149 = load i32, ptr %l.2
	%150 = add i32 %148, %149
	%151 = load ptr, ptr %res.3
	%152 = getelementptr %struct.Slice_int, ptr %151, i32 0, i32 1
	store i32 %150, ptr %152
	%153 = getelementptr %struct.Slice_int, ptr %139, i32 0, i32 1
	%154 = load i32, ptr %153
	%155 = load i32, ptr %r.2
	%156 = add i32 %154, %155
	%157 = load ptr, ptr %res.3
	%158 = getelementptr %struct.Slice_int, ptr %157, i32 0, i32 2
	store i32 %156, ptr %158
	%159 = load ptr, ptr %res.3
	%160 = getelementptr %struct.Slice_int, ptr %159, i32 0, i32 1
	%161 = load i32, ptr %160
	%162 = getelementptr %struct.Slice_int, ptr %139, i32 0, i32 0
	%163 = load ptr, ptr %162
	%164 = call i32 @array.size(ptr %163)
	%165 = icmp sgt i32 %161, %164
	%166 = alloca i1
	store i1 true, ptr %166
	br i1 %165, label %LogicBinary.end.0, label %LogicBinary.second.0
LogicBinary.second.0:
	%167 = load ptr, ptr %res.3
	%168 = getelementptr %struct.Slice_int, ptr %167, i32 0, i32 2
	%169 = load i32, ptr %168
	%170 = getelementptr %struct.Slice_int, ptr %139, i32 0, i32 0
	%171 = load ptr, ptr %170
	%172 = call i32 @array.size(ptr %171)
	%173 = icmp sgt i32 %169, %172
	store i1 %173, ptr %166
	br label %LogicBinary.end.0
LogicBinary.end.0:
	%174 = load i1, ptr %166
	br i1 %174, label %if.then.0, label %if.else.0
if.then.0:
	call void @println(ptr @stringLiteral.2)
	br label %if.endif.0
if.else.0:
	br label %if.endif.0
if.endif.0:
	%175 = load ptr, ptr %res.3
	ret ptr %175
}

define void @mergeSort (ptr %52) {
mergeSort:
	%a.1 = alloca ptr
	store ptr %52, ptr %a.1
	%53 = load ptr, ptr %a.1
	%54 = call i32 @Slice_int.size(ptr %53)
	%55 = icmp eq i32 %54, 1
	br i1 %55, label %if.then.5, label %if.else.5
if.then.5:
	ret void
if.else.5:
	br label %if.endif.5
if.endif.5:
	%n.1 = alloca i32
	%56 = load ptr, ptr %a.1
	%57 = call i32 @Slice_int.size(ptr %56)
	store i32 %57, ptr %n.1
	%m.1 = alloca i32
	%58 = load i32, ptr %n.1
	%59 = sdiv i32 %58, 2
	store i32 %59, ptr %m.1
	%60 = load ptr, ptr %a.1
	%61 = load i32, ptr %m.1
	%62 = call ptr @Slice_int.slice(ptr %60, i32 0, i32 %61)
	call void @mergeSort(ptr %62)
	%63 = load ptr, ptr %a.1
	%64 = load i32, ptr %m.1
	%65 = load i32, ptr %n.1
	%66 = call ptr @Slice_int.slice(ptr %63, i32 %64, i32 %65)
	call void @mergeSort(ptr %66)
	%67 = load ptr, ptr %a.1
	%68 = load ptr, ptr %a.1
	%69 = load i32, ptr %m.1
	%70 = call ptr @Slice_int.slice(ptr %68, i32 0, i32 %69)
	%71 = load ptr, ptr %a.1
	%72 = load i32, ptr %m.1
	%73 = load i32, ptr %n.1
	%74 = call ptr @Slice_int.slice(ptr %71, i32 %72, i32 %73)
	%75 = call ptr @merge(ptr %70, ptr %74)
	%76 = call ptr @makeSlice_int(ptr %75)
	call void @Slice_int.copy(ptr %67, ptr %76)
	ret void
}

define void @Slice_int.init (ptr %104, ptr %105) {
Slice_int.init:
	%arr.2 = alloca ptr
	store ptr %105, ptr %arr.2
	%106 = load ptr, ptr %arr.2
	%107 = getelementptr %struct.Slice_int, ptr %104, i32 0, i32 0
	store ptr %106, ptr %107
	%108 = getelementptr %struct.Slice_int, ptr %104, i32 0, i32 1
	store i32 0, ptr %108
	%109 = load ptr, ptr %arr.2
	%110 = call i32 @array.size(ptr %109)
	%111 = getelementptr %struct.Slice_int, ptr %104, i32 0, i32 2
	store i32 %110, ptr %111
	ret void
}

define void @Slice_int.copy (ptr %179, ptr %180) {
Slice_int.copy:
	%arr.3 = alloca ptr
	store ptr %180, ptr %arr.3
	%181 = call i32 @Slice_int.size(ptr %179)
	%182 = load ptr, ptr %arr.3
	%183 = call i32 @Slice_int.size(ptr %182)
	%184 = icmp slt i32 %181, %183
	br i1 %184, label %if.then.1, label %if.else.1
if.then.1:
	call void @println(ptr @stringLiteral.3)
	br label %if.endif.1
if.else.1:
	br label %if.endif.1
if.endif.1:
	%i.2 = alloca i32
	store i32 0, ptr %i.2
	br label %for.cond.0
for.cond.0:
	%185 = load i32, ptr %i.2
	%186 = load ptr, ptr %arr.3
	%187 = call i32 @Slice_int.size(ptr %186)
	%188 = icmp slt i32 %185, %187
	br i1 %188, label %for.body.0, label %for.end.0
for.body.0:
	%189 = load ptr, ptr %arr.3
	%190 = load i32, ptr %i.2
	%191 = call i32 @Slice_int.get(ptr %189, i32 %190)
	%192 = getelementptr %struct.Slice_int, ptr %179, i32 0, i32 0
	%193 = load ptr, ptr %192
	%194 = getelementptr %struct.Slice_int, ptr %179, i32 0, i32 1
	%195 = load i32, ptr %194
	%196 = load i32, ptr %i.2
	%197 = add i32 %195, %196
	%198 = getelementptr i32, ptr %193, i32 %197
	store i32 %191, ptr %198
	br label %for.update.0
for.update.0:
	%199 = load i32, ptr %i.2
	%200 = add i32 %199, 1
	store i32 %200, ptr %i.2
	br label %for.cond.0
for.end.0:
	ret void
}

define void @mergeSortInf (ptr %77) {
mergeSortInf:
	%a.2 = alloca ptr
	store ptr %77, ptr %a.2
	%78 = load ptr, ptr %a.2
	%79 = call ptr @makeSlice_int(ptr %78)
	call void @mergeSort(ptr %79)
	ret void
}

define ptr @merge (ptr %5, ptr %6) {
merge:
	%l.1 = alloca ptr
	store ptr %5, ptr %l.1
	%r.1 = alloca ptr
	store ptr %6, ptr %r.1
	%7 = load ptr, ptr %l.1
	%8 = call i32 @Slice_int.size(ptr %7)
	%9 = icmp eq i32 %8, 0
	br i1 %9, label %if.then.2, label %if.else.2
if.then.2:
	%10 = load ptr, ptr %r.1
	%11 = call ptr @Slice_int.cloneArray(ptr %10)
	ret ptr %11
if.else.2:
	br label %if.endif.2
if.endif.2:
	%12 = load ptr, ptr %r.1
	%13 = call i32 @Slice_int.size(ptr %12)
	%14 = icmp eq i32 %13, 0
	br i1 %14, label %if.then.3, label %if.else.3
if.then.3:
	%15 = load ptr, ptr %l.1
	%16 = call ptr @Slice_int.cloneArray(ptr %15)
	ret ptr %16
if.else.3:
	br label %if.endif.3
if.endif.3:
	%res.2 = alloca ptr
	%17 = load ptr, ptr %l.1
	%18 = call i32 @Slice_int.size(ptr %17)
	%19 = load ptr, ptr %r.1
	%20 = call i32 @Slice_int.size(ptr %19)
	%21 = add i32 %18, %20
	%22 = call ptr @builtin.calloc_array(i32 4, i32 %21)
	store ptr %22, ptr %res.2
	%tail.1 = alloca ptr
	%23 = load ptr, ptr %res.2
	%24 = call ptr @makeSlice_int(ptr %23)
	%25 = call ptr @Slice_int.tail(ptr %24)
	store ptr %25, ptr %tail.1
	%26 = load ptr, ptr %l.1
	%27 = call i32 @Slice_int.get(ptr %26, i32 0)
	%28 = load ptr, ptr %r.1
	%29 = call i32 @Slice_int.get(ptr %28, i32 0)
	%30 = icmp slt i32 %27, %29
	br i1 %30, label %if.then.4, label %if.else.4
if.then.4:
	%31 = load ptr, ptr %l.1
	%32 = call i32 @Slice_int.get(ptr %31, i32 0)
	%33 = load ptr, ptr %res.2
	%34 = getelementptr i32, ptr %33, i32 0
	store i32 %32, ptr %34
	%35 = load ptr, ptr %tail.1
	%36 = load ptr, ptr %l.1
	%37 = call ptr @Slice_int.tail(ptr %36)
	%38 = load ptr, ptr %r.1
	%39 = call ptr @merge(ptr %37, ptr %38)
	%40 = call ptr @makeSlice_int(ptr %39)
	call void @Slice_int.copy(ptr %35, ptr %40)
	br label %if.endif.4
if.else.4:
	%41 = load ptr, ptr %r.1
	%42 = call i32 @Slice_int.get(ptr %41, i32 0)
	%43 = load ptr, ptr %res.2
	%44 = getelementptr i32, ptr %43, i32 0
	store i32 %42, ptr %44
	%45 = load ptr, ptr %tail.1
	%46 = load ptr, ptr %l.1
	%47 = load ptr, ptr %r.1
	%48 = call ptr @Slice_int.tail(ptr %47)
	%49 = call ptr @merge(ptr %46, ptr %48)
	%50 = call ptr @makeSlice_int(ptr %49)
	call void @Slice_int.copy(ptr %45, ptr %50)
	br label %if.endif.4
if.endif.4:
	%51 = load ptr, ptr %res.2
	ret ptr %51
}

define i32 @Slice_int.size (ptr %112) {
Slice_int.size:
	%113 = getelementptr %struct.Slice_int, ptr %112, i32 0, i32 2
	%114 = load i32, ptr %113
	%115 = getelementptr %struct.Slice_int, ptr %112, i32 0, i32 1
	%116 = load i32, ptr %115
	%117 = sub i32 %114, %116
	ret i32 %117
}

define void @Slice_int.set (ptr %128, i32 %129, i32 %130) {
Slice_int.set:
	%n.4 = alloca i32
	store i32 %129, ptr %n.4
	%val.1 = alloca i32
	store i32 %130, ptr %val.1
	%131 = load i32, ptr %val.1
	%132 = getelementptr %struct.Slice_int, ptr %128, i32 0, i32 0
	%133 = load ptr, ptr %132
	%134 = getelementptr %struct.Slice_int, ptr %128, i32 0, i32 1
	%135 = load i32, ptr %134
	%136 = load i32, ptr %n.4
	%137 = add i32 %135, %136
	%138 = getelementptr i32, ptr %133, i32 %137
	store i32 %131, ptr %138
	ret void
}

define void @global.init () {
global.init:
	ret void
}

