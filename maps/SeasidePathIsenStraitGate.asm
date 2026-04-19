	object_const_def ; object_event constants
	const SEASIDEPATHISENSTRAITGATE_OFFICER
	const SEASIDEPATHISENSTRAITGATE_BUG_CATCHER

SeasidePathIsenStraitGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


SeasidePathIsenStraitGateOfficerScript:
	jumptextfaceplayer SeasidePathIsenStraitGateOfficerText

SeasidePathIsenStraitGateBugCatcherScript:
	jumptextfaceplayer SeasidePathIsenStraitGateBugCatcherText
	
SeasidePathIsenStraitGateBugCatcherText:
    text "Die wilden #MON"
    line "auf den INSELN"
    cont "sind sehr stark."

    para "Viel stärker, als"
    line "auf dem Festland,"
    cont "glaube ich."
	done

SeasidePathIsenStraitGateOfficerText:
	text "Ich hörte, die"
	line "ISEN-STRAẞE birgt"
	para "verborgene Reste"
	line "geheimer Experi-"
	cont "mente zur Erschaf-"
	para "fung eines künst-"
	line "lichen #MONs."

	para "Was könnte das"
	line "wohl bedeuten?"
	done


SeasidePathIsenStraitGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  7, ISEN_STRAIT, 1
	warp_event  1,  7, ISEN_STRAIT, 1
	warp_event  8,  7, SEASIDE_PATH, 1
	warp_event  9,  7, SEASIDE_PATH, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, SeasidePathIsenStraitGateOfficerScript, -1
	object_event  1,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SeasidePathIsenStraitGateBugCatcherScript, -1
