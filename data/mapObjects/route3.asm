Route3Object: ; 0x54208 (size=77)
	db $2c ; border block

	db $0 ; warps

	db $1 ; signs
	db $9, $3b, $a ; Route3Text10

	db $9 ; objects
	object SPRITE_BLACK_HAIR_BOY_2, $39, $b, STAY, NONE, $1 ; person
	object SPRITE_BUG_CATCHER, $a, $6, STAY, RIGHT, $2, BUG_CATCHER + $C8, $4
	object SPRITE_BUG_CATCHER, $e, $4, STAY, DOWN, $3, YOUNGSTER + $C8, $1
	object SPRITE_LASS, $10, $9, STAY, LEFT, $4, LASS + $C8, $1
	object SPRITE_BUG_CATCHER, $13, $5, STAY, DOWN, $5, BUG_CATCHER + $C8, $5
	object SPRITE_LASS, $17, $4, STAY, LEFT, $6, LASS + $C8, $2
	object SPRITE_BUG_CATCHER, $16, $9, STAY, LEFT, $7, YOUNGSTER + $C8, $2
	object SPRITE_BUG_CATCHER, $18, $6, STAY, RIGHT, $8, BUG_CATCHER + $C8, $6
	object SPRITE_LASS, $21, $a, STAY, UP, $9, LASS + $C8, $3
