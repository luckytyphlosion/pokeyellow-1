Route14Object: ; 0x549bb (size=87)
	db $43 ; border block

	db $0 ; warps

	db $1 ; signs
	db $d, $11, $b ; Route14Text11

	db $a ; objects
	object SPRITE_BLACK_HAIR_BOY_1, $4, $4, STAY, DOWN, $1, BIRD_KEEPER + $C8, $e
	object SPRITE_BLACK_HAIR_BOY_1, $f, $6, STAY, DOWN, $2, BIRD_KEEPER + $C8, $f
	object SPRITE_BLACK_HAIR_BOY_1, $c, $b, STAY, DOWN, $3, BIRD_KEEPER + $C8, $10
	object SPRITE_BLACK_HAIR_BOY_1, $e, $f, STAY, UP, $4, BIRD_KEEPER + $C8, $11
	object SPRITE_BLACK_HAIR_BOY_1, $f, $1f, STAY, LEFT, $5, BIRD_KEEPER + $C8, $4
	object SPRITE_BLACK_HAIR_BOY_1, $6, $31, STAY, UP, $6, BIRD_KEEPER + $C8, $5
	object SPRITE_BIKER, $5, $27, STAY, DOWN, $7, BIKER + $C8, $d
	object SPRITE_BIKER, $4, $1e, STAY, RIGHT, $8, BIKER + $C8, $e
	object SPRITE_BIKER, $f, $1e, STAY, LEFT, $9, BIKER + $C8, $f
	object SPRITE_BIKER, $4, $1f, STAY, RIGHT, $a, BIKER + $C8, $2
