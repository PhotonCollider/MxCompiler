;Definition Of Structs
%struct.Array_Node = type {ptr, i32}
%struct.Heap_Node = type {ptr}
%struct.Node = type {i32, i32}
%struct.Edge = type {i32, i32, i32}
%struct.EdgeList = type {ptr, ptr, ptr, i32}

;Definition Of Global Variables
@n = global i32 0
@m = global i32 0
@g = global ptr null
@INF = global i32 0

;Definition Of String Literals
@stringLiteral.0 = private unnamed_addr constant [3 x i8] c"-1\00"
@stringLiteral.1 = private unnamed_addr constant [2 x i8] c" \00"
@stringLiteral.2 = private unnamed_addr constant [1 x i8] c"\00"

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
define ptr @Heap_Node.pop (ptr %372) {
Heap_Node.pop:
	%res.1 = alloca ptr
	%373 = getelementptr %struct.Heap_Node, ptr %372, i32 0, i32 0
	%374 = load ptr, ptr %373
	%375 = call ptr @Array_Node.front(ptr %374)
	store ptr %375, ptr %res.1
	%376 = getelementptr %struct.Heap_Node, ptr %372, i32 0, i32 0
	%377 = load ptr, ptr %376
	%378 = call i32 @Heap_Node.size(ptr %372)
	%379 = sub i32 %378, 1
	call void @Array_Node.swap(ptr %377, i32 0, i32 %379)
	%380 = getelementptr %struct.Heap_Node, ptr %372, i32 0, i32 0
	%381 = load ptr, ptr %380
	%382 = call ptr @Array_Node.pop_back(ptr %381)
	call void @Heap_Node.maxHeapify(ptr %372, i32 0)
	%383 = load ptr, ptr %res.1
	ret ptr %383
}

define i32 @Heap_Node.rchild (ptr %397, i32 %398) {
Heap_Node.rchild:
	%x.3 = alloca i32
	store i32 %398, ptr %x.3
	%399 = load i32, ptr %x.3
	%400 = mul i32 %399, 2
	%401 = add i32 %400, 2
	ret i32 %401
}

define void @Heap_Node.push (ptr %345, ptr %346) {
Heap_Node.push:
	%v.6 = alloca ptr
	store ptr %346, ptr %v.6
	%347 = getelementptr %struct.Heap_Node, ptr %345, i32 0, i32 0
	%348 = load ptr, ptr %347
	%349 = load ptr, ptr %v.6
	call void @Array_Node.push_back(ptr %348, ptr %349)
	%x.1 = alloca i32
	%350 = call i32 @Heap_Node.size(ptr %345)
	%351 = sub i32 %350, 1
	store i32 %351, ptr %x.1
	br label %while.cond.1
while.cond.1:
	%352 = load i32, ptr %x.1
	%353 = icmp sgt i32 %352, 0
	br i1 %353, label %while.body.1, label %while.end.1
while.body.1:
	%p.1 = alloca i32
	%354 = load i32, ptr %x.1
	%355 = call i32 @Heap_Node.pnt(ptr %345, i32 %354)
	store i32 %355, ptr %p.1
	%356 = getelementptr %struct.Heap_Node, ptr %345, i32 0, i32 0
	%357 = load ptr, ptr %356
	%358 = load i32, ptr %p.1
	%359 = call ptr @Array_Node.get(ptr %357, i32 %358)
	%360 = call i32 @Node.key_(ptr %359)
	%361 = getelementptr %struct.Heap_Node, ptr %345, i32 0, i32 0
	%362 = load ptr, ptr %361
	%363 = load i32, ptr %x.1
	%364 = call ptr @Array_Node.get(ptr %362, i32 %363)
	%365 = call i32 @Node.key_(ptr %364)
	%366 = icmp sge i32 %360, %365
	br i1 %366, label %if.then.1, label %if.else.1
if.then.1:
	br label %while.end.1
if.else.1:
	br label %if.endif.1
if.endif.1:
	%367 = getelementptr %struct.Heap_Node, ptr %345, i32 0, i32 0
	%368 = load ptr, ptr %367
	%369 = load i32, ptr %p.1
	%370 = load i32, ptr %x.1
	call void @Array_Node.swap(ptr %368, i32 %369, i32 %370)
	%371 = load i32, ptr %p.1
	store i32 %371, ptr %x.1
	br label %while.cond.1
while.end.1:
	ret void
}

define ptr @Heap_Node.top (ptr %384) {
Heap_Node.top:
	%385 = getelementptr %struct.Heap_Node, ptr %384, i32 0, i32 0
	%386 = load ptr, ptr %385
	%387 = call ptr @Array_Node.front(ptr %386)
	ret ptr %387
}

define ptr @Array_Node.front (ptr %260) {
Array_Node.front:
	%261 = getelementptr %struct.Array_Node, ptr %260, i32 0, i32 0
	%262 = load ptr, ptr %261
	%263 = getelementptr ptr, ptr %262, i32 0
	%264 = load ptr, ptr %263
	ret ptr %264
}

define ptr @Array_Node.pop_back (ptr %242) {
Array_Node.pop_back:
	%243 = getelementptr %struct.Array_Node, ptr %242, i32 0, i32 1
	%244 = load i32, ptr %243
	%245 = add i32 %244, -1
	store i32 %245, ptr %243
	%246 = getelementptr %struct.Array_Node, ptr %242, i32 0, i32 0
	%247 = load ptr, ptr %246
	%248 = getelementptr %struct.Array_Node, ptr %242, i32 0, i32 1
	%249 = load i32, ptr %248
	%250 = getelementptr ptr, ptr %247, i32 %249
	%251 = load ptr, ptr %250
	ret ptr %251
}

define void @Array_Node.doubleStorage (ptr %314) {
Array_Node.doubleStorage:
	%copy.1 = alloca ptr
	%315 = getelementptr %struct.Array_Node, ptr %314, i32 0, i32 0
	%316 = load ptr, ptr %315
	store ptr %316, ptr %copy.1
	%szCopy.1 = alloca i32
	%317 = getelementptr %struct.Array_Node, ptr %314, i32 0, i32 1
	%318 = load i32, ptr %317
	store i32 %318, ptr %szCopy.1
	%319 = load ptr, ptr %copy.1
	%320 = call i32 @array.size(ptr %319)
	%321 = mul i32 %320, 2
	%322 = call ptr @builtin.calloc_array(i32 4, i32 %321)
	%323 = getelementptr %struct.Array_Node, ptr %314, i32 0, i32 0
	store ptr %322, ptr %323
	%324 = getelementptr %struct.Array_Node, ptr %314, i32 0, i32 1
	store i32 0, ptr %324
	br label %for.cond.2
for.cond.2:
	%325 = getelementptr %struct.Array_Node, ptr %314, i32 0, i32 1
	%326 = load i32, ptr %325
	%327 = load i32, ptr %szCopy.1
	%328 = icmp ne i32 %326, %327
	br i1 %328, label %for.body.2, label %for.end.2
for.body.2:
	%329 = load ptr, ptr %copy.1
	%330 = getelementptr %struct.Array_Node, ptr %314, i32 0, i32 1
	%331 = load i32, ptr %330
	%332 = getelementptr ptr, ptr %329, i32 %331
	%333 = load ptr, ptr %332
	%334 = getelementptr %struct.Array_Node, ptr %314, i32 0, i32 0
	%335 = load ptr, ptr %334
	%336 = getelementptr %struct.Array_Node, ptr %314, i32 0, i32 1
	%337 = load i32, ptr %336
	%338 = getelementptr ptr, ptr %335, i32 %337
	store ptr %333, ptr %338
	br label %for.update.2
for.update.2:
	%339 = getelementptr %struct.Array_Node, ptr %314, i32 0, i32 1
	%340 = load i32, ptr %339
	%341 = add i32 %340, 1
	store i32 %341, ptr %339
	br label %for.cond.2
for.end.2:
	ret void
}

define ptr @dijkstra (i32 %18) {
dijkstra:
	%s.1 = alloca i32
	store i32 %18, ptr %s.1
	%visited.1 = alloca ptr
	%19 = load i32, ptr @n
	%20 = call ptr @builtin.calloc_array(i32 4, i32 %19)
	store ptr %20, ptr %visited.1
	%d.1 = alloca ptr
	%21 = load i32, ptr @n
	%22 = call ptr @builtin.calloc_array(i32 4, i32 %21)
	store ptr %22, ptr %d.1
	%i.2 = alloca i32
	store i32 0, ptr %i.2
	br label %for.cond.4
for.cond.4:
	%23 = load i32, ptr %i.2
	%24 = load i32, ptr @n
	%25 = icmp slt i32 %23, %24
	br i1 %25, label %for.body.4, label %for.end.4
for.body.4:
	%26 = load i32, ptr @INF
	%27 = load ptr, ptr %d.1
	%28 = load i32, ptr %i.2
	%29 = getelementptr i32, ptr %27, i32 %28
	store i32 %26, ptr %29
	%30 = load ptr, ptr %visited.1
	%31 = load i32, ptr %i.2
	%32 = getelementptr i32, ptr %30, i32 %31
	store i32 0, ptr %32
	br label %for.update.4
for.update.4:
	%33 = load i32, ptr %i.2
	%34 = add i32 %33, 1
	store i32 %34, ptr %i.2
	br label %for.cond.4
for.end.4:
	%35 = load ptr, ptr %d.1
	%36 = load i32, ptr %s.1
	%37 = getelementptr i32, ptr %35, i32 %36
	store i32 0, ptr %37
	%q.1 = alloca ptr
	%38 = call ptr @builtin.malloc(i32 4)
	call void @Heap_Node.Heap_Node()
	store ptr %38, ptr %q.1
	%src.1 = alloca ptr
	%39 = call ptr @builtin.malloc(i32 8)
	store ptr %39, ptr %src.1
	%40 = load ptr, ptr %src.1
	%41 = getelementptr %struct.Node, ptr %40, i32 0, i32 1
	store i32 0, ptr %41
	%42 = load i32, ptr %s.1
	%43 = load ptr, ptr %src.1
	%44 = getelementptr %struct.Node, ptr %43, i32 0, i32 0
	store i32 %42, ptr %44
	%45 = load ptr, ptr %q.1
	%46 = load ptr, ptr %src.1
	call void @Heap_Node.push(ptr %45, ptr %46)
	br label %while.cond.2
while.cond.2:
	%47 = load ptr, ptr %q.1
	%48 = call i32 @Heap_Node.size(ptr %47)
	%49 = icmp ne i32 %48, 0
	br i1 %49, label %while.body.2, label %while.end.2
while.body.2:
	%node.1 = alloca ptr
	%50 = load ptr, ptr %q.1
	%51 = call ptr @Heap_Node.pop(ptr %50)
	store ptr %51, ptr %node.1
	%u.2 = alloca i32
	%52 = load ptr, ptr %node.1
	%53 = getelementptr %struct.Node, ptr %52, i32 0, i32 0
	%54 = load i32, ptr %53
	store i32 %54, ptr %u.2
	%55 = load ptr, ptr %visited.1
	%56 = load i32, ptr %u.2
	%57 = getelementptr i32, ptr %55, i32 %56
	%58 = load i32, ptr %57
	%59 = icmp eq i32 %58, 1
	br i1 %59, label %if.then.5, label %if.else.5
if.then.5:
	br label %while.cond.2
if.else.5:
	br label %if.endif.5
if.endif.5:
	%60 = load ptr, ptr %visited.1
	%61 = load i32, ptr %u.2
	%62 = getelementptr i32, ptr %60, i32 %61
	store i32 1, ptr %62
	%k.1 = alloca i32
	%63 = load ptr, ptr @g
	%64 = getelementptr %struct.EdgeList, ptr %63, i32 0, i32 2
	%65 = load ptr, ptr %64
	%66 = load i32, ptr %u.2
	%67 = getelementptr i32, ptr %65, i32 %66
	%68 = load i32, ptr %67
	store i32 %68, ptr %k.1
	br label %for.cond.5
for.cond.5:
	%69 = load i32, ptr %k.1
	%70 = sub i32 0, 1
	%71 = icmp ne i32 %69, %70
	br i1 %71, label %for.body.5, label %for.end.5
for.body.5:
	%v.2 = alloca i32
	%72 = load ptr, ptr @g
	%73 = getelementptr %struct.EdgeList, ptr %72, i32 0, i32 0
	%74 = load ptr, ptr %73
	%75 = load i32, ptr %k.1
	%76 = getelementptr ptr, ptr %74, i32 %75
	%77 = load ptr, ptr %76
	%78 = getelementptr %struct.Edge, ptr %77, i32 0, i32 1
	%79 = load i32, ptr %78
	store i32 %79, ptr %v.2
	%w.2 = alloca i32
	%80 = load ptr, ptr @g
	%81 = getelementptr %struct.EdgeList, ptr %80, i32 0, i32 0
	%82 = load ptr, ptr %81
	%83 = load i32, ptr %k.1
	%84 = getelementptr ptr, ptr %82, i32 %83
	%85 = load ptr, ptr %84
	%86 = getelementptr %struct.Edge, ptr %85, i32 0, i32 2
	%87 = load i32, ptr %86
	store i32 %87, ptr %w.2
	%alt.1 = alloca i32
	%88 = load ptr, ptr %d.1
	%89 = load i32, ptr %u.2
	%90 = getelementptr i32, ptr %88, i32 %89
	%91 = load i32, ptr %90
	%92 = load i32, ptr %w.2
	%93 = add i32 %91, %92
	store i32 %93, ptr %alt.1
	%94 = load i32, ptr %alt.1
	%95 = load ptr, ptr %d.1
	%96 = load i32, ptr %v.2
	%97 = getelementptr i32, ptr %95, i32 %96
	%98 = load i32, ptr %97
	%99 = icmp sge i32 %94, %98
	br i1 %99, label %if.then.6, label %if.else.6
if.then.6:
	br label %for.update.5
if.else.6:
	br label %if.endif.6
if.endif.6:
	%100 = load i32, ptr %alt.1
	%101 = load ptr, ptr %d.1
	%102 = load i32, ptr %v.2
	%103 = getelementptr i32, ptr %101, i32 %102
	store i32 %100, ptr %103
	%104 = call ptr @builtin.malloc(i32 8)
	store ptr %104, ptr %node.1
	%105 = load i32, ptr %v.2
	%106 = load ptr, ptr %node.1
	%107 = getelementptr %struct.Node, ptr %106, i32 0, i32 0
	store i32 %105, ptr %107
	%108 = load ptr, ptr %d.1
	%109 = load i32, ptr %v.2
	%110 = getelementptr i32, ptr %108, i32 %109
	%111 = load i32, ptr %110
	%112 = load ptr, ptr %node.1
	%113 = getelementptr %struct.Node, ptr %112, i32 0, i32 1
	store i32 %111, ptr %113
	%114 = load ptr, ptr %q.1
	%115 = load ptr, ptr %node.1
	call void @Heap_Node.push(ptr %114, ptr %115)
	br label %for.update.5
for.update.5:
	%116 = load ptr, ptr @g
	%117 = getelementptr %struct.EdgeList, ptr %116, i32 0, i32 1
	%118 = load ptr, ptr %117
	%119 = load i32, ptr %k.1
	%120 = getelementptr i32, ptr %118, i32 %119
	%121 = load i32, ptr %120
	store i32 %121, ptr %k.1
	br label %for.cond.5
for.end.5:
	br label %while.cond.2
while.end.2:
	%122 = load ptr, ptr %d.1
	ret ptr %122
}

define i32 @main () {
main:
	call void @global.init()
	call void @init()
	%i.3 = alloca i32
	%j.1 = alloca i32
	store i32 0, ptr %i.3
	br label %for.cond.6
for.cond.6:
	%123 = load i32, ptr %i.3
	%124 = load i32, ptr @n
	%125 = icmp slt i32 %123, %124
	br i1 %125, label %for.body.6, label %for.end.6
for.body.6:
	%d.2 = alloca ptr
	%126 = load i32, ptr %i.3
	%127 = call ptr @dijkstra(i32 %126)
	store ptr %127, ptr %d.2
	store i32 0, ptr %j.1
	br label %for.cond.7
for.cond.7:
	%128 = load i32, ptr %j.1
	%129 = load i32, ptr @n
	%130 = icmp slt i32 %128, %129
	br i1 %130, label %for.body.7, label %for.end.7
for.body.7:
	%131 = load ptr, ptr %d.2
	%132 = load i32, ptr %j.1
	%133 = getelementptr i32, ptr %131, i32 %132
	%134 = load i32, ptr %133
	%135 = load i32, ptr @INF
	%136 = icmp eq i32 %134, %135
	br i1 %136, label %if.then.7, label %if.else.7
if.then.7:
	call void @print(ptr @stringLiteral.0)
	br label %if.endif.7
if.else.7:
	%137 = load ptr, ptr %d.2
	%138 = load i32, ptr %j.1
	%139 = getelementptr i32, ptr %137, i32 %138
	%140 = load i32, ptr %139
	%141 = call ptr @toString(i32 %140)
	call void @print(ptr %141)
	br label %if.endif.7
if.endif.7:
	call void @print(ptr @stringLiteral.1)
	br label %for.update.7
for.update.7:
	%142 = load i32, ptr %j.1
	%143 = add i32 %142, 1
	store i32 %143, ptr %j.1
	br label %for.cond.7
for.end.7:
	call void @println(ptr @stringLiteral.2)
	br label %for.update.6
for.update.6:
	%144 = load i32, ptr %i.3
	%145 = add i32 %144, 1
	store i32 %145, ptr %i.3
	br label %for.cond.6
for.end.6:
	ret i32 0
}

define void @Array_Node.resize (ptr %268, i32 %269) {
Array_Node.resize:
	%newSize.1 = alloca i32
	store i32 %269, ptr %newSize.1
	br label %while.cond.0
while.cond.0:
	%270 = getelementptr %struct.Array_Node, ptr %268, i32 0, i32 0
	%271 = load ptr, ptr %270
	%272 = call i32 @array.size(ptr %271)
	%273 = load i32, ptr %newSize.1
	%274 = icmp slt i32 %272, %273
	br i1 %274, label %while.body.0, label %while.end.0
while.body.0:
	call void @Array_Node.doubleStorage(ptr %268)
	br label %while.cond.0
while.end.0:
	%275 = load i32, ptr %newSize.1
	%276 = getelementptr %struct.Array_Node, ptr %268, i32 0, i32 1
	store i32 %275, ptr %276
	ret void
}

define i32 @Heap_Node.lchild (ptr %392, i32 %393) {
Heap_Node.lchild:
	%x.2 = alloca i32
	store i32 %393, ptr %x.2
	%394 = load i32, ptr %x.2
	%395 = mul i32 %394, 2
	%396 = add i32 %395, 1
	ret i32 %396
}

define ptr @Array_Node.get (ptr %277, i32 %278) {
Array_Node.get:
	%i.5 = alloca i32
	store i32 %278, ptr %i.5
	%279 = getelementptr %struct.Array_Node, ptr %277, i32 0, i32 0
	%280 = load ptr, ptr %279
	%281 = load i32, ptr %i.5
	%282 = getelementptr ptr, ptr %280, i32 %281
	%283 = load ptr, ptr %282
	ret ptr %283
}

define i32 @Node.key_ (ptr %458) {
Node.key_:
	%459 = getelementptr %struct.Node, ptr %458, i32 0, i32 1
	%460 = load i32, ptr %459
	%461 = sub i32 0, %460
	ret i32 %461
}

define i32 @EdgeList.nVertices (ptr %218) {
EdgeList.nVertices:
	%219 = getelementptr %struct.EdgeList, ptr %218, i32 0, i32 2
	%220 = load ptr, ptr %219
	%221 = call i32 @array.size(ptr %220)
	ret i32 %221
}

define i32 @EdgeList.nEdges (ptr %222) {
EdgeList.nEdges:
	%223 = getelementptr %struct.EdgeList, ptr %222, i32 0, i32 0
	%224 = load ptr, ptr %223
	%225 = call i32 @array.size(ptr %224)
	ret i32 %225
}

define void @Heap_Node.maxHeapify (ptr %407, i32 %408) {
Heap_Node.maxHeapify:
	%x.5 = alloca i32
	store i32 %408, ptr %x.5
	%l.1 = alloca i32
	%409 = load i32, ptr %x.5
	%410 = call i32 @Heap_Node.lchild(ptr %407, i32 %409)
	store i32 %410, ptr %l.1
	%r.1 = alloca i32
	%411 = load i32, ptr %x.5
	%412 = call i32 @Heap_Node.rchild(ptr %407, i32 %411)
	store i32 %412, ptr %r.1
	%largest.1 = alloca i32
	%413 = load i32, ptr %x.5
	store i32 %413, ptr %largest.1
	%414 = load i32, ptr %l.1
	%415 = call i32 @Heap_Node.size(ptr %407)
	%416 = icmp slt i32 %414, %415
	%417 = alloca i1
	store i1 false, ptr %417
	br i1 %416, label %LogicBinary.second.0, label %LogicBinary.end.0
LogicBinary.second.0:
	%418 = getelementptr %struct.Heap_Node, ptr %407, i32 0, i32 0
	%419 = load ptr, ptr %418
	%420 = load i32, ptr %l.1
	%421 = call ptr @Array_Node.get(ptr %419, i32 %420)
	%422 = call i32 @Node.key_(ptr %421)
	%423 = getelementptr %struct.Heap_Node, ptr %407, i32 0, i32 0
	%424 = load ptr, ptr %423
	%425 = load i32, ptr %largest.1
	%426 = call ptr @Array_Node.get(ptr %424, i32 %425)
	%427 = call i32 @Node.key_(ptr %426)
	%428 = icmp sgt i32 %422, %427
	store i1 %428, ptr %417
	br label %LogicBinary.end.0
LogicBinary.end.0:
	%429 = load i1, ptr %417
	br i1 %429, label %if.then.2, label %if.else.2
if.then.2:
	%430 = load i32, ptr %l.1
	store i32 %430, ptr %largest.1
	br label %if.endif.2
if.else.2:
	br label %if.endif.2
if.endif.2:
	%431 = load i32, ptr %r.1
	%432 = call i32 @Heap_Node.size(ptr %407)
	%433 = icmp slt i32 %431, %432
	%434 = alloca i1
	store i1 false, ptr %434
	br i1 %433, label %LogicBinary.second.2, label %LogicBinary.end.2
LogicBinary.second.2:
	%435 = getelementptr %struct.Heap_Node, ptr %407, i32 0, i32 0
	%436 = load ptr, ptr %435
	%437 = load i32, ptr %r.1
	%438 = call ptr @Array_Node.get(ptr %436, i32 %437)
	%439 = call i32 @Node.key_(ptr %438)
	%440 = getelementptr %struct.Heap_Node, ptr %407, i32 0, i32 0
	%441 = load ptr, ptr %440
	%442 = load i32, ptr %largest.1
	%443 = call ptr @Array_Node.get(ptr %441, i32 %442)
	%444 = call i32 @Node.key_(ptr %443)
	%445 = icmp sgt i32 %439, %444
	store i1 %445, ptr %434
	br label %LogicBinary.end.2
LogicBinary.end.2:
	%446 = load i1, ptr %434
	br i1 %446, label %if.then.3, label %if.else.3
if.then.3:
	%447 = load i32, ptr %r.1
	store i32 %447, ptr %largest.1
	br label %if.endif.3
if.else.3:
	br label %if.endif.3
if.endif.3:
	%448 = load i32, ptr %largest.1
	%449 = load i32, ptr %x.5
	%450 = icmp eq i32 %448, %449
	br i1 %450, label %if.then.4, label %if.else.4
if.then.4:
	ret void
if.else.4:
	br label %if.endif.4
if.endif.4:
	%451 = getelementptr %struct.Heap_Node, ptr %407, i32 0, i32 0
	%452 = load ptr, ptr %451
	%453 = load i32, ptr %x.5
	%454 = load i32, ptr %largest.1
	call void @Array_Node.swap(ptr %452, i32 %453, i32 %454)
	%455 = load i32, ptr %largest.1
	call void @Heap_Node.maxHeapify(ptr %407, i32 %455)
	ret void
}

define ptr @Array_Node.back (ptr %252) {
Array_Node.back:
	%253 = getelementptr %struct.Array_Node, ptr %252, i32 0, i32 0
	%254 = load ptr, ptr %253
	%255 = getelementptr %struct.Array_Node, ptr %252, i32 0, i32 1
	%256 = load i32, ptr %255
	%257 = sub i32 %256, 1
	%258 = getelementptr ptr, ptr %254, i32 %257
	%259 = load ptr, ptr %258
	ret ptr %259
}

define void @global.init () {
global.init:
	store i32 10000000, ptr @INF
	ret void
}

define void @EdgeList.addEdge (ptr %179, i32 %180, i32 %181, i32 %182) {
EdgeList.addEdge:
	%u.3 = alloca i32
	store i32 %180, ptr %u.3
	%v.3 = alloca i32
	store i32 %181, ptr %v.3
	%w.3 = alloca i32
	store i32 %182, ptr %w.3
	%e.1 = alloca ptr
	%183 = call ptr @builtin.malloc(i32 12)
	store ptr %183, ptr %e.1
	%184 = load i32, ptr %u.3
	%185 = load ptr, ptr %e.1
	%186 = getelementptr %struct.Edge, ptr %185, i32 0, i32 0
	store i32 %184, ptr %186
	%187 = load i32, ptr %v.3
	%188 = load ptr, ptr %e.1
	%189 = getelementptr %struct.Edge, ptr %188, i32 0, i32 1
	store i32 %187, ptr %189
	%190 = load i32, ptr %w.3
	%191 = load ptr, ptr %e.1
	%192 = getelementptr %struct.Edge, ptr %191, i32 0, i32 2
	store i32 %190, ptr %192
	%193 = load ptr, ptr %e.1
	%194 = getelementptr %struct.EdgeList, ptr %179, i32 0, i32 0
	%195 = load ptr, ptr %194
	%196 = getelementptr %struct.EdgeList, ptr %179, i32 0, i32 3
	%197 = load i32, ptr %196
	%198 = getelementptr ptr, ptr %195, i32 %197
	store ptr %193, ptr %198
	%199 = getelementptr %struct.EdgeList, ptr %179, i32 0, i32 2
	%200 = load ptr, ptr %199
	%201 = load i32, ptr %u.3
	%202 = getelementptr i32, ptr %200, i32 %201
	%203 = load i32, ptr %202
	%204 = getelementptr %struct.EdgeList, ptr %179, i32 0, i32 1
	%205 = load ptr, ptr %204
	%206 = getelementptr %struct.EdgeList, ptr %179, i32 0, i32 3
	%207 = load i32, ptr %206
	%208 = getelementptr i32, ptr %205, i32 %207
	store i32 %203, ptr %208
	%209 = getelementptr %struct.EdgeList, ptr %179, i32 0, i32 3
	%210 = load i32, ptr %209
	%211 = getelementptr %struct.EdgeList, ptr %179, i32 0, i32 2
	%212 = load ptr, ptr %211
	%213 = load i32, ptr %u.3
	%214 = getelementptr i32, ptr %212, i32 %213
	store i32 %210, ptr %214
	%215 = getelementptr %struct.EdgeList, ptr %179, i32 0, i32 3
	%216 = load i32, ptr %215
	%217 = add i32 %216, 1
	store i32 %217, ptr %215
	ret void
}

define void @Array_Node.set (ptr %284, i32 %285, ptr %286) {
Array_Node.set:
	%i.6 = alloca i32
	store i32 %285, ptr %i.6
	%v.5 = alloca ptr
	store ptr %286, ptr %v.5
	%287 = load ptr, ptr %v.5
	%288 = getelementptr %struct.Array_Node, ptr %284, i32 0, i32 0
	%289 = load ptr, ptr %288
	%290 = load i32, ptr %i.6
	%291 = getelementptr ptr, ptr %289, i32 %290
	store ptr %287, ptr %291
	ret void
}

define void @init () {
init:
	%0 = call i32 @getInt()
	store i32 %0, ptr @n
	%1 = call i32 @getInt()
	store i32 %1, ptr @m
	%2 = call ptr @builtin.malloc(i32 16)
	store ptr %2, ptr @g
	%3 = load ptr, ptr @g
	%4 = load i32, ptr @n
	%5 = load i32, ptr @m
	call void @EdgeList.init(ptr %3, i32 %4, i32 %5)
	%i.1 = alloca i32
	store i32 0, ptr %i.1
	br label %for.cond.3
for.cond.3:
	%6 = load i32, ptr %i.1
	%7 = load i32, ptr @m
	%8 = icmp slt i32 %6, %7
	br i1 %8, label %for.body.3, label %for.end.3
for.body.3:
	%u.1 = alloca i32
	%9 = call i32 @getInt()
	store i32 %9, ptr %u.1
	%v.1 = alloca i32
	%10 = call i32 @getInt()
	store i32 %10, ptr %v.1
	%w.1 = alloca i32
	%11 = call i32 @getInt()
	store i32 %11, ptr %w.1
	%12 = load ptr, ptr @g
	%13 = load i32, ptr %u.1
	%14 = load i32, ptr %v.1
	%15 = load i32, ptr %w.1
	call void @EdgeList.addEdge(ptr %12, i32 %13, i32 %14, i32 %15)
	br label %for.update.3
for.update.3:
	%16 = load i32, ptr %i.1
	%17 = add i32 %16, 1
	store i32 %17, ptr %i.1
	br label %for.cond.3
for.end.3:
	ret void
}

define void @Array_Node.push_back (ptr %226, ptr %227) {
Array_Node.push_back:
	%v.4 = alloca ptr
	store ptr %227, ptr %v.4
	%228 = call i32 @Array_Node.size(ptr %226)
	%229 = getelementptr %struct.Array_Node, ptr %226, i32 0, i32 0
	%230 = load ptr, ptr %229
	%231 = call i32 @array.size(ptr %230)
	%232 = icmp eq i32 %228, %231
	br i1 %232, label %if.then.0, label %if.else.0
if.then.0:
	call void @Array_Node.doubleStorage(ptr %226)
	br label %if.endif.0
if.else.0:
	br label %if.endif.0
if.endif.0:
	%233 = load ptr, ptr %v.4
	%234 = getelementptr %struct.Array_Node, ptr %226, i32 0, i32 0
	%235 = load ptr, ptr %234
	%236 = getelementptr %struct.Array_Node, ptr %226, i32 0, i32 1
	%237 = load i32, ptr %236
	%238 = getelementptr ptr, ptr %235, i32 %237
	store ptr %233, ptr %238
	%239 = getelementptr %struct.Array_Node, ptr %226, i32 0, i32 1
	%240 = load i32, ptr %239
	%241 = add i32 %240, 1
	store i32 %241, ptr %239
	ret void
}

define i32 @Heap_Node.pnt (ptr %402, i32 %403) {
Heap_Node.pnt:
	%x.4 = alloca i32
	store i32 %403, ptr %x.4
	%404 = load i32, ptr %x.4
	%405 = sub i32 %404, 1
	%406 = sdiv i32 %405, 2
	ret i32 %406
}

define void @Heap_Node.Heap_Node (ptr %this) {
Heap_Node.Heap_Node.entry:
	%456 = call ptr @builtin.malloc(i32 8)
	call void @Array_Node.Array_Node()
	%457 = getelementptr %struct.Heap_Node, ptr %this, i32 0, i32 0
	store ptr %456, ptr %457
	ret void
}

define void @Array_Node.swap (ptr %292, i32 %293, i32 %294) {
Array_Node.swap:
	%i.7 = alloca i32
	store i32 %293, ptr %i.7
	%j.2 = alloca i32
	store i32 %294, ptr %j.2
	%t.1 = alloca ptr
	%295 = getelementptr %struct.Array_Node, ptr %292, i32 0, i32 0
	%296 = load ptr, ptr %295
	%297 = load i32, ptr %i.7
	%298 = getelementptr ptr, ptr %296, i32 %297
	%299 = load ptr, ptr %298
	store ptr %299, ptr %t.1
	%300 = getelementptr %struct.Array_Node, ptr %292, i32 0, i32 0
	%301 = load ptr, ptr %300
	%302 = load i32, ptr %j.2
	%303 = getelementptr ptr, ptr %301, i32 %302
	%304 = load ptr, ptr %303
	%305 = getelementptr %struct.Array_Node, ptr %292, i32 0, i32 0
	%306 = load ptr, ptr %305
	%307 = load i32, ptr %i.7
	%308 = getelementptr ptr, ptr %306, i32 %307
	store ptr %304, ptr %308
	%309 = load ptr, ptr %t.1
	%310 = getelementptr %struct.Array_Node, ptr %292, i32 0, i32 0
	%311 = load ptr, ptr %310
	%312 = load i32, ptr %j.2
	%313 = getelementptr ptr, ptr %311, i32 %312
	store ptr %309, ptr %313
	ret void
}

define i32 @Heap_Node.size (ptr %388) {
Heap_Node.size:
	%389 = getelementptr %struct.Heap_Node, ptr %388, i32 0, i32 0
	%390 = load ptr, ptr %389
	%391 = call i32 @Array_Node.size(ptr %390)
	ret i32 %391
}

define void @EdgeList.init (ptr %146, i32 %147, i32 %148) {
EdgeList.init:
	%n.1 = alloca i32
	store i32 %147, ptr %n.1
	%m.1 = alloca i32
	store i32 %148, ptr %m.1
	%149 = load i32, ptr %m.1
	%150 = call ptr @builtin.calloc_array(i32 4, i32 %149)
	%151 = getelementptr %struct.EdgeList, ptr %146, i32 0, i32 0
	store ptr %150, ptr %151
	%152 = load i32, ptr %m.1
	%153 = call ptr @builtin.calloc_array(i32 4, i32 %152)
	%154 = getelementptr %struct.EdgeList, ptr %146, i32 0, i32 1
	store ptr %153, ptr %154
	%155 = load i32, ptr %n.1
	%156 = call ptr @builtin.calloc_array(i32 4, i32 %155)
	%157 = getelementptr %struct.EdgeList, ptr %146, i32 0, i32 2
	store ptr %156, ptr %157
	%i.4 = alloca i32
	store i32 0, ptr %i.4
	br label %for.cond.0
for.cond.0:
	%158 = load i32, ptr %i.4
	%159 = load i32, ptr %m.1
	%160 = icmp slt i32 %158, %159
	br i1 %160, label %for.body.0, label %for.end.0
for.body.0:
	%161 = sub i32 0, 1
	%162 = getelementptr %struct.EdgeList, ptr %146, i32 0, i32 1
	%163 = load ptr, ptr %162
	%164 = load i32, ptr %i.4
	%165 = getelementptr i32, ptr %163, i32 %164
	store i32 %161, ptr %165
	br label %for.update.0
for.update.0:
	%166 = load i32, ptr %i.4
	%167 = add i32 %166, 1
	store i32 %167, ptr %i.4
	br label %for.cond.0
for.end.0:
	store i32 0, ptr %i.4
	br label %for.cond.1
for.cond.1:
	%168 = load i32, ptr %i.4
	%169 = load i32, ptr %n.1
	%170 = icmp slt i32 %168, %169
	br i1 %170, label %for.body.1, label %for.end.1
for.body.1:
	%171 = sub i32 0, 1
	%172 = getelementptr %struct.EdgeList, ptr %146, i32 0, i32 2
	%173 = load ptr, ptr %172
	%174 = load i32, ptr %i.4
	%175 = getelementptr i32, ptr %173, i32 %174
	store i32 %171, ptr %175
	br label %for.update.1
for.update.1:
	%176 = load i32, ptr %i.4
	%177 = add i32 %176, 1
	store i32 %177, ptr %i.4
	br label %for.cond.1
for.end.1:
	%178 = getelementptr %struct.EdgeList, ptr %146, i32 0, i32 3
	store i32 0, ptr %178
	ret void
}

define void @Array_Node.Array_Node (ptr %this) {
Array_Node.Array_Node.entry:
	%342 = getelementptr %struct.Array_Node, ptr %this, i32 0, i32 1
	store i32 0, ptr %342
	%343 = call ptr @builtin.calloc_array(i32 4, i32 16)
	%344 = getelementptr %struct.Array_Node, ptr %this, i32 0, i32 0
	store ptr %343, ptr %344
	ret void
}

define i32 @Array_Node.size (ptr %265) {
Array_Node.size:
	%266 = getelementptr %struct.Array_Node, ptr %265, i32 0, i32 1
	%267 = load i32, ptr %266
	ret i32 %267
}

