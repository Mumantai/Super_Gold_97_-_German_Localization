	object_const_def ; object_event constants
	const WESTPORTPORT_SAILOR1
	const WESTPORTPORT_SAILOR3
	const WESTPORTPORT_FISHING_GURU1
	const WESTPORTPORT_FISHING_GURU2
	const WESTPORTPORT_YOUNGSTER
	const WESTPORTPORT_COOLTRAINER_F

WestportPort_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .LeaveFastShip ; SCENE_WESTPORTPORT_LEAVE_SHIP

	db 0 ; callbacks

.DummyScene0:
	end

.LeaveFastShip:
	priorityjump .LeaveFastShipScript
	end

.LeaveFastShipScript:
	applymovement PLAYER, MovementData_0x74a32
	appear WESTPORTPORT_SAILOR1
	setscene SCENE_DEFAULT
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	blackoutmod ALLOY_CITY
	end

WestportPortSailorAtGangwayScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue WestportPortAlreadyRodeScript
	writetext DepartureTimeText
	waitbutton
	closetext
	turnobject WESTPORTPORT_SAILOR1, DOWN
	pause 10
	playsound SFX_EXIT_BUILDING
	disappear WESTPORTPORT_SAILOR1
	waitsfx
	applymovement PLAYER, MovementData_0x74a30
	playsound SFX_EXIT_BUILDING
	special FadeBlackQuickly
	waitsfx
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iffalse .FirstTime
	clearevent EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	setevent EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	clearevent EVENT_BEAT_COOLTRAINERM_SEAN
	clearevent EVENT_BEAT_COOLTRAINERF_CAROL
	clearevent EVENT_BEAT_GENTLEMAN_EDWARD
	clearevent EVENT_BEAT_BEAUTY_CASSIE
	clearevent EVENT_BEAT_PSYCHIC_RODNEY
	clearevent EVENT_BEAT_SUPER_NERD_SHAWN
	clearevent EVENT_BEAT_SAILOR_GARRETT
	clearevent EVENT_BEAT_FISHER_JONAH
	clearevent EVENT_BEAT_BLACKBELT_WAI
.FirstTime:
	clearevent EVENT_FAST_SHIP_DESTINATION_ALLOY
	appear WESTPORTPORT_SAILOR1
	setmapscene FAST_SHIP_1F, SCENE_FASTSHIP1F_ENTER_SHIP
	warp FAST_SHIP_1F, 25, 1
	end

WestportPortSailorAtGangwayScriptTeknos:
	faceplayer
	opentext
	writetext DepartureTimeText
	waitbutton
	closetext
	turnobject WESTPORTPORT_SAILOR1, DOWN
	pause 10
	playsound SFX_EXIT_BUILDING
	disappear WESTPORTPORT_SAILOR1
	waitsfx
	applymovement PLAYER, MovementData_0x74a30
	playsound SFX_EXIT_BUILDING
	special FadeBlackQuickly
	waitsfx
	warpfacing UP, TEKNOS_PORT, 4, 9
	end

WestportPortAlreadyRodeScript:
	writetext SorryCantBoardText
	waitbutton
	closetext
	end

WestportPortWalkUpToShipScript:
	appear WESTPORTPORT_SAILOR1
	turnobject WESTPORTPORT_SAILOR3, RIGHT
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .skip
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .skip
	turnobject PLAYER, LEFT
	checkflag ENGINE_HIVEBADGE
	iftrue WestportPortSailorFerryToTeknosScript
	opentext
	writetext WestportPortSailorBeforeHiveBadgeText
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a34
	end
	
.skip:
	end

WestportPortSailorOriginalScript:
	writetext WelcomeToTheDocksAfterHOF
	loadmenu WestportDocksAfterHOFMenu
	verticalmenu
	closewindow
	ifequal 1, .Teknos
	ifequal 2, .Islands
	jump WestportDocksCancel
.Islands
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iffalse .FirstTime
	checkcode VAR_WEEKDAY
	ifequal SUNDAY, .NextShipMonday
	ifequal SATURDAY, .NextShipMonday
	ifequal TUESDAY, .NextShipFriday
	ifequal WEDNESDAY, .NextShipFriday
	ifequal THURSDAY, .NextShipFriday
.FirstTime:
	writetext AskForTicketText
	buttonsound
	checkitem S_S_TICKET
	iffalse .NoTicket
	writetext FlashTheTicketText
	waitbutton
	closetext
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	applymovement PLAYER, MovementData_0x74a37
	jump WestportPortSailorAtGangwayScript

.NoTicket:
	writetext DontHaveTicketWhoopsText
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a34
	end

.NextShipMonday:
	writetext NoTripsToIslandsTodayText
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a34
	end

.NextShipFriday:
	writetext NoTripsToIslandsToday2Text
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a34
	end

.skip:
	end
	
.Teknos
	writetext WestportPortSailorGoToTeknosText2
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a37
	jump WestportPortSailorAtGangwayScriptTeknos
	end
	
	
WestportDocksAfterHOFMenu:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 3, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "TEKNOPIA CITY@"
	db "SÜDWEST INSELN@"
	db "ZURÜCK@"
	
WestportDocksCancel:
	writetext HopeToSeeYouAgainText
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a34
	end
	
WestportPortSailorFerryToTeknosScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue WestportPortSailorOriginalScript
	writetext WestportPortSailorGoToTeknosText
	yesorno
	iffalse .NotGoing
	writetext WestportPortSailorGoToTeknosText2
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a37
	jump WestportPortSailorAtGangwayScriptTeknos
	end
	
	
.NotGoing:
	writetext WestportPortSailorNotGoingToTeknosText
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a34
	end

WestportPortNotRidingScript:
	writetext HopeToSeeYouAgainText
	waitbutton
	closetext
	end

WestportPortNotRidingMoveAwayScript:
	writetext HopeToSeeYouAgainText
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a34
	end

WestportPortSailorAfterHOFScript:
	faceplayer
	opentext
	jump WestportPortAlreadyRodeScript

WestportPortSailorBeforeHOFScript:

	end



WestportPortFishingGuru1Script:
	faceplayer
	opentext
	writetext WestportPortFishingGuru1Text
	waitbutton
	closetext
	turnobject WESTPORTPORT_FISHING_GURU1, UP
	end

WestportPortFishingGuru2Script:
	faceplayer
	opentext
	writetext WestportPortFishingGuru2Text
	waitbutton
	closetext
	turnobject WESTPORTPORT_FISHING_GURU2, UP
	end

WestportPortYoungsterScript:
	faceplayer
	opentext
	writetext WestportPortYoungsterText
	waitbutton
	closetext
	turnobject WESTPORTPORT_YOUNGSTER, DOWN
	end

WestportPortCooltrainerFScript:
	faceplayer
	opentext
	writetext WestportPortCooltrainerFText
	waitbutton
	closetext
	turnobject WESTPORTPORT_COOLTRAINER_F, DOWN
	end

WestportPortHiddenProtein:
	hiddenitem PROTEIN, EVENT_WESTPORT_PORT_HIDDEN_PROTEIN

MovementData_0x74a30:
	step DOWN
	step_end

MovementData_0x74a32:
	step UP
	step_end

MovementData_0x74a34:
	step RIGHT
	turn_head LEFT
	step_end

MovementData_0x74a37:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_0x74a3f:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_0x74a49:
	step UP
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
WelcomeToTheDocksAfterHOF:
    text "Willkommen!"

    para "Wir haben unseren"
    line "Service erweitert"
    para "und bieten jetzt"
    line "Fahrten nach"
    para "TEKNOPIA CITY und"
    line "NIHONs SÜDWEST"
    cont "INSELN an!"

    para "Wohin möchtest du"
    line "heute fahren?"
	done

WestportPortSailorNotGoingToTeknosText:
    text "Bitte besuche uns"
    line "ein andermal!"
	done

WestportPortSailorGoToTeknosText:
    text "Willkommen."

    para "Möchtest du die"
    line "Fähre nach"
    para "TEKNOPIA CITY"
    line "nehmen?"
	done

WestportPortSailorGoToTeknosText2:
    text "Okay! Abfahrt nach"
    line "TEKNOPIA CITY."
	done

DepartureTimeText:
	text "Wir legen bald"
	line "ab! Geh an"
	cont "Bord."
	done

SorryCantBoardText:
	text "Du darfst jetzt"
	line "nicht an Bord."
	done


AskForTicketText:
	text "Zeige mir bitte"
	line "dein"

	para "BOOTSTICKET."
	done

HopeToSeeYouAgainText:
	text "Komm jederzeit"
	line "wieder vorbei!"
	done

FlashTheTicketText:
	text "<PLAYER> zeigt"
	line "das BOOTSTICKET."

	para "In Ordnung."
	line "Danke schön!"
	done

DontHaveTicketWhoopsText:
	text "<PLAYER> sucht"
	line "das BOOTSTICKET…"

	para "…Kein TICKET!"

	para "Tut mir Leid!"
	line "Du darfst nur"

	para "mit TICKET"
	line "an Bord."
	done

NoTripsToIslandsTodayText:
    text "Tut mir leid, aber"
    line "die nächste Fähre"
    para "zu den SÜDWEST"
    line "INSELN fährt erst"
    cont "am Montag ab."

    para "Heute bieten wir"
    line "nur Fahrten nach"
    cont "TEKNOPIA CITY an."
	done

NoTripsToIslandsToday2Text:
    text "Tut mir leid, aber"
    line "die nächste Fähre"
    para "zu den SÜDWEST"
    line "INSELN fährt erst"
    cont "am Freitag ab."

    para "Heute bieten wir"
    line "nur Fahrten nach"
    cont "TEKNOPIA CITY an."
	done

WestportPortFishingGuru1Text:
	text "Hier kannst du"
	line "MUSCHAS leicht"
	para "fangen. An anderen"
	line "Orten sind sie"
	cont "seltener."
	done

WestportPortFishingGuru2Text:
	text "Wie viele ANGELN"
	line "hast du?"

	para "Mit verschiedenen"
	line "ANGELN, fängst du"
	cont "verschiedene"
	cont "#MON."
	done

WestportPortYoungsterText:
	text "M.S. AQUA benutzt"
	line "Spezialdüsen,"
	cont "um über die Wellen"
	cont "zu gleiten!"
	done

WestportPortCooltrainerFText:
	text "Auf den INSELN"
	line "gibt es viele"
	cont "#MON."

	para "Ich wünschte, ich"
	line "könnte dorthin…"
	done

WestportPortSailorBeforeHiveBadgeText:
    text "Es tut uns leid,"
    line "aber der HAFEN ist"
    para "wegen Renovierung"
    line "geschlossen."

    para "Du siehst mir aber"
    line "nach einem toughen"
    cont "Trainer aus."

    para "Hast du schon KAI"
    line "herausgefordert?"

    para "Versuch es doch"
    line "einmal und komm"
    cont "dann wieder."

    para "Vermutlich sind"
    line "wir bis dann mit"
    cont "der Arbeit fertig."
	done


WestportPort_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 11,  7, WESTPORT_PORT_PASSAGE, 5
	warp_event  7, 23, FAST_SHIP_1F, 1

	db 1 ; coord events
	coord_event  7, 15, SCENE_DEFAULT, WestportPortWalkUpToShipScript

	db 1 ; bg events
	bg_event  1, 22, BGEVENT_ITEM, WestportPortHiddenProtein

	db 6 ; object events
	object_event  7, 23, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportPortSailorAtGangwayScript, EVENT_WESTPORT_PORT_SAILOR_AT_GANGWAY
;	object_event  6, 15, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportPortSailorBeforeHOFScript, EVENT_WESTPORT_PORT_SPRITES_BEFORE_HALL_OF_FAME
	object_event  6, 15, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportPortSailorAfterHOFScript, -1
	object_event  4, 12, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WestportPortFishingGuru1Script, EVENT_WESTPORT_PORT_SPRITES_BEFORE_HALL_OF_FAME
	object_event  3,  9, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, WestportPortFishingGuru2Script, EVENT_WESTPORT_PORT_SPRITES_BEFORE_HALL_OF_FAME
	object_event  2, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, WestportPortYoungsterScript, EVENT_WESTPORT_PORT_SPRITES_AFTER_HALL_OF_FAME
	object_event 11, 15, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, WestportPortCooltrainerFScript, EVENT_WESTPORT_PORT_SPRITES_AFTER_HALL_OF_FAME
