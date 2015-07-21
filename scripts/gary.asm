GaryScript: ; 75f1d (1d:5f1d)
	call EnableAutoTextBoxDrawing
	ld hl, GaryScriptPointers
	ld a, [W_GARYCURSCRIPT]
	jp CallFunctionInTable

GaryScript_75f29: ; 75f29 (1d:5f29)
	xor a
	ld [wJoyIgnore], a
	ld [W_GARYCURSCRIPT], a
	ret

GaryScriptPointers: ; 75f31 (1d:5f31)
	dw GaryScript0
	dw GaryScript1
	dw GaryScript2
	dw GaryScript3
	dw GaryScript4
	dw GaryScript5
	dw GaryScript6
	dw GaryScript7
	dw GaryScript8
	dw GaryScript9
	dw GaryScript10

GaryScript0: ; 75f47 (1d:5f47)
	ret

GaryScript1: ; 75f48 (1d:5f48)
	ld a, $ff
	ld [wJoyIgnore], a
	ld hl, wSimulatedJoypadStatesEnd
	ld de, RLEMovement75f63
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, $2
	ld [W_GARYCURSCRIPT], a
	ret

RLEMovement75f63: ; 75f63 (1d:5f63)
	db D_UP,1
	db D_RIGHT,1
	db D_UP,3
	db $ff

GaryScript2: ; 75f6a (1d:5f6a)
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	xor a
	ld [wJoyIgnore], a
	ld hl, W_OPTIONS
	res 7, [hl]
	ld a, $1
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	call Delay3
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, GaryText_760f9
	ld de, GaryText_760fe
	call SaveEndBattleTextPointers
	ld a, SONY3 + $c8
	ld [W_CUROPPONENT], a

	; select which team to use during the encounter
	ld a, [W_RIVALSTARTER]
	cp STARTER2
	jr nz, .NotSquirtle
	ld a, $1
	jr .done
.NotSquirtle
	cp STARTER3
	jr nz, .Charmander
	ld a, $2
	jr .done
.Charmander
	ld a, $3
.done
	ld [W_TRAINERNO], a

	xor a
	ld [hJoyHeld], a
	ld a, $3
	ld [W_GARYCURSCRIPT], a
	ret

GaryScript3: ; 75fbb (1d:5fbb)
	ld a, [W_ISINBATTLE]
	cp $ff
	jp z, GaryScript_75f29
	call UpdateSprites
	ld hl, wd867
	set 1, [hl]
	ld a, $f0
	ld [wJoyIgnore], a
	ld a, $1
	ld [hSpriteIndexOrTextID], a
	call GaryScript_760c8
	ld a, $1
	ld [H_SPRITEINDEX], a
	call SetSpriteMovementBytesToFF
	ld a, $4
	ld [W_GARYCURSCRIPT], a
	ret

GaryScript4: ; 75fe4 (1d:5fe4)
	callba Music_Cities1AlternateTempo
	ld a, $2
	ld [hSpriteIndexOrTextID], a
	call GaryScript_760c8
	ld a, $2
	ld [H_SPRITEINDEX], a
	call SetSpriteMovementBytesToFF
	ld de, MovementData_76014
	ld a, $2
	ld [H_SPRITEINDEX], a
	call MoveSprite
	ld a, HS_CHAMPIONS_ROOM_OAK
	ld [wcc4d], a
	predef ShowObject
	ld a, $5
	ld [W_GARYCURSCRIPT], a
	ret

MovementData_76014: ; 76014 (1d:6014)
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db $FF

GaryScript5: ; 7601a (1d:601a)
	ld a, [wd730]
	bit 0, a
	ret nz
	ld a, PLAYER_DIR_LEFT
	ld [wPlayerMovingDirection], a
	ld a, $1
	ld [H_SPRITEINDEX], a
	ld a, SPRITE_FACING_LEFT
	ld [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, $2
	ld [H_SPRITEINDEX], a
	xor a ; SPRITE_FACING_DOWN
	ld [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, $3
	ld [hSpriteIndexOrTextID], a
	call GaryScript_760c8
	ld a, $6
	ld [W_GARYCURSCRIPT], a
	ret

GaryScript6: ; 76047 (1d:6047)
	ld a, $2
	ld [H_SPRITEINDEX], a
	ld a, SPRITE_FACING_RIGHT
	ld [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, $4
	ld [hSpriteIndexOrTextID], a
	call GaryScript_760c8
	ld a, $7
	ld [W_GARYCURSCRIPT], a
	ret

GaryScript7: ; 7605f (1d:605f)
	ld a, $2
	ld [H_SPRITEINDEX], a
	xor a ; SPRITE_FACING_DOWN
	ld [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, $5
	ld [hSpriteIndexOrTextID], a
	call GaryScript_760c8
	ld de, MovementData_76080
	ld a, $2
	ld [H_SPRITEINDEX], a
	call MoveSprite
	ld a, $8
	ld [W_GARYCURSCRIPT], a
	ret

MovementData_76080: ; 76080 (1d:6080)
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db $FF

GaryScript8: ; 76083 (1d:6083)
	ld a, [wd730]
	bit 0, a
	ret nz
	ld a, HS_CHAMPIONS_ROOM_OAK
	ld [wcc4d], a
	predef HideObject
	ld a, $9
	ld [W_GARYCURSCRIPT], a
	ret

GaryScript9: ; 76099 (1d:6099)
	ld a, $ff
	ld [wJoyIgnore], a
	ld hl, wSimulatedJoypadStatesEnd
	ld de, RLEMovement760b4
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, $a
	ld [W_GARYCURSCRIPT], a
	ret

RLEMovement760b4: ; 760b4 (1d:60b4)
	db D_UP,4
	db D_LEFT,1
	db $ff

GaryScript10: ; 760b9 (1d:60b9)
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, $0
	ld [W_GARYCURSCRIPT], a
	ret

GaryScript_760c8: ; 760c8 (1d:60c8)
	ld a, $f0
	ld [wJoyIgnore], a
	call DisplayTextID
	ld a, $ff
	ld [wJoyIgnore], a
	ret

GaryTextPointers: ; 760d6 (1d:60d6)
	dw GaryText1
	dw GaryText2
	dw GaryText3
	dw GaryText4
	dw GaryText5

GaryText1: ; 760e0 (1d:60e0)
	TX_ASM
	ld a, [wd867]
	bit 1, a
	ld hl, GaryText_760f4
	jr z, .asm_17e9f
	ld hl, GaryText_76103
.asm_17e9f
	call PrintText
	jp TextScriptEnd

GaryText_760f4: ; 760f4 (1d:60f4)
	TX_FAR _GaryText_760f4
	db "@"

GaryText_760f9: ; 760f9 (1d:60f9)
	TX_FAR _GaryText_760f9
	db "@"

GaryText_760fe: ; 760fe (1d:60fe)
	TX_FAR _GaryText_760fe
	db "@"

GaryText_76103: ; 76103 (1d:6103)
	TX_FAR _GaryText_76103
	db "@"

GaryText2: ; 76108 (1d:6108)
	TX_FAR _GaryText2
	db "@"

GaryText3: ; 7610d (1d:610d)
	TX_ASM
	ld a, [W_PLAYERSTARTER]
	ld [wd11e], a
	call GetMonName
	ld hl, GaryText_76120
	call PrintText
	jp TextScriptEnd

GaryText_76120: ; 76120 (1d:6120)
	TX_FAR _GaryText_76120
	db "@"

GaryText4: ; 76125 (1d:6125)
	TX_FAR _GaryText_76125
	db "@"

GaryText5: ; 7612a (1d:612a)
	TX_FAR _GaryText_7612a
	db "@"
