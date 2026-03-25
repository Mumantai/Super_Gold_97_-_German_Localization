	object_const_def ; object_event constants
	const SANSKRITMART_CLERK
	const SANSKRITMART_LASS
	const SANSKRITMART_COOLTRAINER_M

SanskritMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SanskritMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_ACTUAL_SANSKRIT
	closetext
	end

SanskritMartLassScript:
	jumptextfaceplayer SanskritMartLassText

SanskritMartCooltrainerMScript:
	jumptextfaceplayer SanskritMartCooltrainerMText

SanskritMartLassText:
	text "Ich interessiere"
	line "mich nicht wirklich"
	cont "für die RUINEN."

	para "In der Stadt gibt"
	line "gab es nie viel"
	cont "für mich zu tun."

	para "Das war so, bis die"
	line "neue PROMENADE und"
	cont "die SPIELHALLE"
	cont "südlich der Stadt"
	cont "aufgemacht haben!"

	para "Das solltest du"
	line "dir mal ansehen,"
	cont "wenn du noch nicht"
	cont "da warst."
	done

SanskritMartCooltrainerMText:
	text "Warst du schon in"
	line "KAZANAMI CITY?"

	para "Es ist ein wichtiger"
	line "Umschlagplatz für"
	cont "Waren, die aus"
	cont "Ländern nördlich"
	cont "von NIHON kommen."
	done

SanskritMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, SANSKRIT_TOWN, 1
	warp_event  5,  7, SANSKRIT_TOWN, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SanskritMartClerkScript, -1
	object_event  9,  5, SPRITE_JANINE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SanskritMartLassScript, -1
	object_event  4,  1, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SanskritMartCooltrainerMScript, -1
