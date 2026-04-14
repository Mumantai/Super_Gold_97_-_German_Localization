	object_const_def ; object_event constants
	const CROWNPATHGATE_OFFICER
	const CROWNPATHGATE_COOLTRAINERM
	const CROWNPATHGATE_COOLTRAINERF

CrownPathGate_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

CrownPathGateBadgeCheckScene:
	turnobject PLAYER, LEFT
	jump CrownPathGateBadgeCheckScript

CrownPathGateOfficerScript:
	faceplayer
CrownPathGateBadgeCheckScript:
	opentext
	writetext CrownPathGateOfficerText
	buttonsound
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iffalse .NoPokemonEvenYet
	checkcode VAR_BADGES
	ifgreater NUM_NIHON_BADGES - 1, .AllEightBadges
	writetext CrownPathGateNotEnoughBadgesText
	waitbutton
	closetext
	applymovement PLAYER, CrownPathGateStepDownMovement
	end

.NoPokemonEvenYet
	writetext CrownPathGateNotEvenATrainer
	waitbutton
	closetext
	applymovement PLAYER, CrownPathGateStepDownMovement
	end

.AllEightBadges:
	writetext CrownPathGateEightBadgesText
	waitbutton
	closetext
	setscene SCENE_FINISHED
	end

CrownPathGateStepDownMovement:
	step DOWN
	step_end
	
CrownPathGateCooltrainerMScript:
	jumptextfaceplayer CrownPathGateCooltrainerMText
	
CrownPathGateCooltrainerFScript:
	jumptextfaceplayer CrownPathGateCooltrainerFText
	
CrownPathGateCooltrainerMText:
    text "Ich kann es kaum"
    line "glauben!"

    para "Ich stehe kurz"
    line "davor die #MON"
    cont "LIGA herauszu-
    cont "fordern!"

    para "Darauf habe ich"
    line "mein ganzes Leben"
    cont "lang gewartet!"
	done
	
CrownPathGateCooltrainerFText:
    text "Der KOROKANIA-PFAD"
    line "ist ein Kinder-"
    cont "spiel."

    para "Die wahre Heraus-"
    line "forderung ist es,"
    para "von KOROKANIA CITY"
    line "aus den Gipfel des"
    para "KOROKANIABERGs zu"
    line "erklimmen."
	done
	
CrownPathGateNotEvenATrainer:
    text "Du siehst ja nicht"
    line "mal aus wie ein"
    cont "#MON-TRAINER."

    para "Tut mir Leid, aber"
    line "ich kann hier nur"
    para "qualifizierte"
    line "Trainer durch-"
    cont "lassen."
	done

CrownPathGateOfficerText:
	text "Nur Trainer, die"
	line "sich als würdig"
	cont "erwiesen haben,"
	cont "dürfen eintreten."
	done

CrownPathGateNotEnoughBadgesText:
    text "Du besitzt keine"
    line "acht ORDEN."

    para "Tut mir Leid, aber"
    line "nur Trainer, die"
    para "genug ORDEN haben,"
    line "dürfen KOROKANIA"
    para "CITY betreten und"
    line "den KOROKANIABERG"
    cont "erklimmen."
	done

CrownPathGateEightBadgesText:
    text "Oh! Acht Orden!"

    para "Du hast dich als"
    line "würdig erwiesen."

    para "Bitte, geh weiter!"
	done

CrownPathGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  9, 17, SILENT_NORTH, 1
	warp_event 10, 17, SILENT_NORTH, 1
	warp_event  9,  0, CROWN_PATH, 1
	warp_event 10,  0, CROWN_PATH, 2

	db 1 ; coord events
	coord_event 10, 11, SCENE_DEFAULT, CrownPathGateBadgeCheckScene

	db 0 ; bg events

	db 3 ; object events
	object_event  8, 11, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CrownPathGateOfficerScript, -1
	object_event 12,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CrownPathGateCooltrainerMScript, -1
	object_event  7,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, CrownPathGateCooltrainerFScript, -1
