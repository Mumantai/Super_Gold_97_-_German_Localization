	object_const_def ; object_event constants
	const OAKSOLDLAB_AIDE

OaksLab_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OaksLabBookshelf:
	jumpstd DifficultBookshelfScript

OaksLabPoster1:
	jumptext OaksLabPoster1Text

OaksLabPoster2:
	jumptext OaksLabPoster2Text
	
OaksLabPC:
	jumptext OaksLabPCText
	
OaksOldLabAideScript:
	jumptextfaceplayer OaksOldLabAideText
	
OaksOldLabAideText:
    text "Oh, hallo!"

    para "Prof. EICH ist in"
    line "SILENITIA auf"
    cont "Forschungsreise."

    para "Ich passe hier nur"
    line "auf sein altes"
    cont "LABOR auf."
	done

OaksLabPoster1Text:
	text "Drücke START, um"
	line "das MENÜ zu"
	cont "öffnen."
	done

OaksLabPoster2Text:
	text "Möchtest du deinen"
	line "Spielstand von"

	para "Zeit zu Zeit"
	line "speichern, dann"
	cont "wähle im MENÜ die"
	cont "Option SICHERN."
	done

OaksLabPCText:
	text "Er ist nicht"
	line "an…"
	done

OaksLab_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, KANTO_REGION, 17
	warp_event  4,  7, KANTO_REGION, 18

	db 0 ; coord events

	db 7 ; bg events
	bg_event  0,  5, BGEVENT_READ, OaksLabBookshelf
	bg_event  1,  5, BGEVENT_READ, OaksLabBookshelf
	bg_event  7,  5, BGEVENT_READ, OaksLabBookshelf
	bg_event  6,  5, BGEVENT_READ, OaksLabBookshelf
	bg_event  2,  0, BGEVENT_READ, OaksLabPoster1
	bg_event  4,  0, BGEVENT_READ, OaksLabPoster2
	bg_event  0,  1, BGEVENT_READ, OaksLabPC

	db 1 ; object events
	object_event  4,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, OaksOldLabAideScript, -1

