PRINTPARTY_HP EQU "◀" ; $71

PrintPage1:
	hlcoord 0, 0
	decoord 0, 0, wPrinterTilemapBuffer
	ld bc, 17 * SCREEN_WIDTH
	call CopyBytes
	hlcoord 17, 1, wPrinterTilemapBuffer
	ld a, $62
	ld [hli], a
	inc a
	ld [hl], a
	hlcoord 17, 2, wPrinterTilemapBuffer
	ld a, $64
	ld [hli], a
	inc a
	ld [hl], a
	hlcoord 1, 9, wPrinterTilemapBuffer
	ld a, " "
	ld [hli], a
	ld [hl], a
	hlcoord 1, 10, wPrinterTilemapBuffer
	ld a, $61
	ld [hli], a
	ld [hl], a
	hlcoord 2, 11, wPrinterTilemapBuffer
	lb bc, 5, 18
	call ClearBox
	ld a, [wTempSpecies]
	dec a
	call CheckCaughtMon
	push af
	ld a, [wTempSpecies]
	ld b, a
	ld c, 1 ; get page 1
	farcall GetDexEntryPagePointer
	pop af
	ld a, b
	hlcoord 1, 11, wPrinterTilemapBuffer
	call nz, FarString
	hlcoord 19, 0, wPrinterTilemapBuffer
	ld [hl], $35
	ld de, SCREEN_WIDTH
	add hl, de
	ld b, $f
.column_loop
	ld [hl], $37
	add hl, de
	dec b
	jr nz, .column_loop
	ld [hl], $3a
	ret

PrintPage2:
	hlcoord 0, 0, wPrinterTilemapBuffer
	ld bc, 8 * SCREEN_WIDTH
	ld a, " "
	call ByteFill
	hlcoord 0, 0, wPrinterTilemapBuffer
	ld a, $36
	ld b, 6
	call .FillColumn
	hlcoord 19, 0, wPrinterTilemapBuffer
	ld a, $37
	ld b, 6
	call .FillColumn
	hlcoord 0, 6, wPrinterTilemapBuffer
	ld [hl], $38
	inc hl
	ld a, $39
	ld bc, SCREEN_HEIGHT
	call ByteFill
	ld [hl], $3a
	hlcoord 0, 7, wPrinterTilemapBuffer
	ld bc, SCREEN_WIDTH
	ld a, $32
	call ByteFill
	ld a, [wTempSpecies]
	dec a
	call CheckCaughtMon
	push af
	ld a, [wTempSpecies]
	ld b, a
	ld c, 2 ; get page 2
	farcall GetDexEntryPagePointer
	pop af
	hlcoord 1, 1, wPrinterTilemapBuffer
	ld a, b
	call nz, FarString
	ret

.FillColumn:
	push de
	ld de, SCREEN_WIDTH
.column_loop
	ld [hl], a
	add hl, de
	dec b
	jr nz, .column_loop
	pop de
	ret

GBPrinterStrings: ; used only for BANK(GBPrinterStrings)
GBPrinterString_Null: db "@"
GBPrinterString_CheckingLink: next "   PRÜFE LINK...@"
GBPrinterString_Transmitting: next "   ÜBERTRAGUNG@"
GBPrinterString_Printing: next "     DRUCKEN@"
GBPrinterString_PrinterError1:
	db   " Drucker fehler 1"
	next ""
	next " Lies das GAME BOY"
	next " PRINTER-Handbuch."
	db   "@"
GBPrinterString_PrinterError2:
	db   " Drucker fehler 2"
	next ""
	next " Lies das GAME BOY"
	next " PRINTER-Handbuch."
	db   "@"
GBPrinterString_PrinterError3:
	db   " Drucker fehler 3"
	next ""
	next " Lies das GAME BOY"
	next " PRINTER-Handbuch."
	db   "@"
GBPrinterString_PrinterError4:
	db   " Drucker fehler 4"
	next ""
	next " Lies das GAME BOY"
	next " PRINTER-Handbuch."
	db   "@"

PrintPartyMonPage1:
	call ClearBGPalettes
	call ClearTilemap
	call ClearSprites
	xor a
	ldh [hBGMapMode], a
	call LoadFontsBattleExtra

	ld de, GBPrinterHPIcon
	ld hl, vTiles2 tile PRINTPARTY_HP
	lb bc, BANK(GBPrinterHPIcon), 1
	call Request1bpp

	ld de, GBPrinterLvIcon
	ld hl, vTiles2 tile "<LV>"
	lb bc, BANK(GBPrinterLvIcon), 1
	call Request1bpp

	ld de, StatsScreenPageTilesGFX + 14 tiles ; shiny icon
	ld hl, vTiles2 tile "⁂"
	lb bc, BANK(StatsScreenPageTilesGFX), 1
	call Get2bpp

	xor a
	ld [wMonType], a
	farcall CopyMonToTempMon
	hlcoord 0, 7
	ld b, 9
	ld c, 18
	call Textbox
	hlcoord 8, 2
	ld a, [wTempMonLevel]
	call PrintLevel_Force3Digits
	hlcoord 12, 2
	ld [hl], PRINTPARTY_HP
	inc hl
	ld de, wTempMonMaxHP
	lb bc, 2, 3
	call PrintNum
	ld a, [wCurPartySpecies]
	ld [wNamedObjectIndexBuffer], a
	ld [wCurSpecies], a
	ld hl, wPartyMonNicknames
	call Function1c0375
	hlcoord 8, 4
	call PlaceString
	hlcoord 9, 6
	ld [hl], "/"
	call GetPokemonName
	hlcoord 10, 6
	call PlaceString
	hlcoord 8, 0
	ld [hl], "№"
	inc hl
	ld [hl], "."
	inc hl
	ld de, wNamedObjectIndexBuffer
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	hlcoord 1, 9
	ld de, String1c03b7
	call PlaceString
	ld hl, wPartyMonOT
	call Function1c0375
	hlcoord 4, 9
	call PlaceString
	hlcoord 1, 11
	ld de, String1c03c0
	call PlaceString
	hlcoord 4, 11
	ld de, wTempMonID
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	hlcoord 1, 14
	ld de, String1c03bb
	call PlaceString
	hlcoord 7, 14
	ld a, [wTempMonMoves + 0]
	call Function1c0381
	call Function1c0393
	ld hl, wTempMonDVs
	predef GetUnownLetter
	hlcoord 0, 0
	call PrepMonFrontpic
	call WaitBGMap
	ld b, SCGB_STATS_SCREEN_HP_PALS
	call GetSGBLayout
	call SetPalettes
	ret

PrintPartyMonPage2:
	call ClearBGPalettes
	call ClearTilemap
	call ClearSprites
	xor a
	ldh [hBGMapMode], a
	call LoadFontsBattleExtra

	ld de, GBPrinterHPIcon
	ld hl, vTiles2 tile PRINTPARTY_HP
	lb bc, BANK(GBPrinterHPIcon), 1
	call Request1bpp

	ld de, GBPrinterLvIcon
	ld hl, vTiles2 tile "<LV>"
	lb bc, BANK(GBPrinterLvIcon), 1
	call Request1bpp

	ld de, StatsScreenPageTilesGFX + 14 tiles ; shiny icon
	ld hl, vTiles2 tile "⁂"
	lb bc, BANK(StatsScreenPageTilesGFX), 1
	call Get2bpp

	xor a
	ld [wMonType], a
	farcall CopyMonToTempMon
	hlcoord 0, 0
	ld b, 15
	ld c, 18
	call Textbox
	ld bc, SCREEN_WIDTH
	decoord 0, 0
	hlcoord 0, 1
	call CopyBytes
	hlcoord 7, 0
	ld a, [wTempMonMoves + 1]
	call Function1c0381
	hlcoord 7, 2
	ld a, [wTempMonMoves + 2]
	call Function1c0381
	hlcoord 7, 4
	ld a, [wTempMonMoves + 3]
	call Function1c0381
	hlcoord 7, 7
	ld de, String1c03c3
	call PlaceString
	hlcoord 16, 7
	ld de, wTempMonAttack
	call .PrintTempMonStats
	hlcoord 16, 9
	ld de, wTempMonDefense
	call .PrintTempMonStats
	hlcoord 16, 11
	ld de, wTempMonSpclAtk
	call .PrintTempMonStats
	hlcoord 16, 13
	ld de, wTempMonSpclDef
	call .PrintTempMonStats
	hlcoord 16, 15
	ld de, wTempMonSpeed
	call .PrintTempMonStats
	call WaitBGMap
	ld b, SCGB_STATS_SCREEN_HP_PALS
	call GetSGBLayout
	call SetPalettes
	ret

.PrintTempMonStats:
	lb bc, 2, 3
	call PrintNum
	ret

Function1c0375:
	ld bc, NAME_LENGTH
	ld a, [wCurPartyMon]
	call AddNTimes
	ld e, l
	ld d, h
	ret

Function1c0381:
	and a
	jr z, .no_move

	ld [wNamedObjectIndexBuffer], a
	call GetMoveName
	jr .got_string

.no_move
	ld de, String1c03ea

.got_string
	call PlaceString
	ret

Function1c0393:
	farcall GetGender
	ld a, " "
	jr c, .got_gender
	ld a, "♂"
	jr nz, .got_gender
	ld a, "♀"

.got_gender
	hlcoord 17, 2
	ld [hl], a
	ld bc, wTempMonDVs
	farcall CheckShininess
	ret nc
	hlcoord 18, 2
	ld [hl], "⁂"
	ret

String1c03b7:
	db "OT/@"

String1c03bb:
	db "ATTACKE/@"

String1c03c0:
	db "<ID>№.@"

String1c03c3:
	db   "ANGR"
	next "VER"
	next "SPEZ.ANG"
	next "SPEZ.VER"
	next "INIT"
	db "@"

String1c03ea:
	db "------------@"

GBPrinterHPIcon:
INCBIN "gfx/printer/hp.1bpp"

GBPrinterLvIcon:
INCBIN "gfx/printer/lv.1bpp"
