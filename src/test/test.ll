;Definition Of Structs

;Definition Of Global Variables
@A = global i32 0
@B = global i32 0
@C = global i32 0

;Definition Of String Literals

;Definition Of Formatted String Fragments
@FString.0.Literal.0 = private unnamed_addr constant [5 x i8] c"lhs=\00"
@FString.0.Literal.1 = private unnamed_addr constant [7 x i8] c", rhs=\00"
@FString.0.Literal.2 = private unnamed_addr constant [11 x i8] c", lhs-rhs=\00"
@FString.0.Literal.3 = private unnamed_addr constant [5 x i8] c", A=\00"
@FString.0.Literal.4 = private unnamed_addr constant [1 x i8] c"\00"
@FString.1.Literal.0 = private unnamed_addr constant [3 x i8] c"A=\00"
@FString.1.Literal.1 = private unnamed_addr constant [5 x i8] c", B=\00"
@FString.1.Literal.2 = private unnamed_addr constant [5 x i8] c", C=\00"
@FString.1.Literal.3 = private unnamed_addr constant [2 x i8] c"\0A\00"

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
	%fuckingTerminator.1 = alloca i32
	store i32 0, ptr %fuckingTerminator.1
	br label %while.cond.0
while.cond.0:
	%0 = load i32, ptr @C
	%1 = shl i32 1, 29
	%2 = icmp slt i32 %0, %1
	%3 = alloca i1
	store i1 false, ptr %3
	br i1 %2, label %LogicBinary.second.0, label %LogicBinary.end.0
LogicBinary.second.0:
	%4 = load i32, ptr @C
	%5 = shl i32 1, 29
	%6 = sub i32 0, %5
	%7 = icmp sgt i32 %4, %6
	store i1 %7, ptr %3
	br label %LogicBinary.end.0
LogicBinary.end.0:
	%8 = load i1, ptr %3
	br i1 %8, label %while.body.0, label %while.end.0
while.body.0:
	%lhs.1 = alloca i32
	%9 = load i32, ptr @C
	%10 = load i32, ptr @A
	%11 = sub i32 %9, %10
	%12 = load i32, ptr @B
	%13 = add i32 %11, %12
	%14 = load i32, ptr @A
	%15 = load i32, ptr @B
	%16 = add i32 %14, %15
	%17 = sub i32 %13, %16
	%18 = load i32, ptr @C
	%19 = load i32, ptr @A
	%20 = sub i32 %18, %19
	%21 = load i32, ptr @B
	%22 = add i32 %20, %21
	%23 = load i32, ptr @A
	%24 = load i32, ptr @B
	%25 = add i32 %23, %24
	%26 = sub i32 %22, %25
	%27 = add i32 %17, %26
	%28 = load i32, ptr @C
	%29 = load i32, ptr @A
	%30 = sub i32 %28, %29
	%31 = load i32, ptr @B
	%32 = add i32 %30, %31
	%33 = load i32, ptr @A
	%34 = load i32, ptr @B
	%35 = add i32 %33, %34
	%36 = sub i32 %32, %35
	%37 = load i32, ptr @C
	%38 = load i32, ptr @A
	%39 = sub i32 %37, %38
	%40 = load i32, ptr @B
	%41 = add i32 %39, %40
	%42 = add i32 %36, %41
	%43 = add i32 %27, %42
	%44 = load i32, ptr @A
	%45 = load i32, ptr @B
	%46 = add i32 %44, %45
	%47 = load i32, ptr @C
	%48 = load i32, ptr @A
	%49 = sub i32 %47, %48
	%50 = load i32, ptr @B
	%51 = add i32 %49, %50
	%52 = add i32 %46, %51
	%53 = load i32, ptr @A
	%54 = load i32, ptr @B
	%55 = add i32 %53, %54
	%56 = sub i32 %52, %55
	%57 = load i32, ptr @C
	%58 = load i32, ptr @A
	%59 = sub i32 %57, %58
	%60 = load i32, ptr @B
	%61 = add i32 %59, %60
	%62 = load i32, ptr @A
	%63 = load i32, ptr @B
	%64 = add i32 %62, %63
	%65 = sub i32 %61, %64
	%66 = load i32, ptr @C
	%67 = load i32, ptr @A
	%68 = sub i32 %66, %67
	%69 = load i32, ptr @B
	%70 = add i32 %68, %69
	%71 = add i32 %65, %70
	%72 = add i32 %56, %71
	%73 = sub i32 %43, %72
	%74 = load i32, ptr @A
	%75 = load i32, ptr @B
	%76 = add i32 %74, %75
	%77 = load i32, ptr @C
	%78 = load i32, ptr @A
	%79 = sub i32 %77, %78
	%80 = load i32, ptr @B
	%81 = add i32 %79, %80
	%82 = add i32 %76, %81
	%83 = load i32, ptr @A
	%84 = load i32, ptr @B
	%85 = add i32 %83, %84
	%86 = load i32, ptr @C
	%87 = load i32, ptr @A
	%88 = sub i32 %86, %87
	%89 = load i32, ptr @B
	%90 = add i32 %88, %89
	%91 = add i32 %85, %90
	%92 = sub i32 %82, %91
	%93 = load i32, ptr @A
	%94 = load i32, ptr @B
	%95 = add i32 %93, %94
	%96 = load i32, ptr @C
	%97 = load i32, ptr @A
	%98 = sub i32 %96, %97
	%99 = load i32, ptr @B
	%100 = add i32 %98, %99
	%101 = add i32 %95, %100
	%102 = load i32, ptr @A
	%103 = load i32, ptr @B
	%104 = add i32 %102, %103
	%105 = sub i32 %101, %104
	%106 = sub i32 %92, %105
	%107 = load i32, ptr @C
	%108 = load i32, ptr @A
	%109 = sub i32 %107, %108
	%110 = load i32, ptr @B
	%111 = add i32 %109, %110
	%112 = load i32, ptr @A
	%113 = load i32, ptr @B
	%114 = add i32 %112, %113
	%115 = sub i32 %111, %114
	%116 = load i32, ptr @C
	%117 = load i32, ptr @A
	%118 = sub i32 %116, %117
	%119 = load i32, ptr @B
	%120 = add i32 %118, %119
	%121 = add i32 %115, %120
	%122 = load i32, ptr @A
	%123 = load i32, ptr @B
	%124 = add i32 %122, %123
	%125 = load i32, ptr @C
	%126 = load i32, ptr @A
	%127 = sub i32 %125, %126
	%128 = load i32, ptr @B
	%129 = add i32 %127, %128
	%130 = add i32 %124, %129
	%131 = load i32, ptr @A
	%132 = load i32, ptr @B
	%133 = add i32 %131, %132
	%134 = sub i32 %130, %133
	%135 = sub i32 %121, %134
	%136 = add i32 %106, %135
	%137 = sub i32 %73, %136
	%138 = load i32, ptr @C
	%139 = load i32, ptr @A
	%140 = sub i32 %138, %139
	%141 = load i32, ptr @B
	%142 = add i32 %140, %141
	%143 = load i32, ptr @A
	%144 = load i32, ptr @B
	%145 = add i32 %143, %144
	%146 = sub i32 %142, %145
	%147 = load i32, ptr @C
	%148 = load i32, ptr @A
	%149 = sub i32 %147, %148
	%150 = load i32, ptr @B
	%151 = add i32 %149, %150
	%152 = load i32, ptr @A
	%153 = load i32, ptr @B
	%154 = add i32 %152, %153
	%155 = sub i32 %151, %154
	%156 = add i32 %146, %155
	%157 = load i32, ptr @C
	%158 = load i32, ptr @A
	%159 = sub i32 %157, %158
	%160 = load i32, ptr @B
	%161 = add i32 %159, %160
	%162 = load i32, ptr @A
	%163 = load i32, ptr @B
	%164 = add i32 %162, %163
	%165 = sub i32 %161, %164
	%166 = load i32, ptr @C
	%167 = load i32, ptr @A
	%168 = sub i32 %166, %167
	%169 = load i32, ptr @B
	%170 = add i32 %168, %169
	%171 = add i32 %165, %170
	%172 = add i32 %156, %171
	%173 = load i32, ptr @A
	%174 = load i32, ptr @B
	%175 = add i32 %173, %174
	%176 = load i32, ptr @C
	%177 = load i32, ptr @A
	%178 = sub i32 %176, %177
	%179 = load i32, ptr @B
	%180 = add i32 %178, %179
	%181 = add i32 %175, %180
	%182 = load i32, ptr @A
	%183 = load i32, ptr @B
	%184 = add i32 %182, %183
	%185 = sub i32 %181, %184
	%186 = load i32, ptr @C
	%187 = load i32, ptr @A
	%188 = sub i32 %186, %187
	%189 = load i32, ptr @B
	%190 = add i32 %188, %189
	%191 = load i32, ptr @A
	%192 = load i32, ptr @B
	%193 = add i32 %191, %192
	%194 = sub i32 %190, %193
	%195 = load i32, ptr @C
	%196 = load i32, ptr @A
	%197 = sub i32 %195, %196
	%198 = load i32, ptr @B
	%199 = add i32 %197, %198
	%200 = add i32 %194, %199
	%201 = add i32 %185, %200
	%202 = sub i32 %172, %201
	%203 = load i32, ptr @A
	%204 = load i32, ptr @B
	%205 = add i32 %203, %204
	%206 = load i32, ptr @C
	%207 = load i32, ptr @A
	%208 = sub i32 %206, %207
	%209 = load i32, ptr @B
	%210 = add i32 %208, %209
	%211 = add i32 %205, %210
	%212 = load i32, ptr @A
	%213 = load i32, ptr @B
	%214 = add i32 %212, %213
	%215 = sub i32 %211, %214
	%216 = load i32, ptr @C
	%217 = load i32, ptr @A
	%218 = sub i32 %216, %217
	%219 = load i32, ptr @B
	%220 = add i32 %218, %219
	%221 = load i32, ptr @A
	%222 = load i32, ptr @B
	%223 = add i32 %221, %222
	%224 = sub i32 %220, %223
	%225 = load i32, ptr @C
	%226 = load i32, ptr @A
	%227 = sub i32 %225, %226
	%228 = load i32, ptr @B
	%229 = add i32 %227, %228
	%230 = add i32 %224, %229
	%231 = add i32 %215, %230
	%232 = load i32, ptr @A
	%233 = load i32, ptr @B
	%234 = add i32 %232, %233
	%235 = load i32, ptr @C
	%236 = load i32, ptr @A
	%237 = sub i32 %235, %236
	%238 = load i32, ptr @B
	%239 = add i32 %237, %238
	%240 = add i32 %234, %239
	%241 = load i32, ptr @A
	%242 = load i32, ptr @B
	%243 = add i32 %241, %242
	%244 = sub i32 %240, %243
	%245 = load i32, ptr @C
	%246 = load i32, ptr @A
	%247 = sub i32 %245, %246
	%248 = load i32, ptr @B
	%249 = add i32 %247, %248
	%250 = load i32, ptr @A
	%251 = load i32, ptr @B
	%252 = add i32 %250, %251
	%253 = sub i32 %249, %252
	%254 = load i32, ptr @C
	%255 = load i32, ptr @A
	%256 = sub i32 %254, %255
	%257 = load i32, ptr @B
	%258 = add i32 %256, %257
	%259 = add i32 %253, %258
	%260 = add i32 %244, %259
	%261 = sub i32 %231, %260
	%262 = sub i32 %202, %261
	%263 = add i32 %137, %262
	store i32 %263, ptr %lhs.1
	%rhs.1 = alloca i32
	%264 = load i32, ptr @A
	%265 = load i32, ptr @B
	%266 = add i32 %264, %265
	%267 = load i32, ptr @C
	%268 = load i32, ptr @A
	%269 = sub i32 %267, %268
	%270 = load i32, ptr @B
	%271 = add i32 %269, %270
	%272 = add i32 %266, %271
	%273 = load i32, ptr @A
	%274 = load i32, ptr @B
	%275 = add i32 %273, %274
	%276 = load i32, ptr @C
	%277 = load i32, ptr @A
	%278 = sub i32 %276, %277
	%279 = load i32, ptr @B
	%280 = add i32 %278, %279
	%281 = add i32 %275, %280
	%282 = sub i32 %272, %281
	%283 = load i32, ptr @A
	%284 = load i32, ptr @B
	%285 = add i32 %283, %284
	%286 = load i32, ptr @C
	%287 = load i32, ptr @A
	%288 = sub i32 %286, %287
	%289 = load i32, ptr @B
	%290 = add i32 %288, %289
	%291 = add i32 %285, %290
	%292 = load i32, ptr @A
	%293 = load i32, ptr @B
	%294 = add i32 %292, %293
	%295 = sub i32 %291, %294
	%296 = sub i32 %282, %295
	%297 = load i32, ptr @C
	%298 = load i32, ptr @A
	%299 = sub i32 %297, %298
	%300 = load i32, ptr @B
	%301 = add i32 %299, %300
	%302 = load i32, ptr @A
	%303 = load i32, ptr @B
	%304 = add i32 %302, %303
	%305 = sub i32 %301, %304
	%306 = load i32, ptr @C
	%307 = load i32, ptr @A
	%308 = sub i32 %306, %307
	%309 = load i32, ptr @B
	%310 = add i32 %308, %309
	%311 = add i32 %305, %310
	%312 = load i32, ptr @A
	%313 = load i32, ptr @B
	%314 = add i32 %312, %313
	%315 = load i32, ptr @C
	%316 = load i32, ptr @A
	%317 = sub i32 %315, %316
	%318 = load i32, ptr @B
	%319 = add i32 %317, %318
	%320 = add i32 %314, %319
	%321 = load i32, ptr @A
	%322 = load i32, ptr @B
	%323 = add i32 %321, %322
	%324 = sub i32 %320, %323
	%325 = sub i32 %311, %324
	%326 = add i32 %296, %325
	%327 = load i32, ptr @C
	%328 = load i32, ptr @A
	%329 = sub i32 %327, %328
	%330 = load i32, ptr @B
	%331 = add i32 %329, %330
	%332 = load i32, ptr @A
	%333 = load i32, ptr @B
	%334 = add i32 %332, %333
	%335 = sub i32 %331, %334
	%336 = load i32, ptr @C
	%337 = load i32, ptr @A
	%338 = sub i32 %336, %337
	%339 = load i32, ptr @B
	%340 = add i32 %338, %339
	%341 = add i32 %335, %340
	%342 = load i32, ptr @A
	%343 = load i32, ptr @B
	%344 = add i32 %342, %343
	%345 = load i32, ptr @C
	%346 = load i32, ptr @A
	%347 = sub i32 %345, %346
	%348 = load i32, ptr @B
	%349 = add i32 %347, %348
	%350 = add i32 %344, %349
	%351 = load i32, ptr @A
	%352 = load i32, ptr @B
	%353 = add i32 %351, %352
	%354 = sub i32 %350, %353
	%355 = sub i32 %341, %354
	%356 = load i32, ptr @C
	%357 = load i32, ptr @A
	%358 = sub i32 %356, %357
	%359 = load i32, ptr @B
	%360 = add i32 %358, %359
	%361 = load i32, ptr @A
	%362 = load i32, ptr @B
	%363 = add i32 %361, %362
	%364 = sub i32 %360, %363
	%365 = load i32, ptr @C
	%366 = load i32, ptr @A
	%367 = sub i32 %365, %366
	%368 = load i32, ptr @B
	%369 = add i32 %367, %368
	%370 = add i32 %364, %369
	%371 = load i32, ptr @A
	%372 = load i32, ptr @B
	%373 = add i32 %371, %372
	%374 = load i32, ptr @C
	%375 = load i32, ptr @A
	%376 = sub i32 %374, %375
	%377 = load i32, ptr @B
	%378 = add i32 %376, %377
	%379 = add i32 %373, %378
	%380 = load i32, ptr @A
	%381 = load i32, ptr @B
	%382 = add i32 %380, %381
	%383 = sub i32 %379, %382
	%384 = sub i32 %370, %383
	%385 = add i32 %355, %384
	%386 = add i32 %326, %385
	%387 = load i32, ptr @C
	%388 = load i32, ptr @A
	%389 = sub i32 %387, %388
	%390 = load i32, ptr @B
	%391 = add i32 %389, %390
	%392 = load i32, ptr @A
	%393 = load i32, ptr @B
	%394 = add i32 %392, %393
	%395 = sub i32 %391, %394
	%396 = load i32, ptr @C
	%397 = load i32, ptr @A
	%398 = sub i32 %396, %397
	%399 = load i32, ptr @B
	%400 = add i32 %398, %399
	%401 = load i32, ptr @A
	%402 = load i32, ptr @B
	%403 = add i32 %401, %402
	%404 = sub i32 %400, %403
	%405 = add i32 %395, %404
	%406 = load i32, ptr @C
	%407 = load i32, ptr @A
	%408 = sub i32 %406, %407
	%409 = load i32, ptr @B
	%410 = add i32 %408, %409
	%411 = load i32, ptr @A
	%412 = load i32, ptr @B
	%413 = add i32 %411, %412
	%414 = sub i32 %410, %413
	%415 = load i32, ptr @C
	%416 = load i32, ptr @A
	%417 = sub i32 %415, %416
	%418 = load i32, ptr @B
	%419 = add i32 %417, %418
	%420 = add i32 %414, %419
	%421 = add i32 %405, %420
	%422 = load i32, ptr @A
	%423 = load i32, ptr @B
	%424 = add i32 %422, %423
	%425 = load i32, ptr @C
	%426 = load i32, ptr @A
	%427 = sub i32 %425, %426
	%428 = load i32, ptr @B
	%429 = add i32 %427, %428
	%430 = add i32 %424, %429
	%431 = load i32, ptr @A
	%432 = load i32, ptr @B
	%433 = add i32 %431, %432
	%434 = sub i32 %430, %433
	%435 = load i32, ptr @C
	%436 = load i32, ptr @A
	%437 = sub i32 %435, %436
	%438 = load i32, ptr @B
	%439 = add i32 %437, %438
	%440 = load i32, ptr @A
	%441 = load i32, ptr @B
	%442 = add i32 %440, %441
	%443 = sub i32 %439, %442
	%444 = load i32, ptr @C
	%445 = load i32, ptr @A
	%446 = sub i32 %444, %445
	%447 = load i32, ptr @B
	%448 = add i32 %446, %447
	%449 = add i32 %443, %448
	%450 = add i32 %434, %449
	%451 = sub i32 %421, %450
	%452 = load i32, ptr @A
	%453 = load i32, ptr @B
	%454 = add i32 %452, %453
	%455 = load i32, ptr @C
	%456 = load i32, ptr @A
	%457 = sub i32 %455, %456
	%458 = load i32, ptr @B
	%459 = add i32 %457, %458
	%460 = add i32 %454, %459
	%461 = load i32, ptr @A
	%462 = load i32, ptr @B
	%463 = add i32 %461, %462
	%464 = sub i32 %460, %463
	%465 = load i32, ptr @C
	%466 = load i32, ptr @A
	%467 = sub i32 %465, %466
	%468 = load i32, ptr @B
	%469 = add i32 %467, %468
	%470 = load i32, ptr @A
	%471 = load i32, ptr @B
	%472 = add i32 %470, %471
	%473 = sub i32 %469, %472
	%474 = load i32, ptr @C
	%475 = load i32, ptr @A
	%476 = sub i32 %474, %475
	%477 = load i32, ptr @B
	%478 = add i32 %476, %477
	%479 = add i32 %473, %478
	%480 = add i32 %464, %479
	%481 = load i32, ptr @A
	%482 = load i32, ptr @B
	%483 = add i32 %481, %482
	%484 = load i32, ptr @C
	%485 = load i32, ptr @A
	%486 = sub i32 %484, %485
	%487 = load i32, ptr @B
	%488 = add i32 %486, %487
	%489 = add i32 %483, %488
	%490 = load i32, ptr @A
	%491 = load i32, ptr @B
	%492 = add i32 %490, %491
	%493 = sub i32 %489, %492
	%494 = load i32, ptr @C
	%495 = load i32, ptr @A
	%496 = sub i32 %494, %495
	%497 = load i32, ptr @B
	%498 = add i32 %496, %497
	%499 = load i32, ptr @A
	%500 = load i32, ptr @B
	%501 = add i32 %499, %500
	%502 = sub i32 %498, %501
	%503 = load i32, ptr @C
	%504 = load i32, ptr @A
	%505 = sub i32 %503, %504
	%506 = load i32, ptr @B
	%507 = add i32 %505, %506
	%508 = add i32 %502, %507
	%509 = add i32 %493, %508
	%510 = sub i32 %480, %509
	%511 = sub i32 %451, %510
	%512 = add i32 %386, %511
	store i32 %512, ptr %rhs.1
	%513 = load i32, ptr %lhs.1
	%514 = load i32, ptr %rhs.1
	%515 = sub i32 %513, %514

	store i32 %515, ptr @A

	%516 = load i32, ptr %lhs.1
	%517 = call ptr @toString(i32 %516)
	%518 = load i32, ptr %rhs.1
	%519 = call ptr @toString(i32 %518)
	%520 = load i32, ptr %lhs.1
	%521 = load i32, ptr %rhs.1
	%522 = sub i32 %520, %521
	%523 = call ptr @toString(i32 %522)
	%524 = load i32, ptr @A
	%525 = call ptr @toString(i32 %524)
	%526 = call ptr @builtin.string_add(ptr @FString.0.Literal.0, ptr %517)
	%527 = call ptr @builtin.string_add(ptr %526, ptr @FString.0.Literal.1)
	%528 = call ptr @builtin.string_add(ptr %527, ptr %519)
	%529 = call ptr @builtin.string_add(ptr %528, ptr @FString.0.Literal.2)
	%530 = call ptr @builtin.string_add(ptr %529, ptr %523)
	%531 = call ptr @builtin.string_add(ptr %530, ptr @FString.0.Literal.3)
	%532 = call ptr @builtin.string_add(ptr %531, ptr %525)
	%533 = call ptr @builtin.string_add(ptr %532, ptr @FString.0.Literal.4)
	call void @println(ptr %533)
	%534 = load i32, ptr %fuckingTerminator.1
	%535 = add i32 %534, 1
	store i32 %535, ptr %fuckingTerminator.1
	%536 = load i32, ptr %fuckingTerminator.1
	%537 = icmp sgt i32 %536, 10
	br i1 %537, label %if.then.0, label %if.else.0
if.then.0:
	br label %while.end.0
if.else.0:
	br label %if.endif.0
if.endif.0:
	br label %while.cond.0
while.end.0:
	%538 = load i32, ptr @A
	%539 = call ptr @toString(i32 %538)
	%540 = load i32, ptr @B
	%541 = call ptr @toString(i32 %540)
	%542 = load i32, ptr @C
	%543 = call ptr @toString(i32 %542)
	%544 = call ptr @builtin.string_add(ptr @FString.1.Literal.0, ptr %539)
	%545 = call ptr @builtin.string_add(ptr %544, ptr @FString.1.Literal.1)
	%546 = call ptr @builtin.string_add(ptr %545, ptr %541)
	%547 = call ptr @builtin.string_add(ptr %546, ptr @FString.1.Literal.2)
	%548 = call ptr @builtin.string_add(ptr %547, ptr %543)
	%549 = call ptr @builtin.string_add(ptr %548, ptr @FString.1.Literal.3)
	call void @println(ptr %549)
	ret i32 0
}

define void @global.init () {
global.init:
	store i32 1, ptr @A
	store i32 1, ptr @B
	store i32 1, ptr @C
	ret void
}

