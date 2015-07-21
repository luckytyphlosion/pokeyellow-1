PKMNLeaguePC: ; 0x7657e
	ld hl, AccessedHoFPCText
	call PrintText
	ld hl, wd730
	set 6, [hl]
	push hl
	ld a, [wUpdateSpritesEnabled]
	push af
	ld a, [hTilesetType]
	push af
	xor a
	ld [hTilesetType], a
	ld [W_SPRITEFLIPPED], a
	ld [wUpdateSpritesEnabled], a
	ld [wHoFTeamIndex2], a
	ld [wHoFTeamNo], a
	ld a, [wNumHoFTeams]
	ld b, a
	cp HOF_TEAM_CAPACITY + 1
	jr c, .loop
; If the total number of hall of fame teams is greater than the storage
; capacity, then calculate the number of the first team that is still recorded.
	ld b, HOF_TEAM_CAPACITY
	sub b
	ld [wHoFTeamNo], a
.loop
	ld hl, wHoFTeamNo
	inc [hl]
	push bc
	ld a, [wHoFTeamIndex2]
	ld [wHoFTeamIndex], a
	callba LoadHallOfFameTeams
	call LeaguePCShowTeam
	pop bc
	jr c, .doneShowingTeams
	ld hl, wHoFTeamIndex2
	inc [hl]
	ld a, [hl]
	cp b
	jr nz, .loop
.doneShowingTeams
	pop af
	ld [hTilesetType], a
	pop af
	ld [wUpdateSpritesEnabled], a
	pop hl
	res 6, [hl]
	call GBPalWhiteOutWithDelay3
	call ClearScreen
	call GoPAL_SET_CF1C
	jp GBPalNormal

LeaguePCShowTeam: ; 765e5 (1d:65e5)
	ld c, PARTY_LENGTH
.loop
	push bc
	call LeaguePCShowMon
	call WaitForTextScrollButtonPress
	ld a, [hJoyHeld]
	bit 1, a
	jr nz, .exit
	ld hl, wHallOfFame + HOF_MON
	ld de, wHallOfFame
	ld bc, HOF_TEAM - HOF_MON
	call CopyData
	pop bc
	ld a, [wHallOfFame + 0]
	cp $ff
	jr z, .done
	dec c
	jr nz, .loop
.done
	and a
	ret
.exit
	pop bc
	scf
	ret

LeaguePCShowMon: ; 76610 (1d:6610)
	call GBPalWhiteOutWithDelay3
	call ClearScreen
	ld hl, wHallOfFame
	ld a, [hli]
	ld [wHoFMonSpecies], a
	ld [wcf91], a
	ld [wd0b5], a
	ld [wBattleMonSpecies2], a
	ld [wcf1d], a
	ld a, [hli]
	ld [wHoFMonLevel], a
	ld de, wcd6d
	ld bc, $000B
	call CopyData
	ld b, $0B
	ld c, 0
	call GoPAL_SET
	coord hl, 12, 5
	call GetMonHeader
	call LoadFrontSpriteByMonIndex
	call GBPalNormal
	coord hl, 0, 13
	ld b, 2
	ld c, $12
	call TextBoxBorder
	coord hl, 1, 15
	ld de, HallOfFameNoText
	call PlaceString
	coord hl, 16, 15
	ld de, wHoFTeamNo
	ld bc, $0103
	call PrintNumber
	jpba HoFDisplayMonInfo

HallOfFameNoText: ; 76670 (1d:6670)
	db "HALL OF FAME No   @"

AccessedHoFPCText: ; 76683 (1d:6683)
	TX_FAR _AccessedHoFPCText
	db "@"
