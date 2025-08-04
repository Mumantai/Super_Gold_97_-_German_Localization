	object_const_def ; object_event constants
	const WESTPORTPOKECENTER1F_NURSE 
	const WESTPORTPOKECENTER1F_GAMEBOY_KID
	const WESTPORTPOKECENTER1F_LASS

WestportPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WestportPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript



WestportPokecenter1FGameboyKidScript:
	jumptextfaceplayer WestportPokecenter1FGameboyKidText

WestportPokecenter1FLassScript:
	jumptextfaceplayer WestportPokecenter1FLassText

WestportPokecenter1FGameboyKidText:
    text "Hast du versucht,"
    line "#MON mit einem"
    para "SUPERBALL zu"
    line "fangen?"

    para "Er eignet sich"
    line "besser besser zum"
    para "Fangen als ein"
    line "#BALL."
	done

WestportPokecenter1FLassText:
	text "Ein starkes #-"
	line "MON muss nicht"
	cont "zwingend gewinnen."

	para "Meist entscheidet"
	line "der Vor- oder"
	cont "Nachteil des Typs."

	para "Ich glaube nicht,"
	line "dass es ein #-"
	cont "MON gibt, das al-"
	cont "len anderen über-"
	cont "legen ist."
	done



WestportPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, WESTPORT_CITY, 8
	warp_event  6,  7, WESTPORT_CITY, 8
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, WestportPokecenter1FNurseScript, -1
	object_event  8,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WestportPokecenter1FGameboyKidScript, -1
	object_event  1,  4, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportPokecenter1FLassScript, -1
