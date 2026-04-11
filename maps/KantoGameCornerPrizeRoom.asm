	object_const_def ; object_event constants
	const KANTOGAMECORNERPRIZEROOM_GENTLEMAN
	const KANTOGAMECORNERPRIZEROOM_PHARMACIST
	const KANTOGAMECORNERPRIZEROOM_CLERK1
	const KANTOGAMECORNERPRIZEROOM_CLERK2
	const KANTOGAMECORNERPRIZEROOM_CLERK3

KantoGameCornerPrizeRoom_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoGameCornerPrizeRoomGentlemanScript:
	jumptextfaceplayer KantoGameCornerPrizeRoomGentlemanText

KantoGameCornerPrizeRoomPharmacistScript:
	jumptextfaceplayer KantoGameCornerPrizeRoomPharmacistText
	
;----------------------------------


KantoGameCornerDecorVendorScript:
	opentext
	writetext KantoPrizeRoom_PrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse KantoPrizeRoom_NoCoinCase
KantoGameCornerDecorVendor_LoopScript:
	writetext KantoPrizeRoom_AskWhichPrizeText
	special DisplayCoinCaseBalance
	loadmenu KantoGameCornerDecorVendorMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Poster
	ifequal 2, .Console
	ifequal 3, .BigDolls
	jump KantoPrizeRoom_cancel
	
.Poster
	special DisplayCoinCaseBalance
	loadmenu KantoGameCornerPostersVendorMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Pikachu
	ifequal 2, .Clefairy
	ifequal 3, .Jigglypuff
	jump KantoPrizeRoom_cancel
	
.Pikachu
	checkcoins 1800
	ifequal HAVE_LESS, KantoPrizeRoom_notenoughcoins
	writetext SendItemToHomePCTextKanto
	yesorno
	iffalse KantoPrizeRoom_cancel
	checkevent EVENT_DECO_POSTER_2
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_POSTER_2
	takecoins 1800
	jump KantoGameCornerDecorVendor_FinishScript
	end
	
.Clefairy
	checkcoins 1800
	ifequal HAVE_LESS, KantoPrizeRoom_notenoughcoins
	writetext SendItemToHomePCTextKanto
	yesorno
	iffalse KantoPrizeRoom_cancel
	checkevent EVENT_DECO_POSTER_3
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_POSTER_3
	takecoins 1800
	jump KantoGameCornerDecorVendor_FinishScript
	end

.Jigglypuff
	checkcoins 1800
	ifequal HAVE_LESS, KantoPrizeRoom_notenoughcoins
	writetext SendItemToHomePCTextKanto
	yesorno
	iffalse KantoPrizeRoom_cancel
	checkevent EVENT_DECO_POSTER_4
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_POSTER_4
	takecoins 1800
	jump KantoGameCornerDecorVendor_FinishScript
	end

.Console;
	special DisplayCoinCaseBalance
	loadmenu KantoGameCornerConsoleVendorMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .NESConsole
	ifequal 2, .SNESConsole
	ifequal 3, .VBConsole
	jump KantoPrizeRoom_cancel
	
.NESConsole
	checkcoins 1800
	ifequal HAVE_LESS, KantoPrizeRoom_notenoughcoins
	writetext SendItemToHomePCTextKanto
	yesorno
	iffalse KantoPrizeRoom_cancel
	checkevent EVENT_DECO_FAMICOM
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_FAMICOM
	takecoins 1800
	jump KantoGameCornerDecorVendor_FinishScript
	end
	
.SNESConsole
	checkcoins 1800
	ifequal HAVE_LESS, KantoPrizeRoom_notenoughcoins
	writetext SendItemToHomePCTextKanto
	yesorno
	iffalse KantoPrizeRoom_cancel
	checkevent EVENT_DECO_SNES
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_SNES
	takecoins 1800
	jump KantoGameCornerDecorVendor_FinishScript
	end

.VBConsole
	checkcoins 1800
	ifequal HAVE_LESS, KantoPrizeRoom_notenoughcoins
	writetext SendItemToHomePCTextKanto
	yesorno
	iffalse KantoPrizeRoom_cancel
	checkevent EVENT_DECO_VIRTUAL_BOY
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_VIRTUAL_BOY
	takecoins 1800
	jump KantoGameCornerDecorVendor_FinishScript
	end

.BigDolls
	special DisplayCoinCaseBalance
	loadmenu KantoGameCornerBigDollVendorMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Onix
	ifequal 2, .Lapras
	jump KantoPrizeRoom_cancel
	
.Onix
	checkcoins 2500
	ifequal HAVE_LESS, KantoPrizeRoom_notenoughcoins
	writetext SendItemToHomePCTextKanto
	yesorno
	iffalse KantoPrizeRoom_cancel
	checkevent EVENT_DECO_BIG_ONIX_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_BIG_ONIX_DOLL
	takecoins 2500
	jump KantoGameCornerDecorVendor_FinishScript
	end
	
.Lapras
	checkcoins 2500
	ifequal HAVE_LESS, KantoPrizeRoom_notenoughcoins
	writetext SendItemToHomePCTextKanto
	yesorno
	iffalse KantoPrizeRoom_cancel
	checkevent EVENT_DECO_BIG_LAPRAS_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_BIG_LAPRAS_DOLL
	takecoins 2500
	jump KantoGameCornerDecorVendor_FinishScript
	end


	
.AlreadyHaveDecorItem
	writetext AlreadyHaveDecorItemTextKanto
	waitbutton
	jump KantoGameCornerDecorVendor_LoopScript

	
KantoGameCornerDecorVendor_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext KantoPrizeRoom_HereYouGoText
	waitbutton
	jump KantoGameCornerDecorVendor_LoopScript
	
KantoGameCornerBigDollVendorMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "ONIX        2500@"
	db "LAPRAS      2500@"
	db "ZURÜCK@"

KantoGameCornerConsoleVendorMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "NES          1800@"
	db "SUPER NES    1800@"
	db "VIRTUAL BOY  1800@"
	db "ZURÜCK@"

KantoGameCornerPostersVendorMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "PIKACHU      1800@"
	db "PIEPI        1800@"
	db "PUMMELUFF    1800@"
	db "ZURÜCK@"
	
KantoGameCornerDecorVendorMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "POSTER@"
	db "KONSOLEN@"
	db "RIESIGE PUPPEN@"
	db "ZURÜCK@"

;----------------------------------

KantoGameCornerPrizeRoomTMVendor:
;	faceplayer
	opentext
	writetext KantoPrizeRoom_PrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse KantoPrizeRoom_NoCoinCase
	writetext KantoPrizeRoom_AskWhichPrizeText
KantoPrizeRoom_tmcounterloop:
	special DisplayCoinCaseBalance
	loadmenu KantoPrizeRoom_TMMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .kingsrock
	ifequal 2, .covenantorb
	ifequal 3, .metalcoat
	jump KantoPrizeRoom_cancel

.kingsrock
	checkcoins 2500
	ifequal HAVE_LESS, KantoPrizeRoom_notenoughcoins
	itemtotext KINGS_ROCK, MEM_BUFFER_0
	scall KantoPrizeRoom_askbuy
	iffalse KantoPrizeRoom_cancel
	giveitem KINGS_ROCK
	iffalse KantoPrizeRoom_notenoughroom
	takecoins 2500
	jump KantoPrizeRoom_purchased

.covenantorb
	checkcoins 2500
	ifequal HAVE_LESS, KantoPrizeRoom_notenoughcoins
	itemtotext COVENANT_ORB, MEM_BUFFER_0
	scall KantoPrizeRoom_askbuy
	iffalse KantoPrizeRoom_cancel
	giveitem COVENANT_ORB
	iffalse KantoPrizeRoom_notenoughroom
	takecoins 2500
	jump KantoPrizeRoom_purchased

.metalcoat
	checkcoins 2500
	ifequal HAVE_LESS, KantoPrizeRoom_notenoughcoins
	itemtotext METAL_COAT, MEM_BUFFER_0
	scall KantoPrizeRoom_askbuy
	iffalse KantoPrizeRoom_cancel
	giveitem METAL_COAT
	iffalse KantoPrizeRoom_notenoughroom
	takecoins 2500
	jump KantoPrizeRoom_purchased

KantoPrizeRoom_askbuy:
	writetext KantoPrizeRoom_ConfirmPurchaseText
	yesorno
	end

KantoPrizeRoom_purchased:
	waitsfx
	playsound SFX_TRANSACTION
	writetext KantoPrizeRoom_HereYouGoText
	waitbutton
	jump KantoPrizeRoom_tmcounterloop

KantoPrizeRoom_notenoughcoins:
	writetext KantoPrizeRoom_NotEnoughCoinsText
	waitbutton
	closetext
	end

KantoPrizeRoom_notenoughroom:
	writetext KantoPrizeRoom_NotEnoughRoomText
	waitbutton
	closetext
	end

KantoPrizeRoom_cancel:
	writetext KantoPrizeRoom_ComeAgainText
	waitbutton
	closetext
	end

KantoPrizeRoom_NoCoinCase:
	writetext KantoPrizeRoom_NoCoinCaseText
	waitbutton
	closetext
	end

KantoPrizeRoom_TMMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "KINGSTEIN    2500@"
	db "WUNDERSTEIN  2500@"
	db "METALLMANTEL 2500@"
	db "ZURÜCK@"

KantoGameCornerPrizeRoomPokemonVendor:
;	faceplayer
	opentext
	writetext KantoPrizeRoom_PrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse KantoPrizeRoom_NoCoinCase
.loop
	writetext KantoPrizeRoom_AskWhichPrizeText
	special DisplayCoinCaseBalance
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .pikachu
	ifequal 2, .porygon
	ifequal 3, .warfurs
	jump KantoPrizeRoom_cancel

.pikachu
	checkcoins 2222
	ifequal HAVE_LESS, KantoPrizeRoom_notenoughcoins
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, KantoPrizeRoom_notenoughroom
	pokenamemem PIKACHU, MEM_BUFFER_0
	scall KantoPrizeRoom_askbuy
	iffalse KantoPrizeRoom_cancel
	waitsfx
	playsound SFX_TRANSACTION
	writetext KantoPrizeRoom_HereYouGoText
	waitbutton
	writebyte PIKACHU
	special GameCornerPrizeMonCheckDex
	givepoke PIKACHU, 25
	takecoins 2222
	jump .loop

.porygon
	checkcoins 5555
	ifequal HAVE_LESS, KantoPrizeRoom_notenoughcoins
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, KantoPrizeRoom_notenoughroom
	pokenamemem PORYGON, MEM_BUFFER_0
	scall KantoPrizeRoom_askbuy
	iffalse KantoPrizeRoom_cancel
	waitsfx
	playsound SFX_TRANSACTION
	writetext KantoPrizeRoom_HereYouGoText
	waitbutton
	writebyte PORYGON
	special GameCornerPrizeMonCheckDex
	givepoke PORYGON, 15
	takecoins 5555
	jump .loop

.warfurs
	checkcoins 8888
	ifequal HAVE_LESS, KantoPrizeRoom_notenoughcoins
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, KantoPrizeRoom_notenoughroom
	pokenamemem WARFURS, MEM_BUFFER_0
	scall KantoPrizeRoom_askbuy
	iffalse KantoPrizeRoom_cancel
	waitsfx
	playsound SFX_TRANSACTION
	writetext KantoPrizeRoom_HereYouGoText
	waitbutton
	writebyte WARFURS
	special GameCornerPrizeMonCheckDex
	givepoke WARFURS, 40
	takecoins 8888
	jump .loop

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 17, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "PIKACHU    2222@"
	db "PORYGON    5555@"
	db "LUPONCHO   8888@"
	db "ZURÜCK@"
	
DummyVendorScript:
	end
	
AlreadyHaveDecorItemTextKanto:
	text "Du besitzt dieses"
	line "Item bereits."
	done
	
	
SendItemToHomePCTextKanto:
	text "Dieses Item an"
	line "den PC in deinem"
	cont "Zimmer senden?"
	done

KantoGameCornerPrizeRoomGentlemanText:
	text "Ich wollte ein"
	line "PORYGON, aber mir"
	cont "fehlten 100"
	cont "Münzen…"
	done

KantoGameCornerPrizeRoomPharmacistText:
	text "Puh…"

	para "Ich muss ruhig"
	line "Blut bewahren…"

	para "Wenn ich nervös"
	line "werde, könnte ich"
	cont "mein ganzes Geld"
	cont "verlieren…"
	done

KantoPrizeRoom_PrizeVendorIntroText:
	text "Willkommen!"

	para "Wir tauschen deine"
	line "Münzen ein gegen"
	cont "fabelhafte Preise!"
	done

KantoPrizeRoom_AskWhichPrizeText:
	text "Welchen Preis"
	line "hättest du gerne?"
	done

KantoPrizeRoom_ConfirmPurchaseText:
	text "Du willst also"
	line "@"
	text_ram wStringBuffer3
	text "?"
	done

KantoPrizeRoom_HereYouGoText:
	text "Hier, bitte sehr!"
	done

KantoPrizeRoom_NotEnoughCoinsText:
	text "Du hast nicht"
	line "genug Münzen."
	done

KantoPrizeRoom_NotEnoughRoomText:
	text "Du hast dafür"
	line "keinen Platz."
	done

KantoPrizeRoom_ComeAgainText:
	text "Oh. Komm bitte"
	line "mit Münzen wieder!"
	done

KantoPrizeRoom_NoCoinCaseText:
	text "Ach, du hast"
	line "keinen MÜNZKORB?"
	done

KantoGameCornerPrizeRoom_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KANTO_REGION, 7
	warp_event  5,  7, KANTO_REGION, 7

	db 0 ; coord events

	db 3 ; bg events
	bg_event  2,  2, BGEVENT_READ, KantoGameCornerPrizeRoomTMVendor
	bg_event  4,  2, BGEVENT_READ, KantoGameCornerPrizeRoomPokemonVendor
	bg_event  6,  2, BGEVENT_READ, KantoGameCornerDecorVendorScript

	db 5 ; object events
	object_event  0,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, KantoGameCornerPrizeRoomGentlemanScript, -1
	object_event  8,  4, SPRITE_PHARMACIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KantoGameCornerPrizeRoomPharmacistScript, -1
	object_event  2,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, DummyVendorScript, -1
	object_event  4,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, DummyVendorScript, -1
	object_event  6,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, DummyVendorScript, -1
