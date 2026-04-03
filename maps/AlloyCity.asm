	object_const_def ; object_event constants
	const ALLOYCITY_SAILOR1
	const ALLOYCITY_STANDING_YOUNGSTER
	const ALLOYCITY_SAILOR2
	const ALLOYCITY_ALLOY_RIVAL
	const ALLOYCITY_GRAMPS

AlloyCity_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_ALLOY
	return

AlloyCityRivalSceneTop:
	variablesprite SPRITE_ALLOY_RIVAL, SPRITE_SILVER
	special LoadUsedSpritesGFX
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	playsound SFX_ENTER_DOOR
	appear ALLOYCITY_ALLOY_RIVAL
	waitsfx
	applymovement ALLOYCITY_ALLOY_RIVAL, AlloyRivalWalkOutOfPokecenterMovement
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext AlloyCityRivalText
	waitbutton
	closetext
	applymovement ALLOYCITY_ALLOY_RIVAL, AlloyRivalLeaving1
	turnobject PLAYER, LEFT
	applymovement ALLOYCITY_ALLOY_RIVAL, AlloyRivalLeaving2
	setscene SCENE_FINISHED
	disappear ALLOYCITY_ALLOY_RIVAL
	special RestartMapMusic
	variablesprite SPRITE_ALLOY_RIVAL, SPRITE_POKEFAN_M
	special LoadUsedSpritesGFX
	end

AlloyCityRivalSceneBottom:
	variablesprite SPRITE_ALLOY_RIVAL, SPRITE_SILVER
	special LoadUsedSpritesGFX
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	playsound SFX_ENTER_DOOR
	appear ALLOYCITY_ALLOY_RIVAL
	waitsfx
	applymovement ALLOYCITY_ALLOY_RIVAL, AlloyRivalWalkOutOfPokecenterMovement2
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext AlloyCityRivalText
	waitbutton
	closetext
	applymovement ALLOYCITY_ALLOY_RIVAL, AlloyRivalLeaving3
	turnobject PLAYER, LEFT
	applymovement ALLOYCITY_ALLOY_RIVAL, AlloyRivalLeaving2
	disappear ALLOYCITY_ALLOY_RIVAL
	setscene SCENE_FINISHED
	special RestartMapMusic
	variablesprite SPRITE_ALLOY_RIVAL, SPRITE_POKEFAN_M
	special LoadUsedSpritesGFX
	end

AlloyCitySailor1Script:
	jumptextfaceplayer AlloyCitySailor1Text

AlloyCityStandingYoungsterScript:
	faceplayer
	opentext
	random 2
	ifequal 0, .FiftyFifty
	writetext AlloyCityStandingYoungsterPokegearText
	waitbutton
	closetext
	end

.FiftyFifty:
	writetext AlloyCityStandingYoungsterPokedexText
	waitbutton
	closetext
	end

AlloyCityGrampsScript:
	jumptextfaceplayer AlloyCityGrampsText

AlloyCitySailor2Script:
	jumptextfaceplayer AlloyCitySailor2Text

AlloyCitySign:
	jumptext AlloyCitySignText

AlloyGymSign:
	jumptext AlloyGymSignText

AlloyDojoSign:
	jumptext AlloyDojoSignText

AlloyCityPokecenterSign:
	jumpstd PokecenterSignScript

AlloyCityMartSign:
	jumpstd MartSignScript

AlloyRivalWalkOutOfPokecenterMovement:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

AlloyRivalWalkOutOfPokecenterMovement2:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

AlloyRivalLeaving1:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step_end

AlloyRivalLeaving2:
	step LEFT
	step LEFT
	step LEFT
	step_end

AlloyRivalLeaving3:
	step UP
	step LEFT
	step LEFT
	step LEFT
	step_end


AlloyCityGrampsText:
	text "Ohohoho!"

	para "Hast du schon mal"
	line "gegen ein #MON"
	para "vom Typ Stahl"
	line "gekämpft?"

	para "Die haben eine"
	line "hohe Verteidigung!"

	para "Merk dir das,"
	line "wenn du JASMIN"
	cont "herausforderst!"
	done

AlloyCityRivalText:
	text "<PLAYER>!"

	para "Ist 'ne Weile her!"

	para "Du kommst gerade"
	line "aus dem JADEWALD,"
	cont "was?"

	para "Der ist 'ne Nummer"
	line "für sich."

	para "Aber es gibt da"
	line "viele #MON!"

	para "Ich habe gerade"
	line "keine Lust auf"
	cont "einen Kampf."

	para "Ich gehe zurück in"
	line "den WALD, um noch"
	para "mehr #MON zu"
	line "suchen!"

	para "Die Gelegenheit,"
	line "nach dem stärksten"
	para "#MON für mein"
	line "Team zu suchen,"
	para "kann ich mir nicht"
    line "entgehen lassen!"

    para "Die Stadt hier ist"
    line "aber echt cool!"

    para "Die ARENALEITERIN"
    line "setzt #MON vom"
    cont "Typ Stahl ein!"

    para "Ich wusste gar"
    line "nicht, dass es"
    cont "diesen Typ gibt!"

    para "Naja, ich bin dann"
    line "mal weg!"

    para "Wir sehen uns!"
	done

AlloyCitySailor1Text:
    text "Ich träume schon"
    line "immer davon, hoch"
    para "in den Norden zu"
    line "ziehen, wo es"
    cont "schneit."
	done

AlloyCityStandingYoungsterPokegearText:
	text "Dieses Ding da ist"
	line "doch ein #COM."
	cont "Wow, das ist cool!"
	done

AlloyCityStandingYoungsterPokedexText:
	text "Wow, du hast einen"
	line "#DEX!"

	para "Das ist so toll!"
	done

AlloyCitySailor2Text:
    text "Der Kanal sieht"
    line "bei Sonnenunter-"
    cont "gang wundervoll"
    cont "aus!"
	done

AlloyCitySignText:
	text "GENEOS CITY"

	para "Die pulsierende"
	line "Stadt an der"
	cont "rauen See"
	done

AlloyGymSignText:
	text "PKMN-ARENA von"
	line "GENEOS CITY"
	cont "LEITUNG: JASMIN"

	para "Ein stahlhartes"
	line "Mädchen!"
	done

AlloyDojoSignText:
	text "KARATE DOJO"
	done

AlloyCity_MapEvents:
	db 0, 0 ; filler

	db 13 ; warp events
	warp_event  7,  8, ALLOY_POKECENTER_1F, 1
	warp_event 30,  9, ALLOY_GYM, 1
	warp_event 35, 30, ALLOY_TIMS_HOUSE, 1
	warp_event 34, 15, FIGHTING_DOJO, 2
	warp_event 11, 28, ALLOY_PUNISHMENT_SPEECH_HOUSE, 1
	warp_event 23, 22, ALLOY_GOOD_ROD_HOUSE, 1
	warp_event  5, 23, ALLOY_CAFE, 1
	warp_event  7, 14, ALLOY_MART, 1
	warp_event 23, 13, ALLOY_SAILOR_HO_OH_HOUSE, 1
	warp_event 18,  5, ALLOY_ROUTE_107_GATE, 3
	warp_event 33, 15, FIGHTING_DOJO, 1
	warp_event 19,  5, ALLOY_ROUTE_107_GATE, 4
	warp_event 31,  9, ALLOY_GYM, 2

	db 2 ; coord events
	coord_event  2,  9, SCENE_DEFAULT, AlloyCityRivalSceneTop
	coord_event  2, 10, SCENE_DEFAULT, AlloyCityRivalSceneBottom

	db 5 ; bg events
	bg_event 30, 21, BGEVENT_READ, AlloyCitySign
	bg_event 32, 10, BGEVENT_READ, AlloyGymSign
	bg_event 30, 15, BGEVENT_READ, AlloyDojoSign
	bg_event  8,  8, BGEVENT_READ, AlloyCityPokecenterSign
	bg_event  8, 14, BGEVENT_READ, AlloyCityMartSign

	db 5 ; object events
	object_event 10, 31, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AlloyCitySailor1Script, -1
	object_event 24,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, AlloyCityStandingYoungsterScript, -1
	object_event 26, 25, SPRITE_ALLOY_RIVAL, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AlloyCitySailor2Script, -1
	object_event  7,  8, SPRITE_ALLOY_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_ALLOY_CITY
	object_event  8, 17, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AlloyCityGrampsScript, -1
