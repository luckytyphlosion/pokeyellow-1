PewterGymObject: ; 0x5c52e (size=42)
	db $3 ; border block

	db $2 ; warps
	db $d, $4, $2, $ff
	db $d, $5, $2, $ff

	db $0 ; signs

	db $3 ; objects
	object SPRITE_BLACK_HAIR_BOY_2, $4, $1, STAY, DOWN, $1, BROCK + $C8, $1
	object SPRITE_BLACK_HAIR_BOY_1, $3, $6, STAY, RIGHT, $2, JR__TRAINER_M + $C8, $1
	object SPRITE_GYM_HELPER, $7, $a, STAY, DOWN, $3 ; person

	; warp-to
	EVENT_DISP PEWTER_GYM_WIDTH, $d, $4
	EVENT_DISP PEWTER_GYM_WIDTH, $d, $5
