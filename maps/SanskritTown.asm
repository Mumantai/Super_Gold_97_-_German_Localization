	object_const_def ; object_event constants
	const SANSKRIT_COOLTRAINER
	const SANSKRIT_MONSTER
	const SANSKRIT_YOUNGSTER
	const SANSKRIT_LASS

SanskritTown_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_SANSKRIT
	return


SanskritTownCooltrainermScript:
	faceplayer
	opentext
	writetext SanskritTownCooltrainermText
	waitbutton
	closetext
	turnobject SANSKRIT_COOLTRAINER, DOWN
	end

SanskritTownLassScript:
	jumptextfaceplayer SanskritTownLassText

SanskritTownMonsterScript:
	faceplayer
	opentext
	writetext SanskritTownMonsterText
	cry DONPHAN
	waitbutton
	closetext
	turnobject SANSKRIT_MONSTER, UP
	end

SanskritTownYoungsterScript:
	jumptextfaceplayer SanskritTownYoungsterText

SanskritTownSign:
	jumptext SanskritTownSignText

SanskritTownRagecandybarSign:
	jumpstd MartSignScript

SanskritResearchSign:
	jumptext SanskritResearchSignText

SanskritTownPokecenterSign:
	jumpstd PokecenterSignScript
	
SanskritTownLassText:
    text "Ich liebe die"
    line "Atmosphäre dieser"
    cont "Stadt."

    para "Ich fühle mich fast"
    line "schon, in der Zeit"
    cont "zurückversetzt."
	done
	
SanskritTownYoungsterText:
    text "Dieser Brunnen ist"
    line "so geheimnisvoll."

    para "Niemand weiß, wer"
    line "ihn gebaut hat."

    para "Aber er stammt"
    line "eindeutig aus der"
    cont "gleichen Zeit wie"
    cont "die RUINEN nörd-"
    cont "lich der Stadt."
	done

SanskritTownMonsterText:
	text "DONPHAN: PHYUUU!"
	done

SanskritTownCooltrainermText:
    text "Mein DONPHAN hört"
    line "nicht auf mich."

    para "Ich habe es in"
    line "einem Tausch von"
    cont "einem Kumpel be-"
    cont "kommen, aber ich"
    cont "habe nicht genug"
    cont "ORDEN, damit es"
    cont "mir gehorcht."
	done

SanskritTownSignText:
	text "GLYPHONTIA"

	para "Eine Verbindung"
	line "zu NIHONs"
	cont "Vergangenheit"
	done

SanskritTownRagecandybarSignText:
    text "Versuchen Sie"
    line "einen WUTKEKS,"
    cont "während Sie in"
    cont "GLYPHONTIA sind!"
	done

SanskritResearchSignText:
	text "GLYPHTONTIA"
	line "RUINENFORSCHUNGS-"
	cont "ZENTRUM"
	done

SanskritTown_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event 15,  4, SANSKRIT_MART, 1
	warp_event  3,  7, SANSKRIT_GAMBLER_MAN_HOUSE, 1
	warp_event 16, 11, SANSKRIT_RUINS_RESEARCH_CENTER, 1
	warp_event  3, 12, SANSKRIT_POKECENTER_1F, 1
	warp_event  4,  3, SANSKRIT_ROCKET_HOUSE, 1
	warp_event  8, 17, BOARDWALK_GATE, 1
	warp_event  9, 17, BOARDWALK_GATE, 2
	db 0 ; coord events

	db 4 ; bg events
	bg_event  6, 12, BGEVENT_READ, SanskritTownSign
	bg_event 16,  4, BGEVENT_READ, SanskritTownRagecandybarSign
	bg_event 14, 12, BGEVENT_READ, SanskritResearchSign
	bg_event  4, 12, BGEVENT_READ, SanskritTownPokecenterSign

	db 4 ; object events
	object_event  2,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, SanskritTownCooltrainermScript, -1
	object_event  2,  5, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, SanskritTownMonsterScript, -1
	object_event 11, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SanskritTownYoungsterScript, -1
	object_event 14,  8, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SanskritTownLassScript, -1
