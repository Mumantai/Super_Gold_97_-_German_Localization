	object_const_def ; object_event constants
	const KOBANPOKECENTER1F_NURSE
	const KOBANPOKECENTER1F_GENTLEMAN
	const KOBANPOKECENTER1F_TEACHER
	const KOBANPOKECENTER1F_YOUNGSTER

KobanPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KobanPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

KobanPokecenter1FGentlemanScript:
	jumptextfaceplayer KobanPokecenter1FGentlemanText

KobanPokecenter1FTeacherScript:
	jumptextfaceplayer KobanPokecenter1FTeacherText

KobanPokecenter1FYoungsterScript:
	jumptextfaceplayer KobanPokecenter1FYoungsterText
	

KobanPokecenter1FGentlemanText:
    text "Diese Stadt sieht"
    line "nicht viele"
    cont "Besucher."

    para "Hauptsächlich sind"
    line "es Leute, die im"
    para "DRACHENSCHLUND"
    line "trainieren wollen."
	done

KobanPokecenter1FTeacherText:
	text "Ich lebe schon"
	line "mein ganzes Leben"
	para "auf dieser Insel"
	line "und habe dich hier"
	cont "noch nie gesehen."

	para "Ich schätze, du"
	line "willst etwas über"
	cont "Drachen-#MON"
	cont "lernen."
	done

KobanPokecenter1FYoungsterText:
	text "Drachen-#MON"
	line "interessieren mich"
	cont "nicht besonders."

	para "Hier gibt es"
	line "nicht viel für"
	cont "mich zu tun."

	para "Vielleicht ziehe"
	line "ich irgendwann"
	cont "mal weg."
	done



KobanPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, KOBAN_ISLAND, 3
	warp_event  6,  7, KOBAN_ISLAND, 3
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, KobanPokecenter1FNurseScript, -1
	object_event  2,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KobanPokecenter1FGentlemanScript, -1
	object_event 10,  1, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KobanPokecenter1FTeacherScript, -1
	object_event 14,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, KobanPokecenter1FYoungsterScript, -1
