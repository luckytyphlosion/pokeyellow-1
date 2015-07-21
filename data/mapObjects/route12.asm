Route12Object: ; 0x5869a (size=118)
	db $43 ; border block

	db $4 ; warps
	db $f, $a, $0, ROUTE_12_GATE_1F
	db $f, $b, $1, ROUTE_12_GATE_1F
	db $15, $a, $2, ROUTE_12_GATE_1F
	db $4d, $b, $0, ROUTE_12_HOUSE

	db $2 ; signs
	db $d, $d, $b ; Route12Text11
	db $3f, $b, $c ; Route12Text12

	db $a ; objects
	object SPRITE_SNORLAX, $a, $3e, STAY, DOWN, $1 ; person
	object SPRITE_FISHER2, $e, $1f, STAY, LEFT, $2, FISHER + $C8, $3
	object SPRITE_FISHER2, $5, $27, STAY, UP, $3, FISHER + $C8, $4
	object SPRITE_BLACK_HAIR_BOY_1, $b, $5c, STAY, LEFT, $4, JR__TRAINER_M + $C8, $9
	object SPRITE_BLACK_HAIR_BOY_2, $e, $4c, STAY, UP, $5, ROCKER + $C8, $2
	object SPRITE_FISHER2, $c, $28, STAY, LEFT, $6, FISHER + $C8, $5
	object SPRITE_FISHER2, $9, $34, STAY, RIGHT, $7, FISHER + $C8, $6
	object SPRITE_FISHER2, $6, $57, STAY, DOWN, $8, FISHER + $C8, $b
	object SPRITE_BALL, $e, $23, STAY, NONE, $9, TM_16
	object SPRITE_BALL, $5, $59, STAY, NONE, $a, IRON

	; warp-to
	EVENT_DISP ROUTE_12_WIDTH, $f, $a ; ROUTE_12_GATE_1F
	EVENT_DISP ROUTE_12_WIDTH, $f, $b ; ROUTE_12_GATE_1F
	EVENT_DISP ROUTE_12_WIDTH, $15, $a ; ROUTE_12_GATE_1F
	EVENT_DISP ROUTE_12_WIDTH, $4d, $b ; ROUTE_12_HOUSE
