	object_const_def ; object_event constants
	const TEKNOSCITY_GRAMPS1
	const TEKNOSCITY_GRAMPS2
	const TEKNOSCITY_LASS1
	const TEKNOSCITY_LASS2
	const TEKNOSCITY_FISHER
	const TEKNOSCITY_YOUNGSTER
	const TEKNOSCITY_GRAMPS3
	const TEKNOSCITY_ROCKET1
	const TEKNOSCITY_ROCKET2
	const TEKNOSCITY_ROCKET3
	const TEKNOSCITY_ROCKET4
	const TEKNOSCITY_ROCKET5

TeknosCity_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_TILES, .ClearOpenBoardwalkPath

.ClearOpenBoardwalkPath:
	checkevent EVENT_BOARDWALK_PATH_IS_OPEN
	iftrue .Done
	changeblock 21,  7, $41 ; fence
	changeblock 23,  7, $41 ; fence
	changeblock 25,  7, $41 ; fence
	changeblock 21,  5, $21 ; water
	changeblock 23,  5, $21 ; water
	changeblock 25,  5, $21 ; water
.Done:
	return

.FlyPoint:
	setflag ENGINE_FLYPOINT_TEKNOS
	return

TeknosCityGramps1Script:
	jumptextfaceplayer TeknosCityGramps1Text

TeknosCityGramps2Script:
	faceplayer
	opentext
	checkevent EVENT_BOARDWALK_PATH_IS_OPEN
	iftrue .Gramps2Script2
	writetext TeknosCityGramps2Text
	waitbutton
	closetext
	end
	
.Gramps2Script2:
	writetext TeknosCityGramps2Text2
	waitbutton
	closetext
	end

TeknosCityGramps3Script:
	jumptextfaceplayer TeknosCityGramps3Text

TeknosCityLass1Script:
	jumptextfaceplayer TeknosCityLass1Text

TeknosCityLass2Script:
	jumptextfaceplayer TeknosCityLass2Text

	
TeknosCityFisherScript:
	faceplayer
	opentext
	checkevent EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	iftrue .NoRockets
	writetext TeknosCityFisherText_TheresRockets
	waitbutton
	closetext
	end

.NoRockets:
	writetext TeknosCityFisherText
	waitbutton
	closetext
	end


TeknosCityRocket1Script:
	jumptextfaceplayer TeknosCityRocket1Text
	
TeknosCityRocket2Script:
	jumptextfaceplayer TeknosCityRocket2Text
	
TeknosCityRocket3Script:
	jumptextfaceplayer TeknosCityRocket3Text
	
TeknosCityRocket4Script:
	jumptextfaceplayer TeknosCityRocket4Text
	
TeknosCityRocket5Script:
	jumptextfaceplayer TeknosCityRocket5Text

TeknosCityYoungsterScript:
	jumptextfaceplayer TeknosCityYoungsterText

TeknosCitySign:
	jumptext TeknosCitySignText

TinTowerSign:
	checkevent EVENT_BOARDWALK_PATH_IS_OPEN
	iftrue .TinTowerSign2
	jumptext TinTowerSignText
	
.TinTowerSign2
	jumptext TinTowerSignText2

BirdonGymSign:
	jumptext BirdonGymSignText
	
TeknosCityDocksSign:
	jumptext TeknosCityDocksText

TeknosDanceTheaterSign:
	jumptext TeknosDanceTheaterSignText

BurnedTowerSign:
	jumptext BurnedTowerSignText

TeknosCityPokecenterSign:
	jumpstd PokecenterSignScript

TeknosCityMartSign:
	jumpstd MartSignScript

TeknosCityHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_TEKNOS_CITY_HIDDEN_HYPER_POTION
	
TeknosCityRocket3Text:
	text "Oh, man!"

	para "Das wird ein Spaß!"
	done
	
TeknosCityRocket4Text:
	text "Bald ist es so"
	line "weit, in Erschei-"
	cont "nung zu treten!"
	done
	
TeknosCityRocket5Text:
	text "Das AQUARIUM wird"
	line "nicht wissen, wie"
	cont "ihm geschieht!"
	done

TeknosCityRocket1Text:
	text "Halte dich vom"
	line "AQUARIUM fern,"
	cont "wenn dir dein"
	cont "Leben lieb ist!"
	done
	
TeknosCityRocket2Text:
	text "Hehehehe!"

	para "Hier gibt es"
	line "sicher seltene"
	cont "#MON, die wir"
	cont "teuer verkaufen"
	cont "können!"
	done


TeknosCityGramps1Text:
    text "Ich lebe schon"
    line "mein ganzes Leben"
    cont "hier in TEKNOPIA."

    para "Heutzutage ist die"
    line "Stadt so viel"
    cont "lebehafter, als zu"
    cont "meiner Jugend."
	done

TeknosCityGramps2Text:
	text "Die Stadt wird"
	line "noch weiter"
	cont "wachsen, wenn die"
	cont "PROMENADE fertig"
	cont "gebaut ist."

	para "Dann werden noch"
	line "viel mehr Menschen"
	cont "hier durchkommen!"
	done
	
TeknosCityGramps2Text2:
	text "Ich muss zugeben,"
	line "ich bin ein Fan"
	cont "der neuen SPIEL-"
	cont "HALLE im Norden."
	done

TeknosCityLass1Text:
    text "TENKNOPIA war mal"
    line "ein ruhiger Ort."

    para "Aber die Stadt ist"
    line "so schnell gewach-"
    cont "sen, dass man kaum"
    cont "hinterherkommt."
	done

TeknosCityLass2Text:
    text "BIANKA ist unsere"
    line "ARENALEITERIN!"

    para "Sie ist immer eine"
    line "große Hilfe für die"
    cont "Stadt gewesen!"

    para "Manchmal ist es"
    line "schwer, sie in der"
    cont "ARENA zu treffen,"
    cont "weil sie immer"
    cont "unterwegs ist, um"
    cont "bei Problemen zu"
    cont "helfen."
	done

TeknosCityLass2Text_ReleasedBeasts:
	text "Drei große #MON"
	line "sind in verschie-"
	cont "dene Richtungen"
	cont "davongelaufen!"

	para "Was waren das für"
	line "welche?"
	done

TeknosCityFisherText:
	text "Das AQUARIUM ist"
	line "für MATROSEN wie"
	cont "mich eher öde."

	para "Wir sehen diese"
	line "#MON ja ständig"
	cont "auf hoher See!"

	para "Yohohoho!
	done

TeknosCityFisherText_TheresRockets:
    text "Diese Typen sehen"
    line "echt wie TEAM"
    cont "ROCKET aus."

    para "Ich dachte, die"
    line "würde es nicht"
    cont "mehr geben?"
	done

TeknosCityYoungsterText:
	text "Ich habe es oft"
	line "probiert, aber"
	cont "ich kann BIANKA"
	cont "einfach nicht"
	cont "besiegen…"
	done

TeknosCityGramps3Text:
    text "TEKNOPIA wächst zu"
    line "einer richtigen"
    cont "Hafenstadt heran."

    para "Ich kam ja schon"
    line "immer gerne zu"
    cont "Besuch hierher."

    para "Ich hoffe nur, es"
    line "wird hier nicht zu"
    cont "überrannt!"
	done

TeknosCitySignText:
	text "TEKNOPIA CITY"
	para "Eine Stadt, die"
	line "die Zukunft"
	para "begrüßt."
	done

TinTowerSignText:
	text "DEMNÄCHST!"

	para "PROMENADE und"
	line "SPIELHALLE!"

	para "Der Weg am Meer"
	line "von TEKNOPIA nach"
	cont "GLYPHONTIA voller"
	cont "Spiele und großen"
	cont "Preisen!"
	done

TinTowerSignText2:
	text "Nördlich zur"
	line "PROMENADE und"
	cont "SPIELHALLE!"

	para "Spiel, Spaß und"
	line "große Preise!"
	done

BirdonGymSignText:
	text "PKMN-ARENA von"
	line "TEKNOPIA CITY"
	cont "LEITUNG: BIANKA"

	para "Die energische"
	line "Macherin!"
	done

TeknosDanceTheaterSignText:
	text "TEKNOPIA CITY"
	line "AQUARIUM"
	done

BurnedTowerSignText:
	text "HAUS DES"
	line "PROFIANGLERS"
	done
	
TeknosCityDocksText:
	text "TEKNOPIA CITY"
	line "HAFEN"
	done

TeknosCity_MapEvents:
	db 0, 0 ; filler

	db 14 ; warp events
	warp_event 22, 31, TEKNOS_PORT_PASSAGE, 1
	warp_event 23, 31, TEKNOS_PORT_PASSAGE, 2
	warp_event 31, 10, TEKNOS_POKECENTER_1F, 1
	warp_event  7, 17, TEKNOS_FISHING_HOUSE, 1
	warp_event  7, 27, TEKNOS_AQUARIUM_1F, 2
	warp_event 31, 16, TEKNOS_MART, 1
	warp_event 10, 11, TEKNOS_GYM, 1
	warp_event 15, 17, TEKNOS_ITEMFINDER_HOUSE, 1
	warp_event  6, 27, TEKNOS_AQUARIUM_1F, 1
	warp_event  9, 11, ROUTE_109_ROUTE_110_GATE, 4
	warp_event 22,  1, BOARDWALK_TEKNOS_GATE, 3
	warp_event 23,  1, BOARDWALK_TEKNOS_GATE, 4
	warp_event 11, 11, TEKNOS_GYM, 2
	warp_event 33, 20, TEKNOS_TRADE_HOUSE, 1

	db 0 ; coord events

	db 9 ; bg events
	bg_event 18, 20, BGEVENT_READ, TeknosCitySign
	bg_event 24,  8, BGEVENT_READ, TinTowerSign
	bg_event 12, 12, BGEVENT_READ, BirdonGymSign
	bg_event 10, 27, BGEVENT_READ, TeknosDanceTheaterSign
	bg_event 10, 17, BGEVENT_READ, BurnedTowerSign
	bg_event 32, 10, BGEVENT_READ, TeknosCityPokecenterSign
	bg_event 32, 16, BGEVENT_READ, TeknosCityMartSign
	bg_event  5, 18, BGEVENT_ITEM, TeknosCityHiddenHyperPotion
	bg_event 24, 29, BGEVENT_READ, TeknosCityDocksSign

	db 12 ; object events
	object_event 14, 21, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, TeknosCityGramps1Script, -1
	object_event 19,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, TeknosCityGramps2Script, -1
	object_event 28, 27, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TeknosCityLass1Script, -1
	object_event 23, 14, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, TeknosCityLass2Script, -1
	object_event 10, 30, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, TeknosCityFisherScript, -1
	object_event 10, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, TeknosCityYoungsterScript, -1
	object_event 22, 13, SPRITE_SAILOR, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TeknosCityGramps3Script, -1
	object_event  5, 28, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, TeknosCityRocket1Script, EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	object_event  8, 28, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, TeknosCityRocket2Script, EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	object_event  7, 28, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, TeknosCityRocket3Script, EVENT_ROCKETS_BLOCKING_AQUARIUM
	object_event  7, 30, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, TeknosCityRocket4Script, EVENT_ROCKETS_BLOCKING_AQUARIUM
	object_event  6, 29, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, TeknosCityRocket5Script, EVENT_ROCKETS_BLOCKING_AQUARIUM

	