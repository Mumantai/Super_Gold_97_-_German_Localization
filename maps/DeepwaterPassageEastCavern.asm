	object_const_def ; object_event constants
	const DEEPWATERPASSAGEEASTCAVERN_PRYCE
	const DEEPWATERPASSAGEEASTCAVERN_ITEMBALL_1
	const DEEPWATERPASSAGEEASTCAVERN_ITEMBALL_2
	const DEEPWATERPASSAGEEASTCAVERN_ITEMBALL_3
	const DEEPWATERPASSAGEEASTCAVERN_ITEMBALL_4
	const DEEPWATERPASSAGEEASTCAVERN_ITEMBALL_5
 
DeepwaterPassageEastCavern_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
DeepwaterPassageEastCavernMaxRevive:
	itemball MAX_REVIVE

DeepwaterPassageEastCavernRareCandy:
	itemball RARE_CANDY

DeepwaterPassageEastCavernMaxEther:
	itemball MAX_ETHER
	
DeepwaterPassageEastCavernTMSwagger:
	itemball TM_SWAGGER
	
DeepwaterPassageEastCavernHpUp:
	itemball HP_UP

DeepwaterPassageEastCavernPryceScript:
	faceplayer
	opentext
	writetext PryceGreetingText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal RIGHT, .PryceWalksAroundPlayer
	applymovement DEEPWATERPASSAGEEASTCAVERN_PRYCE, PryceLeavesMovement
	disappear DEEPWATERPASSAGEEASTCAVERN_PRYCE
	setevent EVENT_PRYCE_IN_DEEPWATER
	clearevent EVENT_PRYCE_IN_HOME
	end
	
.PryceWalksAroundPlayer:
	applymovement DEEPWATERPASSAGEEASTCAVERN_PRYCE, PryceLeavesMovementAlt
	disappear DEEPWATERPASSAGEEASTCAVERN_PRYCE
	setevent EVENT_PRYCE_IN_DEEPWATER
	clearevent EVENT_PRYCE_IN_HOME
	end

PryceGreetingText:
    text "Ah, hallo."

    para "Ich bekomme hier"
    line "nur selten Besuch."

    para "Mein Name ist"
    line "ALBERT."

    para "Ich bin der"
    line "ARENALEITER von"
    cont "KITAOMORIA CITY."

    para "Ich ziehe mich"
    line "aber gerne mal"
    para "von der PKMN-ARENA"
    line "zurück und trai-"
    para "niere tief in"
    line "dieser Höhle."

    para "Lebe unter den"
    line "EIS-#MON, um"
    para "sie wirklich zu"
    line "verstehen."

    para "…"

    para "Ich verstehe auch,"
    line "wenn du möchtest,"
    para "dass ich wieder"
    line "meinen Posten in"
    para "meiner PKMN-ARENA"
    line "einnehme."

	para "Das werde ich"
	line "zu gegebener Zeit"
	cont "auch tun."

	para "Ich habe Familie,"
	line "die oben in"
	cont "SPIZARDIA lebt."

	para "Ich habe ihnen"
	line "schon gesagt,"
	cont "dass ich sie"
	cont "besuchen werde."

	para "Ich werde mein"
	line "Versprechen nicht"
	cont "brechen."

	para "Ich hoffe, du"
	line "verstehst das."

	para "…"

	para "Ich kann spüren,"
	line "dass du großen"
	para "Respekt gegenüber"
	line "#MON hast."

	para "Das bewundere ich."

	para "Wenn du die Zeit"
	line "hast, besuche doch"
	para "bitte meine"
	line "Familie und mich"
	cont "in SPIZARDIA."

	para "Ich kehre in die"
	line "PKMN-ARENA zurück,"
	para "sobald ich meinen"
	line "Besuch beendet"
	cont "habe."
	done

PryceLeavesMovement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end
	
PryceLeavesMovementAlt:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

DeepwaterPassageEastCavern_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  3, 33, DEEPWATER_PASSAGE_B2F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event 26, 31, SPRITE_PRYCE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DeepwaterPassageEastCavernPryceScript, EVENT_PRYCE_IN_DEEPWATER
	object_event  5, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DeepwaterPassageEastCavernTMSwagger, EVENT_DEEPWATER_EAST_TM_SWAGGER
	object_event 14, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DeepwaterPassageEastCavernMaxEther, EVENT_DEEPWATER_EAST_MAX_ETHER
	object_event 18, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DeepwaterPassageEastCavernMaxRevive, EVENT_DEEPWATER_EAST_MAX_REVIVE
	object_event 16, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DeepwaterPassageEastCavernRareCandy, EVENT_DEEPWATER_EAST_RARE_CANDY
	object_event 10, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DeepwaterPassageEastCavernHpUp, EVENT_DEEPWATER_EAST_HP_UP

