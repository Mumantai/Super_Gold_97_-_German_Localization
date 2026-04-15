	object_const_def ; object_event constants
	const CROWNCITYTRAINERHOUSE_SUPER_NERD
	const CROWNCITYTRAINERHOUSE_COOLTRAINER_F
	const CROWNCITYTRAINERHOUSE_COOLTRAINER_M
	const CROWNCITYTRAINERHOUSE_ROCKER
	const CROWNCITYTRAINERHOUSE_LASS

CrownCityTrainerHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CrownCityTrainerHouseSuperNerdScript:
	jumptextfaceplayer CrownCityTrainerHouseSuperNerdText
	
CrownCityTrainerHouseCooltrainerfScript:
	jumptextfaceplayer CrownCityTrainerHouseCooltrainerfText

CrownCityTrainerHouseCooltrainermScript:
	jumptextfaceplayer CrownCityTrainerHouseCooltrainermText
	
CrownCityTrainerHouseRockerScript:
	jumptextfaceplayer CrownCityTrainerHouseRockerText

CrownCityTrainerHouseBookshelf:
	jumpstd MagazineBookshelfScript
	
CrownCityTrainerHouseLassScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM42_DREAM_EATER
	iftrue .GotDreamEater
	writetext IejimaTownDreamEaterFisherText
	buttonsound
	verbosegiveitem TM_DREAM_EATER
	iffalse .NoRoomForDreamEater
	setevent EVENT_GOT_TM42_DREAM_EATER
.GotDreamEater:
	writetext IejimaTownDreamEaterFisherGotDreamEaterText
	waitbutton
.NoRoomForDreamEater:
	closetext
	end
	

IejimaTownDreamEaterFisherText:
	text "Gähn!"

	para "Ich habe in"
	line "letzter Zeit so"
	cont "viel trainiert…"

	para "Ich bin so müde,"
	line "ich könnte glatt"
	cont "einschlafen."

	para "Wusstest du, dass"
	line "es eine Attacke"
	para "gibt, die nur"
	line "bei schlafenden"
	cont "#MON wirkt?"

	para "Hier, schau sie"
	line "dir mal an."
	done

IejimaTownDreamEaterFisherGotDreamEaterText:
	text "TM42 enthält"
	line "TRAUMFRESSER…"

	para "…Zzzzz…"
	done
	
CrownCityTrainerHouseRockerText:
    text "Welche meiner"
    line "#MON sind tough"
    para "genug, um in der"
    line "LIGA zu bestehen?"
	done
	
CrownCityTrainerHouseCooltrainermText:
    text "Ich bin bereit!"

    para "Ich schaffe das!"

    para "Ich bereite mich"
    line "mental schon mal"
    cont "vor."
	done

CrownCityTrainerHouseSuperNerdText:
    text "Ich hörte in der"
    line "LIGA gibt es"
    para "Trainer, die"
    line "#MON der Typen"
    para "Psycho, Gift,"
    line "Geist, Wasser und"
    cont "Drache einsetzen."
	done
	
CrownCityTrainerHouseCooltrainerfText:
    text "Ich hatte es nicht"
    line "leicht, die acht"
    cont "ORDEN zu sammeln."

    para "Ich sollte wohl"
    line "mehr trainieren,"
    para "bevor ich die LIGA"
    line "herausfordere."
	done

CrownCityTrainerHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  7,  7, CROWN_CITY, 8
	warp_event  8,  7, CROWN_CITY, 9

	db 0 ; coord events

	db 4 ; bg events
	bg_event  8,  1, BGEVENT_READ, CrownCityTrainerHouseBookshelf
	bg_event  9,  1, BGEVENT_READ, CrownCityTrainerHouseBookshelf
	bg_event 10,  1, BGEVENT_READ, CrownCityTrainerHouseBookshelf
	bg_event 11,  1, BGEVENT_READ, CrownCityTrainerHouseBookshelf

	db 5 ; object events
	object_event  2,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CrownCityTrainerHouseSuperNerdScript, -1
	object_event  1,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, CrownCityTrainerHouseCooltrainerfScript, -1
	object_event  4,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CrownCityTrainerHouseCooltrainermScript, -1
	object_event 10,  3, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, CrownCityTrainerHouseRockerScript, -1
	object_event 13,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CrownCityTrainerHouseLassScript, -1
