	object_const_def ; object_event constants
	const SUNPOINTMAGMASHAFTSPEECHHOUSE_MAN

SunpointMagmaShaftSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
SunpointMagmaShaftSpeechHouseFishingGuruScript:
	jumptextfaceplayer SunpointFishGuruText

SunpointFishGuruText:
    text "Im MAGMA-SCHACHT"
    line "im Westen der"
    cont "Stadt ist es echt"
    cont "brütend heiß."

    para "Feuer-#MON"
    line "sollen sich davon"
    cont "angezogen fühlen."
	done

SunpointMagmaShaftSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, SUNPOINT_CITY, 5
	warp_event  5,  7, SUNPOINT_CITY, 5

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  1,  2, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, SunpointMagmaShaftSpeechHouseFishingGuruScript, -1
