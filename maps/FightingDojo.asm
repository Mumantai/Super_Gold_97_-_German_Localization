	object_const_def ; object_event constants
	const FIGHTINGDOJO_BLACK_BELT
	const FIGHTINGDOJO_POKE_BALL
	const FIGHTINGDOJO_BLACK_BELT2
	const FIGHTINGDOJO_BLACK_BELT3
	const FIGHTINGDOJO_BLACK_BELT4
	const FIGHTINGDOJO_BLACK_BELT5

FightingDojo_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FightingDojoBlackBelt:
	faceplayer
	checkevent EVENT_BEAT_BLACKBELT_YOSHI
	iftrue .CheckNext1
	faceplayer
	opentext
	writetext Text_GoBeatBlackbelts
	waitbutton
	closetext
	end
	
.CheckNext1
	checkevent EVENT_BEAT_BLACKBELT_LAO
	iftrue .CheckNext2
	faceplayer
	opentext
	writetext Text_GoBeatBlackbelts
	waitbutton
	closetext
	end
	
.CheckNext2
	checkevent EVENT_BEAT_BLACKBELT_NOB
	iftrue .CheckNext3
	faceplayer
	opentext
	writetext Text_GoBeatBlackbelts
	waitbutton
	closetext
	end
	
.CheckNext3
	checkevent EVENT_BEAT_BLACKBELT_LUNG
	iftrue .BeatAllBlackbelts
	faceplayer
	opentext
	writetext Text_GoBeatBlackbelts
	waitbutton
	closetext
	end
	
.BeatAllBlackbelts
	checkevent EVENT_GOT_TYROGUE_FROM_KIYO
	iftrue .GotTyrogueDojo
	opentext
	writetext Text_BeatEm
	buttonsound
	waitsfx
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoomTyrogue
	writetext UnknownText_0x7e3551
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke TYROGUE, 10
	setevent EVENT_GOT_TYROGUE_FROM_KIYO
	writetext Text_FocusBandDescription
	waitbutton
	closetext
	end

.GotTyrogueDojo:
	opentext
	writetext Text_GoodJob
	waitbutton
	closetext
	end
.NoRoomTyrogue:
	writetext UnknownText_0x7e3df1
	waitbutton
	closetext
	end


FightingDojoSign1:
	jumptext FightingDojoSign1Text

FightingDojoSign2:
	jumptext FightingDojoSign2Text

FightingDojoFocusBand:
	itemball FOCUS_BAND
TrainerBlackbeltYoshi:
	trainer BLACKBELT_T, YOSHI, EVENT_BEAT_BLACKBELT_YOSHI, BlackbeltYoshiSeenText, BlackbeltYoshiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltYoshiAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltLao:
	trainer BLACKBELT_T, LAO, EVENT_BEAT_BLACKBELT_LAO, BlackbeltLaoSeenText, BlackbeltLaoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltLaoAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltNob:
	trainer BLACKBELT_T, NOB, EVENT_BEAT_BLACKBELT_NOB, BlackbeltNobSeenText, BlackbeltNobBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltNobAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltLung:
	trainer BLACKBELT_T, LUNG, EVENT_BEAT_BLACKBELT_LUNG, BlackbeltLungSeenText, BlackbeltLungBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltLungAfterText
	waitbutton
	closetext
	end
	
UnknownText_0x7e3551:
	text "<PLAYER> erhält"
	line "RABAUZ."
	done
	
UnknownText_0x7e3df1:
	text "Du kannst keine"
	line "weiteren #MON"
	cont "mehr tragen!"
	done
	
Text_FocusBandDescription:
    text "RABAUZ kann sich"
    line "zu einem von drei"
    para "verschiedenen"
    line "KAMPF-#MON"
    cont "entwickeln!"

    para "Ein Trainer wie du"
    line "sollte keine"
    para "Probleme haben, es"
    line "großzuziehen!"
	done
	
Text_GoodJob:
    text "WAHA! Du solltest"
    line "auch in unserem"
    para "DOJO trainieren,"
    line "Knirps!"
	done
	
Text_BeatEm:
    text "Wow, Knirps!"

    para "Das war eine"
    line "beeindruckende"
    cont "Vorstellung!"

    para "Das hast du dir"
    line "verdient!"
	done

Text_GoBeatBlackbelts:
    text "Hey, Knirps!"

    para "Wenn du meine"
    line "Schüler besiegen"
    para "kannst, belohne"
    line "ich dich mit einem"
    cont "tollen Preis!"
	done

FightingDojoBlackBeltText:
	text "Hallo!"

	para "Der KARATE-"
	line "MEISTER, der"

	para "Leiter des KARATE"
	line "DOJO, übt in einer"
	cont "Höhle in NIHON."
	done

FightingDojoSign1Text:
	text "Es geschieht, was"
	line "geschehen muss!"
	done

FightingDojoSign2Text:
	text "Feinde, wo man"
	line "hinsieht!"
	done

BlackbeltYoshiSeenText:
	text "Meine #MON und"
	line "mich verbindet un-"
	cont "sere Freundschaft."

	para "Dieses Band wird"
	line "nie zerreißen!"
	done

BlackbeltYoshiBeatenText:
	text "Das ist unmöglich!"
	done

BlackbeltYoshiAfterText:
	text "Es scheint, als"
	line "stündest auch du"
	cont "deinen #MON"
	cont "sehr nahe!"
	done

BlackbeltLaoSeenText:
	text "Wir Meister der"
	line "Kampfkunst haben"
	cont "vor nichts Angst!"
	done

BlackbeltLaoBeatenText:
	text "Schockierend!"
	done

BlackbeltLaoAfterText:
	text "Kampf-#MON"
	line "fürchten sich vor"
	cont "Psycho-Attacken…"
	done

BlackbeltNobSeenText:
	text "Worte sind nutz-"
	line "los. Lass deine"
	cont "Fäuste sprechen!"
	done

BlackbeltNobBeatenText:
	text "…"
	done

BlackbeltNobAfterText:
	text "Ich habe verloren!"
	line "Ich bin sprachlos!"
	done

BlackbeltLungSeenText:
	text "Gegen die Wut mei-"
	line "ner Fäuste können"
	cont "deine #MON"
	cont "nichts ausrichten!"
	done

BlackbeltLungBeatenText:
	text "Ich wurde zer-"
	line "schmettert!"
	done

BlackbeltLungAfterText:
	text "Meine #MON ha-"
	line "ben verloren…"
	cont "Mein Stolz ist"
	cont "zerstört…"
	done

FightingDojo_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5, 11, ALLOY_CITY, 11
	warp_event  6, 11, ALLOY_CITY, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5,  0, BGEVENT_READ, FightingDojoSign1
	bg_event  6,  0, BGEVENT_READ, FightingDojoSign2

	db 6 ; object events
	object_event  5,  3, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FightingDojoBlackBelt, -1
	object_event  4,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, FightingDojoFocusBand, EVENT_PICKED_UP_FOCUS_BAND
	object_event  4,  7, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 0, TrainerBlackbeltYoshi, -1
	object_event  7,  8, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 0, TrainerBlackbeltLao, -1
	object_event  7,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 0, TrainerBlackbeltNob, -1
	object_event  4,  5, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 0, TrainerBlackbeltLung, -1
