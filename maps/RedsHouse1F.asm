	object_const_def ; object_event constants
	const REDSHOUSE1F_REDS_MOM

RedsHouse1F_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

RedsMom:
	jumptextfaceplayer RedsMomText1

RedsHouse1FTV:
	checkcode VAR_FACING
	ifequal UP, .tvtext
	jumptext RedsHouse1FTVWrongSideText

.tvtext
	jumptext RedsHouse1FTVText

RedsHouse1FBookshelf:
	jumpstd PictureBookshelfScript

RedsMomText1:
	text "Hi!"

	text "Mein Junge, ROT,"
	line "ist hier der"
	cont "ARENALEITER."

	para "Er hat letztes"
	line "Jahr auch die"
	para "#MON LIGA"
	line "besiegt."

	para "Ich bin so stolz"
	line "darauf, was mein"
	para "Junge bereits"
	line "erreicht hat."
	done


RedsHouse1FTVText:
    text "Diese Sendung habe"
    line "ich noch nie"
    para "gesehen…"
	done

RedsHouse1FTVWrongSideText:
	text "Ups, falsche"
	line "Seite."
	done

RedsHouse1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2,  7, KANTO_REGION, 20
	warp_event  3,  7, KANTO_REGION, 20
	warp_event  7,  0, REDS_HOUSE_2F, 1

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, RedsHouse1FBookshelf
	bg_event  1,  1, BGEVENT_READ, RedsHouse1FBookshelf
	bg_event  3,  1, BGEVENT_READ, RedsHouse1FTV

	db 1 ; object events
	object_event  5,  3, SPRITE_REDS_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedsMom, -1
