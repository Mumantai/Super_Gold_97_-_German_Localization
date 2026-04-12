	object_const_def ; object_event constants
	const BLUESHOUSE_DAISY
	const KANTOHOUSE_2_POKEFANM

KantoHouse2_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DaisyScript:
	faceplayer
	opentext
	checkcode VAR_HOUR
	ifequal 15, .ThreePM
	writetext DaisyHelloText
	waitbutton
	closetext
	end

.ThreePM:
	checkflag ENGINE_DAISYS_GROOMING
	iftrue .AlreadyGroomedMon
	writetext DaisyOfferGroomingText
	yesorno
	iffalse .Refused
	writetext DaisyWhichMonText
	waitbutton
	special DaisysGrooming
	ifequal $0, .Refused
	ifequal $1, .CantGroomEgg
	setflag ENGINE_DAISYS_GROOMING
	writetext DaisyAlrightText
	waitbutton
	closetext
	special FadeOutPalettes
	playmusic MUSIC_HEAL
	pause 60
	special FadeInPalettes
	special RestartMapMusic
	opentext
	writetext GroomedMonLooksContentText
	special PlayCurMonCry
	buttonsound
	writetext DaisyAllDoneText
	waitbutton
	closetext
	end

.AlreadyGroomedMon:
	writetext DaisyAlreadyGroomedText
	waitbutton
	closetext
	end

.Refused:
	writetext DaisyRefusedText
	waitbutton
	closetext
	end

.CantGroomEgg:
	writetext DaisyCantGroomEggText
	waitbutton
	closetext
	end
	
KantoHouse2PokefanMScript:
	jumptextfaceplayer KantoHouse2PokefanMText

KantoHouse2PokefanMText:
    text "Oh, hallo!"

    para "Wir lieben es,"
    line "Besucher zu haben."

    para "Meine Frau kann"
    line "einem, bei einer"
    para "Tasse Tee, echt"
    line "ein Ohr abkauen."
	done

DaisyHelloText:
    text "Oh, hallo."

    para "Ich liebe es, neue"
    line "Leute zu treffen."

    para "Vielleicht kommst"
    line "du mal zu einer"
    para "Tasse Tee am"
    line "Nachmittag vorbei."
	done

DaisyOfferGroomingText:
	text "Hi! Gutes Timing."

	para "Ich war gerade"
	cont "dabei, Tee zu"
	cont "machen."

	para "Hättest du auch"
	line "gern eine"
	cont "Tasse Tee?"

	para "Oh, deine #MON"
	line "sehen ein bisschen"
	cont "mitgenommen aus."

	para "Möchtest du, dass"
	line "ich eines für dich"
	cont "verschönere?"
	done

DaisyWhichMonText:
	text "Welches soll ich"
	line "verschönern?"
	done

DaisyAlrightText:
	text "Gut. In kürzester"
	line "Zeit wird es"
	cont "hübsch und adrett"
	cont "aussehen."
	done

GroomedMonLooksContentText:
	text_ram wStringBuffer3
	text " sieht"
	line "zufrieden aus."
	done

DaisyAllDoneText:
	text "Hier bitte."
	line "Schon fertig."

	para "Siehst du? Ist es"
	line "jetzt nicht"
	cont "wunderschön?"

	para "Es ist so ein"
	line "süßes #MON."
	done

DaisyAlreadyGroomedText:
	text "Um diese Zeit"
	line "trinke ich immer"
	cont "meinen Tee."

	para "Möchtest du auch"
	line "eine Tasse Tee?"
	done

DaisyRefusedText:
	text "Möchtest du keines"
	line "deiner #MON"
	para "verschönern"
	line "lassen? Gut, dann"
	cont "trinken wir eben"
	cont "nur Tee."
	done

DaisyCantGroomEggText:
	text "Es tut mir Leid,"
	line "aber ich kann"
	cont "wirklich kein EI"
	cont "verschönern."
	done

KantoHouse2_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KANTO_REGION, 25
	warp_event  5,  7, KANTO_REGION, 25

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  1,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DaisyScript, -1
	object_event  7,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoHouse2PokefanMScript, -1
