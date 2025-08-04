	object_const_def ; object_event constants
	const WESTPORTPPSPEECHHOUSE_FISHER
	const WESTPORTPPSPEECHHOUSE_LASS


WestportPPSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WestportPPSpeechHouseFisherScript:
	jumptextfaceplayer WestportPPSpeechHouseFisherText

WestportPPSpeechHouseLassScript:
	jumptextfaceplayer WestportPPSpeechHouseLassText

WestportPPSpeechHouseBookshelf2:
	jumpstd DifficultBookshelfScript

WestportPPSpeechHouseBookshelf1:
	jumpstd MagazineBookshelfScript

WestportPPSpeechHouseRadio:
	jumpstd Radio2Script

WestportPPSpeechHouseFisherText:
	text "Als ich einmal"
	line "kämpfte, konnte"

	para "mein #MON kei-"
	line "ne Attacken mehr"
	cont "ausführen."

	para "Die ANGRIFFSPUNK-"
	line "TE, oder AP, sei-"
	cont "ner Attacken waren"
	cont "verbraucht."
	done

WestportPPSpeechHouseLassText:
	text "Manchmal kann auch"
	line "ein gesundes"

	para "#MON nicht mehr"
	line "angreifen."

	para "In diesem Fall"
	line "musst du es in ei-"
	cont "nem #MON-CENTER"
	cont "oder mit einem"
	cont "Item heilen."
	done

WestportPPSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, WESTPORT_CITY, 13
	warp_event  5,  7, WESTPORT_CITY, 13

	db 0 ; coord events

	db 3 ; bg events
	bg_event  4,  1, BGEVENT_READ, WestportPPSpeechHouseBookshelf1
	bg_event  5,  1, BGEVENT_READ, WestportPPSpeechHouseBookshelf2
	bg_event  6,  1, BGEVENT_READ, WestportPPSpeechHouseRadio

	db 2 ; object events
	object_event  3,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WestportPPSpeechHouseFisherScript, -1
	object_event  1,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportPPSpeechHouseLassScript, -1
