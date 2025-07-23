	object_const_def ; object constants
	const RIVALSHOUSE_RIVALS_MOM
	const RIVALSHOUSE_RIVALS_BROTHER

RivalsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RivalsMom:
	jumptextfaceplayer RivalsMomText

RivalsBrother:
	jumptextfaceplayer RivalsBrotherText


RivalsHouseBookshelf:
	jumpstd DifficultBookshelfScript

RivalsPCScript:
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue .RivalPCIsOff
	writetext AnEmailForRivalText
	yesorno
	iftrue .PlayerReadsRivalsMail
	writetext PlayerDoesntReadMailText
	waitbutton
	closetext
	end
	
.RivalPCIsOff
	writetext RivalPCIsOffText
	waitbutton
	closetext
	end

.PlayerReadsRivalsMail
	writetext RivalsEmailText
	waitbutton
	closetext
	end
	
AnEmailForRivalText:
	text "Was ist das?"

	para "Eine E-Mail für"
	line "<RIVAL>?"

	para "E-Mail lesen?"
	done
	
PlayerDoesntReadMailText:
	text "Stimmt, es gehört"
	line "sich nicht, die"
	para "E-Mails von"
	line "anderen zu lesen…"
	done

RivalPCIsOffText:
	text "Er ist anscheinend"
	line "ausgeschaltet…"
	done
	
RivalsEmailText:
	text "…"
	
	para "Ich hoffe, du"
    line "entschuldigst die"
    para "plötzliche E-Mail,"
    line "aber es gibt da"
    para "etwas, was ich dir"
    line "anvertrauen will."

    para "Kommst du bitte"
    line "vorbei, um es dir"
    cont "abzuholen?"

    para "#MON-Professor"
    line "EICH"
	
	done

RivalsMomText:
    text "Hi, <PLAYER>! Mein"
    line "Sohn ist immer so"
    cont "energiegeladen."

    para "Wenn er sich etwas"
    line "in den Kopf setzt,"
    para "dann geht er es"
    line "auch mit voller"
    cont "Energie an."
	done

RivalsBrotherText:
	text "Ich habe neulich"
	line "ein komisch ge-"
	cont "färbtes TAUBSI"
	cont "gesehen!"
	done




RivalsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, SILENT_TOWN, 4
	warp_event  5,  7, SILENT_TOWN, 4

	db 0 ; coord events

	db 3 ; bg events
	bg_event  4,  0, BGEVENT_READ, RivalsHouseBookshelf
	bg_event  5,  0, BGEVENT_READ, RivalsHouseBookshelf
	bg_event  0,  1, BGEVENT_READ, RivalsPCScript

	db 2 ; object events
	object_event  5,  3, SPRITE_RIVALS_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RivalsMom, -1
	object_event  2,  4, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RivalsBrother, -1
