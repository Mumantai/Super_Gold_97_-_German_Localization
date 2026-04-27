	object_const_def ; object_event constants
	const MERIDIANPATH_YOUNGSTER1
	const MERIDIANPATH_LASS1
	const MERIDIANPATH_YOUNGSTER2
	const MERIDIANPATH_LASS2
	const MERIDIANPATH_YOUNGSTER3
	const MERIDIANPATH_LASS3
	const MERIDIANPATH_SUPER_NERD
	const MERIDIANPATH_COOLTRAINER_M2
	const MERIDIANPATH_POKE_BALL

MeridianPath_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


TrainerBeautyVictoria:
	trainer BEAUTY, VICTORIA, EVENT_BEAT_BEAUTY_VICTORIA, BeautyVictoriaSeenText, BeautyVictoriaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyVictoriaAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyJoe:
	trainer SCHOOLBOY, JOE, EVENT_BEAT_SCHOOLBOY_JOE, SchoolboyJoeSeenText, SchoolboyJoeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyJoeAfterBattleText
	waitbutton
	closetext
	end

TrainerLassLaura:
	trainer LASS, LAURA, EVENT_BEAT_LASS_LAURA, LassLauraSeenText, LassLauraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassLauraAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperLloyd:
	trainer CAMPER, LLOYD, EVENT_BEAT_CAMPER_LLOYD, CamperLloydSeenText, CamperLloydBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperLloydAfterBattleText
	waitbutton
	closetext
	end

TrainerLassShannon:
	trainer LASS, SHANNON, EVENT_BEAT_LASS_SHANNON, LassShannonSeenText, LassShannonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassShannonAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdPat:
	trainer SUPER_NERD, PAT, EVENT_BEAT_SUPER_NERD_PAT, SupernerdPatSeenText, SupernerdPatBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdPatAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermKevin:
	trainer COOLTRAINERM, KEVIN, EVENT_BEAT_COOLTRAINERM_KEVIN, CooltrainermKevinSeenText, CooltrainermKevinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermKevinAfterBattleText
	waitbutton
	closetext
	end


MeridianPathProtein:
	itemball PROTEIN

MeridianPathHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_MERIDIAN_PATH_HIDDEN_HYPER_POTION
	
MeridianPathSign:
	jumptext MeridianPathSignText
	
MeridianPathSignText:
	text "MERIDIAN-PFAD"

	para "NAGOTANI    -"
	line "RUUCHUU CITY"
	done


BeautyVictoriaSeenText:
    text "Hast du schon mal"
    line "den RUẞGIPFEL"
    cont "bestiegen?"
	done

BeautyVictoriaBeatenText:
	text "Wie konnte ich"
	line "verlieren?"
	done

BeautyVictoriaAfterBattleText:
    text "Die Aussicht ist"
    line "toll da oben."
	done

SchoolboyJoeSeenText:
    text "Du hast ganz NIHON"
    line "bereist?"

    para "Das ist cool."

    para "Aber hast du auch"
    line "eine Chance gegen"
    cont "einen Trainer wie"
    cont "mich?"
	done

SchoolboyJoeBeatenText:
    text "Au! Plattgemacht!"
	done

SchoolboyJoeAfterBattleText:
    text "So wie es aus-"
    line "sieht, hattest du"
    para "auf deinen Reisen"
    line "eine Menge Zeit,"
    para "um deine #MON"
    line "zu trainieren."
	done

LassLauraSeenText:
    text "Du siehst aus,"
    line "als wärst du weit"
    cont "weg von zu Hause."
	done

LassLauraBeatenText:
    text "Ich bin raus!"
	done

LassLauraAfterBattleText:
    text "Woher kommst du?"

    para "SILENITIA?"

    para "Da war ich noch"
    line "nie."
	done

CamperLloydSeenText:
    text "Gehst du zum"
    line "RUẞGIPFEL?"
	done

CamperLloydBeatenText:
	text "Woah! Zu viel."
	done

CamperLloydAfterBattleText:
    text "Der Legende nach,"
    line "nistet ein selten-"
    cont "es #MON hier."

    para "Ich bin schon bis"
    line "auf den Gipfel"
    para "geklettert, aber"
    line "ich habe nie etwas"
    cont "gesehen."
	done

LassShannonSeenText:
    text "Lass mich dir"
    line "sagen, ich bin"
    cont "eine harte Nuss!"
	done

LassShannonBeatenText:
	text "Du machst Witze."
	done

LassShannonAfterBattleText:
    text "Ich habe alles"
    line "gegeben, aber du"
    cont "warst wohl besser."
	done

SupernerdPatSeenText:
	text "Uffuffuff…"

	para "Kämpf mit mir."
	done

SupernerdPatBeatenText:
	text "Du hättest nicht"
	line "gewinnen sollen."
	done

SupernerdPatAfterBattleText:
    text "Es gibt da diese"
    line "Frau in NAGOTANI,"
    para "die einen Haufen"
    line "GLUMANDAs in ihrem"
    cont "Haus hat."

    para "Ich mache mir"
    line "Sorgen, dass es"
    cont "bald Feuer fängt."
	done


CooltrainermKevinSeenText:
    text "Du möchtest"
    line "kämpfen, oder?"

    para "Oder?"
	done

CooltrainermKevinBeatenText:
	text "Das war der beste"
	line "Kampf meines"
	cont "Lebens!"
	done

CooltrainermKevinAfterBattleText:
	text "Der Kampf war"
	line "großartig!"

	para "Du und deine #-"
	line "MON seid ein"
	cont "perfektes Team!"
	done


MeridianPath_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  4, 47, MERIDIAN_PATH_RYUKYU_GATE, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  4, 14, BGEVENT_ITEM, MeridianPathHiddenHyperPotion
	bg_event 11,  5, BGEVENT_READ, MeridianPathSign

	db 8 ; object events
	object_event  9,  7, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautyVictoria, -1
	object_event  8, 47, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSchoolboyJoe, -1
	object_event 13, 44, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLassLaura, -1
	object_event 14, 22, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCamperLloyd, -1
	object_event  8, 18, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerLassShannon, -1
	object_event  6, 37, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerSupernerdPat, -1
	object_event 13, 11, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 4, TrainerCooltrainermKevin, -1
	object_event  6, 44, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MeridianPathProtein, EVENT_MERIDIAN_PATH_PROTEIN
