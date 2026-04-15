	object_const_def ; object_event constants
	const MTFUJIINTERIORUPPER_COOLTRAINER_F
	const MTFUJIINTERIORUPPER_BIRDKEEPER
	const MTFUJIINTERIORUPPER_SWIMMER_M
	const MTFUJIINTERIORUPPER_SOLDIER
	const MTFUJIINTERIORUPPER_COOLTRAINER_M
	const MTFUJIINTERIORUPPER_PSYCHIC
	const MTFUJIINTERIORUPPER_FIREBREATHER
	const MTFUJIINTERIORUPPER_HIKER
	const MTFUJIINTERIORUPPER_HIKER2
	const MTFUJIINTERIORUPPER_COOLTRAINER_M2
	const MTFUJIINTERIORUPPER_COOLTRAINER_F2
	const MTFUJIINTERIORUPPER_ITEM_1
	const MTFUJIINTERIORUPPER_ITEM_2
	const MTFUJIINTERIORUPPER_ITEM_3

MtFujiInteriorUpper_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	

MtFujiInteriorUpperHelixFossil:
	itemball HELIX_FOSSIL

	
MtFujiInteriorUpperNugget:
	itemball NUGGET
	
MtFujiInteriorUpperToxic:
	itemball TM_TOXIC

MtFujiInteriorUpperHiddenPpUp:
	hiddenitem PP_UP, EVENT_MT_FUJI_INTERIOR_UPPER_HIDDEN_PP_UP

	
TrainerCooltrainerfJenn:
	trainer COOLTRAINERF, JENN, EVENT_BEAT_COOLTRAINERF_JENN, CooltrainerfJennSeenText, CooltrainerfJennBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfJennAfterBattleText
	waitbutton
	closetext
	end
	
TrainerBirdkeeperRoy:
	trainer BIRD_KEEPER, ROY, EVENT_BEAT_BIRD_KEEPER_ROY, BirdkeeperRoySeenText, BirdkeeperRoyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdkeeperRoyAfterBattleText
	waitbutton
	closetext
	end
	

TrainerSwimmermKirk:
	trainer SWIMMERM, KIRK, EVENT_BEAT_SWIMMERM_KIRK, SwimmermKirkSeenText, SwimmermKirkBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermKirkAfterBattleText
	waitbutton
	closetext
	end

TrainerSoldierAntonio:
	trainer SOLDIER, ANTONIO, EVENT_BEAT_SOLDIER_ANTONIO, SoldierAntonioSeenText, SoldierAntonioBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SoldierAntonioAfterBattleText
	waitbutton
	closetext
	end


TrainerCooltrainermAndy:
	trainer COOLTRAINERM, ANDY, EVENT_BEAT_COOLTRAINERM_ANDY, CooltrainermAndySeenText, CooltrainermAndyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermAndyAfterBattleText
	waitbutton
	closetext
	end
	

TrainerPsychicRichard:
	trainer PSYCHIC_T, RICHARD, EVENT_BEAT_PSYCHIC_RICHARD, PsychicRichardSeenText, PsychicRichardBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicRichardAfterBattleText
	waitbutton
	closetext
	end
	

TrainerFirebreatherWalt:
	trainer FIREBREATHER, WALT, EVENT_BEAT_FIREBREATHER_WALT, FirebreatherWaltSeenText, FirebreatherWaltBeatenText, 0, .Script
	
.Script:
	endifjustbattled
	opentext
	writetext FirebreatherWaltAfterBattleText
	waitbutton
	closetext
	end


TrainerHikerMichael:
	trainer HIKER, MICHAEL, EVENT_BEAT_HIKER_MICHAEL, HikerMichaelSeenText, HikerMichaelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerMichaelAfterBattleText
	waitbutton
	closetext
	end


TrainerHikerKenny:
	trainer HIKER, KENNY, EVENT_BEAT_HIKER_KENNY, HikerKennySeenText, HikerKennyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerKennyAfterBattleText
	waitbutton
	closetext
	end
	
TrainerCooltrainermTyler:
	trainer COOLTRAINERM, TYLER, EVENT_BEAT_COOLTRAINERM_TYLER, CooltrainermTylerSeenText, CooltrainermTylerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermTylerAfterBattleText
	waitbutton
	closetext
	end
	
TrainerCooltrainerfCybil:
	trainer COOLTRAINERF, CYBIL, EVENT_BEAT_COOLTRAINERF_CYBIL, CooltrainerfCybilSeenText, CooltrainerfCybilBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfCybilAfterBattleText
	waitbutton
	closetext
	end

BirdkeeperRoySeenText:
    text "Meine Vögel haben"
    line "in dieser Höhle"
    cont "kaum Platz zum"
    cont "Fliegen."
	done

BirdkeeperRoyBeatenText:
	text "Abgestürzt!"
	done

BirdkeeperRoyAfterBattleText:
    text "Meine Vögel geben"
    line "immer ihr Bestes."
	done

CooltrainerfJennSeenText:
    text "Mal sehen, ob du"
    line "das Zeug dazu"
    para "hast, die LIGA"
    line "herauszufordern."
	done

CooltrainerfJennBeatenText:
	text "Ja, das hast du…"
	done

CooltrainerfJennAfterBattleText:
    text "Um die LIGA zu"
    line "gewinnen, musst du"
    para "die TOP VIER am"
    line "Stück besiegen."

    para "Und danach noch"
    line "den CHAMP."

    para "Das ist ein Stück."

    para "Du solltest vorbe-"
    line "reitet sein!"
	done

SwimmermKirkSeenText:
    text "Das Wasser hier"
    line "ist so ruhig."

    para "Das ist irgendwie"
    line "unheimlich."
	done

SwimmermKirkBeatenText:
	text "Treffer versenkt!"
	done

SwimmermKirkAfterBattleText:
    text "Es muss toll sein,"
    line "auf einem #MON"
    cont "zu reiten."
	done

SoldierAntonioSeenText:
    text "Nur ein echter"
    line "Soldat schafft es"
    cont "durch diese Höhle!"
	done
	
SoldierAntonioBeatenText:
    text "Immer weiter"
    line "vorwärts!"
	done
	
SoldierAntonioAfterBattleText:
    text "Es ist Zeit für"
    line "dich, weiter zu"
    cont "marschieren!"
	done
	
CooltrainermAndySeenText:
	text "Welcher Weg ist"
	line "der richtige?"
	done

CooltrainermAndyBeatenText:
	text "Der hier war es"
	line "wohl nicht."
	done

CooltrainermAndyAfterBattleText:
    text "Das war eine"
    line "ernste Frage."

    para "Ich will mich hier"
    line "nicht verlaufen."
	done	

PsychicRichardSeenText:
    text "Ich kenne dein"
    line "tiefstes Begehren!"
	done

PsychicRichardBeatenText:
	text "Guter Kampf!"
	done

PsychicRichardAfterBattleText:
    text "Du willst es aus"
    line "dieser Höhle"
    cont "schaffen!"

    para "…Das war ziemlich"
    line "offensichtlich."
	done
	
FirebreatherWaltSeenText:
    text "Ich mag meine"
    line "Höhlen warm und"
    cont "muckelig."

    para "Das ist diese"
    line "hier nicht."
	done
	
FirebreatherWaltBeatenText:
	text "Aua, heiß!"
	done

FirebreatherWaltAfterBattleText:
    text "Es ist ziemlich"
    line "kühl hier."

    para "Warst du schon im"
    line "MAGMA-SCHACHT?"

    para "Da ist es viel"
    line "heißer!"
	done

HikerMichaelSeenText:
	text "He! Du hast Mumm"
	line "in den Knochen!"
	cont "Aber weißt du was?"

	para "Wenn es um echte"
	line "Courage geht, bin"
	cont "ich der Mann!"
	done

HikerMichaelBeatenText:
	text "Meine #MON"
	line "waren leider nicht"
	cont "couragiert genug!"
	done

HikerMichaelAfterBattleText:
	text "Mensch, wie ich"
	line "diese KP-PLUS"
	cont "liebe! Mm, lecker!"

	para "Ich trinke immer"
	line "die von meinen"
	cont "#MON!"

	para "Ich kann nichts"
	line "dagegen tun!"
	done


HikerKennySeenText:
	text "Ich sollte mir"
	line "ein ONIX fangen."
	done

HikerKennyBeatenText:
	text "Ich habe verloren…"
	done

HikerKennyAfterBattleText:
	text "Es scheint, als"
	line "würden sich geo-"
	cont "logische Gegeben-"
	cont "heiten nicht"
	cont "ändern."

	para "Aber sie ändern"
	line "sich; langsam,"
	cont "ganz langsam."

	para "Der KOROKANIABERG"
	line "war vor vielen"
	cont "Jahrtausenden um"
	cont "einiges kleiner."
	done
	
CooltrainermTylerSeenText:
    text "Das ist der letzte"
    line "Abschnitt vor dem"
    cont "Gipfel!"

    para "Packst du das?"
	done

CooltrainermTylerBeatenText:
	text "Ich glaube, du"
	line "packst das."
	done

CooltrainermTylerAfterBattleText:
    text "Du stehst kurz"
    line "davor, die LIGA"
    cont "herauszufordern."

    para "Wie fühlst du"
    line "dich dabei?"
	done

CooltrainerfCybilSeenText:
	text "Du siehst sehr"
	line "stark aus."

	para "Gute Trainer"
	line "suchen instinktiv"
	cont "nach starken"
	cont "Gegnern."
	done

CooltrainerfCybilBeatenText:
	text "Nein! So geht das"
	line "auf gar keinen"
	cont "Fall."
	done

CooltrainerfCybilAfterBattleText:
	text "Mit den Kämpfen"
	line "steigen unsere"
	cont "Erfahrungen und"
	cont "wir werden besser."

	para "Ich habe viele"
	line "Kämpfe ausge-"
	cont "tragen, um das zu"
	cont "werden, was ich"
	cont "heute bin - ein"
	cont "Profi."
	done	

MtFujiInteriorUpper_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 25, 51, MOUNT_FUJI_OUTSIDE, 6
	warp_event 15, 41, MOUNT_FUJI_OUTSIDE, 7
	warp_event  9, 33, MOUNT_FUJI_OUTSIDE, 8
	warp_event 19,  1, FUJI_SUMMIT, 3
	warp_event 28, 41, MT_FUJI_INTERIOR_LOWER, 9

	db 0 ; coord events

	db 1 ; bg events
	bg_event  3, 20, BGEVENT_ITEM, MtFujiInteriorUpperHiddenPpUp

	db 14 ; object events
	object_event 26, 45, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfJenn, -1
	object_event 15, 45, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBirdkeeperRoy, -1
	object_event  7, 47, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_TRAINER, 3, TrainerSwimmermKirk, -1
	object_event 13, 31, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSoldierAntonio, -1
	object_event 18, 29, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermAndy, -1
	object_event 21, 24, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerPsychicRichard, -1
	object_event 14, 17, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerFirebreatherWalt, -1
	object_event 26, 12, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_TRAINER, 2, TrainerHikerMichael, -1
	object_event 15,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerHikerKenny, -1
	object_event 36, 14, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermTyler, -1
	object_event  8, 15, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerfCybil, -1
	object_event 37, 31, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MtFujiInteriorUpperNugget, EVENT_MT_FUJI_INTERIOR_UPPER_NUGGET
	object_event 37,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MtFujiInteriorUpperToxic, EVENT_MT_FUJI_INTERIOR_UPPER_TOXIC
	object_event  2,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MtFujiInteriorUpperHelixFossil, EVENT_MT_FUJI_INTERIOR_UPPER_HELIX_FOSSIL
