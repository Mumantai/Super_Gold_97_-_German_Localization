	object_const_def ; object_event constants
	const CROWNPOKECENTER1F_NURSE
	const CROWNPOKECENTER1F_FISHER
	const CROWNPOKECENTER1F_GENTLEMAN
	const CROWNPOKECENTER1F_TEACHER

CrownPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CrownPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

CrownPokecenter1FFisherScript:
	jumptextfaceplayer CrownPokecenter1FFisherText

CrownPokecenter1FGentlemanScript:
	jumptextfaceplayer CrownPokecenter1FGentlemanText

CrownPokecenter1FTeacherScript:
	jumptextfaceplayer CrownPokecenter1FTeacherText

CrownPokecenter1FFisherText:
    text "Ich sollte dafür"
    line "sorgen, dass meine"
    para "#MON auch alle"
    line "bereit sind."

    para "Der Aufstieg wird"
    line "kein Kinderspiel."
	done

CrownPokecenter1FGentlemanText:
    text "Die Trainer, die"
    line "du auf dem Berg"
    cont "triffst, sind ein"
    cont "hartes Stück."

    para "Jeder von ihnen,"
    line "möchte die LIGA"
    cont "herausfordern."
	done

CrownPokecenter1FTeacherText:
    text "KOROKANIA CITY ist"
    line "ein guter Treff-"
    para "punkt für Trainer,"
    line "die den KOROKANIA-"
    cont "BERG erklimmen"
    cont "wollen."
	done


CrownPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, CROWN_CITY, 3
	warp_event  6,  7, CROWN_CITY, 3
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CrownPokecenter1FNurseScript, -1
	object_event  2,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, CrownPokecenter1FFisherScript, -1
	object_event  12, 6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CrownPokecenter1FGentlemanScript, -1
	object_event  1,  6, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CrownPokecenter1FTeacherScript, -1
