	object_const_def ; object_event constants
	const WESTPORTPORTPASSAGE_POKEFAN_M
	const WESTPORTPORTPASSAGE_GRAMPS
	const WESTPORTPORTPASSAGE_ABRA
	const WESTPORTPORTPASSAGE_CLERK

WestportPortPassage_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .DollMonday

.DollMonday:
	checkcode VAR_WEEKDAY
	ifequal MONDAY, .DollMondayAppears
	disappear WESTPORTPORTPASSAGE_CLERK
	return

.DollMondayAppears:
	appear WESTPORTPORTPASSAGE_CLERK
	return

WestportPortPassagePokefanMScript:
	jumptextfaceplayer WestportPortPassagePokefanMText
	
;-------------
	
TravelingDollSalesmanMonday:
	faceplayer
	opentext
	writetext DollSalesmanTextMonday
	waitbutton
DollSalesmanMonday_LoopScript:
	writetext DollSalesmanTextMonday_AskWhichPrizeText
	special PlaceMoneyTopRight
	loadmenu DollSalesmanMondayMenu
	verticalmenu
	closewindow
	ifequal 1, .Doll1
	ifequal 2, .Doll2
	ifequal 3, .Doll3
	jump DollSalesmanMonday_Cancel
	
.Doll1
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanMondayNoMoney
	writetext SendItemToPCTextDollMonday
	yesorno
	iffalse DollSalesmanMonday_Cancel
	checkevent EVENT_DECO_SURFING_PIKACHU_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_SURFING_PIKACHU_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanMonday_FinishScript
	end
	
.Doll2
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanMondayNoMoney
	writetext SendItemToPCTextDollMonday
	yesorno
	iffalse DollSalesmanMonday_Cancel
	checkevent EVENT_DECO_JIGGLYPUFF_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_JIGGLYPUFF_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanMonday_FinishScript
	end
	
.Doll3
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanMondayNoMoney
	writetext SendItemToPCTextDollMonday
	yesorno
	iffalse DollSalesmanMonday_Cancel
	checkevent EVENT_DECO_BULBASAUR_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_BULBASAUR_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanMonday_FinishScript
	end
	
.AlreadyHaveDecorItem
	writetext AlreadyHaveDecorItemTextSalesmanMonday
	waitbutton
	jump DollSalesmanMonday_LoopScript

	
DollSalesmanMondayMenu:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "QUAPPO      ¥5000@"
	db "PUMMELUFF   ¥5000@"
	db "BISASAM     ¥5000@"
	db "ZURÜCK@"
	
DollSalesmanMonday_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext DollSalesmanMonday_HereYouGoText
	waitbutton
	jump DollSalesmanMonday_LoopScript

DollSalesmanMonday_Cancel:
	writetext DollSalesmanMondayComeAgain
	waitbutton
	closetext
	end

	
DollSalesmanMondayNoMoney:
	writetext DollSalesmanMondayNoMoneyText
	waitbutton
	closetext
	end
	
SendItemToPCTextDollMonday:
    text "Die PUPPE an den"
    line "PC schicken?"
	done

AlreadyHaveDecorItemTextSalesmanMonday:
    text "Du hast diese"
    line "PUPPE bereits!"
	done

DollSalesmanMonday_HereYouGoText:
	text "Hier, bitte schön!"
	done
	
DollSalesmanMondayComeAgain:
    text "Ich hoffe, wir"
    line "sehen uns bald"
    cont "wieder irgendwo!"
	done
	
DollSalesmanMondayNoMoneyText:
    text "Tut mir leid, du"
    line "hast nicht genug"
    line "Geld!"
	done
	
DollSalesmanTextMonday:
    text "Hey!"

    para "Ich bin ein rei-"
    line "sender PUPPEN-"
    cont "Händler!"

    para "Was das heißt?"

    para "Das heißt, dass"
    line "ich derjenige bin,"
    para "mit dem du sprichst,"
    line "wenn du dein Zimmer"
    cont "aufpeppen willst!"

    para "Mein Angebot und"
    line "mein Standort"
    para "wechseln täglich,"
    line "also halte deine"
    cont "Augen offen!"
	done
	
DollSalesmanTextMonday_AskWhichPrizeText:
    text "Also, welche PUPPE"
    line "hättest du gerne?"
	done
	
;---------------------------------
	
TeleportGuyScript2:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_WESTPORT_WARP_GUY
	iftrue .SkipTeleportTextWest
	writetext TeleportGuyText12
	buttonsound
	setevent EVENT_TALKED_TO_WESTPORT_WARP_GUY
.SkipTeleportTextWest
	writetext TeleportGuyText12_2	
	yesorno
	iffalse .No2
	writetext TeleportGuyYesText2
	waitbutton
	closetext
	playsound SFX_WARP_TO
	special FadeBlackQuickly
	waitsfx
	warp AMAMI_PORT_PASSAGE, 13, 2
	end

.No2:
	writetext TeleportGuyNoText2
	waitbutton
	closetext
	end

AbraScript2:
	opentext
	writetext AbraText2
	cry ABRA
	waitbutton
	closetext
	end


	

TeleportGuyText12:
    text "Fährst du nicht"
    line "gerne Boot?"

    para "Oder fährt es"
    line "heute nicht?"

    para "Schau mal hier!"

    para "Mein ABRA kann"
    line "dich im Nu auf die"
    cont "INSELN bringen!"

    para "Ich habe einen"
    line "Kumpel, der an den"
    para "AMAMIA-DOCKS steht"
    line "und wartet."

    para "Ich bringe dich zu"
    line "ihm!"

    para "Na, wie wär's?"
    done
	
TeleportGuyText12_2:
	text "Möchtest du nach"
	line "AMAMIA?"
	done

TeleportGuyYesText2:
	text "OK, OK. Stell dir"
	line "AMAMIA in deinem"
	cont "Kopf vor…"
	done

TeleportGuyNoText2:
	text "OK, OK. Ich warte"
	line "hier!"
	done

AbraText2:
	text "ABRA: Aabra…"
	done


WestportPortPassagePokefanMText:
	text "Die M.S. AQUA"
	line "fährt immer"
	para "montags und"
	line "freitags nach"
	cont "AMAMIA."
	done

WestportPortPassage_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 19,  4, WESTPORT_CITY, 14
	warp_event 19,  5, WESTPORT_CITY, 15
	warp_event 15,  4, WESTPORT_PORT_PASSAGE, 4
	warp_event  3,  2, WESTPORT_PORT_PASSAGE, 3
	warp_event  3, 14, WESTPORT_PORT, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event 18,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, WestportPortPassagePokefanMScript, EVENT_WESTPORT_PORT_PASSAGE_POKEFAN_M
	object_event 13,  1, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TeleportGuyScript2, EVENT_TELEPORT_GUY
	object_event 14,  1, SPRITE_JYNX, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AbraScript2, EVENT_TELEPORT_GUY
	object_event  1, 10, SPRITE_CLERK, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, TravelingDollSalesmanMonday, EVENT_DOLL_SALESMAN_MONDAY
