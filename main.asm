INCLUDE "constants.asm"

NPC_SPRITES_1 EQU $4
NPC_SPRITES_2 EQU $5

GFX EQU $4

PICS_1 EQU $9
PICS_2 EQU $A
PICS_3 EQU $B
PICS_4 EQU $C
PICS_5 EQU $D


SECTION "home",ROM0

INCBIN "baserom.gbc",$0000,$4000 - $0000


SECTION "bank01",ROMX,BANK[$01]

INCBIN "baserom.gbc",$4000,$8000 - $4000


SECTION "bank02",ROMX,BANK[$02]

INCBIN "baserom.gbc",$8000,$c000 - $8000


SECTION "bank03",ROMX,BANK[$03]

INCBIN "baserom.gbc",$c000,$10000 - $c000


SECTION "bank04",ROMX,BANK[$04]

INCBIN "baserom.gbc",$10000,$14000 - $10000


SECTION "bank05",ROMX,BANK[$05]

INCBIN "baserom.gbc",$14000,$18000 - $14000


SECTION "bank06",ROMX,BANK[$06]

INCBIN "baserom.gbc",$18000,$1c000 - $18000


SECTION "bank07",ROMX,BANK[$07]

INCBIN "baserom.gbc",$1c000,$20000 - $1c000


SECTION "bank08",ROMX,BANK[$08]

INCBIN "baserom.gbc",$20000,$24000 - $20000


SECTION "bank09",ROMX,BANK[$09]

INCBIN "baserom.gbc",$24000,$28000 - $24000


SECTION "bank0A",ROMX,BANK[$0A]

INCBIN "baserom.gbc",$28000,$2c000 - $28000


SECTION "bank0B",ROMX,BANK[$0B]

INCBIN "baserom.gbc",$2c000,$30000 - $2c000


SECTION "bank0C",ROMX,BANK[$0C]

INCBIN "baserom.gbc",$30000,$34000 - $30000


SECTION "bank0D",ROMX,BANK[$0D]

INCBIN "baserom.gbc",$34000,$38000 - $34000


SECTION "bank0E",ROMX,BANK[$0E]

INCBIN "baserom.gbc",$38000,$3c000 - $38000


SECTION "bank0F",ROMX,BANK[$0F]

INCBIN "baserom.gbc",$3c000,$40000 - $3c000


SECTION "bank10",ROMX,BANK[$10]

INCBIN "baserom.gbc",$40000,$44000 - $40000


SECTION "bank11",ROMX,BANK[$11]

INCBIN "baserom.gbc",$44000,$48000 - $44000


SECTION "bank12",ROMX,BANK[$12]

INCBIN "baserom.gbc",$48000,$4c000 - $48000


SECTION "bank13",ROMX,BANK[$13]

INCBIN "baserom.gbc",$4c000,$50000 - $4c000


SECTION "bank14",ROMX,BANK[$14]

INCBIN "baserom.gbc",$50000,$54000 - $50000


SECTION "bank15",ROMX,BANK[$15]

INCBIN "baserom.gbc",$54000,$58000 - $54000


SECTION "bank16",ROMX,BANK[$16]

INCBIN "baserom.gbc",$58000,$5c000 - $58000


SECTION "bank17",ROMX,BANK[$17]

INCBIN "baserom.gbc",$5c000,$60000 - $5c000


SECTION "bank18",ROMX,BANK[$18]

INCBIN "baserom.gbc",$60000,$64000 - $60000


SECTION "bank19",ROMX,BANK[$19]

INCBIN "baserom.gbc",$64000,$68000 - $64000


SECTION "bank1A",ROMX,BANK[$1A]

INCBIN "baserom.gbc",$68000,$6c000 - $68000


SECTION "bank1B",ROMX,BANK[$1B]

INCBIN "baserom.gbc",$6c000,$70000 - $6c000


SECTION "bank1C",ROMX,BANK[$1C]

INCBIN "baserom.gbc",$70000,$74000 - $70000


SECTION "bank1D",ROMX,BANK[$1D]

INCBIN "baserom.gbc",$74000,$78000 - $74000


SECTION "bank1E",ROMX,BANK[$1E]

INCBIN "baserom.gbc",$78000,$7c000 - $78000


SECTION "bank1F",ROMX,BANK[$1F]

INCBIN "baserom.gbc",$7c000,$80000 - $7c000


SECTION "bank20",ROMX,BANK[$20]

INCBIN "baserom.gbc",$80000,$84000 - $80000


SECTION "bank21",ROMX,BANK[$21]

INCBIN "baserom.gbc",$84000,$88000 - $84000


SECTION "bank22",ROMX,BANK[$22]

INCBIN "baserom.gbc",$88000,$8c000 - $88000


SECTION "bank23",ROMX,BANK[$23]

INCBIN "baserom.gbc",$8c000,$90000 - $8c000


SECTION "bank24",ROMX,BANK[$24]

INCBIN "baserom.gbc",$90000,$94000 - $90000


SECTION "bank25",ROMX,BANK[$25]

INCBIN "baserom.gbc",$94000,$98000 - $94000


SECTION "bank2f",ROMX[$5000],BANK[$2F]

INCBIN "baserom.gbc",$bd000,$c0000 - $bd000


SECTION "bank30",ROMX,BANK[$30]

INCBIN "baserom.gbc",$c0000,$c4000 - $c0000


SECTION "bank31",ROMX,BANK[$31]

INCBIN "baserom.gbc",$c4000,$c8000 - $c4000


SECTION "bank32",ROMX,BANK[$32]

INCBIN "baserom.gbc",$c8000,$cc000 - $c8000


SECTION "bank33",ROMX,BANK[$33]

INCBIN "baserom.gbc",$cc000,$d0000 - $cc000


SECTION "bank34",ROMX,BANK[$34]

INCBIN "baserom.gbc",$d0000,$d4000 - $d0000


SECTION "bank35",ROMX,BANK[$35]

INCBIN "baserom.gbc",$d4000,$d8000 - $d4000


SECTION "bank36",ROMX,BANK[$36]

INCBIN "baserom.gbc",$d8000,$dc000 - $d8000


SECTION "bank37",ROMX,BANK[$37]

INCBIN "baserom.gbc",$dc000,$e0000 - $dc000


SECTION "bank38",ROMX,BANK[$38]

INCBIN "baserom.gbc",$e0000,$e4000 - $e0000


SECTION "bank39",ROMX,BANK[$39]

INCBIN "baserom.gbc",$e4000,$e8000 - $e4000


SECTION "bank3A",ROMX,BANK[$3A]

INCBIN "baserom.gbc",$e8000,$ec000 - $e8000


SECTION "bank3C",ROMX,BANK[$3C]

INCBIN "baserom.gbc",$f0000,$f4000 - $f0000


SECTION "bank3D",ROMX,BANK[$3D]

INCBIN "baserom.gbc",$f4000,$f8000 - $f4000


SECTION "bank3E",ROMX,BANK[$3E]

INCBIN "baserom.gbc",$f8000,$fc000 - $f8000


SECTION "bank3F",ROMX,BANK[$3F]

INCBIN "baserom.gbc",$fc000,$100000 - $fc000


;IF DEF(_OPTION_BEACH_HOUSE)
;SECTION "bank3C",ROMX[$4314],BANK[$3C]
;
;BeachHouse_GFX:
;	INCBIN "gfx/tilesets/beachhouse.2bpp"
;
;BeachHouse_Block:
;	INCBIN "gfx/blocksets/beachhouse.bst"
;ENDC
