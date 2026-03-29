	object_const_def ; object_event constants
	const SUNPOINTCITY_STANDING_YOUNGSTER
	const SUNPOINTCITY_POKEFAN_M
	const SUNPOINTCITY_LASS
	const SUNPOINTCITY_ROCK1
	const SUNPOINTCITY_ROCK3
	const SUNPOINTCITY_POKEFAN_F


SunpointCity_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_SUNPOINTCITY_NOTHING
	scene_script .DummyScene1 ; SCENE_SUNPOINTCITY_SUICUNE_AND_EUSINE

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint


.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_SUNPOINT
	setevent EVENT_BOARDWALK_PATH_IS_OPEN
	return


SunpointCityLass:
	jumptextfaceplayer SunpointCityLassText

SunpointCityFishingGuru:
	jumptextfaceplayer SunpointCityFishingGuruText

SunpointCityTwin:
	jumptextfaceplayer SunpointCityTwinText

SunpointCityRocker:
	jumptextfaceplayer SunpointCityRockerText

SunpointCitySign:
	jumptext SunpointCitySignText

SunpointCityMartSign:
	jumpstd MartSignScript

SunpointTrainerTipsSign:
	jumptext SunpointTrainerTipsSignText

SunpointMagmaShaftWarningSign:
	jumptext SunpointMagmaShaftWarningSignText

SunpointPokecenterSign:
	jumpstd PokecenterSignScript

SunpointCityRock:
	jumpstd SmashRockScript

SunpointCityHiddenRevive:
	hiddenitem REVIVE, EVENT_SUNPOINT_CITY_HIDDEN_REVIVE

SunpointCityHiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_SUNPOINT_CITY_HIDDEN_MAX_ETHER



SunpointCityLassText:
    text "Auf dieser Seite"
    line "von NIHON ist das"
    cont "Klima deutlich"
    cont "wärmer als in der"
    cont "restlichen Region."
	done

ChucksWifeChubbyText:
	text "Mein Mann hat ge-"
	line "gen dich verloren."
	cont "Also muss er här-"
	cont "ter trainieren."

	para "Das ist auch gut"
	line "so. Er hat in"
	cont "letzter Zeit etwas"
	cont "Speck angesetzt."
	done

SunpointCityFishingGuruText:
    text "Warst du schon mal"
    line "im BLAUTANNENWALD?"

    para "Dort ist es kalt"
    line "und verschneit."

    para "Ich könnte da"
    line "nicht leben!"

    para "Die Kälte ist"
    line "nichts für mich."
	done

SunpointCityTwinText:
    text "Seltene #MON"
    line "sollen im MAGMA-"
    cont "SCHACHT leben."

    para "Es ist schwer, in"
    line "die Höhle zu"
    cont "gelangen, weil"

    para "heruntergefallene"
    line "Felsen den Eingang"
    cont "oft blockieren."
	done

SunpointCityRockerText:
    text "Diese Stadt hat"
    line "keine ARENA."

    para "Das braucht sie"
    line "aber auch nicht."
	done


SunpointCitySignText:
    text "KAZANAMI CITY"

    para "NIHONs Zentrum für"
    line "Internationalen"
    cont "Handel"
	done

SunpointTrainerTipsSignText:
	text "TIPPS FÜR TRAINER"

	para "Manche VM-Attacken"
	line "benötigen ORDEN,"
	cont "um außerhalb von"
	cont "Kämpfen benutzt"
	cont "zu werden."

	para "In Kämpfen können"
	line "sie jederzeit"
	cont "verwendet werden."
	done

SunpointMagmaShaftWarningSignText:
	text "NOTICE:"
	para "Dangerous rocks"
	line "frequently fall"
	para "from the MAGMA"
	line "SHAFT."
	para "Use proper caution"
	line "if approaching."
	done

SunpointCity_MapEvents:
	db 0, 0 ; filler

	db 11 ; warp events
	warp_event 20, 26, MANIAS_HOUSE, 1
	warp_event 16, 11, MAGMA_SHAFT_1F, 1
	warp_event 31, 16, SUNPOINT_POKECENTER_1F, 1
	warp_event 17, 22, SUNPOINT_MART, 1
	warp_event 33, 23, SUNPOINT_MAGMA_SHAFT_SPEECH_HOUSE, 1
	warp_event 33, 11, ROUTE_118_SUNPOINT_GATE, 1
	warp_event 22, 10, SKATEBOARDER_HOUSE, 1
	warp_event 26,  5, SUNPOINT_DOCKS_GATE, 3
	warp_event 27,  5, SUNPOINT_DOCKS_GATE, 4
	warp_event 28, 30, ROUTE_119_SUNPOINT_GATE, 1
	warp_event 29, 30, ROUTE_119_SUNPOINT_GATE, 2

	db 0 ; coord events

	db 7 ; bg events
	bg_event 26, 21, BGEVENT_READ, SunpointCitySign
	bg_event 32, 16, BGEVENT_READ, SunpointPokecenterSign
	bg_event 18, 22, BGEVENT_READ, SunpointCityMartSign
	bg_event 14, 22, BGEVENT_READ, SunpointTrainerTipsSign
	bg_event 28, 16, BGEVENT_READ, SunpointMagmaShaftWarningSign
	bg_event 34, 24, BGEVENT_ITEM, SunpointCityHiddenRevive
	bg_event 13, 21, BGEVENT_ITEM, SunpointCityHiddenMaxEther

	db 6 ; object events
	object_event 28, 13, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SunpointCityFishingGuru, -1
	object_event 23, 22, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, SunpointCityTwin, -1
	object_event 24, 17, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SunpointCityRocker, -1
	object_event 19, 16, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SunpointCityRock, -1
	object_event 18, 17, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SunpointCityRock, -1
	object_event 22, 22, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SunpointCityLass, -1
