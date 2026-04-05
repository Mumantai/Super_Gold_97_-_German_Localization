	object_const_def ; object_event constants
	const ROUTE109_BEAUTY
;	const ROUTE109_POKEFAN_M
	const ROUTE109_POKEFAN_F1
	const ROUTE109_PSYCHIC_NORMAN
	const ROUTE109_FRUIT_TREE
	const ROUTE109_POKEFAN_F2
	const ROUTE109_BUGCATCHER

Route109_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


TrainerBugCatcherEd:
	trainer BUG_CATCHER, ED, EVENT_BEAT_BUG_CATCHER_ED, BugCatcherEdSeenText, BugCatcherEdBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherEdAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanfRuth:
	trainer POKEFANF, RUTH, EVENT_BEAT_POKEFANF_RUTH, PokefanfRuthSeenText, PokefanfRuthBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanfRuthAfterBattleText
	waitbutton
	closetext
	end


TrainerBeautyValerie:
	trainer BEAUTY, VALERIE, EVENT_BEAT_BEAUTY_VALERIE, BeautyValerieSeenText, BeautyValerieBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext BeautyValerieAfterBattleText
	waitbutton
	closetext
	end


TrainerPsychicNorman:
	trainer PSYCHIC_T, NORMAN, EVENT_BEAT_PSYCHIC_NORMAN, PsychicNormanSeenText, PsychicNormanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicNormanAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanfJaime:
	faceplayer
	opentext
	checktime NITE
	iffalse .NotNight
	checkevent EVENT_BEAT_POKEFANF_JAIME
	iftrue .Beaten
	writetext PokefanfJaimeSeenText
	waitbutton
	closetext
	winlosstext PokefanfJaimeBeatenText, 0
	loadtrainer POKEFANF, JAIME
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_POKEFANF_JAIME
	closetext
	end

.Beaten:
	writetext PokefanfJaimeAfterBattleText
	waitbutton
	closetext
	end

.NotNight:
	writetext PokefanfJaimeHopeItGetsDarkText
	waitbutton
	closetext
	end



Route109PokecenterSign:
	jumptext Route109PokecenterSignText


Route109FruitTree:
	fruittree FRUITTREE_TREE_ROUTE_109

Route109HiddenNugget:
	hiddenitem NUGGET, EVENT_ROUTE_109_HIDDEN_NUGGET
	

BugCatcherEdSeenText:
    text "Setzt du Käfer-"
    line "#MON ein?"
	done

BugCatcherEdBeatenText:
    text "Ich benutze aus-"
    line "schließlich Käfer-"
    cont "#MON!"
	done

BugCatcherEdAfterBattleText:
	text "Jeder Trainer"
	line "sollte ein paar"
	cont "Käfer-#MON"
	cont "einsetzen!"
	done

PokefanmDerekSeenText:
	text "Genau der richtige"
	line "Moment, um mit"
	cont "PIKACHU anzugeben!"
	done

PokefanmDerekBeatenText:
	text "Ich hatte keine"
	line "Zeit, mit PIKACHU"
	cont "zu prahlen…"
	done

PokefanMDerekText_NotBragging:
	text "Ich höre mir deine"
	line "Prahlerei gar"
	cont "nicht an!"

	para "Wir #-FANS"
	line "haben ein Gelübde,"

	para "das uns verbietet,"
	line "Leuten beim"
	cont "Prahlen zuzuhören!"
	done

PokefanfRuthSeenText:
	text "Was für süße"
	line "#MON!"

	para "Zeigen wir uns"
	line "gegenseitig unsere"
	cont "#MON, und zwar"
	cont "gleichzeitig!"
	done

PokefanfRuthBeatenText:
	text "Mir macht es"
	line "nichts aus,"
	cont "zu verlieren."
	done

PokefanfRuthAfterBattleText:
	text "Weißt du über"
	line "Baby-#MON"
	cont "Bescheid?"

	para "Die sind bestimmt"
	line "super-süß!"
	done

PokefanMDerekPikachuIsItText:
	text "PIKACHU muss sein!"
	line "Was meinst du?"
	done

PsychicNormanSeenText:
	text "Zeig doch mal, was"
	line "deine #MON"
	cont "drauf haben."
	done

PsychicNormanBeatenText:
	text "He, deine #MON"
	line "sind sehr fähig!"
	done

PsychicNormanAfterBattleText:
	text "Du weißt von den"
	line "unterschiedlichen"
	cont "#-Fähigkeiten?"

	para "Bei den Menschen"
	line "ist das ganz"
	cont "ähnlich. Jeder hat"
	cont "unterschiedliche"
	cont "Talente."
	done

PokefanfJaimeHopeItGetsDarkText:
	text "Ufu… Ich hoffe, es"
	line "wird bald dunkel."
	done

PokefanfJaimeSeenText:
	text "Du kommst gerade"
	line "recht."

	para "Auf in den Kampf."
	done

PokefanfJaimeBeatenText:
	text "Oh, wie"
	line "ernüchternd…"
	done

PokefanfJaimeAfterBattleText:
	text "Ich traf PONITA"
	line "NACHTs, genau hier"
	cont "auf ROUTE 109."

	para "Ich weiß nicht"
	line "warum, aber es"

	para "scheint es zu"
	line "mögen, wenn ich"
	cont "hier trainiere."

	para "Es scheint mich"
	line "durch das Training"

	para "hier mehr zu"
	line "mögen, als wenn"

	para "ich woanders"
	line "trainiere."
	done


BeautyValerieSeenText:
	text "Hallo! Du bist"
	line "bestimmt so nett"

	para "und zeigst mir"
	line "deine #MON?"
	done

BeautyValerieBeatenText:
	text "Ich bin froh, dass"
	line "ich deine #MON"
	cont "sehen durfte!"
	done

BeautyValerieAfterBattleText:
	text "Wenn ich #-"
	line "MON sehe, scheint"
	cont "mich das zu"
	cont "entspannen."
	done

Route109PokecenterSignText:
	text "Lass deine"
	line "#MON in einem"
	cont "#MON-CENTER"
	cont "heilen!"
	done

Route109_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 15, 13, AMPARE_CAVERN_1F, 1
	warp_event 13, 28, ROUTE_109_POKECENTER_1F, 1
	warp_event  8,  5, ROUTE_109_ROUTE_110_GATE, 1
	warp_event  9,  5, ROUTE_109_ROUTE_110_GATE, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14, 28, BGEVENT_READ, Route109PokecenterSign
	bg_event  4, 11, BGEVENT_ITEM, Route109HiddenNugget

	db 6 ; object events
	object_event  4, 63, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerBeautyValerie, -1
;	object_event  9, 52, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 4, TrainerPokefanmDerek, -1
	object_event 14, 36, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 1, TrainerPokefanfRuth, -1
	object_event  5, 31, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_TRAINER, 3, TrainerPsychicNorman, -1
	object_event 10, 23, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route109FruitTree, -1
	object_event  4, 49, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, TrainerPokefanfJaime, -1
	object_event  9, 84, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerBugCatcherEd, -1
