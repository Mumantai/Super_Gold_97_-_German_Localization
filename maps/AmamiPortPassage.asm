	object_const_def ; object_event constants
	const AMAMIPORTPASSAGE_TEACHER
	const AMAMIPORTPASSAGE_GRAMPS
	const AMAMIPORTPASSAGE_ABRA
	const AMAMIPORTPASSAGE_CLERK

AmamiPortPassage_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .DollFriday

.DollFriday:
	checkcode VAR_WEEKDAY
	ifequal FRIDAY, .DollFridayAppears
	disappear AMAMIPORTPASSAGE_CLERK
	return

.DollFridayAppears:
	appear AMAMIPORTPASSAGE_CLERK
	return
	

;-------------
	
TravelingDollSalesmanFriday:
	faceplayer
	opentext
	writetext DollSalesmanTextFriday
	waitbutton
DollSalesmanFriday_LoopScript:
	writetext DollSalesmanTextFriday_AskWhichPrizeText
	special PlaceMoneyTopRight
	loadmenu DollSalesmanFridayMenu
	verticalmenu
	closewindow
	ifequal 1, .Doll1
	ifequal 2, .Doll2
	ifequal 3, .Doll3
	jump DollSalesmanFriday_Cancel
	
.Doll1
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanFridayNoMoney
	writetext SendItemToPCTextDollFriday
	yesorno
	iffalse DollSalesmanFriday_Cancel
	checkevent EVENT_DECO_VOLTORB_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_VOLTORB_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanFriday_FinishScript
	end
	
.Doll2
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanFridayNoMoney
	writetext SendItemToPCTextDollFriday
	yesorno
	iffalse DollSalesmanFriday_Cancel
	checkevent EVENT_DECO_WEEDLE_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_WEEDLE_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanFriday_FinishScript
	end
	
.Doll3
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanFridayNoMoney
	writetext SendItemToPCTextDollFriday
	yesorno
	iffalse DollSalesmanFriday_Cancel
	checkevent EVENT_DECO_GEODUDE_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_GEODUDE_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanFriday_FinishScript
	end
	
.AlreadyHaveDecorItem
	writetext AlreadyHaveDecorItemTextSalesmanFriday
	waitbutton
	jump DollSalesmanFriday_LoopScript

	
DollSalesmanFridayMenu:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "VOLTOBALL   ¥5000@"
	db "HORNLIU     ¥5000@"
	db "KLEINSTEIN  ¥5000@"
	db "ZURÜCK@"
	
DollSalesmanFriday_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext DollSalesmanFriday_HereYouGoText
	waitbutton
	jump DollSalesmanFriday_LoopScript

DollSalesmanFriday_Cancel:
	writetext DollSalesmanFridayComeAgain
	waitbutton
	closetext
	end

	
DollSalesmanFridayNoMoney:
	writetext DollSalesmanFridayNoMoneyText
	waitbutton
	closetext
	end
	
SendItemToPCTextDollFriday:
    text "Die PUPPE an den"
    line "PC schicken?"
	done

AlreadyHaveDecorItemTextSalesmanFriday:
    text "Du hast diese"
    line "PUPPE bereits!"
	done

DollSalesmanFriday_HereYouGoText:
	text "Hier, bitte schön!"
	done
	
DollSalesmanFridayComeAgain:
    text "Ich hoffe, wir"
    line "sehen uns bald"
    cont "wieder irgendwo!"
	done
	
DollSalesmanFridayNoMoneyText:
    text "Tut mir leid, du"
    line "hast nicht genug"
    line "Geld!"
	done
	
DollSalesmanTextFriday:
    text "Hey!"

    para "Ich bin ein rei-"
    line "sender PUPPEN-"
    cont "Händler!"

    para "Was das heißt?"

    para "Das soll heißen,"
    line "ich bin dein"
    para "Ansprechpartner,"
    line "wenn es darum"
    cont "geht, dein Zimmer"
    cont "aufzupeppen!"

    para "Mein Angebot und"
    line "mein Standort"
    para "wechseln täglich,"
    line "also halte deine"
    cont "Augen offen!"
	done
	
DollSalesmanTextFriday_AskWhichPrizeText:
    text "Also, welche PUPPE"
    line "hättest du gerne?"
	done
	
;---------------------------------



AmamiPortPassageTeacherScript:
	jumptextfaceplayer AmamiPortPassageTeacherText
	
TeleportGuyScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_AMAMI_WARP_GUY
	iftrue .SkipTeleportTextAmami
	writetext TeleportGuyText1
	buttonsound
	setevent EVENT_TALKED_TO_AMAMI_WARP_GUY
.SkipTeleportTextAmami
	writetext TeleportGuyText1_2
	yesorno
	iffalse .No
	writetext TeleportGuyYesText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	special FadeBlackQuickly
	waitsfx
	warp WESTPORT_PORT_PASSAGE, 13, 2
	end

.No:
	writetext TeleportGuyNoText
	waitbutton
	closetext
	end

AbraScript:
	opentext
	writetext AbraText
	cry ABRA
	waitbutton
	closetext
	end


AmamiPortPassageTeacherText:
	text "Die M.S. AQUA"
	line "fährt immer"
	para "mittwochs und"
	line "sonntags nach"
	cont "PORT ABANISHI."
	done
	

TeleportGuyText1:
    text "Fühlst du dich"
    line "nicht danach, das"
    cont "Schiff zu nehmen?"

    para "Oder vielleicht"
    line "fährt es heute"
    line "gar nicht?"

    para "Dann schau mal!"

    para "Mein liebes ABRA"
    line "kann dich im"
    para "Handumdrehen aufs"
    line "Festland bringen!"

    para "Ich habe einen"
    line "Kumpel, der am"
    para "PIER von PORT"
    line "ABANISHI wartet."

    para "Ich schicke dich"
    line "zu ihm!"

    para "Na, wie wär's?"
	done
	
TeleportGuyText1_2:
	text "Möchtest du nach"
	line "PORT ABANISHI?"
	done

TeleportGuyYesText:
	text "O.K. Stell dir"
	line "PORT ABANISHI"
	cont "vor…"
	done

TeleportGuyNoText:
	text "O.K. Alles"
	line "Gute!"
	done

AbraText:
	text "ABRA: Aabra…"
	done


AmamiPortPassage_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 19,  4, AMAMI_TOWN, 1
	warp_event 19,  5, AMAMI_TOWN, 2
	warp_event 15, 14, AMAMI_PORT_PASSAGE, 4
	warp_event 15,  4, AMAMI_PORT_PASSAGE, 3
	warp_event  3, 14, AMAMI_PORT, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event 18,  2, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, AmamiPortPassageTeacherScript, EVENT_TELEPORT_GUY
	object_event 13,  1, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TeleportGuyScript, EVENT_TELEPORT_GUY
	object_event 14,  1, SPRITE_JYNX, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AbraScript, EVENT_TELEPORT_GUY
	object_event  5, 13, SPRITE_CLERK, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, TravelingDollSalesmanFriday, EVENT_DOLL_SALESMAN_FRIDAY
