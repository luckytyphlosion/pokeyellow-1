CeruleanCityScript: ; 19480 (6:5480)
	call EnableAutoTextBoxDrawing
	ld hl, CeruleanCityScriptPointers
	ld a, [W_CERULEANCITYCURSCRIPT]
	jp CallFunctionInTable

CeruleanCityScript_1948c: ; 1948c (6:548c)
	xor a
	ld [wJoyIgnore], a
	ld [W_CERULEANCITYCURSCRIPT], a
	ld a, HS_CERULEAN_RIVAL
	ld [wcc4d], a
	predef_jump HideObject

CeruleanCityScriptPointers: ; 1949d (6:549d)
	dw CeruleanCityScript0
	dw CeruleanCityScript1
	dw CeruleanCityScript2
	dw CeruleanCityScript3
	dw CeruleanCityScript4

CeruleanCityScript4: ; 194a7 (6:54a7)
	ld a, [W_ISINBATTLE]
	cp $ff
	jp z, CeruleanCityScript_1948c
	ld a, $f0
	ld [wJoyIgnore], a
	ld hl, wd75b
	set 7, [hl]
	ld a, $2
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ld [wJoyIgnore], a
	ld [W_CERULEANCITYCURSCRIPT], a
	ret

CeruleanCityScript0: ; 194c8 (6:54c8)
	ld a, [wd75b]
	bit 7, a
	jr nz, .asm_194f7
	ld hl, CeruleanCityCoords1
	call ArePlayerCoordsInArray
	jr nc, .asm_194f7
	ld a, [wCoordIndex]
	cp $1
	ld a, PLAYER_DIR_UP
	ld b, SPRITE_FACING_DOWN
	jr nz, .asm_194e6
	ld a, PLAYER_DIR_DOWN
	ld b, SPRITE_FACING_UP
.asm_194e6
	ld [wPlayerMovingDirection], a
	ld a, b
	ld [wSpriteStateData1 + 2 * $10 + $9], a
	call Delay3
	ld a, $2
	ld [hSpriteIndexOrTextID], a
	jp DisplayTextID
.asm_194f7
	ld a, [wd75a]
	bit 0, a
	ret nz
	ld hl, CeruleanCityCoords2
	call ArePlayerCoordsInArray
	ret nc
	ld a, [wWalkBikeSurfState]
	and a
	jr z, .asm_19512
	ld a, $ff
	ld [wc0ee], a
	call PlaySound
.asm_19512
	ld c, BANK(Music_MeetRival)
	ld a, MUSIC_MEET_RIVAL
	call PlayMusic
	xor a
	ld [hJoyHeld], a
	ld a, $f0
	ld [wJoyIgnore], a
	ld a, [W_XCOORD]
	cp $14
	jr z, .asm_19535
	ld a, $1
	ld [H_SPRITEINDEX], a
	ld a, $5
	ld [H_SPRITEDATAOFFSET], a
	call GetPointerWithinSpriteStateData2
	ld [hl], $19
.asm_19535
	ld a, HS_CERULEAN_RIVAL
	ld [wcc4d], a
	predef ShowObject
	ld de, CeruleanCityMovement1
	ld a, $1
	ld [H_SPRITEINDEX], a
	call MoveSprite
	ld a, $1
	ld [W_CERULEANCITYCURSCRIPT], a
	ret

CeruleanCityCoords1: ; 1954f (6:554f)
	db $07,$1e
	db $09,$1e
	db $ff

CeruleanCityCoords2: ; 19554 (6:5554)
	db $06,$14
	db $06,$15
	db $ff

CeruleanCityMovement1: ; 19559 (6:5559)
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db $FF

CeruleanCityScript_1955d: ; 1955d (6:555d)
	ld a,1
	ld [H_SPRITEINDEX],a
	xor a ; SPRITE_FACING_DOWN
	ld [hSpriteFacingDirection],a
	jp SetSpriteFacingDirectionAndDelay ; face object

CeruleanCityScript1: ; 19567 (6:5567)
	ld a, [wd730]
	bit 0, a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, $1
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, CeruleanCityText_1966d
	ld de, CeruleanCityText_19672
	call SaveEndBattleTextPointers
	ld a, SONY1 + $c8
	ld [W_CUROPPONENT], a

	; select which team to use during the encounter
	ld a, [W_RIVALSTARTER]
	cp STARTER2
	jr nz, .NotSquirtle
	ld a, $7
	jr .done
.NotSquirtle
	cp STARTER3
	jr nz, .Charmander
	ld a, $8
	jr .done
.Charmander
	ld a, $9
.done
	ld [W_TRAINERNO], a

	xor a
	ld [hJoyHeld], a
	call CeruleanCityScript_1955d
	ld a, $2
	ld [W_CERULEANCITYCURSCRIPT], a
	ret

CeruleanCityScript2: ; 195b1 (6:55b1)
	ld a, [W_ISINBATTLE]
	cp $ff
	jp z, CeruleanCityScript_1948c
	call CeruleanCityScript_1955d
	ld a, $f0
	ld [wJoyIgnore], a
	ld hl, wd75a
	set 0, [hl]
	ld a, $1
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, $ff
	ld [wc0ee], a
	call PlaySound
	callba Music_RivalAlternateStart
	ld a, $1
	ld [H_SPRITEINDEX], a
	call SetSpriteMovementBytesToFF
	ld a, [W_XCOORD]
	cp $14
	jr nz, .asm_195f0
	ld de, CeruleanCityMovement4
	jr .asm_195f3
.asm_195f0
	ld de, CeruleanCityMovement3
.asm_195f3
	ld a, $1
	ld [H_SPRITEINDEX], a
	call MoveSprite
	ld a, $3
	ld [W_CERULEANCITYCURSCRIPT], a
	ret

CeruleanCityMovement3: ; 19600 (6:5600)
	db NPC_MOVEMENT_LEFT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db $FF

CeruleanCityMovement4: ; 19608 (6:5608)
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db $FF

CeruleanCityScript3: ; 19610 (6:5610)
	ld a, [wd730]
	bit 0, a
	ret nz
	ld a, HS_CERULEAN_RIVAL
	ld [wcc4d], a
	predef HideObject
	xor a
	ld [wJoyIgnore], a
	call PlayDefaultMusic
	ld a, $0
	ld [W_CERULEANCITYCURSCRIPT], a
	ret

CeruleanCityTextPointers: ; 1962d (6:562d)
	dw CeruleanCityText1
	dw CeruleanCityText2
	dw CeruleanCityText3
	dw CeruleanCityText4
	dw CeruleanCityText5
	dw CeruleanCityText6
	dw CeruleanCityText7
	dw CeruleanCityText8
	dw CeruleanCityText9
	dw CeruleanCityText10
	dw CeruleanCityText11
	dw CeruleanCityText12
	dw CeruleanCityText13
	dw MartSignText
	dw PokeCenterSignText
	dw CeruleanCityText16
	dw CeruleanCityText17

CeruleanCityText1: ; 1964f (6:564f)
	TX_ASM
	ld a, [wd75a] ; rival battle flag
	bit 0, a
	; do pre-battle text
	jr z, .PreBattleText
	; or talk about bill
	ld hl, CeruleanCityText_19677
	call PrintText
	jr .end
.PreBattleText
	ld hl, CeruleanCityText_19668
	call PrintText
.end
	jp TextScriptEnd

CeruleanCityText_19668: ; 19668 (6:5668)
	TX_FAR _CeruleanCityText_19668
	db "@"

CeruleanCityText_1966d: ; 1966d (6:566d)
	TX_FAR _CeruleanCityText_1966d
	db "@"

CeruleanCityText_19672: ; 19672 (6:5672)
	TX_FAR _CeruleanCityText_19672
	db "@"

CeruleanCityText_19677: ; 19677 (6:5677)
	TX_FAR _CeruleanCityText_19677
	db "@"

CeruleanCityText2: ; 1967c (6:567c)
	TX_ASM
	ld a, [wd75b]
	bit 7, a
	jr nz, .asm_4ca20
	ld hl, CeruleanCityText_196d9
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, CeruleanCityText_196ee
	ld de, CeruleanCityText_196ee
	call SaveEndBattleTextPointers
	ld a, [hSpriteIndexOrTextID]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $4
	ld [W_CERULEANCITYCURSCRIPT], a
	jp TextScriptEnd
.asm_4ca20
	ld hl, CeruleanCityText_196f3
	call PrintText
	ld bc, (TM_28 << 8) + 1
	call GiveItem
	jr c, .Success
	ld hl, TM28NoRoomText
	call PrintText
	jr .Done
.Success
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, ReceivedTM28Text
	call PrintText
	callba CeruleanHideRocket
.Done
	jp TextScriptEnd

CeruleanCityText_196d9: ; 196d9 (6:56d9)
	TX_FAR _CeruleanCityText_196d9
	db "@"

ReceivedTM28Text: ; 196de (6:56de)
	TX_FAR _ReceivedTM28Text
	db $0B
	TX_FAR _ReceivedTM28Text2
	db $0D, "@"

TM28NoRoomText: ; 196e9 (6:56e9)
	TX_FAR _TM28NoRoomText
	db "@"

CeruleanCityText_196ee: ; 196ee (6:56ee)
	TX_FAR _CeruleanCityText_196ee
	db "@"

CeruleanCityText_196f3: ; 196f3 (6:56f3)
	TX_FAR _CeruleanCityText_196f3
	db "@"

CeruleanCityText3: ; 196f8 (6:56f8)
	TX_FAR _CeruleanCityText3
	db "@"

CeruleanCityText4: ; 196fd (6:56fd)
	TX_FAR _CeruleanCityText4
	db "@"

CeruleanCityText5: ; 19702 (6:5702)
	TX_FAR _CeruleanCityText5
	db "@"

CeruleanCityText11: ; 19707 (6:5707)
CeruleanCityText6: ; 19707 (6:5707)
	TX_FAR _CeruleanCityText6
	db "@"

CeruleanCityText7: ; 1970c (6:570c)
	TX_ASM
	ld a, [hRandomAdd]
	cp $b4
	jr c, .asm_e9fc9
	ld hl, CeruleanCityText_19730
	call PrintText
	jr .asm_d486e
.asm_e9fc9
	cp $64
	jr c, .asm_df99b
	ld hl, CeruleanCityText_19735
	call PrintText
	jr .asm_d486e
.asm_df99b
	ld hl, CeruleanCityText_1973a
	call PrintText
.asm_d486e
	jp TextScriptEnd

CeruleanCityText_19730: ; 19730 (6:5730)
	TX_FAR _CeruleanCityText_19730
	db "@"

CeruleanCityText_19735: ; 19735 (6:5735)
	TX_FAR _CeruleanCityText_19735
	db "@"

CeruleanCityText_1973a: ; 1973a (6:573a)
	TX_FAR _CeruleanCityText_1973a
	db "@"

CeruleanCityText8: ; 1973f (6:573f)
	TX_ASM
	ld a, [hRandomAdd]
	cp $b4
	jr c, .asm_e28da
	ld hl, CeruleanCityText_1976f
	call PrintText
	jr .asm_f2f38
.asm_e28da
	cp $78
	jr c, .asm_15d08
	ld hl, CeruleanCityText_19774
	call PrintText
	jr .asm_f2f38
.asm_15d08
	cp $3c
	jr c, .asm_d7fea
	ld hl, CeruleanCityText_19779
	call PrintText
	jr .asm_f2f38
.asm_d7fea
	ld hl, CeruleanCityText_1977e
	call PrintText
.asm_f2f38
	jp TextScriptEnd

CeruleanCityText_1976f: ; 1976f (6:576f)
	TX_FAR _CeruleanCityText_1976f
	db "@"

CeruleanCityText_19774: ; 19774 (6:5774)
	TX_FAR _CeruleanCityText_19774
	db "@"

CeruleanCityText_19779: ; 19779 (6:5779)
	TX_FAR _CeruleanCityText_19779
	db "@"

CeruleanCityText_1977e: ; 1977e (6:577e)
	TX_FAR _CeruleanCityText_1977e
	db "@"

CeruleanCityText9: ; 19783 (6:5783)
	TX_FAR _CeruleanCityText9
	db "@"

CeruleanCityText10: ; 19788 (6:5788)
	TX_FAR _CeruleanCityText10
	db "@"

CeruleanCityText12: ; 1978d (6:578d)
	TX_FAR _CeruleanCityText12
	db "@"

CeruleanCityText13: ; 19792 (6:5792)
	TX_FAR _CeruleanCityText13
	db "@"

CeruleanCityText16: ; 19797 (6:5797)
	TX_FAR _CeruleanCityText16
	db "@"

CeruleanCityText17: ; 1979c (6:579c)
	TX_FAR _CeruleanCityText17
	db "@"
