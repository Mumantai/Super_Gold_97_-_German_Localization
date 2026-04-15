	object_const_def ; object_event constants
	const CROWN_CITY_LASS
	const CROWN_CITY_ROCKER
	const CROWN_CITY_JANINE

CrownCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_CROWN
	return

CrownLassCoordScript:
	turnobject PLAYER, RIGHT
	turnobject CROWN_CITY_LASS, LEFT
	opentext
	writetext GoTrainerText
	waitbutton
	closetext
	setscene SCENE_CROWNCITY_NOTHING
	end

CrownCityLassScript:
	faceplayer
	opentext
	writetext GoTrainerText
	waitbutton
	closetext
	setscene SCENE_CROWNCITY_NOTHING
	end
	
CrownCityPokecenterSign:
	jumpstd PokecenterSignScript
	
CrownCityMartSign:
	jumpstd MartSignScript
	
CrownCitySign:
	jumptext CrownCitySignText
	
CrownCitySign2:
	jumptext CrownCitySign2Text
	
CrownCityRockerScript:
	jumptextfaceplayer CrownCityRockerText
	
CrownCityJanineScript:
	jumptextfaceplayer CrownCityJanineText
	
CrownCityJanineText:
    text "Mein großer Bruder"
    line "hat die LIGA mal"
    cont "herausgefordert."

    para "Er konnte sie"
    line "nicht besiegen."
	done
	
CrownCityRockerText:
    text "Der KOROKANIABERG"
    line "ist echt imposant."

    para "Diese Stadt, hier"
    line "am Fuß des Berges,"
    para "ist aber auch echt"
    line "malerisch."
	done
	
CrownCitySign2Text:
	text "KOROKANIA CITY"
	line "TRAINERHAUS"
	done
	
CrownCitySignText:
	text "KOROKANIA CITY"

	para "Das Basislager für"
	line "Herausforderer der"
	cont "#MON LIGA"
	done
	
GoTrainerText:
    text "Trainer!"

    para "Du bist hier, weil"
    line "du dich dazu"
    para "entschlossen hast,"
    line "den KOROKANIABERG"
    cont "zu erklimmen!"

    para "Stell dein best-"
    line "mögliches #MON-"
    cont "Team zusammen und"
    para "gib alles, was du"
    line "hast!"

    para "Steige den Wasser-"
    line "fall hinauf und"
    para "beginne mit deinem"
    line "Aufstieg!"

    para "Die LIGA wartet!"
	done

CrownCity_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event 10, 25, CROWN_PATH, 3
	warp_event 11, 25, CROWN_PATH, 3
	warp_event  5, 22, CROWN_POKECENTER_1F, 1
	warp_event 11, 22, CROWN_MART, 1
	warp_event  9,  1, MT_FUJI_INTERIOR_LOWER, 1
	warp_event  3, 17, CROWN_HOUSE_1, 1
	warp_event 15, 19, CROWN_HOUSE_2, 1
	warp_event 14, 15, CROWN_CITY_TRAINER_HOUSE, 1
	warp_event 15, 15, CROWN_CITY_TRAINER_HOUSE, 2

	db 1 ; coord events
	coord_event  8, 16, SCENE_CROWNCITY_MEET_RIVAL, CrownLassCoordScript

	db 4 ; bg events
	bg_event  6, 22, BGEVENT_READ, CrownCityPokecenterSign
	bg_event 12, 22, BGEVENT_READ, CrownCityMartSign
	bg_event 10, 16, BGEVENT_READ, CrownCitySign
	bg_event 16, 16, BGEVENT_READ, CrownCitySign2

	db 3 ; object events
	object_event  9, 16, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CrownCityLassScript, -1
	object_event 12, 19, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, CrownCityRockerScript, -1
	object_event  4, 19, SPRITE_JANINE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CrownCityJanineScript, -1
