	object_const_def ; object_event constants
	const ROUTE118_YOUNGSTER
	const ROUTE118_LASS1
	const ROUTE118_LASS2
	const ROUTE118_POKE_BALL
	const SANSKRIT_ROUTE_TRAINER
	const SANSKRIT_ROUTE_MON
	const ROUTE118_FRUIT_TREE
	const ROUTE118_SWIMMERM
	const ROUTE118_SWIMMERM2
	const ROUTE118_SWIMMERM3

Route118_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
SanskritTownRouteCooltrainermScript:
	end
SanskritTownRouteMonsterScript:
	end
	
Route118FruitTree:
	fruittree FRUITTREE_TREE_ROUTE_118

TrainerBirdKeeperHank:
	trainer BIRD_KEEPER, HANK, EVENT_BEAT_BIRD_KEEPER_HANK, BirdKeeperHankSeenText, BirdKeeperHankBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperHankAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerHope:
	trainer PICNICKER, HOPE, EVENT_BEAT_PICNICKER_HOPE, PicnickerHopeSeenText, PicnickerHopeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerHopeAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerSharon:
	trainer PICNICKER, SHARON, EVENT_BEAT_PICNICKER_SHARON, PicnickerSharonSeenText, PicnickerSharonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerSharonAfterBattleText
	waitbutton
	closetext
	end
	

TrainerSwimmermRandall:
	trainer SWIMMERM, RANDALL, EVENT_BEAT_SWIMMERM_RANDALL, SwimmermRandallSeenText, SwimmermRandallBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermRandallAfterBattleText
	waitbutton
	closetext
	end
	

TrainerSwimmermBerke:
	trainer SWIMMERM, BERKE, EVENT_BEAT_SWIMMERM_BERKE, SwimmermBerkeSeenText, SwimmermBerkeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermBerkeAfterBattleText
	waitbutton
	closetext
	end
	
TrainerSwimmermHal:
	trainer SWIMMERM, HAL, EVENT_BEAT_SWIMMERM_HAL, SwimmermHalSeenText, SwimmermHalBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermHalAfterBattleText
	waitbutton
	closetext
	end

Route118Sign:
	jumptext Route118SignText

Route118HPUp:
	itemball HP_UP

Route118HiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_ROUTE_118_HIDDEN_ULTRA_BALL
	
	
SwimmermHalSeenText:
    text "Gehst du nach"
    line "KAZANAMI CITY?"

    para "Wie wäre es zuerst"
    line "mit einem Kampf?"
	done
	
SwimmermHalBeatenText:
	text "Den habe ich"
	line "verloren!"
	done


SwimmermHalAfterBattleText:
    text "Ich würde sagen,"
    line "ich bin ein bess-"
    cont "erer Schwimmer als"
    line "du. Yeah!"
	done

BirdKeeperHankSeenText:
	text "Ich trainiere"
	line "#MON. Trittst"
	cont "du gegen mich an?"
	done

BirdKeeperHankBeatenText:
	text "Uff! Ich habe"
	line "verloren…"
	done

BirdKeeperHankAfterBattleText:
	text "Hast du ein spe-"
	line "zielles #MON,"

	para "das du trainieren"
	line "möchtest, setze es"

	para "an die erste Stel-"
	line "le und tausche es"
	cont "sofort aus."

	para "So funktioniert"
	line "das."
	done

PicnickerHopeSeenText:
	text "Ich spüre, dass"
	line "ich gewinnen kann."

	para "Mal sehen, ob"
	line "das stimmt!"
	done

PicnickerHopeBeatenText:
	text "Argh, du bist zu"
	line "stark."
	done

PicnickerHopeAfterBattleText:
    text "Ich hörte, dass"
    line "manche #MON"
    cont "Baby-Formen haben,"

    para "die aus EIERN"
    line "schlüpfen."

    para "Aber wo bekommt"
    line "man ein #MON-EI"
    cont "her?"
	done

PicnickerSharonSeenText:
	text "Ähm…"
	line "Ich…"
	done

PicnickerSharonBeatenText:
	text "…"
	done

PicnickerSharonAfterBattleText:
    text "……Ich kam her, um"
    line "PIEPI zu sehen,"

    para "aber ich habe"
    line "keines gefunden."
	done
	

	
SwimmermRandallSeenText:
	text "Heh, du bist jung"
	line "und fit!"

	para "Surfe nicht auf"
	line "deinem #MON!"
	cont "Schwimme!"
	done

SwimmermRandallBeatenText:
	text "Oh, oh. Ich habe"
	line "verloren…"
	done

SwimmermRandallAfterBattleText:
	text "Schwimmen hält"
	line "deinen ganzen"
	cont "Körper fit und"
	cont "gesund."
	done

Route118SignText:
	text "ROUTE 118"
	para "KAZANAMI CITY -"
	line "GLYPHONTIA"
	done
	
SwimmermBerkeSeenText:
	text "Das Wasser ist"
	line "schön warm. Ich"
	cont "bin also sehr"
	cont "locker und gelenk."

	para "Natürlich trete"
	line "ich gegen dich an!"
	done
	
SwimmermBerkeBeatenText:
	text "Oje! Ich habe eine"
	line "Gänsehaut!"
	done

SwimmermBerkeAfterBattleText:
	text "Ist es nicht"
	line "sehr entspannend,"
	cont "sich auf dem"
	cont "Wasser treiben"
	cont "zu lassen?"
	done

Route118_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  4, 11, ROUTE_118_SUNPOINT_GATE, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  6, 10, BGEVENT_READ, Route118Sign
	bg_event 12, 13, BGEVENT_ITEM, Route118HiddenUltraBall

	db 10 ; object events
	object_event 64,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperHank, -1
	object_event  8, 12, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerPicnickerHope, -1
	object_event 11,  9, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerPicnickerSharon, -1
	object_event 20,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route118HPUp, EVENT_ROUTE_118_HP_UP
	object_event 72,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, SanskritTownRouteCooltrainermScript, -1
	object_event 72,  5, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, SanskritTownRouteMonsterScript, -1
	object_event  5,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route118FruitTree, -1
	object_event 55,  8, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSwimmermRandall, -1
	object_event 44,  9, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 4, TrainerSwimmermBerke, -1
	object_event 30,  5, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 4, TrainerSwimmermHal, -1
