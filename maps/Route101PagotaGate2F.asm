	object_const_def ; object_event constants
	const ROUTE106PAGOTAGATE2F_LASS
	const ROUTE106PAGOTAGATE2F_TWIN

Route101PagotaGate2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

	
Route101PagotaGate2FLassScript:
	jumptextfaceplayer Route101PagotaGate2FLassText

Route101PagotaGate2FLassText:
    text "Hast du schon von"
    line "KURT gehört?"

    para "Wenn er sich für"
    line "dich interessiert,"
    para "ist das etwas"
    line "Besonderes."
	done
	
Route101PagotaGate2FTwinScript:
	jumptextfaceplayer Route101PagotaGate2FTwinText

Route101PagotaGate2FTwinText:
    text "Bist du Tourist?"

    para "Wenn ja, dann"
    line "hast du leider"
    cont "Pech gehabt…"

    para "Nicht jeder darf"
    line "einfach so in den"
    cont "5-EBENEN-TURM."
	done
	
Route101PagotaGate2FSign:
	jumptext Route101PagotaGate2FSignText
	
Route101PagotaGate2FSignText:
	text "<PLAYER> schaut"
	line "durch das"
	cont "Fernrohr!"

	para "Wow! Ein hoher"
	line "Turm ist zu sehen!"
	done

Route101PagotaGate2FSign2:
	jumptext Route101PagotaGate2FSign2Text
	
Route101PagotaGate2FSign2Text:
	text "<PLAYER> schaut"
	line "durch das"
	cont "Fernrohr!"

	para "Ein Fluss er-"
	line "streckt sich in"
	cont "die Ferne."
	done
	
Route101PagotaGate2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5,  0, ROUTE_101_PAGOTA_GATE, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event 1,  0, BGEVENT_READ, Route101PagotaGate2FSign
	bg_event 3,  0, BGEVENT_READ, Route101PagotaGate2FSign2

	db 2 ; object events
	object_event  1,  3, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route101PagotaGate2FLassScript, -1
	object_event  5,  4, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route101PagotaGate2FTwinScript, -1
	