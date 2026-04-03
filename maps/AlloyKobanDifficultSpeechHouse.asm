	object_const_def ; object_event constants
	const ALLOYKOBANDIFFICULTSPEECHHOUSE_POKEFAN_M

AlloyKobanDifficultSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AlloyKobanDifficultSpeechHouseDad:
	jumptextfaceplayer AlloyKobanDifficultSpeechHouseDadText



AlloyKobanDifficultSpeechHouseBookshelf2:
	jumpstd PictureBookshelfScript

AlloyKobanDifficultSpeechHouseRadio:
	jumpstd Radio2Script

AlloyKobanDifficultSpeechHouseDadText:
    text "Die SATORIA-INSEL"
    line "ist eine wirklich"
    para "idyllische kleine"
    line "Insel."

    para "Aber er ist schwer"
    line "sie zu erreichen."

    para "Die Gewässer nörd-"
    line "lich von hier sind"
    cont "voll von Strudeln."

    para "Ohne die Hilfe von"
    line "einem #MON, ist"
    para "es unmöglich, sie"
    line "zu durchqueren."
	done



AlloyKobanDifficultSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, ALLOY_CITY, 5
	warp_event  5,  7, ALLOY_CITY, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event  4,  1, BGEVENT_READ, AlloyKobanDifficultSpeechHouseRadio
	bg_event  4,  0, BGEVENT_READ, AlloyKobanDifficultSpeechHouseBookshelf2

	db 1 ; object events
	object_event  1,  2, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AlloyKobanDifficultSpeechHouseDad, -1
