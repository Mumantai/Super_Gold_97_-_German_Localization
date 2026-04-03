	object_const_def ; object_event constants
	const ALLOYGOODRODHOUSE_FISHING_GURU

AlloyGoodRodHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GoodRodGuru:
	faceplayer
	opentext
	checkevent EVENT_GOT_GOOD_ROD
	iftrue .AlreadyGotItem
	writetext OfferGoodRodText
	yesorno
	iffalse .DontWantIt
	writetext GiveGoodRodText
	buttonsound
	verbosegiveitem GOOD_ROD
	writetext GaveGoodRodText
	waitbutton
	closetext
	setevent EVENT_GOT_GOOD_ROD
	end

.DontWantIt:
	writetext DontWantGoodRodText
	waitbutton
	closetext
	end

.AlreadyGotItem:
	writetext HaveGoodRodText
	waitbutton
	closetext
	end

OfferGoodRodText:
    text "Der Kanal ist ein"
    line "beliebter Platz"
    cont "zum Angeln."

    para "Möchtest du nicht"
    line "eine ANGEL nehmen"
    cont "und darin fischen?"
	done

GiveGoodRodText:
	text "Ah, hahah!"
	line "Und da haben wir"
	cont "einen neuen"
	cont "Angler!"
	done

GaveGoodRodText:
	text "Fische findet man"
	line "nicht nur im Meer."

	para "Sie sind überall,"
	line "wo es Wasser gibt."
	done

DontWantGoodRodText:
	text "Waaas? Du willst"
	line "nicht fischen!?"
	cont "Unfassbar!"
	done

HaveGoodRodText:
	text "Wie steht's? Den"
	line "großen Fang ge-"
	cont "macht?"
	done

AlloyGoodRodHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, ALLOY_CITY, 6
	warp_event  5,  7, ALLOY_CITY, 6

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoodRodGuru, -1
