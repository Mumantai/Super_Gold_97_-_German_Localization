	object_const_def ; object_event constants
	const BOARDWALKGAMECORNER_CLERK
	const BOARDWALKGAMECORNER_RECEPTIONIST1
	const BOARDWALKGAMECORNER_RECEPTIONIST2
	const BOARDWALKGAMECORNER_PHARMACIST1
	const BOARDWALKGAMECORNER_PHARMACIST2
	const BOARDWALKGAMECORNER_POKEFAN_M1
	const BOARDWALKGAMECORNER_COOLTRAINER_M
	const BOARDWALKGAMECORNER_POKEFAN_F
	const BOARDWALKGAMECORNER_COOLTRAINER_F
	const BOARDWALKGAMECORNER_GENTLEMAN
	const BOARDWALKGAMECORNER_POKEFAN_M2
	const BOARDWALKGAMECORNER_RECEPTIONIST3
	const BOARDWALKGAMECORNER_MOVETUTOR

BoardwalkGameCorner_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .MoveTutor

.MoveTutor:
	checkitem COIN_CASE
	iffalse .move_tutor_inside
	checkcode VAR_WEEKDAY
	ifequal WEDNESDAY, .move_tutor_outside
	ifequal SATURDAY, .move_tutor_outside
.move_tutor_inside
	appear BOARDWALKGAMECORNER_MOVETUTOR
	return

.move_tutor_outside
	checkflag ENGINE_DAILY_MOVE_TUTOR
	iftrue .finish
	disappear BOARDWALKGAMECORNER_MOVETUTOR
.finish
	return


BoardwalkGameCornerCoinVendorScript:
	jumpstd GameCornerCoinVendorScript
	
;--------------------------------------

BoardwalkGameCornerDecorVendorScript:
	faceplayer
	opentext
	writetext BoardwalkGameCornerPrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse BoardwalkGameCornerPrizeVendor_NoCoinCaseScript
BoardwalkGameCornerDecorVendor_LoopScript:
	writetext BoardwalkGameCornerPrizeVendorWhichPrizeText
	special DisplayCoinCaseBalance
	loadmenu BoardwalkGameCornerDecorVendorMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Bed
	ifequal 2, .Carpet
	ifequal 3, .Plant
	jump BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	
.Bed
	special DisplayCoinCaseBalance
	loadmenu BoardwalkGameCornerBedsVendorMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Pink
	ifequal 2, .Polkadot
	ifequal 3, .Pikachu
	jump BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	
.Pink
	checkcoins 1800
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	writetext SendItemToHomePCText
	yesorno
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	checkevent EVENT_DECO_BED_2
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_BED_2
	takecoins 1800
	jump BoardwalkGameCornerDecorVendor_FinishScript
	end
	
.Polkadot
	checkcoins 1800
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	writetext SendItemToHomePCText
	yesorno
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	checkevent EVENT_DECO_BED_3
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_BED_3
	takecoins 1800
	jump BoardwalkGameCornerDecorVendor_FinishScript
	end

.Pikachu
	checkcoins 1800
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	writetext SendItemToHomePCText
	yesorno
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	checkevent EVENT_DECO_BED_4
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_BED_4
	takecoins 1800
	jump BoardwalkGameCornerDecorVendor_FinishScript
	end

.Carpet
	special DisplayCoinCaseBalance
	loadmenu BoardwalkGameCornerCarpetVendorMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .BlueCarpet
	ifequal 2, .YellowCarpet
	ifequal 3, .GreenCarpet
	jump BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	
.BlueCarpet
	checkcoins 1800
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	writetext SendItemToHomePCText
	yesorno
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	checkevent EVENT_DECO_CARPET_2
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_CARPET_2
	takecoins 1800
	jump BoardwalkGameCornerDecorVendor_FinishScript
	end
	
.YellowCarpet
	checkcoins 1800
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	writetext SendItemToHomePCText
	yesorno
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	checkevent EVENT_DECO_CARPET_3
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_CARPET_3
	takecoins 1800
	jump BoardwalkGameCornerDecorVendor_FinishScript
	end

.GreenCarpet
	checkcoins 1800
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	writetext SendItemToHomePCText
	yesorno
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	checkevent EVENT_DECO_CARPET_4
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_CARPET_4
	takecoins 1800
	jump BoardwalkGameCornerDecorVendor_FinishScript
	end

.Plant
	special DisplayCoinCaseBalance
	loadmenu BoardwalkGameCornerPlantVendorMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Magna
	ifequal 2, .Tropic
	ifequal 3, .Jumbo
	jump BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	
.Magna
	checkcoins 1800
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	writetext SendItemToHomePCText
	yesorno
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	checkevent EVENT_DECO_PLANT_1
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_PLANT_1
	takecoins 1800
	jump BoardwalkGameCornerDecorVendor_FinishScript
	end
	
.Tropic
	checkcoins 1800
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	writetext SendItemToHomePCText
	yesorno
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	checkevent EVENT_DECO_PLANT_2
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_PLANT_2
	takecoins 1800
	jump BoardwalkGameCornerDecorVendor_FinishScript
	end

.Jumbo
	checkcoins 1800
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	writetext SendItemToHomePCText
	yesorno
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	checkevent EVENT_DECO_PLANT_3
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_PLANT_3
	takecoins 1800
	jump BoardwalkGameCornerDecorVendor_FinishScript
	end
	
.AlreadyHaveDecorItem
	writetext AlreadyHaveDecorItemText
	waitbutton
	jump BoardwalkGameCornerDecorVendor_LoopScript

	
BoardwalkGameCornerDecorVendor_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext BoardwalkGameCornerPrizeVendorHereYouGoText
	waitbutton
	jump BoardwalkGameCornerDecorVendor_LoopScript
	
BoardwalkGameCornerPlantVendorMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "BAUMPFLANZE  1800@"
	db "TROPENPFL.   1800@"
	db "RIESENPFL.   1800@"
	db "ZURÜCK@"

BoardwalkGameCornerCarpetVendorMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "BLAU         1800@"
	db "GELB         1800@"
	db "GRÜN         1800@"
	db "ZURÜCK@"

BoardwalkGameCornerBedsVendorMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "ROSA         1800@"
	db "GEPUNKTET    1800@"
	db "PIKACHU      1800@"
	db "ZURÜCK@"
	
BoardwalkGameCornerDecorVendorMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "BETT@"
	db "TEPPICH@"
	db "PFLANZE@"
	db "ZURÜCK@"

;--------------------------------------

BoardwalkGameCornerTMVendorScript:
	faceplayer
	opentext
	writetext BoardwalkGameCornerPrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse BoardwalkGameCornerPrizeVendor_NoCoinCaseScript
	writetext BoardwalkGameCornerPrizeVendorWhichPrizeText
BoardwalkGameCornerTMVendor_LoopScript:
	special DisplayCoinCaseBalance
	loadmenu BoardwalkGameCornerTMVendorMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Poison
	ifequal 2, .Heart
	ifequal 3, .Moon
	jump BoardwalkGameCornerPrizeVendor_CancelPurchaseScript

.Poison:
	checkcoins 800
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext POISON_STONE, MEM_BUFFER_0
	scall BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	giveitem POISON_STONE
	iffalse BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 800
	jump BoardwalkGameCornerTMVendor_FinishScript

.Heart:
	checkcoins 800
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext HEART_STONE, MEM_BUFFER_0
	scall BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	giveitem HEART_STONE
	iffalse BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 800
	jump BoardwalkGameCornerTMVendor_FinishScript

.Moon:
	checkcoins 800
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext MOON_STONE, MEM_BUFFER_0
	scall BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	giveitem MOON_STONE
	iffalse BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 800
	jump BoardwalkGameCornerTMVendor_FinishScript

BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript:
	writetext BoardwalkGameCornerPrizeVendorConfirmPrizeText
	yesorno
	end

BoardwalkGameCornerTMVendor_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext BoardwalkGameCornerPrizeVendorHereYouGoText
	waitbutton
	jump BoardwalkGameCornerTMVendor_LoopScript

BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript:
	writetext BoardwalkGameCornerPrizeVendorNeedMoreCoinsText
	waitbutton
	closetext
	end

BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript:
	writetext BoardwalkGameCornerPrizeVendorNoMoreRoomText
	waitbutton
	closetext
	end

BoardwalkGameCornerPrizeVendor_CancelPurchaseScript:
	writetext BoardwalkGameCornerPrizeVendorQuitText
	waitbutton
	closetext
	end

BoardwalkGameCornerPrizeVendor_NoCoinCaseScript:
	writetext BoardwalkGameCornerPrizeVendorNoCoinCaseText
	waitbutton
	closetext
	end

BoardwalkGameCornerTMVendorMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "GIFTSTEIN     800@"
	db "HERZSTEIN     800@"
	db "MONDSTEIN     800@"
	db "ZURÜCK@"

BoardwalkGameCornerPrizeMonVendorScript:
	faceplayer
	opentext
	writetext BoardwalkGameCornerPrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse BoardwalkGameCornerPrizeVendor_NoCoinCaseScript
.loop
	writetext BoardwalkGameCornerPrizeVendorWhichPrizeText
	special DisplayCoinCaseBalance
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .abra
	ifequal 2, .cubone
	ifequal 3, .bipulla
	jump BoardwalkGameCornerPrizeVendor_CancelPurchaseScript

.abra
	checkcoins 100
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript
	pokenamemem ABRA, MEM_BUFFER_0
	scall BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext BoardwalkGameCornerPrizeVendorHereYouGoText
	waitbutton
	writebyte ABRA
	special GameCornerPrizeMonCheckDex
	givepoke ABRA, 5
	takecoins 100
	jump .loop

.cubone
	checkcoins 800
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript
	pokenamemem CUBONE, MEM_BUFFER_0
	scall BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext BoardwalkGameCornerPrizeVendorHereYouGoText
	waitbutton
	writebyte CUBONE
	special GameCornerPrizeMonCheckDex
	givepoke CUBONE, 15
	takecoins 800
	jump .loop

.bipulla
	checkcoins 1500
	ifequal HAVE_LESS, BoardwalkGameCornerPrizeVendor_NotEnoughCoinsScript
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, BoardwalkGameCornerPrizeMonVendor_NoRoomForPrizeScript
	pokenamemem BIPULLA, MEM_BUFFER_0
	scall BoardwalkGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse BoardwalkGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext BoardwalkGameCornerPrizeVendorHereYouGoText
	waitbutton
	writebyte BIPULLA
	special GameCornerPrizeMonCheckDex
	givepoke BIPULLA, 15
	takecoins 1500
	jump .loop

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 17, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "ABRA        100@"
	db "TRAGOSSO    800@"
	db "ZWILLIST   1500@"
	db "ZURÜCK@"

BoardwalkGameCornerPharmacistScript:
	faceplayer
	opentext
	writetext BoardwalkGameCornerPharmacistText
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

BoardwalkGameCornerPokefanM1Script:
	faceplayer
	opentext
	writetext BoardwalkGameCornerPokefanM1Text
	waitbutton
	closetext
	turnobject BOARDWALKGAMECORNER_POKEFAN_M1, RIGHT
	end

BoardwalkGameCornerCooltrainerMScript:
	faceplayer
	opentext
	writetext BoardwalkGameCornerCooltrainerMText
	waitbutton
	closetext
	turnobject BOARDWALKGAMECORNER_COOLTRAINER_M, LEFT
	end

BoardwalkGameCornerPokefanFScript:
	faceplayer
	opentext
	writetext BoardwalkGameCornerPokefanFText
	waitbutton
	closetext
	turnobject BOARDWALKGAMECORNER_POKEFAN_F, RIGHT
	end

BoardwalkGameCornerCooltrainerFScript:
	jumptextfaceplayer BoardwalkGameCornerCooltrainerFText

BoardwalkGameCornerGentlemanScript:
	faceplayer
	opentext
	writetext BoardwalkGameCornerGentlemanText
	waitbutton
	closetext
	turnobject BOARDWALKGAMECORNER_GENTLEMAN, RIGHT
	end

BoardwalkGameCornerPokefanM2Script:
	jumptextfaceplayer BoardwalkGameCornerPokefanM2Text

BoardwalkGameCornerLeftTheirDrinkScript:
	jumptext BoardwalkGameCornerLeftTheirDrinkText

BoardwalkGameCornerSlotsMachineScript:
	random 6
	ifequal 0, BoardwalkGameCornerLuckySlotsMachineScript
	refreshscreen
	writebyte FALSE
	special SlotMachine
	closetext
	end

BoardwalkGameCornerLuckySlotsMachineScript:
	refreshscreen
	writebyte TRUE
	special SlotMachine
	closetext
	end

BoardwalkGameCornerCardFlipMachineScript:
	refreshscreen
	special CardFlip
	closetext
	end
	
MoveTutorInsideScript:
	faceplayer
	opentext
	writetext MoveTutorInsideText
	waitbutton
	closetext
	turnobject BOARDWALKGAMECORNER_MOVETUTOR, RIGHT
	end
	
AlreadyHaveDecorItemText:
	text "Du besitzt dieses"
	line "Item bereits."
	done
	
SendItemToHomePCText:
	text "Dieses Item an"
	line "den PC in deinem"
	cont "Zimmer senden?
	done

BoardwalkGameCornerPrizeVendorIntroText:
	text "Willkommen!"

	para "Wir tauschen deine"
	line "Münzen ein gegen"
	cont "fabelhafte Preise!"
	done

BoardwalkGameCornerPrizeVendorWhichPrizeText:
	text "Welchen Preis"
	line "hättest du gerne?"
	done

BoardwalkGameCornerPrizeVendorConfirmPrizeText:
	text "Du willst also"
	line "@"
	text_ram wStringBuffer3
	text "?"
	done

BoardwalkGameCornerPrizeVendorHereYouGoText:
	text "Hier, bitte sehr!"
	done

BoardwalkGameCornerPrizeVendorNeedMoreCoinsText:
	text "Du hast nicht"
	line "genug Münzen."
	done

BoardwalkGameCornerPrizeVendorNoMoreRoomText:
	text "Du hast dafür"
	line "keinen Platz."
	done

BoardwalkGameCornerPrizeVendorQuitText:
	text "Oh. Komm bitte"
	line "mit Münzen wieder!"
	done

BoardwalkGameCornerPrizeVendorNoCoinCaseText:
	text "Ach, du hast"
	line "keinen MÜNZKORB?"
	done

BoardwalkGameCornerPharmacistText:
	text "Ich spiele nur an"
	line "diesem Automaten."

	para "Ich glaube, er"
	line "spuckt mehr aus"

	para "als die anderen."
	done

BoardwalkGameCornerPokefanM1Text:
	text "Ich liebe diesen"
	line "neuen Automaten."

	para "Er stellt genau"
	line "die richtige He-"
	cont "rausforderung dar."
	done

BoardwalkGameCornerCooltrainerMText:
	text "Das Leben ist ein"
	line "Spiel. Ich werde"
	cont "Karten spielen,"
	cont "bis ich umfalle!"
	done

BoardwalkGameCornerPokefanFText:
	text "Karten…"
	para "Ich ziehe sie den"
	line "Automaten vor,"

	para "weil man seine"
	line "Chancen besser ab-"
	cont "schätzen kann."

	para "Aber der Gewinn"
	line "ist viel geringer."
	done

BoardwalkGameCornerCooltrainerFText:
	text "Ich höre erst auf,"
	line "wenn ich gewinne!"
	done

BoardwalkGameCornerGentlemanText:
    text "Ich habe mein"
    line "#MON mit einem"
    para "GIFTSTEIN ent-"
    line "wickeln lassen."

	para "Es hat zwar gedau-"
	line "ert, bis ich genug"

	para "Münzen hatte, aber"
	line "es hat sich ge-"
	cont "lohnt."
	done

BoardwalkGameCornerPokefanM2Text:
	text "Ich hatte an den"
	line "Automaten kein"

	para "Glück. Bei den"
	line "Karten sieht es"

	para "auch nicht anders"
	line "aus…"

	para "Ich bin zu viele"
	line "Risiken eingegang-"
	cont "en und keines war"
	cont "es wert."
	done

MoveTutorInsideText:
	text "Wahaha! Die Münzen"
	line "fallen weiter!"
	done

BoardwalkGameCornerLeftTheirDrinkText:
	text "Jemand hat sein"
	line "Getränk stehen"

	para "lassen. Es riecht"
	line "süß!"
	done

BoardwalkGameCorner_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 10, 13, BOARDWALK, 7
	warp_event 11, 13, BOARDWALK, 8

	db 0 ; coord events

	db 31 ; bg events
	bg_event  6,  6, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event  6,  7, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event  6,  8, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event  6,  9, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event  6, 10, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event  6, 11, BGEVENT_RIGHT, BoardwalkGameCornerSlotsMachineScript
	bg_event  7,  6, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event  7,  7, BGEVENT_READ, BoardwalkGameCornerLuckySlotsMachineScript
	bg_event  7,  8, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event  7,  9, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event  7, 10, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event  7, 11, BGEVENT_LEFT, BoardwalkGameCornerSlotsMachineScript
	bg_event 12,  6, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event 12,  7, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event 12,  8, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event 12,  9, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event 12, 10, BGEVENT_READ, BoardwalkGameCornerSlotsMachineScript
	bg_event 12, 11, BGEVENT_RIGHT, BoardwalkGameCornerSlotsMachineScript
	bg_event 13,  6, BGEVENT_READ, BoardwalkGameCornerCardFlipMachineScript
	bg_event 13,  7, BGEVENT_READ, BoardwalkGameCornerCardFlipMachineScript
	bg_event 13,  8, BGEVENT_READ, BoardwalkGameCornerCardFlipMachineScript
	bg_event 13,  9, BGEVENT_READ, BoardwalkGameCornerCardFlipMachineScript
	bg_event 13, 10, BGEVENT_READ, BoardwalkGameCornerCardFlipMachineScript
	bg_event 13, 11, BGEVENT_LEFT, BoardwalkGameCornerCardFlipMachineScript
	bg_event 18,  6, BGEVENT_READ, BoardwalkGameCornerCardFlipMachineScript
	bg_event 18,  7, BGEVENT_READ, BoardwalkGameCornerCardFlipMachineScript
	bg_event 18,  8, BGEVENT_READ, BoardwalkGameCornerCardFlipMachineScript
	bg_event 18,  9, BGEVENT_READ, BoardwalkGameCornerCardFlipMachineScript
	bg_event 18, 10, BGEVENT_READ, BoardwalkGameCornerCardFlipMachineScript
	bg_event 18, 11, BGEVENT_RIGHT, BoardwalkGameCornerCardFlipMachineScript
	bg_event 13,  1, BGEVENT_LEFT, BoardwalkGameCornerLeftTheirDrinkScript

	db 13 ; object events
	object_event  3,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerCoinVendorScript, -1
	object_event 16,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerTMVendorScript, -1
	object_event 18,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerPrizeMonVendorScript, -1
	object_event  8,  7, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerPharmacistScript, -1
	object_event  8,  7, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, NITE, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerPharmacistScript, -1
	object_event 11, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerPokefanM1Script, -1
	object_event 14,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerCooltrainerMScript, -1
	object_event 17,  6, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerPokefanFScript, -1
	object_event 10,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerCooltrainerFScript, -1
	object_event  5, 10, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerGentlemanScript, -1
	object_event  2,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerPokefanM2Script, -1
	object_event 14,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, BoardwalkGameCornerDecorVendorScript, -1
	object_event  5,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MoveTutorInsideScript, EVENT_BOARDWALK_GAME_CORNER_MOVE_TUTOR
