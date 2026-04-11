	object_const_def ; object_event constants
	const KANTOMANSION2F_DEVELOPER

KantoMansion2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoMansion2FComputer:
	jumptext KantoMansion2FComputerText

KantoMansion2FMeetingRoomSign:
	jumptext KantoMansion2FMeetingRoomSignText

KantoMansion2FBookshelf:
	jumpstd DifficultBookshelfScript
	
KantoMansionClerk:
	jumptextfaceplayer KantoMansionClerkText
	
KantoMansionClerkText:
	text "Hey! Ich bin der"
	line "Entwickler!"

	para "Also der andere."

	para "Der, von dem die"
	line "da oben nichts"
	cont "wissen sollen."

	para "Vielen Dank fürs"
	line "Durchspielen!"

	para "Ich habe sehr hart"
	line "hieran gearbeitet."

	para "Ich wollte, dass"
	line "es sich anfühlt,"
	para "wie die Original-"
	line "spiele."

	para "Abgesehen von"
	line "diesem Bruch der"
	cont "4. Wand."
	done

KantoMansion2FComputerText:
	text "Ein Computer mit"
	line "vielen offenen"
	cont "Fenstern:"

	para "Paint, Explorer,"
	line "Notepad++, Polished"
	cont "Map und BGB."

	para "Alles was man zum"
	line "Entwickeln eines"
	cont "ROM-Hacks braucht!"
	done

KantoMansion2FMeetingRoomSignText:
	text "GAME FREAK"
	line "KONFERENZRAUM"
	done

KantoMansion2F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  2,  0, KANTO_MANSION_1F, 4
	warp_event  4,  0, KANTO_MANSION_3F, 2
	warp_event  6,  0, KANTO_MANSION_3F, 3
	warp_event  7,  0, KANTO_MANSION_1F, 5

	db 0 ; coord events

	db 4 ; bg events
	bg_event  0,  6, BGEVENT_READ, KantoMansion2FComputer
	bg_event  4,  9, BGEVENT_UP, KantoMansion2FMeetingRoomSign
	bg_event  0,  1, BGEVENT_READ, KantoMansion2FBookshelf
	bg_event  1,  6, BGEVENT_READ, KantoMansion2FComputer


	db 1 ; object events
	object_event  2,  4, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoMansionClerk, -1
