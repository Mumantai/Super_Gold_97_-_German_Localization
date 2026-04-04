	object_const_def ; object_event constants
	const BLUE_FORESTPOKECENTER1F_NURSE
	const BLUE_FORESTPOKECENTER1F_GENTLEMAN
	const BLUE_FORESTPOKECENTER1F_TWIN
	const BLUE_FORESTPOKECENTER1F_COOLTRAINER_M

BlueForestPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BlueForestPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

BlueForestPokecenter1FGentlemanScript:
	jumptextfaceplayer BlueForestPokecenter1FGentlemanText

BlueForestPokecenter1FTwinScript:
	jumptextfaceplayer BlueForestPokecenter1FTwinText

BlueForestPokecenter1FCooltrainerMScript:
	jumpstd HappinessCheckScript

BlueForestPokecenter1FGentlemanText:
	text "Hoch oben, auf der"
	line "Spitze des KOROKA-"
	para "NIABERGs, befindet"
	line "sich die #MON"
	cont "LIGA."

	para "Ich hörte, die"
	line "besten Trainer des"

	para "Landes versammeln"
	line "sich dort."
	done

BlueForestPokecenter1FTwinText:
	text "Es gibt da eine"
	line "Attacke, die ich"

	para "unbedingt meinen"
	line "#MON beibrin-"
	cont "gen musste."

	para "Also ging ich zum"
	line "ATTACKEN-VERLER-"
	cont "NER, um eine VM-"
	cont "Attacke vergessen"
	cont "zu lassen."
	done

BlueForestPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, BLUE_FOREST, 5
	warp_event  6,  7, BLUE_FOREST, 5
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlueForestPokecenter1FNurseScript, -1
	object_event 10,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlueForestPokecenter1FGentlemanScript, -1
	object_event  1,  4, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BlueForestPokecenter1FTwinScript, -1
	object_event 10,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, BlueForestPokecenter1FCooltrainerMScript, -1
