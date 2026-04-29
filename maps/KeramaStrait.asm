	object_const_def ; object_event constants
	const KERAMASTRAIT_SWIMMER_GIRL
	const KERAMASTRAIT_SWIMMER_GUY2
	const KERAMASTRAIT_SWIMMER_GUY3
	const KERAMASTRAIT_FISHER1
	const KERAMASTRAIT_FISHER2

KeramaStrait_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSwimmerfDawn:
	trainer SWIMMERF, DAWN, EVENT_BEAT_SWIMMERF_DAWN, SwimmerfDawnSeenText, SwimmerfDawnBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfDawnAfterBattleText
	waitbutton
	closetext
	end


TrainerSwimmermJerome:
	trainer SWIMMERM, JEROME, EVENT_BEAT_SWIMMERM_JEROME, SwimmermJeromeSeenText, SwimmermJeromeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermJeromeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermTucker:
	trainer SWIMMERM, TUCKER, EVENT_BEAT_SWIMMERM_TUCKER, SwimmermTuckerSeenText, SwimmermTuckerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermTuckerAfterBattleText
	waitbutton
	closetext
	end

KeramaStraitFisher1Script:
	jumptextfaceplayer KeramaStraitFisher1Text


KeramaStraitFisher2Script:
	jumptextfaceplayer KeramaStraitFisher2Text


KeramaStraitSign:
	jumptext KeramaStraitSignText


SwimmermTuckerSeenText:
	text "Uff, uff…"
	line "Nur… noch… ein"

	para "kleines Stück… bis"
	line "…KUMIA CITY…"
	done

SwimmermTuckerBeatenText:
	text "Ich ertrinke!"
	done

SwimmermTuckerAfterBattleText:
	text "Ich… bat meine"
	line "Freundin… nach"
	cont "KUMIA CITY…"
	cont "zu schwimmen…"
	done

SwimmerfDawnSeenText:
	text "Schwächlinge"
	line "widern mich an!"
	done

SwimmerfDawnBeatenText:
	text "Ich schlage dich"
	line "beim Schwimmen…"
	done

SwimmerfDawnAfterBattleText:
	text "Es ist nur eine"
	line "kurze Distanz"
	cont "bis KUMIA CITY…"

	para "Uah, mein Freund"
	line "ist so groß und"
	para "dennoch ein"
	line "Schwächling!"
	done

SwimmermJeromeSeenText:
	text "Schwimmen?"
	line "Ich mache nichts"
	cont "lieber."
	done

SwimmermJeromeBeatenText:
	text "Ich dachte, ich"
	line "könnte gewinnen."
	done

SwimmermJeromeAfterBattleText:
    text "Ich bin ein toller"
    line "Schwimmer und ich"
    cont "liebe das Meer!"
	done

KeramaStraitFisher1Text:
	text "Die ANGLER, die"
	line "behaupten, die"
	para "Ostseite der"
	line "STRAẞE sei der"
	para "beste Angelplatz,"
	line "liegen falsch."

	para "Die ANGLER, die"
	line "behaupten, die"
	para "Westseite der"
	line "STRAẞE sei der"
	para "beste Angelplatz,"
	line "liegen ebenfalls"
	cont "falsch."

	para "Hier in der Mitte"
	line "ist nämlich der"
	cont "beste Angelplatz!"
	done

KeramaStraitFisher2Text:
	text "Das hier ist"
	line "auf jeden Fall"
	cont "der beste Platz."
	done


KeramaStraitSignText:
	text "STRAẞE VON KIRAMA"

	para "RUUCHUU CITY -"
	line "KUMIA CITY"
	done


KeramaStrait_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 1 ; bg events
	bg_event 58, 11, BGEVENT_READ, KeramaStraitSign

	db 5 ; object events
	object_event 19,  9, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfDawn, -1
	object_event 46,  5, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 3, TrainerSwimmermJerome, -1
	object_event 11, 11, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 3, TrainerSwimmermTucker, -1
	object_event 27,  7, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 1, KeramaStraitFisher1Script, -1
	object_event 29,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, KeramaStraitFisher2Script, -1
