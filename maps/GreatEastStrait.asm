	object_const_def ; object_event constants
	const GES_DAN
	const GES_ITEMBALL
	const GES_PARKER
	const GES_LEWIS

GreatEastStrait_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GreatEastSign:
	jumptext GreatEastSignText
	
GreatEastSignText:
    text "GROẞE ÖTSL. STRAẞE"

    para "NANJUU-WALD  -"
    line "DAITO-RANCH"

    para "Vorsicht vor den"
    line "STRUDELN!"
	done


TrainerSoldierDan:
	trainer SOLDIER, DAN, EVENT_BEAT_SOLDIER_DAN, DanSeenText, DanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext DanAfterBattleText
	waitbutton
	closetext
	end
	
TrainerSwimmermLewis:
	trainer SWIMMERM, LEWIS, EVENT_BEAT_SWIMMERM_LEWIS, SwimmermLewisSeenText, SwimmermLewisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermLewisAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermParker:
	trainer SWIMMERM, PARKER, EVENT_BEAT_SWIMMERM_PARKER, SwimmermParkerSeenText, SwimmermParkerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermParkerAfterBattleText
	waitbutton
	closetext
	end
	
	
SwimmermLewisSeenText:
	text "Blubb…"

	para "Ich bin dran!"

	para "Komm und hol mich!"
	done

SwimmermLewisBeatenText:
	text "Das kann nicht"
	line "sein…"
	done

SwimmermLewisAfterBattleText:
    text "Lass deine Deckung"
    line "nicht fallen, oder"
    cont "du wirst zermalmt!"
	done

DanSeenText:
    text "Diese Insel ist"
    line "mein Schlachtfeld,"
    para "die Wellen mein"
    line "Luftalarm."

    para "Solange ich über"
    line "Wasser bin, wirst"
    para "du mich niemals"
    line "lebend kriegen!"
	done

DanBeatenText:
	text "TELSOOOOOON!"
	done
	
DanAfterBattleText:
    text "Der Krieg ist nie"
    line "vorbei!"

    para "Ich kämpfe jeden"
    line "Tag meinen eigenen"
    cont "Krieg hier!"
	done
	
SwimmermParkerSeenText:
    text "Raue Gewässer"
    line "hier, was?"
	done

SwimmermParkerBeatenText:
	text "Das war nicht"
	line "der Plan!"
	done

SwimmermParkerAfterBattleText:
	text "Pass auf all die"
	line "STRUDEL auf!"
	done

GESItemball:
	itemball NUGGET

GreatEastStrait_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 11,  8, NANJO_FOREST, 3
	warp_event 11,  9, NANJO_FOREST, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event 18,  8, BGEVENT_READ, GreatEastSign

	db 4 ; object events
	object_event 59,  7, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerSoldierDan, -1
	object_event 84,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GESItemball, EVENT_GES_NUGGET
	object_event 31, 10, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 3, TrainerSwimmermParker, -1
	object_event 103,  8, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 3, TrainerSwimmermLewis, -1
