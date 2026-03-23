	object_const_def ; object_event constants
	const BIRDONPOKECENTER1F_NURSE
	const BIRDONPOKECENTER1F_GENTLEMAN
	const BIRDONPOKECENTER1F_FISHING_GURU
	const BIRDONPOKECENTER1F_POKEFAN_F

BirdonPokecenter1F_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

BirdonPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

BirdonPokecenter1FGentlemanScript:
	jumptextfaceplayer BirdonPokecenter1FGentlemanText

BirdonPokecenter1FFishingGuruScript:
	jumptextfaceplayer BirdonPokecenter1FFishingGuruText

BirdonPokecenter1FPokefanFScript:
	jumptextfaceplayer BirdonPokecenter1FPokefanFText

BirdonPokecenter1FGentlemanText:
	text "Beherrschen deine"
	line "#MON VM-"
	cont "Attacken?"

	para "Diese Attacken"
	line "können auch einge-"
	cont "setzt werden, wenn"
	cont "dein #MON be-"
	cont "siegt worden ist."
	done


BirdonPokecenter1FFishingGuruText:
	text "Auf BILLs PC kön-"
	line "nen bis zu 20"
	cont "#MON pro BOX"
	cont "gelagert werden."
	done

BirdonPokecenter1FPokefanFText:
	text "Weißt du über"
	line "APRIKOKOS Be-"
	cont "scheid?"

	para "Brich eine auf,"
	line "höhle sie aus und"
	cont "verbinde sie mit"
	cont "einer speziellen"
	cont "Vorrichtung."

	para "Dann kannst du"
	line "#MON damit"
	cont "fangen."

	para "Vor der Erfindung"
	line "von #BÄLLEN hat"
	cont "jeder APRIKOKOS"
	cont "verwendet."
	done

BirdonPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, BIRDON_TOWN, 1
	warp_event  6,  7, BIRDON_TOWN, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, BirdonPokecenter1FNurseScript, -1
	object_event  11,  6, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BirdonPokecenter1FGentlemanScript, -1
	object_event  10,  1, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BirdonPokecenter1FFishingGuruScript, -1
	object_event  1,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BirdonPokecenter1FPokefanFScript, -1
