	object_const_def ; object_event constants
	const SANSKRITGAMBLERMANHOUSE_GAMBLER_MAN

SanskritGamblerManHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


SanskritGamblerManHouseGamblerManScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_COIN_CASE_FROM_GAMBLER
	iftrue .GotCoinCase
	writetext SanskritGamblerManHouseGamblerManText_Question
	yesorno
	iffalse .Refused
	writetext SanskritGamblerManHouseGamblerManText_Yes
	buttonsound
	verbosegiveitem COIN_CASE
	writetext SanskritGamblerManHouseGamblerManText_GiveCoinCase
	waitbutton
	closetext
	setevent EVENT_GOT_COIN_CASE_FROM_GAMBLER
	end

.Refused:
	writetext SanskritGamblerManHouseGamblerManText_No
	waitbutton
	closetext
	end

.GotCoinCase:
	writetext SanskritGamblerManHouseGamblerManText_After
	waitbutton
	closetext
	end


SanskritGamblerManHouseGamblerManText_Question:
	text "In GLYPHONTIA gab"
	line "es nie einen Ort"
	cont "zur Unterhaltung."

	para "Zumindest, bis die"
	line "SPIELHALLE hier in"
	cont "der Nähe eröffnet"
	cont "wurde."

	para "Ich habe da schon"
	line "viel zu viel Zeit"
    cont "verbracht."

    para "Das wird langsam"
    line "ein richtiges"
    cont "Problem für mich."

    para "Hier! Du solltest"
    line "mir das abnehmen!"
	done

SanskritGamblerManHouseGamblerManText_Yes:
	text "Super! Vielleicht"
	line "gehst du damit ja"
	cont "besser um als ich."
	done

SanskritGamblerManHouseGamblerManText_GiveCoinCase:
    text "Die SPIELHALLE"
    line "macht wirklich"
    cont "so viel Spaß!"

    para "Aber pass auf,"
    line "dass der Spaß"
    cont "nicht zu einem"
    cont "Problem wird."
	done

SanskritGamblerManHouseGamblerManText_No:
	text "Oh. Ich sollte"
	line "wohl an meiner"
	cont "Selbstdisziplin"
	cont "arbeiten…"
	done

SanskritGamblerManHouseGamblerManText_After:
    text "Ah, du nimmst eine"
    line "Last von meinen"
    cont "Schultern."
	done


SanskritGamblerManHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, SANSKRIT_TOWN, 2
	warp_event  5,  7, SANSKRIT_TOWN, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  8,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SanskritGamblerManHouseGamblerManScript, -1
