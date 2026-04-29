	object_const_def ; object_event constants
	const KKHOUSE2_GRAMPS

KikaiHouse2_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KKHouse2GrampsScript:
	jumptextfaceplayer KKHouse2GrampsText
	
KKHouse2GrampsText:
    text "Ein Mann namens"
    line "BRUNO trainiert"
    para "an der Spitze des"
    line "KESSELs."

    para "Er ist bei weitem"
    line "stärker, als alle"
    para "anderen Kämpfer,"
    line "die zum Trainieren"
    cont "hierher kommen."

    para "Tatsächlich ist er"
    line "ein Ersatzmitglied"
    cont "der TOP VIER!"
	done

KikaiHouse2_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KIKAI_VILLAGE, 4
	warp_event  5,  7, KIKAI_VILLAGE, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  4,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KKHouse2GrampsScript, -1
