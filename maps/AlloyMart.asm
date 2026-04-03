	object_const_def ; object_event constants
	const ALLOYMART_CLERK
	const ALLOYMART_COOLTRAINER_F
	const ALLOYMART_LASS

AlloyMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AlloyMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_ALLOY
	closetext
	end

AlloyMartCooltrainerFScript:
	jumptextfaceplayer AlloyMartCooltrainerFText

AlloyMartLassScript:
	jumptextfaceplayer AlloyMartLassText

AlloyMartCooltrainerFText:
	text "Können deine #-"
	line "MON schon Leute"

	para "übers Wasser tra-"
	line "gen?"
	done

AlloyMartLassText:
	text "Ich habe mein"
	line "TAUBOGA von meinem"
	cont "Freund aus Übersee"
	cont "bekommen."

	para "Es ist von selbst"
	line "hierher geflogen!"

	para "Können deine auch"
	line "schon FLIEGEN?"
	done

AlloyMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, ALLOY_CITY, 8
	warp_event  5,  7, ALLOY_CITY, 8

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AlloyMartClerkScript, -1
	object_event  6,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AlloyMartCooltrainerFScript, -1
	object_event  1,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AlloyMartLassScript, -1
