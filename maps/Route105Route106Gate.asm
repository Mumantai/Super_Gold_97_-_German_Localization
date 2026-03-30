	object_const_def ; object_event constants
	const ROUTE105ROUTE106GATE_OFFICER
	const ROUTE105ROUTE106GATE_ROCKER
	const ROUTE105ROUTE106GATE_CLERK

Route105Route106Gate_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .DollWednesday

.DollWednesday:
	checkcode VAR_WEEKDAY
	ifequal WEDNESDAY, .DollWednesdayAppears
	disappear ROUTE105ROUTE106GATE_CLERK
	return

.DollWednesdayAppears:
	appear ROUTE105ROUTE106GATE_CLERK
	return


Route105Route106GateOfficerScript:
	jumptextfaceplayer Route105Route106GateOfficerText
	
Route105Route106GateRockerScript:
	jumptextfaceplayer Route105Route106GateRockerText


;-------------
	
TravelingDollSalesmanWednesday:
	faceplayer
	opentext
	writetext DollSalesmanTextWednesday
	waitbutton
DollSalesmanWednesday_LoopScript:
	writetext DollSalesmanTextWednesday_AskWhichPrizeText
	special PlaceMoneyTopRight
	loadmenu DollSalesmanWednesdayMenu
	verticalmenu
	closewindow
	ifequal 1, .Doll1
	ifequal 2, .Doll2
	ifequal 3, .Doll3
	jump DollSalesmanWednesday_Cancel
	
.Doll1
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanWednesdayNoMoney
	writetext SendItemToPCTextDollWednesday
	yesorno
	iffalse DollSalesmanWednesday_Cancel
	checkevent EVENT_DECO_SQUIRTLE_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_SQUIRTLE_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanWednesday_FinishScript
	end
	
.Doll2
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanWednesdayNoMoney
	writetext SendItemToPCTextDollWednesday
	yesorno
	iffalse DollSalesmanWednesday_Cancel
	checkevent EVENT_DECO_MAGIKARP_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_MAGIKARP_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanWednesday_FinishScript
	end
	
.Doll3
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanWednesdayNoMoney
	writetext SendItemToPCTextDollWednesday
	yesorno
	iffalse DollSalesmanWednesday_Cancel
	checkevent EVENT_DECO_ODDISH_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_ODDISH_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanWednesday_FinishScript
	end
	
.AlreadyHaveDecorItem
	writetext AlreadyHaveDecorItemTextSalesmanWednesday
	waitbutton
	jump DollSalesmanWednesday_LoopScript

	
DollSalesmanWednesdayMenu:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "SCHIGGY     ¥5000@"
	db "KARPADOR    ¥5000@"
	db "MYRAPLA     ¥5000@"
	db "ZURÜCK@"
	
DollSalesmanWednesday_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext DollSalesmanWednesday_HereYouGoText
	waitbutton
	jump DollSalesmanWednesday_LoopScript

DollSalesmanWednesday_Cancel:
	writetext DollSalesmanWednesdayComeAgain
	waitbutton
	closetext
	end

	
DollSalesmanWednesdayNoMoney:
	writetext DollSalesmanWednesdayNoMoneyText
	waitbutton
	closetext
	end
	
SendItemToPCTextDollWednesday:
    text "Die PUPPE an den"
    line "PC schicken?"
	done

AlreadyHaveDecorItemTextSalesmanWednesday:
    text "Du hast diese"
    line "PUPPE bereits!"
	done

DollSalesmanWednesday_HereYouGoText:
	text "Hier, bitte schön!"
	done
	
DollSalesmanWednesdayComeAgain:
    text "Ich hoffe, wir"
    line "sehen uns bald"
    cont "wieder irgendwo!"
	done
	
DollSalesmanWednesdayNoMoneyText:
    text "Tut mir leid, du"
    line "hast nicht genug"
    line "Geld!"
	done
	
DollSalesmanTextWednesday:
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
	
DollSalesmanTextWednesday_AskWhichPrizeText:
    text "Also, welche PUPPE"
    line "hättest du gerne?"
	done
	
;---------------------------------


Route105Route106GateOfficerText:
    text "Der JADEWALD ist"
    line "ein mysteriöses"
    cont "Gebiet."

    para "Behandle ihn stets"
    line "mit Respekt."
	done

Route105Route106GateRockerText:
    text "Ich mache gerne"
    line "friedliche"
    para "Spaziergänge im"
    line "JADEWALD."

    para "Sobald man sich da"
    line "auskennt, ist er"
    cont "auch nicht mehr so"
    cont "gruselig."
	done

Route105Route106Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_105, 1
	warp_event  5,  0, ROUTE_105, 2
	warp_event  4,  7, ROUTE_106, 1
	warp_event  5,  7, ROUTE_106, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, Route105Route106GateOfficerScript, -1
	object_event  6,  3, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, Route105Route106GateRockerScript, -1
	object_event  3,  2, SPRITE_CLERK, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, TravelingDollSalesmanWednesday, EVENT_DOLL_SALESMAN_WEDNESDAY

