	object_const_def ; object_event constants
	const KANTOGAMECORNER_CLERK
	const KANTOGAMECORNER_RECEPTIONIST
	const KANTOGAMECORNER_POKEFAN_M
	const KANTOGAMECORNER_TEACHER
	const KANTOGAMECORNER_FISHING_GURU
	const KANTOGAMECORNER_FISHER1
	const KANTOGAMECORNER_FISHER2
	const KANTOGAMECORNER_GYM_GUY
	const KANTOGAMECORNER_GRAMPS
	const KANTOGAMECORNER_N64_ROCKER

KantoGameCorner_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoGameCornerClerkScript:
	jumpstd GameCornerCoinVendorScript

KantoGameCornerReceptionistScript:
	jumptextfaceplayer KantoGameCornerReceptionistText

KantoGameCornerPokefanMScript:
	faceplayer
	opentext
	writetext KantoGameCornerPokefanMText
	waitbutton
	closetext
	turnobject KANTOGAMECORNER_POKEFAN_M, RIGHT
	end

KantoGameCornerTeacherScript:
	faceplayer
	opentext
	writetext KantoGameCornerTeacherText
	waitbutton
	closetext
	turnobject KANTOGAMECORNER_TEACHER, RIGHT
	end

KantoGameCornerFishingGuruScript:
	faceplayer
	opentext
	writetext KantoGameCornerFishingGuruText
	waitbutton
	closetext
	turnobject KANTOGAMECORNER_FISHING_GURU, RIGHT
	end

KantoGameCornerFisherScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_COINS_FROM_GAMBLER_AT_KANTO
	iftrue .GotCoins
	writetext KantoGameCornerFisherText1
	buttonsound
	checkitem COIN_CASE
	iffalse .NoCoinCase
	checkcoins MAX_COINS - 1
	ifequal HAVE_MORE, .FullCoinCase
	stringtotext .coinname, MEM_BUFFER_1
	scall .GiveCoins
	givecoins 18
	setevent EVENT_GOT_COINS_FROM_GAMBLER_AT_KANTO
.GotCoins:
	writetext KantoGameCornerFisherText2
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

.GiveCoins:
	jumpstd ReceiveItemScript
	end

.coinname
	db "MÜNZEN@"

.NoCoinCase:
	writetext KantoGameCornerFisherNoCoinCaseText
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

.FullCoinCase:
	writetext KantoGameCornerFisherFullCoinCaseText
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

KantoGymGuyScript:
	jumptextfaceplayer KantoGymGuyText

KantoGameCornerGrampsScript:
	faceplayer
	opentext
	writetext KantoGameCornerGrampsText
	waitbutton
	closetext
	turnobject KANTOGAMECORNER_GRAMPS, LEFT
	end

KantoGameCornerPoster1Script:
	jumptext KantoGameCornerPoster1Text

KantoGameCornerPoster2Script:
	jumptext KantoGameCornerPoster2Text

KantoGameCornerLuckySlotMachineScript:
	random 6
	ifequal 0, KantoGameCornerSlotMachineScript
	refreshscreen
	writebyte FALSE
	special SlotMachine
	closetext
	end

KantoGameCornerSlotMachineScript:
	refreshscreen
	writebyte TRUE
	special SlotMachine
	closetext
	end

KantoGameCornerCardFlipScript:
	refreshscreen
	special CardFlip
	closetext
	end

KantoGameCornerLighterScript:
	jumptext KantoGameCornerLighterText

KantoGameCornerSodaCanScript:
	opentext
	writetext KantoGameCornerSodaCanText
	waitbutton
	special CardFlip
	closetext
	end
	
KantoGameCornerPokefanMScript2:
	faceplayer
	opentext
	writetext KantoGameCornerPokefanMText2
	waitbutton
	closetext
	turnobject KANTOGAMECORNER_FISHER1, LEFT
	end

KantoGameCornerN64RockerScript:
	faceplayer
	opentext
	writetext SendN64RockerOffText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal DOWN, GameCornerN64RockerDownScript
	jump GameCornerN64RockerLeftScript
	end
	
GameCornerN64RockerDownScript:
	applymovement KANTOGAMECORNER_N64_ROCKER, GameCornerN64RockerDownMovement
	playsound SFX_EXIT_BUILDING
	disappear KANTOGAMECORNER_N64_ROCKER
	setevent EVENT_GAME_HOUSE_NPC_IN_KANTO_GAME_CORNER
	clearevent EVENT_ROCKER_FROM_KANTO_IN_GAME_HOUSE
	clearevent EVENT_GAME_HOUSE_NPC_IN_KUME_SOCIAL_HOUSE
	waitsfx
	end
	
GameCornerN64RockerLeftScript:
	applymovement KANTOGAMECORNER_N64_ROCKER, GameCornerN64RockerLeftMovement
	playsound SFX_EXIT_BUILDING
	disappear KANTOGAMECORNER_N64_ROCKER
	setevent EVENT_GAME_HOUSE_NPC_IN_KANTO_GAME_CORNER
	clearevent EVENT_ROCKER_FROM_KANTO_IN_GAME_HOUSE
	clearevent EVENT_GAME_HOUSE_NPC_IN_KUME_SOCIAL_HOUSE
	waitsfx
	end
	
GameCornerN64RockerLeftMovement:
	step UP
	step UP
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step_end
	
	
GameCornerN64RockerDownMovement:	
	step RIGHT
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step_end

SendN64RockerOffText:
    text "Ich mag Spiele,"
    line "aber Glücksspiele""
    cont "langweilen mich."

    para "Ich würde gerne"
    line "ein Videospiel"
    cont "oder so spielen."

    para "Hä?"

    para "Es gibt einen Ort"
    line "in der Nähe von"
    para "PORT ABANISHI, den"
    line "ich mir ansehen"
    cont "sollte?"

    para "Alles klar, ich"
    line "gucke es mir mal"
    cont "an, danke!"
	done

KantoGameCornerReceptionistText:
	text "Willkommen!"

	para "Du kannst deine"
	line "Münzen nebenan"

	para "gegen fabelhafte"
	line "Preise ein-"
	cont "tauschen."
	done

KantoGameCornerPokefanMText:
	text "Die Spielautomaten"
	line "sind alle"
	cont "hochmodern."
	done

KantoGameCornerTeacherText:
	text "An diesem Automa-"
	line "ten will ich"
	cont "spielen."

	para "An dem habe ich"
	line "gestern haushoch"

	para "verloren. Das will"
	line "ich heute wieder-"
	cont "haben."
	done

KantoGameCornerFishingGuruText:
	text "Ich glaube, an"
	line "diesem Automaten"
	cont "werde ich"
	cont "gewinnen…"

	para "Die Gewinnchancen"
	line "sind bei jedem"
	cont "Automaten anders."
	done

KantoGameCornerFisherText1:
	text "Guahahaha!"

	para "Die Münzen kommen"
	line "mir entgegen!"

	para "Hm? Was, Zwerg?"
	line "Du willst spielen?"

	para "Ich teile mein"
	line "Glück mit dir!"
	done

KantoGameCornerFisherText2:
	text "Hahahaha!"

	para "Ich fühle mich"
	line "wohl, wenn ich"

	para "anderen etwas"
	line "Gutes tue!"
	done

KantoGameCornerFisherNoCoinCaseText:
	text "Eh, du hast keinen"
	line "MÜNZKORB."

	para "Wie soll ich dir"
	line "denn so Münzen"
	cont "geben, Zwerg?"
	done

KantoGameCornerFisherFullCoinCaseText:
	text "Heh, dein MÜNZKORB"
	line "ist voll, Wicht."

	para "Du hast wohl auch"
	line "eine Glücks-"
	cont "strähne."
	done

KantoGymGuyText:
	text "He! Ein CHAMP"
	line "in spe!"

	para "Spielst du auch an"
	line "den Automaten?"

	para "Ich möchte genug"
	line "Münzen sammeln für"
	cont "ein prämiertes"
	cont "#MON."

	para "Aber ich habe noch"
	line "nicht genug"
	cont "Münzen…"
	done

KantoGameCornerPokefanMText2:
	text "Hm… Die Chancen,"
	line "eine PIKACHU-Reihe"

	para "zu bekommen,"
	line "stehen gut, aber…"
	cont "Was nun?"
	done
	
KantoGameCornerGrampsText:
    text "Mein Papa nimmt"
    line "mich manchmal"
    cont "hierhin mit."

    para "Ich bin noch zu"
    line "um selber spielen"
    cont "zu dürfen."
	done

KantoGameCornerPoster1Text:
	text "He!"

	para "Hinter diesem"
	line "Poster…"

	para "Da ist nichts!"
	done

KantoGameCornerPoster2Text:
	text "He!"

	para "Hinter diesem"
	line "Poster…"

	para "Da ist nichts!"
	done

KantoGameCornerLighterText:
	text "Da ist ein"
	line "Feuerzeug."
	done

KantoGameCornerSodaCanText:
	text "Eine Wasser-"
	line "flasche…"

	para "Die muss jemandem"
	line "gehören, der sie"
	cont "holen wird…"

	para "Was? Sie ist leer!"
	done

KantoGameCorner_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  9, 13, KANTO_REGION, 6
	warp_event 10, 13, KANTO_REGION, 32
	warp_event  8, 13, KANTO_REGION, 6
	warp_event 11, 13, KANTO_REGION, 32


	db 0 ; coord events

	db 38 ; bg events
	bg_event  1,  4, BGEVENT_READ, KantoGameCornerCardFlipScript
	bg_event  1,  5, BGEVENT_READ, KantoGameCornerCardFlipScript
	bg_event  1,  6, BGEVENT_READ, KantoGameCornerCardFlipScript
	bg_event  1,  7, BGEVENT_READ, KantoGameCornerCardFlipScript
	bg_event  1,  8, BGEVENT_READ, KantoGameCornerCardFlipScript
	bg_event  2,  0, BGEVENT_LEFT, KantoGameCornerCardFlipScript
	bg_event  6,  4, BGEVENT_READ, KantoGameCornerCardFlipScript
	bg_event  6,  5, BGEVENT_READ, KantoGameCornerCardFlipScript
	bg_event  6,  6, BGEVENT_READ, KantoGameCornerCardFlipScript
	bg_event  6,  7, BGEVENT_READ, KantoGameCornerSodaCanScript
	bg_event  6,  8, BGEVENT_READ, KantoGameCornerCardFlipScript
	bg_event  0,  0, BGEVENT_RIGHT, KantoGameCornerCardFlipScript
	bg_event  7,  4, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event  7,  5, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event  7,  6, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event  7,  7, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event  7,  8, BGEVENT_READ, KantoGameCornerSlotMachineScript
	bg_event  1,  0, BGEVENT_LEFT, KantoGameCornerLuckySlotMachineScript
	bg_event 12,  4, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event 12,  5, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event 12,  6, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event 12,  7, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event 12,  8, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event  5,  0, BGEVENT_RIGHT, KantoGameCornerLuckySlotMachineScript
	bg_event 13,  4, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event 13,  5, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event 13,  6, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event 13,  7, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event 13,  8, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event  6,  0, BGEVENT_LEFT, KantoGameCornerLuckySlotMachineScript
	bg_event 18,  4, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event 18,  5, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event 18,  6, BGEVENT_READ, KantoGameCornerLighterScript
	bg_event 18,  7, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event 18,  8, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event  7,  0, BGEVENT_RIGHT, KantoGameCornerLuckySlotMachineScript
	bg_event  4,  0, BGEVENT_READ, KantoGameCornerPoster1Script
	bg_event  3,  0, BGEVENT_READ, KantoGameCornerPoster2Script

	db 10 ; object events
	object_event  4,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KantoGameCornerClerkScript, -1
	object_event  3,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KantoGameCornerReceptionistScript, -1
	object_event 17,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, KantoGameCornerPokefanMScript, -1
	object_event 11,  8, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KantoGameCornerTeacherScript, -1
	object_event 11,  6, SPRITE_JANINE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KantoGameCornerFishingGuruScript, -1
	object_event  2,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, KantoGameCornerPokefanMScript2, -1
	object_event 14,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, KantoGameCornerFisherScript, -1
	object_event  5,  8, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, KantoGymGuyScript, -1
	object_event  2,  7, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, KantoGameCornerGrampsScript, -1
	object_event 13, 13, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KantoGameCornerN64RockerScript, EVENT_GAME_HOUSE_NPC_IN_KANTO_GAME_CORNER
