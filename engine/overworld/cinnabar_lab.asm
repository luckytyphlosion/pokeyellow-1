GiveFossilToCinnabarLab: ; 61006 (18:5006)
	ld hl, wd730
	set 6, [hl]
	xor a
	ld [wCurrentMenuItem], a
	ld a, $3
	ld [wMenuWatchedKeys], a
	ld a, [wcd37]
	dec a
	ld [wMaxMenuItem], a
	ld a, $2
	ld [wTopMenuItemY], a
	ld a, $1
	ld [wTopMenuItemX], a
	ld a, [wcd37]
	dec a
	ld bc, $2
	ld hl, $3
	call AddNTimes
	dec l
	ld b, l
	ld c, $d
	coord hl, 0, 0
	call TextBoxBorder
	call UpdateSprites
	call Func_610c2
	ld hl, wd730
	res 6, [hl]
	call HandleMenuInput
	bit 1, a
	jr nz, .asm_610a7
	ld hl, wcc5b
	ld a, [wCurrentMenuItem]
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hl]
	ld [$ffdb], a
	cp DOME_FOSSIL
	jr z, .choseDomeFossil
	cp HELIX_FOSSIL
	jr z, .choseHelixFossil
	ld b, AERODACTYL
	jr .fossilSelected
.choseHelixFossil
	ld b, OMANYTE
	jr .fossilSelected
.choseDomeFossil
	ld b, KABUTO
.fossilSelected
	ld [W_FOSSILITEM], a
	ld a, b
	ld [W_FOSSILMON], a
	call LoadFossilItemAndMonName
	ld hl, LabFossil_610ae
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .asm_610a7
	ld hl, LabFossil_610b3
	call PrintText
	ld a, [W_FOSSILITEM]
	ld [$ffdb], a
	callba RemoveItemByID
	ld hl, LabFossil_610b8
	call PrintText
	ld hl, wd7a3
	set 0, [hl]
	set 1, [hl]
	ret
.asm_610a7
	ld hl, LabFossil_610bd
	call PrintText
	ret

LabFossil_610ae: ; 610ae (18:50ae)
	TX_FAR _Lab4Text_610ae
	db "@"

LabFossil_610b3: ; 610b3 (18:50b3)
	TX_FAR _Lab4Text_610b3
	db "@"

LabFossil_610b8: ; 610b8 (18:50b8)
	TX_FAR _Lab4Text_610b8
	db "@"

LabFossil_610bd: ; 610bd (18:50bd)
	TX_FAR _Lab4Text_610bd
	db "@"

Func_610c2: ; 610c2 (18:50c2)
	ld hl, wcc5b
	xor a
	ld [$ffdb], a
.asm_610c8
	ld a, [hli]
	cp $ff
	ret z
	push hl
	ld [wd11e], a
	call GetItemName
	coord hl, 2, 2
	ld a, [$ffdb]
	ld bc, SCREEN_WIDTH * 2
	call AddNTimes
	ld de, wcd6d
	call PlaceString
	ld hl, $ffdb
	inc [hl]
	pop hl
	jr .asm_610c8

; loads the names of the fossil item and the resulting mon
LoadFossilItemAndMonName: ; 610eb (18:50eb)
	ld a, [W_FOSSILMON]
	ld [wd11e], a
	call GetMonName
	call CopyStringToCF4B
	ld a, [W_FOSSILITEM]
	ld [wd11e], a
	call GetItemName
	ret
