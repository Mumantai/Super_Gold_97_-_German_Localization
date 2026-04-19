	object_const_def ; object_event constants
	const SEASIDE_PATH_YOUNGSTER_1
	const SEASIDE_PATH_YOUNGSTER_2
	const SEASIDE_PATH_POKEFAN_M
	const SEASIDE_PATH_POKEFAN_M_2
	const SEASIDE_PATH_ITEMBALL
	
SeasidePath_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerPsychicFidel:
	trainer PSYCHIC_T, FIDEL, EVENT_BEAT_PSYCHIC_FIDEL, PsychicFidelSeenText, PsychicFidelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicFidelAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperPeter:
	trainer BIRD_KEEPER, PETER, EVENT_BEAT_BIRD_KEEPER_PETER, BirdKeeperPeterSeenText, BirdKeeperPeterBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperPeterAfterText
	waitbutton
	closetext
	end
	
TrainerPokefanmJoshua:
	trainer POKEFANM, JOSHUA, EVENT_BEAT_POKEFANM_JOSHUA, PokefanmJoshuaSeenText, PokefanmJoshuaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmJoshuaAfterBattleText
	waitbutton
	closetext
	end
	

TrainerHikerTimothy:
	trainer HIKER, TIMOTHY, EVENT_BEAT_HIKER_TIMOTHY, HikerTimothySeenText, HikerTimothyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerTimothyAfterBattleText
	waitbutton
	closetext
	end
	
SeasidePathCleanseTag:
	itemball CLEANSE_TAG


SeasidePathSign:
	jumptext SeasidePathSignText
	
JouleCaveSign:
	jumptext JouleCaveSignText
	
SeasidePathSignText:
	text "KÜSTENPFAD"

	para "AMAMIA -"
	line "NAGOTANI"
	done
	
JouleCaveSignText:
	text "JOULEHÖHLE"
	line "EINGANG"
	done

HikerTimothySeenText:
	text "Warum ich auf"
	line "Berge klettere?"

	para "Weil es sie"
	line "gibt."

	para "Warum ich"
	line "#MON trainiere?"

	para "Weil es sie"
	line "gibt!"
	done

HikerTimothyBeatenText:
	text "Niederlagen…"
	line "Die gibt es auch!"
	done

HikerTimothyAfterBattleText:
	text "#MON zu"
	line "entdecken, war das"

	para "Beste, was mir"
	line "passieren konnte."
	done

PsychicFidelSeenText:
	text "Ich kann es sehen…"

	para "Ich kann alles"
	line "über dich sehen…"
	done

PsychicFidelBeatenText:
	text "Deine Stärke"
	line "konnte ich nicht"
	cont "sehen…"
	done

PsychicFidelAfterBattleText:
    text "Wusstest du? Das"
    line "worauf ich hier"
    para "stehe, ist im"
    line "Grunde eine eigene"
    cont "kleine Insel."
	done

BirdKeeperPeterSeenText:
    text "Meine Vögel können"
    line "nicht weit genug"
    para "fliegen, um mich"
    line "zurück aufs Fest-"
    cont "land zu bringen."
	done

BirdKeeperPeterBeatenText:
	text "Ich kenne meine"
	line "Schwächen."
	done

BirdKeeperPeterAfterText:
    text "Ich wünschte, ich"
    line "könnte fliegen…"
	done
	
PokefanmJoshuaSeenText:
	text "Hihi! Möchtest du"
	line "gegen mein"
	cont "PIKACHU-Team"
	cont "antreten?"
	done

PokefanmJoshuaBeatenText:
	text "PI-PIKACHU!"
	done

PokefanmJoshuaAfterBattleText:
	text "Es scheint, dass"
	line "du viele #MON"

	para "hast, aber PIKACHU"
	line "ist immer noch das"
	cont "Beste."
	done

SeasidePath_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 11, SEASIDE_PATH_ISEN_STRAIT_GATE, 4
	warp_event 53, 11, JOULE_CAVE_1F, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 26,  4, BGEVENT_READ, SeasidePathSign
	bg_event 52, 12, BGEVENT_READ, JouleCaveSign

	db 5 ; object events
	object_event 15, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerBirdKeeperPeter, -1
	object_event 43, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPsychicFidel, -1
	object_event 21,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 3, TrainerPokefanmJoshua, -1
	object_event 30,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerHikerTimothy, -1
	object_event 50,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SeasidePathCleanseTag, EVENT_PICKED_UP_CLEANSE_TAG_FROM_SEASIDE_PATH
