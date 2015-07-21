ActivatePC: ; 17e2c (5:7e2c)
	call SaveScreenTilesToBuffer2
	ld a, SFX_TURN_ON_PC
	call PlaySound
	ld hl, TurnedOnPC1Text
	call PrintText
	call WaitForSoundToFinish
	ld hl, wFlags_0xcd60
	set 3, [hl]
	call LoadScreenTilesFromBuffer2
	call Delay3
PCMainMenu: ; 17e48 (5:7e48)
	callba DisplayPCMainMenu
	ld hl, wFlags_0xcd60
	set 5, [hl]
	call HandleMenuInput
	bit 1, a              ;if player pressed B
	jp nz, LogOff
	ld a, [wMaxMenuItem]
	cp a, 2
	jr nz, .next ;if not 2 menu items (not counting log off) (2 occurs before you get the pokedex)
	ld a, [wCurrentMenuItem]
	and a
	jp z, BillsPC    ;if current menu item id is 0, it's bills pc
	cp a, 1
	jr z, .playersPC ;if current menu item id is 1, it's players pc
	jp LogOff        ;otherwise, it's 2, and you're logging off
.next
	cp a, 3
	jr nz, .next2 ;if not 3 menu items (not counting log off) (3 occurs after you get the pokedex, before you beat the pokemon league)
	ld a, [wCurrentMenuItem]
	and a
	jp z, BillsPC    ;if current menu item id is 0, it's bills pc
	cp a, 1
	jr z, .playersPC ;if current menu item id is 1, it's players pc
	cp a, 2
	jp z, OaksPC     ;if current menu item id is 2, it's oaks pc
	jp LogOff        ;otherwise, it's 3, and you're logging off
.next2
	ld a, [wCurrentMenuItem]
	and a
	jp z, BillsPC    ;if current menu item id is 0, it's bills pc
	cp a, 1
	jr z, .playersPC ;if current menu item id is 1, it's players pc
	cp a, 2
	jp z, OaksPC     ;if current menu item id is 2, it's oaks pc
	cp a, 3
	jp z, PKMNLeague ;if current menu item id is 3, it's pkmnleague
	jp LogOff        ;otherwise, it's 4, and you're logging off
.playersPC
	ld hl, wFlags_0xcd60
	res 5, [hl]
	set 3, [hl]
	ld a, SFX_ENTER_PC
	call PlaySound
	call WaitForSoundToFinish
	ld hl, AccessedMyPCText
	call PrintText
	callba PlayerPC
	jr ReloadMainMenu
OaksPC: ; 17ec0 (5:7ec0)
	ld a, SFX_ENTER_PC
	call PlaySound
	call WaitForSoundToFinish
	callba OpenOaksPC
	jr ReloadMainMenu
PKMNLeague: ; 17ed2 (5:7ed2)
	ld a, SFX_ENTER_PC
	call PlaySound
	call WaitForSoundToFinish
	callba PKMNLeaguePC
	jr ReloadMainMenu
BillsPC: ; 17ee4 (5:7ee4)
	ld a, SFX_ENTER_PC
	call PlaySound
	call WaitForSoundToFinish
	ld a, [wd7f1] ;has to do with having met Bill
	bit 0, a
	jr nz, .billsPC ;if you've met bill, use that bill's instead of someone's
	ld hl, AccessedSomeonesPCText
	jr .printText
.billsPC
	ld hl, AccessedBillsPCText
.printText
	call PrintText
	callba BillsPC_
ReloadMainMenu: ; 17f06 (5:7f06)
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	call ReloadMapData
	call UpdateSprites
	jp PCMainMenu
LogOff: ; 17f13 (5:7f13)
	ld a, SFX_TURN_OFF_PC
	call PlaySound
	call WaitForSoundToFinish
	ld hl, wFlags_0xcd60
	res 3, [hl]
	res 5, [hl]
	ret

TurnedOnPC1Text: ; 17f23 (5:7f23)
	TX_FAR _TurnedOnPC1Text
	db "@"

AccessedBillsPCText: ; 17f28 (5:7f28)
	TX_FAR _AccessedBillsPCText
	db "@"

AccessedSomeonesPCText: ; 17f2d (5:7f2d)
	TX_FAR _AccessedSomeonesPCText
	db "@"

AccessedMyPCText: ; 17f32 (5:7f32)
	TX_FAR _AccessedMyPCText
	db "@"

; removes one of the specified item ID [$FFdb] from bag (if existent)
RemoveItemByID: ; 17f37 (5:7f37)
	ld hl, wBagItems
	ld a, [$ffdb]
	ld b, a
	xor a
	ld [$ffdc], a
.asm_17f40
	ld a, [hli]
	cp $ff
	ret z
	cp b
	jr z, .asm_17f4f
	inc hl
	ld a, [$ffdc]
	inc a
	ld [$ffdc], a
	jr .asm_17f40
.asm_17f4f
	ld a, $1
	ld [wItemQuantity], a
	ld a, [$ffdc]
	ld [wWhichPokemon], a
	ld hl, wNumBagItems
	jp RemoveItemFromInventory
