	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	hideSprites
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #1
	mov	r3, #0
	ldr	r0, .L5
	b	.L2
.L3:
	add	r3, r3, #1
	add	r2, r2, #1
.L2:
	cmp	r3, #31
	mov	r1, r3, asl #3
	beq	.L3
	mov	ip, #512	@ movhi
	cmp	r2, #128
	strh	ip, [r0, r1]	@ movhi
	ble	.L3
	bx	lr
.L6:
	.align	2
.L5:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r4, .L25
	ldr	r5, .L25+4
	mov	r3, #1
	str	r3, [r5, #16]
	str	r3, [r5, #20]
	str	r3, [r4, #16]
	str	r3, [r4, #20]
	str	r3, [r4, #56]
	ldr	r3, .L25+8
	mov	r0, #0
	str	r0, [r3, #0]
	ldr	r6, .L25+12
	ldr	r3, .L25+16
	ldr	fp, .L25+20
	mov	r1, #80
	mov	r2, #32
	str	r1, [r4, #0]
	str	r0, [r3, #0]
	mov	r1, #150
	str	r0, [r5, #0]
	str	r0, [r5, #4]
	str	r0, [r6, #0]
	str	r0, [fp, #0]
	ldr	r3, .L25+24
	str	r2, [r5, #24]
	str	r2, [r5, #28]
	str	r1, [r4, #4]
	str	r2, [r4, #24]
	str	r2, [r4, #28]
	mov	r1, #35
	mov	r2, #40
	mov	ip, #15
	mov	lr, r0
.L8:
	ldr	r0, [r3, #-12]
	str	r2, [r3, #-12]
	add	r2, r2, #25
	cmp	r2, #190
	str	r1, [r3, #-16]
	str	r1, [r3, #-8]
	stmda	r3, {r0, ip}	@ phole stm
	str	lr, [r3, #8]
	add	r3, r3, #28
	bne	.L8
	ldr	r7, .L25+28
	mov	r2, #40
	mov	r3, r7
	mov	r1, #55
.L9:
	ldr	r0, [r3, #172]
	str	r2, [r3, #172]
	add	r2, r2, #25
	cmp	r2, #190
	str	r1, [r3, #168]
	str	r1, [r3, #176]
	str	r0, [r3, #180]
	str	ip, [r3, #184]
	str	lr, [r3, #192]
	add	r3, r3, #28
	bne	.L9
	ldr	r3, .L25+28
	mov	r2, #40
	mov	r1, #155
.L10:
	ldr	r0, [r3, #340]
	str	r2, [r3, #340]
	add	r2, r2, #25
	cmp	r2, #190
	str	r1, [r3, #336]
	str	r1, [r3, #344]
	str	r0, [r3, #348]
	str	ip, [r3, #352]
	str	lr, [r3, #360]
	add	r3, r3, #28
	bne	.L10
	ldr	r3, .L25+28
	mov	r2, #40
	mov	r1, #175
.L11:
	ldr	r0, [r3, #508]
	str	r2, [r3, #508]
	add	r2, r2, #25
	cmp	r2, #190
	str	r1, [r3, #504]
	str	r1, [r3, #512]
	str	r0, [r3, #516]
	str	ip, [r3, #520]
	str	lr, [r3, #528]
	add	r3, r3, #28
	bne	.L11
	ldr	r9, .L25+32
	ldr	sl, .L25+36
	ldr	r8, .L25+40
.L18:
	mov	lr, pc
	bx	sl
	smull	r3, r2, r8, r0
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #1
	add	r3, r3, r3, asl #2
	subs	r3, r0, r3
	beq	.L24
	cmp	r3, #1
	bne	.L14
.L24:
	str	r3, [r7, #20]
.L16:
	add	r7, r7, #28
	cmp	r7, r9
	bne	.L18
	mov	r2, #100663296
	ldr	r7, .L25+44
	mov	r0, #3
	ldr	r1, .L25+48
	add	r2, r2, #65536
	mov	r3, #16384
	mov	lr, pc
	bx	r7
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L25+52
	add	r2, r2, #512
	mov	r3, #256
	mov	lr, pc
	bx	r7
	ldr	r2, .L25+56
	mov	r3, #67108864
	ldr	r7, [r3, #304]
	mov	r1, #16
	mov	r3, #0
	str	r3, [r2, #20]
	str	r1, [r2, #8]
	str	r3, [r2, #44]
	str	r1, [r2, #32]
	str	r3, [r2, #68]
	str	r1, [r2, #56]
	str	r3, [r2, #92]
	str	r1, [r2, #80]
	str	r3, [r2, #116]
	str	r1, [r2, #104]
	ldr	r2, .L25+60
	ldr	r0, .L25+64
	mov	r1, #1
	str	r1, [r2, #0]
	mvn	ip, #32512
	ldr	r2, .L25+68
	sub	ip, ip, #55
	strh	r3, [r0, #248]	@ movhi
	str	r3, [r5, #32]
	str	r3, [r5, #44]
	str	r3, [r4, #32]
	str	r3, [r4, #44]
	str	r3, [r5, #36]
	str	r3, [r4, #36]
	str	r3, [r4, #52]
	str	r3, [r4, #48]
	str	r3, [r6, #4]
	str	r3, [r6, #8]
	mov	r3, #516	@ movhi
	strh	ip, [r0, #250]	@ movhi
	str	r7, [r2, #0]
	strh	r3, [r0, #252]	@ movhi
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L14:
	cmp	r3, #2
	beq	.L24
	cmp	r3, #3
	beq	.L24
	cmp	r3, #4
	ldreq	r2, [fp, #0]
	addeq	r2, r2, #1
	streq	r3, [r7, #20]
	streq	r2, [fp, #0]
	b	.L16
.L26:
	.align	2
.L25:
	.word	cow
	.word	farmer
	.word	NUMCOLLECTED
	.word	.LANCHOR0
	.word	vblankCounter
	.word	NUMWEEDS
	.word	plants+16
	.word	plants
	.word	plants+672
	.word	rand
	.word	1717986919
	.word	DMANow
	.word	farmerTiles
	.word	farmerPal
	.word	bullets
	.word	cowMovestate
	.word	shadowOAM
	.word	buttons
	.size	initialize, .-initialize
	.align	2
	.global	animate
	.type	animate, %function
animate:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L38
	ldr	r2, [r3, #36]
	cmp	r2, #4
	strne	r2, [r3, #40]
	ldr	r1, .L38+4
	ldr	r2, [r3, #32]
	smull	r0, r1, r2, r1
	mov	r0, r2, asr #31
	rsb	r1, r0, r1, asr #3
	add	r1, r1, r1, asl #2
	mov	ip, #4
	subs	r2, r2, r1, asl #2
	ldr	r0, .L38
	str	ip, [r3, #36]
	bne	.L29
	ldr	r1, [r0, #44]
	cmp	r1, #2
	addne	r1, r1, #1
	str	r2, [r0, #32]
	streq	r2, [r0, #44]
	strne	r1, [r0, #44]
.L29:
	mov	r2, #67108864
	ldr	r2, [r2, #304]
	tst	r2, #64
	moveq	r2, #1
	streq	r2, [r3, #36]
	mov	r2, #67108864
	ldr	r2, [r2, #304]
	tst	r2, #128
	moveq	r2, #0
	streq	r2, [r3, #36]
	mov	r2, #67108864
	ldr	r2, [r2, #304]
	tst	r2, #32
	moveq	r2, #3
	streq	r2, [r3, #36]
	mov	r2, #67108864
	ldr	r2, [r2, #304]
	mvn	r2, r2
	ands	r2, r2, #16
	movne	r2, #2
	strne	r2, [r3, #36]
	bne	.L35
	ldr	r1, [r3, #36]
	cmp	r1, #4
	beq	.L37
.L35:
	ldr	r2, [r3, #32]
	add	r2, r2, #1
	str	r2, [r3, #32]
	bx	lr
.L37:
	ldr	r3, .L38
	str	r2, [r3, #44]
	bx	lr
.L39:
	.align	2
.L38:
	.word	farmer
	.word	1717986919
	.size	animate, .-animate
	.global	__aeabi_idivmod
	.align	2
	.global	updateOAM
	.type	updateOAM, %function
updateOAM:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L72
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r3, [r3, #12]
	cmp	r3, #4
	cmpne	r3, #2
	movne	r1, #0
	moveq	r1, #1
	beq	.L64
	cmp	r3, #3
	beq	.L65
	cmp	r3, #0
	beq	.L66
	cmp	r3, #5
	beq	.L65
	ldr	r3, .L72+4
	ldr	r5, .L72+8
	ldr	r7, [r3, #4]
	ldr	r0, [r5, #4]
	ldr	r1, [r5, #40]
	ldr	ip, [r3, #40]
	ldr	r6, [r3, #44]
	ldr	r4, [r5, #44]
	mov	r7, r7, asl #23
	mov	r0, r0, asl #23
	add	r1, r1, #4
	ldr	r2, .L72+12
	ldrb	r8, [r3, #0]	@ zero_extendqisi2
	add	r6, ip, r6, asl #5
	add	r1, r1, r4, asl #5
	ldrb	ip, [r5, #0]	@ zero_extendqisi2
	mvn	r7, r7, lsr #6
	mvn	r0, r0, lsr #6
	mvn	r0, r0, lsr #17
	mov	r1, r1, asl #2
	mvn	r7, r7, lsr #17
	mov	r6, r6, asl #2
	ldr	r3, .L72+16
	mov	r4, r2
	strh	r8, [r2, #0]	@ movhi
	strh	r0, [r2, #10]	@ movhi
	strh	r1, [r2, #12]	@ movhi
	strh	r7, [r2, #2]	@ movhi
	strh	r6, [r2, #4]	@ movhi
	strh	ip, [r2, #8]	@ movhi
	mov	r1, #4864	@ movhi
	mov	r2, #67108864
	strh	r1, [r2, #0]	@ movhi
	add	r0, r3, #672
	mov	r2, r4
	b	.L52
.L46:
	add	r3, r3, #28
	cmp	r3, r0
	add	r2, r2, #8
	beq	.L69
.L52:
	ldr	r1, [r3, #0]
	cmp	r1, #0
	bne	.L46
	ldr	ip, [r3, #-20]
	ldr	r1, [r3, #-4]
	mov	ip, ip, asl #23
	cmp	r1, #0
	ldrb	r6, [r3, #-24]	@ zero_extendqisi2
	mvn	ip, ip, lsr #6
	mvn	ip, ip, lsr #17
	moveq	r1, #384	@ movhi
	strh	r6, [r2, #48]	@ movhi
	strh	ip, [r2, #50]	@ movhi
	streqh	r1, [r2, #52]	@ movhi
	beq	.L46
	cmp	r1, #1
	moveq	r1, #512	@ movhi
	streqh	r1, [r2, #52]	@ movhi
	beq	.L46
	cmp	r1, #2
	moveq	r1, #640	@ movhi
	streqh	r1, [r2, #52]	@ movhi
	beq	.L46
	cmp	r1, #3
	moveq	r1, #768	@ movhi
	streqh	r1, [r2, #52]	@ movhi
	beq	.L46
	cmp	r1, #4
	moveq	r1, #388	@ movhi
	streqh	r1, [r2, #52]	@ movhi
	b	.L46
.L64:
	mov	r2, #1
	mov	r3, #0
	ldr	r4, .L72+12
	b	.L68
.L44:
	add	r3, r3, #1
	add	r2, r2, #1
.L68:
	cmp	r3, #31
	mov	r1, r3, asl #3
	beq	.L44
	mov	r0, #512	@ movhi
	cmp	r2, #128
	strh	r0, [r4, r1]	@ movhi
	ble	.L44
	mov	r3, #67108864
	strh	r0, [r3, #0]	@ movhi
.L40:
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L66:
	mov	r2, #1
	ldr	r4, .L72+12
	b	.L68
.L65:
	mov	r2, #1
	mov	r3, r1
	ldr	r4, .L72+12
	b	.L68
.L69:
	ldr	r3, .L72+20
	ldr	r6, [r3, #0]
	sub	r3, r6, #300
	cmp	r3, #29
	bhi	.L53
	mov	r0, r6
	mov	r1, #300
	ldr	r3, .L72+24
	mov	lr, pc
	bx	r3
	cmp	r1, #0
	bne	.L63
	ldr	r2, [r5, #56]
	mvn	r3, #32512
	sub	r3, r3, #55
	cmp	r2, #0
	mov	r2, #644	@ movhi
	strh	r2, [r4, #252]	@ movhi
	strh	r1, [r4, #248]	@ movhi
	strh	r3, [r4, #250]	@ movhi
	ldr	r2, .L72+8
	beq	.L63
	ldr	r3, .L72+28
	ldmia	r2, {r1, r2}	@ phole ldm
	str	r2, [r3, #4]
	str	r2, [r3, #12]
	mov	r2, #1
	str	r1, [r3, #0]
	str	r1, [r3, #8]
	str	r2, [r3, #16]
.L63:
	ldr	r3, [r5, #56]
	cmp	r3, #0
	beq	.L55
	ldr	r3, .L72+28
	ldr	r2, [r3, #16]
	cmp	r2, #1
	bne	.L55
	ldr	r2, [r3, #4]
	mov	r2, r2, asl #23
	mov	r2, r2, lsr #23
	ldrb	r0, [r3, #0]	@ zero_extendqisi2
	mvn	r2, r2, asl #17
	mov	r3, #256
	add	r3, r3, #2
	mvn	r2, r2, lsr #17
	mov	r1, #256
	strh	r2, [r4, r3]	@ movhi
	strh	r0, [r4, r1]	@ movhi
	add	r3, r3, #2
	mov	r0, #396	@ movhi
	strh	r0, [r4, r3]	@ movhi
.L55:
	sub	r3, r6, #600
	cmp	r3, #29
	bhi	.L56
	ldr	r2, [r5, #56]
	mvn	r3, #32512
	sub	r3, r3, #55
	cmp	r2, #0
	mov	r1, #0	@ movhi
	mov	r2, #392	@ movhi
	strh	r2, [r4, #252]	@ movhi
	strh	r1, [r4, #248]	@ movhi
	strh	r3, [r4, #250]	@ movhi
	ldr	r2, .L72+8
	bne	.L70
.L58:
	sub	r3, r6, #1040
	sub	r3, r3, #10
	cmp	r3, #29
	bhi	.L59
	ldr	r2, [r5, #56]
	mvn	r3, #32512
	sub	r3, r3, #55
	cmp	r2, #0
	mov	r1, #0	@ movhi
	mov	r2, #520	@ movhi
	strh	r2, [r4, #252]	@ movhi
	strh	r1, [r4, #248]	@ movhi
	strh	r3, [r4, #250]	@ movhi
	ldr	r2, .L72+8
	bne	.L71
.L61:
	sub	r3, r6, #1344
	sub	r3, r3, #6
	cmp	r3, #29
	bhi	.L62
	ldr	r2, [r5, #56]
	mvn	r3, #32512
	sub	r3, r3, #55
	cmp	r2, #0
	mov	r1, #0	@ movhi
	mov	r2, #648	@ movhi
	strh	r2, [r4, #252]	@ movhi
	strh	r1, [r4, #248]	@ movhi
	strh	r3, [r4, #250]	@ movhi
	ldr	r2, .L72+8
	beq	.L40
	ldr	r3, .L72+28
	ldmia	r2, {r1, r2}	@ phole ldm
	str	r2, [r3, #64]
	str	r2, [r3, #72]
	mov	r2, #1
	str	r1, [r3, #60]
	str	r1, [r3, #68]
	str	r2, [r3, #76]
	b	.L40
.L59:
	mov	r3, #1072
	add	r3, r3, #7
	cmp	r6, r3
	ble	.L61
	ldr	r3, [r5, #56]
	cmp	r3, #0
	beq	.L61
	ldr	r3, .L72+28
	ldr	r2, [r3, #56]
	cmp	r2, #1
	bne	.L61
	ldr	r2, [r3, #44]
	mov	r2, r2, asl #23
	mov	r2, r2, lsr #23
	ldrb	r0, [r3, #40]	@ zero_extendqisi2
	mvn	r2, r2, asl #17
	mov	r3, #272
	add	r3, r3, #2
	mvn	r2, r2, lsr #17
	mov	r1, #272
	strh	r2, [r4, r3]	@ movhi
	strh	r0, [r4, r1]	@ movhi
	add	r3, r3, #2
	mov	r0, #396	@ movhi
	strh	r0, [r4, r3]	@ movhi
	b	.L61
.L62:
	mov	r3, #1376
	add	r3, r3, #3
	cmp	r6, r3
	ble	.L40
	ldr	r3, [r5, #56]
	cmp	r3, #0
	beq	.L40
	ldr	r3, .L72+28
	ldr	r2, [r3, #76]
	cmp	r2, #1
	bne	.L40
	ldr	r2, [r3, #64]
	mov	r2, r2, asl #23
	mov	r2, r2, lsr #23
	ldrb	r0, [r3, #60]	@ zero_extendqisi2
	mvn	r2, r2, asl #17
	mov	r3, #280
	add	r3, r3, #2
	mvn	r2, r2, lsr #17
	mov	r1, #280
	strh	r2, [r4, r3]	@ movhi
	strh	r0, [r4, r1]	@ movhi
	add	r3, r3, #2
	mov	r0, #396	@ movhi
	strh	r0, [r4, r3]	@ movhi
	b	.L40
.L56:
	mov	r3, #628
	add	r3, r3, #1
	cmp	r6, r3
	ble	.L58
	ldr	r3, [r5, #56]
	cmp	r3, #0
	beq	.L58
	ldr	r3, .L72+28
	ldr	r2, [r3, #36]
	cmp	r2, #1
	bne	.L58
	ldr	r2, [r3, #24]
	mov	r2, r2, asl #23
	mov	r2, r2, lsr #23
	ldrb	r0, [r3, #20]	@ zero_extendqisi2
	mvn	r2, r2, asl #17
	mov	r3, #264
	add	r3, r3, #2
	mvn	r2, r2, lsr #17
	mov	r1, #264
	strh	r2, [r4, r3]	@ movhi
	strh	r0, [r4, r1]	@ movhi
	add	r3, r3, #2
	mov	r0, #396	@ movhi
	strh	r0, [r4, r3]	@ movhi
	b	.L58
.L53:
	cmp	r6, #300
	blt	.L55
	b	.L63
.L71:
	ldr	r3, .L72+28
	ldmia	r2, {r1, r2}	@ phole ldm
	str	r2, [r3, #44]
	str	r2, [r3, #52]
	mov	r2, #1
	str	r1, [r3, #40]
	str	r1, [r3, #48]
	str	r2, [r3, #56]
	b	.L61
.L70:
	ldr	r3, .L72+28
	ldmia	r2, {r1, r2}	@ phole ldm
	str	r2, [r3, #24]
	str	r2, [r3, #32]
	mov	r2, #1
	str	r1, [r3, #20]
	str	r1, [r3, #28]
	str	r2, [r3, #36]
	b	.L58
.L73:
	.align	2
.L72:
	.word	.LANCHOR0
	.word	farmer
	.word	cow
	.word	shadowOAM
	.word	plants+24
	.word	vblankCounter
	.word	__aeabi_idivmod
	.word	poops
	.size	updateOAM, .-updateOAM
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L77
	stmfd	sp!, {r4, lr}
	mov	r3, #67108864
	ldr	r1, [r2, #0]
	ldr	r3, [r3, #304]
	ldr	r0, .L77+4
	tst	r1, #8
	str	r1, [r0, #0]
	str	r3, [r2, #0]
	beq	.L74
	ands	r3, r3, #8
	beq	.L76
.L74:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L76:
	ldr	r2, .L77+8
	ldr	r0, .L77+12
	str	r3, [r2, #12]
	ldr	r3, .L77+16
	mov	lr, pc
	bx	r3
	ldr	r4, .L77+20
	mov	r0, #3
	ldr	r1, .L77+24
	mov	r2, #100663296
	mov	r3, #15552
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L77+28
	add	r2, r2, #57344
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, lr}
	b	updateOAM
.L78:
	.align	2
.L77:
	.word	buttons
	.word	oldButtons
	.word	.LANCHOR0
	.word	splashPal
	.word	loadPalette
	.word	DMANow
	.word	splashTiles
	.word	splashMap
	.size	lose, .-lose
	.align	2
	.global	instructions
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L82
	stmfd	sp!, {r4, lr}
	mov	r3, #67108864
	ldr	r1, [r2, #0]
	ldr	r3, [r3, #304]
	ldr	r0, .L82+4
	tst	r1, #8
	str	r1, [r0, #0]
	str	r3, [r2, #0]
	beq	.L79
	ands	r3, r3, #8
	beq	.L81
.L79:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L81:
	ldr	r2, .L82+8
	str	r3, [r2, #12]
	bl	updateOAM
	ldr	r0, .L82+12
	ldr	r3, .L82+16
	mov	lr, pc
	bx	r3
	ldr	r4, .L82+20
	mov	r0, #3
	ldr	r1, .L82+24
	mov	r2, #100663296
	mov	r3, #15552
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L82+28
	add	r2, r2, #57344
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	b	.L79
.L83:
	.align	2
.L82:
	.word	buttons
	.word	oldButtons
	.word	.LANCHOR0
	.word	splashPal
	.word	loadPalette
	.word	DMANow
	.word	splashTiles
	.word	splashMap
	.size	instructions, .-instructions
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L89
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r3, [r1, #0]
	mov	r5, #67108864
	ldr	r2, [r5, #304]
	ldr	r0, .L89+4
	tst	r3, #8
	str	r3, [r0, #0]
	str	r2, [r1, #0]
	beq	.L85
	tst	r2, #8
	beq	.L87
.L85:
	tst	r3, #4
	beq	.L84
	ands	r2, r2, #4
	beq	.L88
.L84:
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L88:
	ldr	r3, .L89+8
	ldr	r3, [r3, #0]
	add	r1, r3, #12
	add	r3, r3, #24
	str	r2, [r1, #8]
	str	r2, [r3, #8]
	ldr	r3, .L89+12
	str	r2, [r3, #12]
	bl	updateOAM
	ldr	r0, .L89+16
	ldr	r3, .L89+20
	mov	lr, pc
	bx	r3
	ldr	r4, .L89+24
	mov	r0, #3
	ldr	r1, .L89+28
	mov	r2, #100663296
	mov	r3, #15552
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L89+32
	add	r2, r2, #57344
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	b	.L84
.L87:
	ldr	r3, .L89+12
	mov	r2, #1
	str	r2, [r3, #12]
	bl	updateOAM
	mov	r3, #128	@ movhi
	strh	r3, [r5, #132]	@ movhi
	ldr	r0, .L89+36
	ldr	r3, .L89+20
	ldr	r4, .L89+24
	mov	lr, pc
	bx	r3
	mov	r0, #3
	ldr	r1, .L89+40
	mov	r2, #100663296
	mov	r3, #96
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L89+44
	add	r2, r2, #57344
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L89+48
	add	r2, r2, #16384
	mov	r3, #6656
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L89+52
	add	r2, r2, #49152
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L89+56
	add	r2, r2, #512
	mov	r3, #256
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L89+60
	add	r2, r2, #65536
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	b	.L84
.L90:
	.align	2
.L89:
	.word	buttons
	.word	oldButtons
	.word	dma
	.word	.LANCHOR0
	.word	splashPal
	.word	loadPalette
	.word	DMANow
	.word	splashTiles
	.word	splashMap
	.word	BG512x512Pal
	.word	BG512x512Tiles
	.word	BG512x512Map
	.word	bg2Tiles
	.word	bg2Map
	.word	farmerPal
	.word	farmerTiles
	.size	pause, .-pause
	.align	2
	.global	win
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L94
	stmfd	sp!, {r4, lr}
	ldr	r1, .L94+4
	ldr	ip, [r3, #0]
	ldr	r0, [r1, #0]
	add	r4, ip, #12
	mov	r2, #0
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	str	r2, [r4, #8]
	ldr	r4, .L94+8
	add	ip, ip, #24
	tst	r0, #8
	str	r0, [r4, #0]
	str	r3, [r1, #0]
	str	r2, [ip, #8]
	beq	.L91
	ands	r3, r3, #8
	beq	.L93
.L91:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L93:
	ldr	r2, .L94+12
	ldr	r0, .L94+16
	str	r3, [r2, #12]
	ldr	r3, .L94+20
	mov	lr, pc
	bx	r3
	ldr	r4, .L94+24
	mov	r0, #3
	ldr	r1, .L94+28
	mov	r2, #100663296
	mov	r3, #15552
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #57344
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L94+32
	mov	lr, pc
	bx	r4
	bl	updateOAM
	ldr	r3, .L94+36
	mov	r2, #1
	str	r2, [r3, #56]
	b	.L91
.L95:
	.align	2
.L94:
	.word	dma
	.word	buttons
	.word	oldButtons
	.word	.LANCHOR0
	.word	splashPal
	.word	loadPalette
	.word	DMANow
	.word	splashTiles
	.word	splashMap
	.word	cow
	.size	win, .-win
	.align	2
	.global	setupSounds
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mvn	r2, #1264
	mov	r3, #67108864
	sub	r2, r2, #1
	mov	r1, #128	@ movhi
	strh	r1, [r3, #132]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	mov	r2, #0	@ movhi
	strh	r2, [r3, #128]	@ movhi
	bx	lr
	.size	setupSounds, .-setupSounds
	.global	__aeabi_idiv
	.align	2
	.global	playSoundA
	.type	playSoundA, %function
playSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L98
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	ip, [r3, #0]
	mov	r6, #0
	add	ip, ip, #12
	str	r6, [ip, #8]
	ldr	ip, .L98+4
	mov	sl, r0
	mov	r7, #67108864
	mov	r5, r2
	mov	r4, r1
	add	r2, r7, #160
	mov	r3, #910163968
	add	r7, r7, #256
	str	r6, [ip, #0]
	mov	r0, #1
	ldr	ip, .L98+8
	mov	r1, sl
	mov	lr, pc
	bx	ip
	ldr	r8, .L98+12
	mov	r1, r5
	strh	r6, [r7, #2]	@ movhi
	mov	r0, #16777216
	mov	lr, pc
	bx	r8
	rsb	r3, r0, #0
	mov	r3, r3, asl #16
	ldr	r6, .L98+16
	mov	r3, r3, lsr #16
	strh	r3, [r7, #0]	@ movhi
	mov	r9, #1
	mov	r3, #128	@ movhi
	rsb	r0, r4, r4, asl #4
	mov	r1, r5
	str	sl, [r6, #0]
	mov	r0, r0, asl #2
	strh	r3, [r7, #2]	@ movhi
	stmib	r6, {r4, r5, r9}	@ phole stm
	str	r9, [r6, #16]
	mov	lr, pc
	bx	r8
	mov	r1, r5
	sub	r5, r0, #1
	mov	r0, r4
	mov	lr, pc
	bx	r8
	sub	r0, r0, r0, asl #2
	add	r5, r5, r0
	str	r5, [r6, #20]
	str	r9, [r6, #24]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
.L99:
	.align	2
.L98:
	.word	dma
	.word	vbCountA
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundA
	.size	playSoundA, .-playSoundA
	.align	2
	.global	interruptHandler
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	mov	r3, #67108864
	add	r3, r3, #512
	ldrh	r2, [r3, #2]
	tst	r2, #1
	mov	r2, #0	@ movhi
	strh	r2, [r3, #8]	@ movhi
	beq	.L101
	ldr	r3, .L110
	ldr	r2, [r3, #12]
	cmp	r2, #0
	ldrne	r1, .L110+4
	ldreq	r2, .L110+4
	ldrne	r2, [r1, #0]
	ldr	r3, [r3, #20]
	ldreq	r2, [r2, #0]
	addne	r2, r2, #1
	strne	r2, [r1, #0]
	cmp	r3, r2
	ldr	r3, .L110
	ble	.L108
.L104:
	ldr	r2, .L110+8
	ldr	r3, [r2, #12]
	cmp	r3, #0
	ldrne	r3, .L110+12
	ldreq	r3, .L110+12
	ldrne	r1, [r3, #0]
	ldreq	r1, [r3, #0]
	ldr	r2, [r2, #20]
	addne	r1, r1, #1
	strne	r1, [r3, #0]
	cmp	r2, r1
	ble	.L109
.L107:
	mov	r3, #67108864
	add	r3, r3, #512
	mov	r2, #1	@ movhi
	strh	r2, [r3, #2]	@ movhi
.L101:
	mov	r3, #67108864
	add	r3, r3, #512
	mov	r2, #1	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldmfd	sp!, {r3, lr}
	bx	lr
.L109:
	ldr	r2, .L110+16
	ldr	r1, [r2, #0]
	mov	r2, #0
	add	r1, r1, #24
	str	r2, [r1, #8]
	str	r2, [r3, #0]
	b	.L107
.L108:
	ldmia	r3, {r0, r1, r2}	@ phole ldm
	bl	playSoundA
	b	.L104
.L111:
	.align	2
.L110:
	.word	soundA
	.word	vbCountA
	.word	soundB
	.word	vbCountB
	.word	dma
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	splash
	.type	splash, %function
splash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L117
	stmfd	sp!, {r4, lr}
	mov	r2, #67108864
	ldr	r3, [r1, #0]
	ldr	r2, [r2, #304]
	ldr	r0, .L117+4
	tst	r3, #8
	str	r3, [r0, #0]
	str	r2, [r1, #0]
	beq	.L113
	tst	r2, #8
	beq	.L115
.L113:
	tst	r3, #4
	beq	.L112
	tst	r2, #4
	beq	.L116
.L112:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L116:
	ldr	r3, .L117+8
	mov	r2, #5
	str	r2, [r3, #12]
	bl	updateOAM
	ldr	r0, .L117+12
	ldr	r3, .L117+16
	mov	lr, pc
	bx	r3
	mov	r3, #6976
	mov	r0, #3
	ldr	r1, .L117+20
	mov	r2, #100663296
	add	r3, r3, #32
	ldr	r4, .L117+24
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L117+28
	add	r2, r2, #57344
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	b	.L112
.L115:
	ldr	r3, .L117+8
	mov	r2, #1
	str	r2, [r3, #12]
	bl	updateOAM
	ldr	r0, .L117+32
	ldr	r3, .L117+16
	ldr	r4, .L117+24
	mov	lr, pc
	bx	r3
	mov	r0, #3
	ldr	r1, .L117+36
	mov	r2, #100663296
	mov	r3, #96
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L117+40
	add	r2, r2, #57344
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L117+44
	add	r2, r2, #16384
	mov	r3, #6656
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L117+48
	add	r2, r2, #49152
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L117+52
	add	r2, r2, #512
	mov	r3, #256
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L117+56
	add	r2, r2, #65536
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	mov	r1, #1130496
	mov	r2, #11008
	ldr	r0, .L117+60
	sub	r1, r1, #1248
	add	r2, r2, #17
	ldmfd	sp!, {r4, lr}
	b	playSoundA
.L118:
	.align	2
.L117:
	.word	buttons
	.word	oldButtons
	.word	.LANCHOR0
	.word	instructionsPal
	.word	loadPalette
	.word	instructionsTiles
	.word	DMANow
	.word	instructionsMap
	.word	BG512x512Pal
	.word	BG512x512Tiles
	.word	BG512x512Map
	.word	bg2Tiles
	.word	bg2Map
	.word	farmerPal
	.word	farmerTiles
	.word	HarvestMoon
	.size	splash, .-splash
	.align	2
	.global	playSoundB
	.type	playSoundB, %function
playSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L120
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	ip, [r3, #0]
	mov	r6, #0
	add	ip, ip, #24
	str	r6, [ip, #8]
	ldr	ip, .L120+4
	mov	sl, r0
	mov	r7, #67108864
	mov	r5, r2
	mov	r4, r1
	add	r2, r7, #164
	mov	r3, #910163968
	add	r7, r7, #256
	mov	r0, #2
	mov	r1, sl
	str	r6, [ip, #0]
	ldr	ip, .L120+8
	mov	lr, pc
	bx	ip
	ldr	r8, .L120+12
	mov	r1, r5
	mov	r0, #16777216
	strh	r6, [r7, #6]	@ movhi
	mov	lr, pc
	bx	r8
	rsb	r3, r0, #0
	mov	r3, r3, asl #16
	ldr	r9, .L120+16
	mov	r3, r3, lsr #16
	strh	r3, [r7, #4]	@ movhi
	rsb	r0, r4, r4, asl #4
	mov	r3, #128	@ movhi
	mov	r1, r5
	str	sl, [r9, #0]
	mov	r0, r0, asl #2
	strh	r3, [r7, #6]	@ movhi
	mov	r3, #1
	str	r3, [r9, #12]
	stmib	r9, {r4, r5}	@ phole stm
	str	r6, [r9, #16]
	mov	lr, pc
	bx	r8
	mov	r1, r5
	sub	r5, r0, #1
	mov	r0, r4
	mov	lr, pc
	bx	r8
	sub	r0, r0, r0, asl #2
	add	r5, r5, r0
	mov	r3, #2
	str	r5, [r9, #20]
	str	r3, [r9, #24]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
.L121:
	.align	2
.L120:
	.word	dma
	.word	vbCountB
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundB
	.size	playSoundB, .-playSoundB
	.align	2
	.global	muteSound
	.type	muteSound, %function
muteSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r2, #0	@ movhi
	strh	r2, [r3, #132]	@ movhi
	bx	lr
	.size	muteSound, .-muteSound
	.align	2
	.global	unmuteSound
	.type	unmuteSound, %function
unmuteSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r2, #128	@ movhi
	strh	r2, [r3, #132]	@ movhi
	bx	lr
	.size	unmuteSound, .-unmuteSound
	.align	2
	.global	pauseSound
	.type	pauseSound, %function
pauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	add	r3, r3, #256
	mov	r2, #0	@ movhi
	strh	r2, [r3, #2]	@ movhi
	bx	lr
	.size	pauseSound, .-pauseSound
	.align	2
	.global	unpauseSound
	.type	unpauseSound, %function
unpauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	add	r3, r3, #256
	mov	r2, #128	@ movhi
	strh	r2, [r3, #2]	@ movhi
	bx	lr
	.size	unpauseSound, .-unpauseSound
	.align	2
	.global	stopSound
	.type	stopSound, %function
stopSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L127
	ldr	r2, [r3, #0]
	mov	r3, #0
	add	r1, r2, #12
	add	r2, r2, #24
	str	r3, [r1, #8]
	str	r3, [r2, #8]
	bx	lr
.L128:
	.align	2
.L127:
	.word	dma
	.size	stopSound, .-stopSound
	.align	2
	.global	setupInterrupts
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	add	r3, r2, #512
	str	r4, [sp, #-4]!
	ldrh	r0, [r2, #4]
	ldrh	ip, [r3, #0]
	mov	r1, #50331648
	ldr	r4, .L130
	add	r1, r1, #28672
	orr	ip, ip, #1
	orr	r0, r0, #8
	str	r4, [r1, #4092]
	strh	ip, [r3, #0]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	mov	r2, #1	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldmfd	sp!, {r4}
	bx	lr
.L131:
	.align	2
.L130:
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.align	2
	.global	updateAI
	.type	updateAI, %function
updateAI:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r3, .L147
	ldr	r3, [r3, #0]
	cmp	r3, #1
	beq	.L133
	ldr	r4, .L147+4
	ldr	r1, [r4, #36]
.L134:
	ldr	r3, [r4, #32]
	ldr	r2, .L147+8
	add	r3, r3, #1
	smull	r0, r2, r3, r2
	mov	r0, r3, asr #31
	add	r2, r2, r3
	rsb	r2, r0, r2, asr #4
	rsb	r2, r2, r2, asl #4
	cmp	r3, r2, asl #1
	ldr	r2, .L147+4
	str	r3, [r4, #32]
	ldreq	r3, [r2, #44]
	ldrne	r3, [r2, #44]
	addeq	r3, r3, #1
	streq	r3, [r2, #44]
	cmp	r3, #1
	movgt	r3, #0
	ldr	r2, [r4, #52]
	strgt	r3, [r4, #44]
	ldr	r3, [r4, #48]
	add	r2, r2, #1
	add	r3, r3, #1
	cmp	r2, #48
	str	r1, [r4, #40]
	ldr	r5, .L147+4
	str	r2, [r4, #52]
	str	r3, [r4, #48]
	beq	.L145
.L143:
	cmp	r3, #120
	beq	.L146
.L132:
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L133:
	ldr	r4, .L147+4
	ldr	r1, [r4, #36]
	cmp	r1, #3
	ldrls	pc, [pc, r1, asl #2]
	b	.L134
.L139:
	.word	.L135
	.word	.L136
	.word	.L137
	.word	.L138
.L138:
	ldr	r2, [r4, #4]
	ldr	r3, [r4, #20]
	rsb	r3, r3, r2
	cmp	r3, #0
	ldr	r2, .L147+4
	str	r3, [r4, #4]
	movle	r1, #2
	movle	r3, #0
	strle	r3, [r2, #4]
	strle	r1, [r2, #36]
	b	.L134
.L137:
	ldr	r3, [r4, #4]
	add	r0, r4, #20
	ldmia	r0, {r0, r2}	@ phole ldm
	add	r3, r0, r3
	rsb	r2, r2, #256
	cmp	r3, r2
	ldr	r0, .L147+4
	movgt	r1, #3
	str	r3, [r4, #4]
	strgt	r1, [r0, #36]
	strgt	r2, [r0, #4]
	b	.L134
.L136:
	ldr	r3, [r4, #0]
	ldr	r0, [r4, #16]
	ldr	r2, [r4, #28]
	add	r3, r0, r3
	rsb	r2, r2, #256
	cmp	r3, r2
	ldr	r0, .L147+4
	movgt	r1, #0
	str	r3, [r4, #0]
	strgt	r1, [r0, #36]
	strgt	r2, [r0, #0]
	b	.L134
.L135:
	ldr	r2, [r4, #0]
	ldr	r3, [r4, #16]
	rsb	r3, r3, r2
	cmp	r3, #0
	ldr	r2, .L147+4
	str	r3, [r4, #0]
	movle	r1, #1
	movle	r3, #0
	strle	r3, [r2, #0]
	strle	r1, [r2, #36]
	b	.L134
.L146:
	ldr	r3, .L147+12
	mov	lr, pc
	bx	r3
	add	r3, r0, r0, lsr #31
	and	r3, r3, #1
	sub	r3, r3, r0, lsr #31
	str	r3, [r4, #36]
	mov	r3, #0
	str	r3, [r4, #48]
	b	.L132
.L145:
	ldr	r3, .L147+12
	mov	lr, pc
	bx	r3
	mov	r3, r0, asr #31
	mov	r3, r3, lsr #30
	add	r0, r0, r3
	and	r0, r0, #3
	rsb	r3, r3, r0
	str	r3, [r5, #36]
	mov	r3, #0
	str	r3, [r5, #52]
	ldr	r3, [r5, #48]
	b	.L143
.L148:
	.align	2
.L147:
	.word	cowMovestate
	.word	cow
	.word	-2004318071
	.word	rand
	.size	updateAI, .-updateAI
	.align	2
	.global	drawBullets
	.type	drawBullets, %function
drawBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L154
	ldr	r2, .L154+4
	add	r0, r3, #120
.L151:
	ldr	r1, [r3, #0]
	cmp	r1, #1
	beq	.L153
.L150:
	add	r3, r3, #24
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L151
	bx	lr
.L153:
	ldr	r1, [r3, #-16]
	mov	r1, r1, asl #23
	mvn	r1, r1, lsr #6
	mvn	r1, r1, lsr #17
	ldrb	ip, [r3, #-20]	@ zero_extendqisi2
	strh	r1, [r2, #18]	@ movhi
	mov	r1, #384	@ movhi
	strh	ip, [r2, #16]	@ movhi
	strh	r1, [r2, #20]	@ movhi
	b	.L150
.L155:
	.align	2
.L154:
	.word	bullets+20
	.word	shadowOAM
	.size	drawBullets, .-drawBullets
	.align	2
	.global	updateBullets
	.type	updateBullets, %function
updateBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	ldr	r4, .L163
	ldr	r6, .L163+4
	ldr	sl, .L163+8
	add	r5, r4, #120
	mov	r8, #1
	mov	r7, #0
.L160:
	ldr	r3, [r4, #12]
	cmp	r3, #1
	beq	.L162
.L157:
	add	r4, r4, #24
	cmp	r4, r5
	bne	.L160
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	bx	lr
.L162:
	ldr	r3, [r4, #-8]
	ldr	r0, [r4, #4]
	ldr	r1, [r4, #-4]
	ldr	r2, [r4, #8]
	add	r3, r0, r3
	add	r2, r1, r2
	cmp	r3, #0
	str	r2, [r4, #-4]
	str	r3, [r4, #-8]
	ble	.L158
	ldr	r1, [r4, #0]
	rsb	r0, r1, #159
	cmp	r3, r0
	bge	.L158
	cmp	r2, #0
	ble	.L158
	rsb	r1, r1, #239
	cmp	r2, r1
	blt	.L159
.L158:
	str	r7, [r4, #12]
	ldr	r3, [r4, #-8]
.L159:
	ldr	r1, [r6, #0]
	ldr	r0, [r6, #24]
	add	r0, r1, r0
	cmp	r0, r3
	blt	.L157
	ldr	r0, [r4, #0]
	add	r3, r3, r0
	cmp	r1, r3
	bgt	.L157
	ldr	r3, [r6, #4]
	ldr	r1, [r6, #28]
	add	r1, r3, r1
	cmp	r2, r1
	bgt	.L157
	add	r2, r2, r0
	cmp	r3, r2
	bgt	.L157
	mov	r1, #20736
	mov	r2, #11008
	ldr	r0, .L163+12
	add	r1, r1, #227
	add	r2, r2, #17
	str	r8, [sl, #0]
	bl	playSoundB
	str	r7, [r4, #12]
	b	.L157
.L164:
	.align	2
.L163:
	.word	bullets+8
	.word	cow
	.word	.LANCHOR0
	.word	secret
	.size	updateBullets, .-updateBullets
	.align	2
	.global	fire
	.type	fire, %function
fire:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7}
	ldr	r0, .L176
	mov	r3, #0
	mov	r2, r0
.L173:
	ldr	r1, [r2, #20]
	cmp	r1, #0
	beq	.L175
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #24
	bne	.L173
.L165:
	ldmfd	sp!, {r4, r5, r6, r7}
	bx	lr
.L175:
	ldr	r2, .L176+4
	mov	r4, r3, asl #1
	add	ip, r4, r3
	ldr	r6, [r2, #0]
	ldr	r5, [r2, #4]
	ldr	r2, [r2, #36]
	add	r1, r0, ip, asl #3
	mov	r7, #1
	str	r7, [r1, #20]
	str	r6, [r0, ip, asl #3]
	str	r5, [r1, #4]
	cmp	r2, #3
	ldrls	pc, [pc, r2, asl #2]
	b	.L165
.L172:
	.word	.L168
	.word	.L169
	.word	.L170
	.word	.L171
.L171:
	add	r3, r4, r3
	add	r0, r0, r3, asl #3
	mvn	r3, #2
	str	r3, [r0, #16]
	mov	r3, #0
	str	r3, [r0, #12]
	b	.L165
.L170:
	add	r3, r4, r3
	add	r0, r0, r3, asl #3
	mov	r3, #3
	str	r3, [r0, #16]
	mov	r3, #0
	str	r3, [r0, #12]
	b	.L165
.L169:
	add	r3, r4, r3
	add	r0, r0, r3, asl #3
	mvn	r3, #2
	str	r3, [r0, #12]
	mov	r3, #0
	str	r3, [r0, #16]
	b	.L165
.L168:
	add	r3, r4, r3
	add	r0, r0, r3, asl #3
	mov	r3, #3
	str	r3, [r0, #12]
	mov	r3, #0
	str	r3, [r0, #16]
	b	.L165
.L177:
	.align	2
.L176:
	.word	bullets
	.word	farmer
	.size	fire, .-fire
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r6, .L231
	ldr	r8, .L231+4
	sub	sp, sp, #12
	ldr	r0, [r8, #8]
	ldr	r2, [r6, #0]
	ldr	r1, [r8, #4]
	ldr	r3, [r6, #4]
	add	r2, r0, r2
	add	r3, r1, r3
	str	r3, [r6, #12]
	str	r2, [r6, #8]
	bl	updateOAM
	ldr	r3, .L231+8
	ldr	r4, [r8, #8]
	sub	r5, r3, #8
	ldr	ip, [r8, #4]
	add	r0, r5, #680
.L179:
	ldmia	r3, {r1, r2}	@ phole ldm
	rsb	r1, r4, r1
	rsb	r2, ip, r2
	stmdb	r3, {r1, r2}	@ phole stm
	add	r3, r3, #28
	cmp	r3, r0
	bne	.L179
	ldr	r1, [r8, #4]
	ldr	r0, [r6, #4]
	ldr	r7, [r6, #0]
	add	r9, r6, #8
	ldmia	r9, {r9, sl}	@ phole ldm
	str	r1, [sp, #4]
	ldr	fp, [r8, #8]
	ldr	r3, .L231+12
	mov	r2, #0
.L181:
	ldr	r1, [r3, #0]
	add	ip, r0, #15
	cmp	ip, r1
	add	r4, r1, #15
	blt	.L180
	cmp	r4, r0
	add	r1, r7, #15
	blt	.L180
	ldr	r4, [r3, #-4]
	cmp	r1, r4
	add	ip, r4, #15
	blt	.L180
	cmp	ip, r7
	blt	.L180
	ldr	r1, [r3, #12]
	cmp	r1, #1
	beq	.L219
.L180:
	add	r2, r2, #8
	cmp	r2, #32
	add	r3, r3, #20
	bne	.L181
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	str	r0, [r6, #4]
	ldr	r0, [sp, #4]
	tst	r3, #64
	str	r7, [r6, #0]
	ldr	r3, .L231
	str	r9, [r6, #8]
	str	sl, [r6, #12]
	stmib	r8, {r0, fp}	@ phole stm
	bne	.L182
	sub	r9, r9, #1
	ldr	r2, .L231+16
	add	sl, sl, r9, asl #8
	add	r1, r2, sl, asl #1
	ldrh	r1, [r1, #2]
	cmp	r1, #0
	mov	r1, #1
	str	r1, [r3, #36]
	bne	.L220
.L182:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #128
	bne	.L185
	ldr	r1, [r6, #28]
	add	r0, r6, #8
	ldmia	r0, {r0, r2}	@ phole ldm
	add	r0, r1, r0
	add	r0, r0, #1
	ldr	r3, .L231+16
	add	r2, r2, r0, asl #8
	add	r0, r3, r2, asl #1
	ldrh	ip, [r0, #2]
	mov	r0, #0
	cmp	ip, r0
	str	r0, [r6, #36]
	bne	.L221
.L185:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	bne	.L188
	add	r1, r6, #8
	ldmia	r1, {r1, r2}	@ phole ldm
	add	r0, r1, #1
	sub	r2, r2, #1
	ldr	r3, .L231+16
	add	r0, r2, r0, asl #8
	mov	r0, r0, asl #1
	ldrh	r0, [r3, r0]
	cmp	r0, #0
	mov	r0, #3
	str	r0, [r6, #36]
	bne	.L222
.L188:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bne	.L190
	ldr	r0, [r6, #24]
	add	r1, r6, #8
	ldmia	r1, {r1, r2}	@ phole ldm
	add	r2, r0, r2
	sub	r2, r2, #2
	add	ip, r1, #1
	ldr	r3, .L231+16
	add	ip, r2, ip, asl #8
	mov	ip, ip, asl #1
	ldrh	ip, [r3, ip]
	cmp	ip, #0
	mov	ip, #2
	str	ip, [r6, #36]
	bne	.L223
.L190:
	ldr	r3, .L231+20
	ldr	r3, [r3, #0]
	tst	r3, #4
	beq	.L192
	ldr	r2, .L231+24
	ldr	r2, [r2, #0]
	ands	r2, r2, #4
	beq	.L224
.L192:
	tst	r3, #1
	beq	.L194
	ldr	r2, .L231+24
	ldr	r2, [r2, #0]
	ands	r2, r2, #1
	bne	.L194
	mov	r7, r5
	ldr	r3, [r6, #8]
	ldr	r2, [r7, #8]
	cmp	r3, r2
	ldr	r9, .L231+28
	ldr	sl, .L231
	ldr	r4, .L231+32
	ldrgt	r1, [r7, #12]
	bgt	.L195
.L227:
	ldr	r0, [sl, #12]
	ldr	r1, [r7, #12]
	cmp	r0, r1
	blt	.L196
	ldr	ip, [sl, #28]
	add	r5, r2, #4
	rsb	ip, ip, r5
	cmp	r3, ip
	ble	.L196
	ldr	ip, [r7, #16]
	add	ip, r1, ip
	cmp	r0, ip
	bgt	.L196
.L197:
	ldr	r3, [r7, #24]
	cmp	r3, #0
	ldrne	fp, .L231+36
	bne	.L199
	ldr	fp, .L231+36
	ldr	r2, [fp, #0]
	mov	r1, #1
	add	r2, r2, #1
	str	r2, [fp, #0]
	str	r1, [r7, #24]
	mov	r2, r1
	b	.L200
.L201:
	add	r3, r3, #1
	add	r2, r2, #1
.L200:
	cmp	r3, #31
	mov	r1, r3, asl #3
	beq	.L201
	mov	ip, #512	@ movhi
	cmp	r2, #128
	strh	ip, [r4, r1]	@ movhi
	ble	.L201
	bl	updateOAM
	mov	r1, #7936
	mov	r2, #11008
	ldr	r0, .L231+40
	add	r1, r1, #51
	add	r2, r2, #17
	bl	playSoundB
.L199:
	ldr	r3, [r7, #20]
	cmp	r3, #4
	beq	.L225
.L202:
	ldr	r3, .L231+44
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #0]
	rsb	r2, r2, #24
	cmp	r2, r3
	beq	.L226
.L198:
	add	r7, r7, #28
	cmp	r7, r9
	beq	.L178
	ldr	r3, [r6, #8]
	ldr	r2, [r7, #8]
	cmp	r3, r2
	ldrgt	r1, [r7, #12]
	ble	.L227
.L195:
	ldr	r0, [r6, #12]
	cmp	r0, r1
	bgt	.L198
	ldr	ip, [sl, #28]
	add	r2, r2, ip
	add	r2, r2, #5
	cmp	r3, r2
	bgt	.L198
	ldr	r3, [r7, #16]
	add	r1, r1, #4
	rsb	r1, r3, r1
	cmp	r0, r1
	ble	.L198
	b	.L197
.L194:
	tst	r3, #2
	beq	.L206
	ldr	r3, .L231+24
	ldr	r3, [r3, #0]
	tst	r3, #2
	beq	.L228
.L206:
	ldr	r3, [r8, #0]
	cmp	r3, #1
	beq	.L229
.L207:
	ldr	r4, .L231+48
	mov	r3, #1824
	ldr	r2, [r4, #0]
	add	r3, r3, #5
	cmp	r2, r3
	bgt	.L230
.L208:
	ldrh	r1, [r8, #4]
	ldrh	r2, [r8, #8]
	mov	r3, #67108864
	strh	r1, [r3, #20]	@ movhi
	strh	r2, [r3, #22]	@ movhi
	strh	r1, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	bl	animate
	bl	updateAI
	bl	updateBullets
	bl	drawBullets
	bl	updateOAM
	mov	r0, #3
	ldr	r1, .L231+32
	mov	r2, #117440512
	mov	r3, #512
	ldr	ip, .L231+52
	mov	lr, pc
	bx	ip
	ldr	r3, .L231+56
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #0]
	add	r3, r3, #1
	str	r3, [r4, #0]
.L178:
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L230:
	ldr	r3, .L231+60
	ldr	r1, [r3, #0]
	ldr	r0, .L231+32
	mov	r3, #0
	mov	r2, #67108864
	add	ip, r1, #12
	mov	lr, #512	@ movhi
	add	r1, r1, #24
	strh	r3, [r2, #16]	@ movhi
	strh	lr, [r0, #248]	@ movhi
	strh	r3, [r2, #18]	@ movhi
	ldr	r0, .L231+64
	strh	r3, [r2, #20]	@ movhi
	strh	r3, [r2, #22]	@ movhi
	str	r3, [ip, #8]
	str	r3, [r8, #4]
	str	r3, [r1, #8]
	str	r3, [r8, #8]
	ldr	r3, .L231+68
	mov	lr, pc
	bx	r3
	ldr	r4, .L231+52
	mov	r0, #3
	ldr	r1, .L231+72
	mov	r2, #100663296
	mov	r3, #17408
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L231+76
	add	r2, r2, #57344
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r3, #2
	str	r3, [r8, #12]
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	updateOAM
.L223:
	ldr	ip, .L231
	ldr	ip, [ip, #28]
	add	r1, r1, ip
	sub	r1, r1, #1
	add	r2, r2, r1, asl #8
	mov	r2, r2, asl #1
	ldrh	r3, [r3, r2]
	cmp	r3, #0
	beq	.L190
	ldr	r3, [r8, #4]
	cmp	r3, #16
	ldrgt	r2, .L231+4
	addgt	r3, r3, #1
	strgt	r3, [r2, #4]
	ldr	r3, [r6, #4]
	add	r0, r3, r0
	cmp	r0, #239
	ldrle	r2, .L231
	addle	r3, r3, #1
	strle	r3, [r2, #4]
	b	.L190
.L222:
	ldr	r0, .L231
	ldr	r0, [r0, #28]
	add	r1, r1, r0
	sub	r1, r1, #1
	add	r2, r2, r1, asl #8
	mov	r2, r2, asl #1
	ldrh	r3, [r3, r2]
	cmp	r3, #0
	beq	.L188
	ldr	r3, [r8, #4]
	cmp	r3, #0
	ldrgt	r2, .L231+4
	subgt	r3, r3, #1
	strgt	r3, [r2, #4]
	ldr	r3, [r6, #4]
	cmp	r3, #0
	ldrgt	r2, .L231
	subgt	r3, r3, #1
	strgt	r3, [r2, #4]
	b	.L188
.L221:
	ldr	ip, .L231
	ldr	ip, [ip, #24]
	add	r2, r2, ip
	add	r3, r3, r2, asl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, r0
	beq	.L185
	ldr	r3, [r8, #8]
	cmp	r3, #95
	bgt	.L186
	ldr	r2, .L231+80
	ldr	ip, [r2, #0]
	ldr	r4, .L231+4
	sub	ip, ip, #1
	add	r3, r3, #1
	str	ip, [r2, #0]
	ldr	r2, .L231+84
	str	r3, [r4, #8]
	mov	r3, r0
.L187:
	ldr	r0, [r2, r3]
	sub	r0, r0, #1
	str	r0, [r2, r3]
	add	r3, r3, #20
	cmp	r3, #80
	bne	.L187
.L186:
	ldr	r3, [r6, #0]
	add	r1, r3, r1
	cmp	r1, #159
	ldrle	r2, .L231
	addle	r3, r3, #1
	strle	r3, [r2, #0]
	b	.L185
.L220:
	ldr	r3, [r3, #24]
	add	sl, sl, r3
	add	r2, r2, sl, asl #1
	ldrh	r3, [r2, #-2]
	cmp	r3, #0
	beq	.L182
	cmp	fp, #0
	ble	.L183
	ldr	r3, .L231+80
	ldr	r2, [r3, #0]
	add	r2, r2, r1
	ldr	r1, .L231+4
	sub	fp, fp, #1
	str	r2, [r3, #0]
	str	fp, [r1, #8]
	ldr	r2, .L231+84
	mov	r3, #0
.L184:
	ldr	r1, [r2, r3]
	add	r1, r1, #1
	str	r1, [r2, r3]
	add	r3, r3, #20
	cmp	r3, #80
	bne	.L184
.L183:
	ldr	r3, [r6, #0]
	cmp	r3, #0
	ldrgt	r2, .L231
	subgt	r3, r3, #1
	strgt	r3, [r2, #0]
	b	.L182
.L196:
	cmp	r3, r2
	blt	.L198
	b	.L195
.L229:
	ldr	r2, .L231+84
	ldr	r1, .L231+80
	mov	r0, #0
	ldr	r4, .L231+48
	str	r3, [r2, #16]
	str	r3, [r2, #36]
	str	r3, [r2, #56]
	str	r3, [r2, #76]
	str	r0, [r1, #56]
	bl	updateOAM
	mov	r3, #1824
	ldr	r2, [r4, #0]
	add	r3, r3, #5
	cmp	r2, r3
	ble	.L208
	b	.L230
.L224:
	mov	r3, #67108864
	mov	r1, #4
	strh	r2, [r3, #16]	@ movhi
	str	r2, [r8, #4]
	strh	r2, [r3, #18]	@ movhi
	str	r2, [r8, #8]
	strh	r2, [r3, #20]	@ movhi
	str	r1, [r8, #12]
	strh	r2, [r3, #22]	@ movhi
	strh	r2, [r3, #132]	@ movhi
	bl	updateOAM
	ldr	r0, .L231+88
	ldr	r3, .L231+68
	mov	lr, pc
	bx	r3
	ldr	r4, .L231+52
	mov	r0, #3
	ldr	r1, .L231+92
	mov	r2, #100663296
	mov	r3, #20480
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L231+96
	add	r2, r2, #57344
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	b	.L178
.L228:
	mov	r1, #7936
	mov	r2, #11008
	ldr	r0, .L231+40
	add	r1, r1, #51
	add	r2, r2, #17
	bl	playSoundB
	bl	fire
	ldr	r3, [r8, #0]
	cmp	r3, #1
	bne	.L207
	b	.L229
.L219:
	ldr	ip, .L231+32
	add	r1, ip, r2
	mov	r0, #0
	add	r1, r1, #256
	mov	ip, #512	@ movhi
	str	r0, [r3, #12]
	strh	ip, [r1, #0]	@ movhi
	mov	fp, r0
	str	r0, [sp, #4]
	mov	sl, r0
	mov	r9, r0
	mov	r7, r0
	b	.L180
.L226:
	mov	r3, #67108864
	mov	ip, #0	@ movhi
	mov	lr, #0
	strh	ip, [r3, #16]	@ movhi
	mov	r2, #1
	str	lr, [r8, #4]
	strh	ip, [r3, #18]	@ movhi
	str	lr, [r8, #8]
	strh	ip, [r3, #20]	@ movhi
	strh	ip, [r3, #22]	@ movhi
	mov	r3, lr
	b	.L203
.L204:
	add	r3, r3, #1
	add	r2, r2, #1
.L203:
	cmp	r3, #31
	mov	r1, r3, asl #3
	beq	.L204
	mov	ip, #512	@ movhi
	cmp	r2, #128
	strh	ip, [r4, r1]	@ movhi
	ble	.L204
	bl	updateOAM
	ldr	lr, .L231+60
	ldr	r3, [lr, #0]
	mov	r0, #0
	add	r2, r3, #12
	add	r3, r3, #24
	str	r0, [r2, #8]
	mov	fp, #3
	str	r0, [r3, #8]
	str	fp, [r8, #12]
	bl	updateOAM
	ldr	r0, .L231+100
	ldr	r1, .L231+68
	mov	lr, pc
	bx	r1
	mov	r3, #21248
	mov	r0, fp
	ldr	r1, .L231+104
	mov	r2, #100663296
	add	r3, r3, #32
	ldr	r5, .L231+52
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	mov	r0, fp
	ldr	r1, .L231+108
	add	r2, r2, #57344
	mov	r3, #1024
	mov	lr, pc
	bx	r5
	b	.L198
.L225:
	ldr	lr, .L231+60
	ldr	r2, [lr, #0]
	mov	ip, #0	@ movhi
	mov	lr, #0
	mov	r3, #67108864
	add	r1, r2, #12
	mov	r0, #0	@ movhi
	add	r2, r2, #24
	strh	r0, [r3, #16]	@ movhi
	strh	ip, [r3, #18]	@ movhi
	ldr	r0, .L231+64
	strh	ip, [r3, #20]	@ movhi
	strh	ip, [r3, #22]	@ movhi
	str	lr, [r1, #8]
	str	lr, [r8, #4]
	str	lr, [r2, #8]
	str	lr, [r8, #8]
	ldr	r1, .L231+68
	mov	lr, pc
	bx	r1
	ldr	r5, .L231+52
	mov	r0, #3
	ldr	r1, .L231+72
	mov	r2, #100663296
	mov	r3, #17408
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L231+76
	add	r2, r2, #57344
	mov	r3, #1024
	mov	lr, pc
	bx	r5
	mov	r3, #2
	str	r3, [r8, #12]
	bl	updateOAM
	b	.L202
.L232:
	.align	2
.L231:
	.word	farmer
	.word	.LANCHOR0
	.word	plants+8
	.word	poops+4
	.word	collisionmapBitmap
	.word	oldButtons
	.word	buttons
	.word	plants+672
	.word	shadowOAM
	.word	NUMCOLLECTED
	.word	harvest
	.word	NUMWEEDS
	.word	vblankCounter
	.word	DMANow
	.word	waitForVblank
	.word	dma
	.word	losePal
	.word	loadPalette
	.word	loseTiles
	.word	loseMap
	.word	cow
	.word	poops
	.word	pausePal
	.word	pauseTiles
	.word	pauseMap
	.word	winPal
	.word	winTiles
	.word	winMap
	.size	game, .-game
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #-1191182336
	mvn	r1, #10048
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	mov	r2, r2, asr #17
	mov	r3, #67108864
	sub	r1, r1, #59
	mov	r0, #4864	@ movhi
	strh	r2, [r3, #10]	@ movhi
	strh	r0, [r3, #0]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	add	r2, r3, #512
	ldrh	r0, [r2, #0]
	ldr	ip, .L248
	mov	r1, #50331648
	add	r1, r1, #28672
	orr	r0, r0, #1
	str	ip, [r1, #4092]
	strh	r0, [r2, #0]	@ movhi
	ldrh	r0, [r3, #4]
	mov	ip, #1	@ movhi
	orr	r0, r0, #8
	mvn	r1, #1264
	strh	r0, [r3, #4]	@ movhi
	sub	r1, r1, #1
	strh	ip, [r2, #8]	@ movhi
	mov	r0, #128	@ movhi
	mov	r2, #0	@ movhi
	strh	r0, [r3, #132]	@ movhi
	strh	r2, [r3, #128]	@ movhi
	strh	r1, [r3, #130]	@ movhi
	bl	updateOAM
	bl	initialize
	mov	r2, #1
	mov	r3, #0
	ldr	r0, .L248+4
	b	.L234
.L235:
	add	r3, r3, #1
	add	r2, r2, #1
.L234:
	cmp	r3, #31
	mov	r1, r3, asl #3
	beq	.L235
	mov	ip, #512	@ movhi
	cmp	r2, #128
	strh	ip, [r0, r1]	@ movhi
	ble	.L235
	ldr	r0, .L248+8
	ldr	r3, .L248+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L248+16
	mov	r0, #3
	ldr	r1, .L248+20
	mov	r2, #100663296
	mov	r3, #15552
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L248+24
	add	r2, r2, #57344
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r7, .L248+28
	ldr	r4, .L248+32
	ldr	r6, .L248+36
	mov	r5, #67108864
.L247:
	ldr	r3, [r4, #0]
	ldr	r2, [r7, #12]
.L237:
	str	r3, [r6, #0]
	ldr	r3, [r5, #304]
	str	r3, [r4, #0]
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L237
.L244:
	.word	.L238
	.word	.L239
	.word	.L240
	.word	.L241
	.word	.L242
	.word	.L243
.L243:
	bl	instructions
	b	.L247
.L242:
	bl	pause
	b	.L247
.L241:
	bl	win
	b	.L247
.L240:
	bl	lose
	b	.L247
.L239:
	bl	game
	b	.L247
.L238:
	bl	initialize
	bl	splash
	b	.L247
.L249:
	.align	2
.L248:
	.word	interruptHandler
	.word	shadowOAM
	.word	splashPal
	.word	loadPalette
	.word	DMANow
	.word	splashTiles
	.word	splashMap
	.word	.LANCHOR0
	.word	buttons
	.word	oldButtons
	.size	main, .-main
	.global	MAX_BULLETS
	.global	hOff
	.global	vOff
	.global	collMapSize
	.global	state
	.global	randomSeed
	.global	cowHit
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.comm	soundA,28,4
	.comm	soundB,28,4
	.comm	vbCountA,4,4
	.comm	vbCountB,4,4
	.comm	NUMWEEDS,4,4
	.comm	NUMCOLLECTED,4,4
	.comm	shadowOAM,1024,4
	.comm	bigRow,4,4
	.comm	bigCol,4,4
	.comm	bullets,120,4
	.comm	plants,672,4
	.comm	poops,80,4
	.comm	farmer,60,4
	.comm	cow,60,4
	.comm	scanLineCounter,2,2
	.comm	fpsbuffer,30,4
	.comm	cowMovestate,4,4
	.comm	vblankCounter,4,4
	.data
	.align	2
	.type	MAX_BULLETS, %object
	.size	MAX_BULLETS, 4
MAX_BULLETS:
	.word	5
	.type	collMapSize, %object
	.size	collMapSize, 4
collMapSize:
	.word	256
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	cowHit, %object
	.size	cowHit, 4
cowHit:
	.space	4
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.space	4
	.type	state, %object
	.size	state, 4
state:
	.space	4
	.type	randomSeed, %object
	.size	randomSeed, 4
randomSeed:
	.space	4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
