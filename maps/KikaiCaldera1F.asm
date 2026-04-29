	object_const_def ; object_event constants
	const KKC_BB1
	const KKC_BB2
	const KKC_BB3
	const KKC_ITEMBALL1
	const KKC_ITEMBALL2

KikaiCaldera1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBBIzo:
	trainer BLACKBELT_T, IZO, EVENT_BEAT_BLACKBELT_IZO, IzoSeenText, IzoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext IzoAfterBattleText
	waitbutton
	closetext
	end

IzoSeenText:
	text "Hiyah! Spüre"
	line "meinen brennend"
	cont "heißen Kampfgeist!"
	done

IzoBeatenText:
	text "Huah!"
	done
	
IzoAfterBattleText:
    text "Ich weiß nicht,"
    line "was heißer ist,"
    para "dieser Vulkan oder"
    line "meine brennende"
    cont "Leidenschaft!"
	done

TrainerBBTakeshi:
	trainer BLACKBELT_T, TAKESHI, EVENT_BEAT_BLACKBELT_TAKESHIKKC, TakeshiSeenText, TakeshiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TakeshiAfterBattleText
	waitbutton
	closetext
	end
	
TakeshiSeenText:
    text "Willkommen in der"
    line "KESSEL-Küche!"

    para "Jetzt spüre"
    line "die Hitze!"
	done
	
TakeshiBeatenText:
	text "Ich rieche, was"
	line "du da kochst!"
	done
	
TakeshiAfterBattleText:
	text "Wer die Hitze"
	line "nicht aushält,"
	para "hat hier nichts"
	line "verloren!"
	done
	
	
TrainerBBTaro:
	trainer BLACKBELT_T, TARO, EVENT_BEAT_BLACKBELT_TARO, TaroSeenText, TaroBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TaroAfterBattleText
	waitbutton
	closetext
	end

TaroSeenText:
    text "Meine Fäuste flie-"
    line "gen schneller, als"
    para "die Schweißperlen"
    line "von meiner Stirn!"
	done
	
TaroBeatenText:
    text "Vielleicht ist"
    line "es Zeit für"
    cont "die Sauna."
	done
	
TaroAfterBattleText:
    text "Kämpfer haben mit"
    line "hier im KESSEL mit"
    para "dem Training be-"
    line "gonnen, weil die"
    para "intensive Hitze"
    line "ihre Herzfunktion"
    cont "stärkt!"
	done

KKC1Itemball1:
	itemball PROTEIN
	
KKC1Itemball2:
	itemball FIRE_STONE


KikaiCaldera1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 17, 19, KIKAI_VILLAGE, 5
	warp_event  5,  3, KIKAI_CALDERA_2F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event 19, 15, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerBBIzo, -1
	object_event 25,  9, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerBBTakeshi, -1
	object_event 14,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerBBTaro, -1
	object_event  0, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, KKC1Itemball1, EVENT_KKC1_ITEMBALL1
	object_event  9,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, KKC1Itemball2, EVENT_KKC1_ITEMBALL2
	
