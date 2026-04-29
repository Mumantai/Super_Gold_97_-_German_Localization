	object_const_def ; object_event constants
	const URASOEPARK_POKEFAN_M1
	const URASOEPARK_POKEFAN_M2
	const URASOEPARK_SUPER_NERD
	const URASOEPARK_LASS
	const URASOEPARK_ITEMBALL
	const URASOEPARK_ITEMBALL2

UrasoePark_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerHikerJim:
	trainer HIKER, JIM, EVENT_BEAT_HIKER_JIM, HikerJimSeenText, HikerJimBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerJimAfterBattleText
	waitbutton
	closetext
	end

TrainerEngineerLandon:
	trainer ENGINEER, LANDON, EVENT_BEAT_ENGINEER_LANDON, EngineerLandonSeenText, EngineerLandonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext EngineerLandonAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmRobert:
	trainer POKEFANM, ROBERT, EVENT_BEAT_POKEFANM_ROBERT, PokefanmRobertSeenText, PokefanmRobertBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmRobertAfterBattleText
	waitbutton
	closetext
	end
	
UrasoeParkLassScript:
	jumptextfaceplayer UrasoeParkLassText

TropicalIslandJungleSign:
	jumptext TropicalIslandJungleSignText
	

UrasoeParkMiracleseed:
	itemball MIRACLE_SEED

	
UrasoeParkCalmSeed:
	itemball CALM_SEED

	
UrasoeParkLassText:
	text "Die #MON hier"
	line "sind besonders"
	cont "stark."

	para "Dieses Gebiet"
	line "wurde bewusst"
	para "geschützt, damit"
	line "RUUCHUU CITY"
	cont "sich nicht weiter"
	cont "ausbreiten kann."
	done

HikerJimSeenText:
	text "Hahahah!"
	done

HikerJimBeatenText:
	text "Hahaha-hatschi!"
	done

HikerJimAfterBattleText:
	text "Ich habe Heu-"
	line "schnupfen!"

	para "Haha-hatschi!"
	done

PokefanmRobertSeenText:
	text "Du magst #MON,"
	line "nicht wahr?"

	para "Ich auch!"
	done

PokefanmRobertBeatenText:
	text "Ich gebe zu, ich"
	line "habe verloren."
	done

PokefanmRobertAfterBattleText:
	text "Sieh nur, was du"
	line "meinen #MON"
	cont "angetan hast…"

	para "Das werde ich dir"
	line "nie verzeihen…"
	done
	
EngineerLandonSeenText:
	text "Ich habe einen"
	line "Plan, wie ich"
	cont "gewinne!"
	done

EngineerLandonBeatenText:
	text "Am Plan muss ich"
	line "noch arbeiten!"
	done

EngineerLandonAfterBattleText:
	text "Der Plan war,"
	line "stärkere #MON"
	cont "zu haben."
	done

TropicalIslandJungleSignText:
	text "URASHI-PARK"

	para "Ein Naturreservat"
	line "für #MON"
	done

UrasoePark_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 22,  1, RYUKYU_URASOE_PARK_GATE, 3
	warp_event 23,  1, RYUKYU_URASOE_PARK_GATE, 4
	warp_event 18, 12, URASOE_PARK_URASOE_TRAIL_GATE, 1
	warp_event 19, 12, URASOE_PARK_URASOE_TRAIL_GATE, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event 20,  2, BGEVENT_READ, TropicalIslandJungleSign

	db 6 ; object events
	object_event 30,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerHikerJim, -1
	object_event 16,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 3, TrainerPokefanmRobert, -1
	object_event  4,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 3, TrainerEngineerLandon, -1
	object_event  3, 15, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, UrasoeParkLassScript, -1
	object_event 39,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UrasoeParkMiracleseed, EVENT_PICKED_UP_MIRACLE_SEED_FROM_URASOE_PARK
	object_event  7, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UrasoeParkCalmSeed, EVENT_URASOE_PARK_CALM_SEED
