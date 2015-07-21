RocketHideoutElevatorScript: ; 45710 (11:5710)
	ld hl, wd126
	bit 5, [hl]
	res 5, [hl]
	push hl
	call nz, RocketHideoutElevatorScript_4572c
	pop hl
	bit 7, [hl]
	res 7, [hl]
	call nz, RocketHideoutElevatorScript_4575f
	xor a
	ld [wAutoTextBoxDrawingControl], a
	inc a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ret

RocketHideoutElevatorScript_4572c: ; 4572c (11:572c)
	ld hl, wWarpEntries
	ld a, [wd73b]
	ld b, a
	ld a, [wd73c]
	ld c, a
	call RocketHideoutElevatorScript_4573a

RocketHideoutElevatorScript_4573a: ; 4573a (11:573a)
	inc hl
	inc hl
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ret

RocketHideoutElevatorScript_45741: ; 45741 (11:5741)
	ld hl, RocketHideoutElavatorFloors
	call LoadItemList
	ld hl, RocketHideoutElevatorWarpMaps
	ld de, wcc5b
	ld bc, $0006
	call CopyData
	ret

RocketHideoutElavatorFloors: ; 45754 (11:5754)
	db $03 ; num elements in list
	db $55, $54, $61 ; "B1F", "B2F", "B4F"
	db $FF ; terminator

RocketHideoutElevatorWarpMaps: ; 45759 (11:5759)
; first byte is warp number
; second byte is map number
; These specify where the player goes after getting out of the elevator.
	db $04, ROCKET_HIDEOUT_1
	db $04, ROCKET_HIDEOUT_2
	db $02, ROCKET_HIDEOUT_4

RocketHideoutElevatorScript_4575f: ; 4575f (11:575f)
	call Delay3
	callba ShakeElevator
	ret

RocketHideoutElevatorTextPointers: ; 4576b (11:576b)
	dw RocketHideoutElevatorText1

RocketHideoutElevatorText1: ; 4576d (11:576d)
	TX_ASM
	ld b, LIFT_KEY
	call IsItemInBag
	jr z, .asm_45782
	call RocketHideoutElevatorScript_45741
	ld hl, RocketHideoutElevatorWarpMaps
	predef Func_1c9c6
	jr .asm_45788
.asm_45782
	ld hl, RocketHideoutElevatorText_4578b
	call PrintText
.asm_45788
	jp TextScriptEnd

RocketHideoutElevatorText_4578b: ; 4578b (11:578b)
	TX_FAR _RocketElevatorText_4578b
	db $d, "@"
