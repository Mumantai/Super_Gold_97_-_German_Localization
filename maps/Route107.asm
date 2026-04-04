	object_const_def ; object_event constants
	const ROUTE107_SWIMMER_GIRL
	const ROUTE107_SWIMMER_GUY
	const ROUTE107_SWIMMER_GUY2
	const ROUTE107_SWIMMER_GUY3
	const ROUTE107_FISHER

Route107_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSwimmermSeth:
	trainer SWIMMERM, SETH, EVENT_BEAT_SWIMMERM_SETH, SwimmermSethSeenText, SwimmermSethBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermSethAfterBattleText
	waitbutton
	closetext
	end
	

TrainerSwimmermCharlie:
	trainer SWIMMERM, CHARLIE, EVENT_BEAT_SWIMMERM_CHARLIE, SwimmermCharlieSeenText, SwimmermCharlieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermCharlieAfterBattleText
	waitbutton
	closetext
	end


TrainerSwimmerfNikki:
	trainer SWIMMERF, NIKKI, EVENT_BEAT_SWIMMERF_NIKKI, SwimmerfNikkiSeenText, SwimmerfNikkiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfNikkiAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherArnold:
	trainer FISHER, ARNOLD, EVENT_BEAT_FISHER_ARNOLD, FisherArnoldSeenText, FisherArnoldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherArnoldAfterBattleText
	waitbutton
	closetext
	end
	
	
TrainerSwimmermGeorge:
	trainer SWIMMERM, GEORGE, EVENT_BEAT_SWIMMERM_GEORGE, SwimmermGeorgeSeenText, SwimmermGeorgeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermGeorgeAfterBattleText
	waitbutton
	closetext
	end
	
SwimmermGeorgeSeenText:
    text "Los! Mein Wasser-"
    line "Allstar-Team!"
	done

SwimmermGeorgeBeatenText:
	text "Die Sterne sind"
	line "gefallen!"
	done

SwimmermGeorgeAfterBattleText:
	text "Dein Team ist auf"
	line "jeden Fall ein"
	cont "Allstar-Team!"
	done

SwimmermSethSeenText:
	text "Land ho! Gotta"
	line "keep going!"
	done

SwimmermSethBeatenText:
	text "Gluck…"
	done

SwimmermSethAfterBattleText:
	text "Eines Tages möchte"
	line "ich mit der"
	para "Drachenmeisterin"
	line "auf der SATORIA-"
	cont "INSEL trainieren."
	done
	
SwimmermCharlieSeenText:
    text "Bist du etwa zu"
    line "schwach, um selber"
    cont "zu schwimmen?"
	done

SwimmermCharlieBeatenText:
	text "Ich lag falsch!"
	done

SwimmermCharlieAfterBattleText:
	text "Deine #MON sind"
	line "definitiv stark!"
	done

SwimmerfNikkiSeenText:
	text "Falls ich gewinne,"
	line "musst du mich mit"
	cont "der Sonnencreme"
	cont "einreiben!"
	done

SwimmerfNikkiBeatenText:
	text "Ich habe Angst vor"
	line "einem Sonnenbrand…"
	done

SwimmerfNikkiAfterBattleText:
	text "Ich muss mich"
	line "vor Hautreizungen"
	cont "in Acht nehmen."
	done

FisherArnoldSeenText:
	text "Angeln langweilt"
	line "mich. Lass uns"
	cont "kämpfen!"
	done

FisherArnoldBeatenText:
	text "Total versagt…"
	done

FisherArnoldAfterBattleText:
	text "Ich gehe zurück"
	line "zum Angeln…"
	done

Route107_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 48, ALLOY_ROUTE_107_GATE, 1
	warp_event  9, 48, ALLOY_ROUTE_107_GATE, 2

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event 11, 34, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfNikki, -1
	object_event  8, 40, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 4, TrainerSwimmermSeth, -1
	object_event  4, 29, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 4, TrainerSwimmermCharlie, -1
	object_event 12,  9, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 4, TrainerSwimmermGeorge, -1
	object_event 12, 28, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherArnold, -1
