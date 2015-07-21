CableClubNPC: ; 71c5 (1:71c5)
	ld hl, CableClubNPCWelcomeText
	call PrintText
	ld a, [wd74b]
	bit 5, a ; received pokedex?
	jp nz, .receivedPokedex
; if the player hasn't received the pokedex
	ld c, 60
	call DelayFrames
	ld hl, CableClubNPCMakingPreparationsText
	call PrintText
	jp Func_7298
.receivedPokedex
	ld a, $1
	ld [wMenuJoypadPollCount], a
	ld a, 90
	ld [wLinkTimeoutCounter], a
.establishConnectionLoop
	ld a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	jr z, .establishedConnection
	cp USING_EXTERNAL_CLOCK
	jr z, .establishedConnection
	ld a, CONNECTION_NOT_ESTABLISHED
	ld [hSerialConnectionStatus], a
	ld a, ESTABLISH_CONNECTION_WITH_EXTERNAL_CLOCK
	ld [rSB], a
	xor a
	ld [hSerialReceiveData], a
	ld a, START_TRANSFER_EXTERNAL_CLOCK
	ld [rSC], a
	ld a, [wLinkTimeoutCounter]
	dec a
	ld [wLinkTimeoutCounter], a
	jr z, .failedToEstablishConnection
	ld a, ESTABLISH_CONNECTION_WITH_INTERNAL_CLOCK
	ld [rSB], a
	ld a, START_TRANSFER_INTERNAL_CLOCK
	ld [rSC], a
	call DelayFrame
	jr .establishConnectionLoop
.establishedConnection
	call Serial_SendZeroByte
	call DelayFrame
	call Serial_SendZeroByte
	ld c, 50
	call DelayFrames
	ld hl, CableClubNPCPleaseApplyHereHaveToSaveText
	call PrintText
	xor a
	ld [wMenuJoypadPollCount], a
	call YesNoChoice
	ld a, $1
	ld [wMenuJoypadPollCount], a
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .choseNo
	callab SaveSAVtoSRAM
	call WaitForSoundToFinish
	ld a, SFX_SAVE
	call PlaySoundWaitForCurrent
	ld hl, CableClubNPCPleaseWaitText
	call PrintText
	ld hl, wUnknownSerialCounter
	ld a, $3
	ld [hli], a
	xor a
	ld [hl], a
	ld [hSerialReceivedNewData], a
	ld [wSerialExchangeNybbleSendData], a
	call Serial_SyncAndExchangeNybble
	ld hl, wUnknownSerialCounter
	ld a, [hli]
	inc a
	jr nz, Func_72a8
	ld a, [hl]
	inc a
	jr nz, Func_72a8
	ld b, $a
.asm_7273
	call DelayFrame
	call Serial_SendZeroByte
	dec b
	jr nz, .asm_7273
	call CloseLinkConnection
	ld hl, CableClubNPCLinkClosedBecauseOfInactivityText
	call PrintText
	jr Func_7298
.failedToEstablishConnection
	ld hl, CableClubNPCAreaReservedFor2FriendsLinkedByCableText
	call PrintText
	jr Func_7298
.choseNo
	call CloseLinkConnection
	ld hl, CableClubNPCPleaseComeAgainText
	call PrintText
	; fall through

Func_7298: ; 7298 (1:7298)
	xor a
	ld hl, wUnknownSerialCounter
	ld [hli], a
	ld [hl], a
	ld hl, wd72e
	res 6, [hl]
	xor a
	ld [wMenuJoypadPollCount], a
	ret

Func_72a8: ; 72a8 (1:72a8)
	xor a
	ld [hld], a
	ld [hl], a
	jpab LinkMenu

CableClubNPCAreaReservedFor2FriendsLinkedByCableText: ; 72b3 (1:72b3)
	TX_FAR _CableClubNPCAreaReservedFor2FriendsLinkedByCableText
	db "@"

CableClubNPCWelcomeText: ; 72b8 (1:72b8)
	TX_FAR _CableClubNPCWelcomeText
	db "@"

CableClubNPCPleaseApplyHereHaveToSaveText: ; 72bd (1:72bd)
	TX_FAR _CableClubNPCPleaseApplyHereHaveToSaveText
	db "@"

CableClubNPCPleaseWaitText: ; 72c2 (1:72c2)
	TX_FAR _CableClubNPCPleaseWaitText
	db $a, "@"

CableClubNPCLinkClosedBecauseOfInactivityText: ; 72c8 (1:72c8)
	TX_FAR _CableClubNPCLinkClosedBecauseOfInactivityText
	db "@"

CableClubNPCPleaseComeAgainText: ; 72cd (1:72cd)
	TX_FAR _CableClubNPCPleaseComeAgainText
	db "@"

CableClubNPCMakingPreparationsText: ; 72d2 (1:72d2)
	TX_FAR _CableClubNPCMakingPreparationsText
	db "@"

CloseLinkConnection: ; 72d7 (1:72d7)
	call Delay3
	ld a, CONNECTION_NOT_ESTABLISHED
	ld [hSerialConnectionStatus], a
	ld a, ESTABLISH_CONNECTION_WITH_EXTERNAL_CLOCK
	ld [rSB], a
	xor a
	ld [hSerialReceiveData], a
	ld a, START_TRANSFER_EXTERNAL_CLOCK
	ld [rSC], a
	ret
