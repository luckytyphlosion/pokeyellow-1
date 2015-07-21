Trade_PrintPlayerMonInfoText: ; 42769 (10:6769)
	coord hl, 5, 0
	ld de,Trade_MonInfoText
	call PlaceString
	ld a,[wTradedPlayerMonSpecies]
	ld [wd11e],a
	predef IndexToPokedex
	coord hl, 9, 0
	ld de,wd11e
	ld bc,$8103
	call PrintNumber
	coord hl, 5, 2
	ld de,wcf4b
	call PlaceString
	coord hl, 8, 4
	ld de,wTradedPlayerMonOT
	call PlaceString
	coord hl, 8, 6
	ld de,wTradedPlayerMonOTID
	ld bc,$8205
	jp PrintNumber

Trade_PrintEnemyMonInfoText: ; 427a7 (10:67a7)
	coord hl, 5, 10
	ld de,Trade_MonInfoText
	call PlaceString
	ld a,[wTradedEnemyMonSpecies]
	ld [wd11e],a
	predef IndexToPokedex
	coord hl, 9, 10
	ld de,wd11e
	ld bc,$8103
	call PrintNumber
	coord hl, 5, 12
	ld de,wcd6d
	call PlaceString
	coord hl, 8, 14
	ld de,wTradedEnemyMonOT
	call PlaceString
	coord hl, 8, 16
	ld de,wTradedEnemyMonOTID
	ld bc,$8205
	jp PrintNumber

Trade_MonInfoText: ; 427e5 (10:67e5)
	db "──",$74,$F2,$4E
	db $4E
	db "OT/",$4E
	db $73,"№",$F2,"@"
