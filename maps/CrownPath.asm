	object_const_def ; object_event constants
	const CROWNPATH_SILVER

CrownPath_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RivalBattleFinal:
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	turnobject CROWNPATH_SILVER, DOWN
	pause 15
	applymovement CROWNPATH_SILVER, UndergroundSilverWalksToPlayer
	turnobject PLAYER, LEFT
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext UndergroundSilverBeforeText
	waitbutton
	closetext
	checkevent EVENT_GOT_PALSSIO_FROM_OAK
	iftrue .cruise
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .chikorita
	winlosstext UndergroundSilverWinText, UndergroundSilverLossText
	;setlasttalked SLOWPOKE_WELL_B1F_SILVER
	loadtrainer RIVAL1, RIVAL1_5_PALSSIO
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.cruise
	winlosstext UndergroundSilverWinText, UndergroundSilverLossText
	;setlasttalked SLOWPOKE_WELL_B1F_SILVER
	loadtrainer RIVAL1, RIVAL1_5_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.chikorita
	winlosstext UndergroundSilverWinText, UndergroundSilverLossText
	;setlasttalked SLOWPOKE_WELL_B1F_SILVER
	loadtrainer RIVAL1, RIVAL1_5_CUBBURN
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.returnfrombattle
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext UndergroundSilverAfterText
	waitbutton
	closetext
	applymovement PLAYER, UndergroundPlayer1StepToTheSide
	applymovement CROWNPATH_SILVER, UndergroundSilverLeavesMovement
	disappear CROWNPATH_SILVER
	setscene SCENE_UNDERGROUND_NOTHING
	setevent EVENT_EMERGENCY_SWITCH
	setmapscene CROWN_CITY, SCENE_CROWNCITY_MEET_RIVAL
	special HealParty
	special FadeOutMusic
	waitsfx
	playmapmusic
	pause 15
	end

CrownPathHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_CROWN_PATH_HIDDEN_FULL_RESTORE

CrownPathHiddenXSpecial:
	hiddenitem X_SPECIAL, EVENT_CROWN_PATH_HIDDEN_X_SPECIAL
	
UndergroundSilverWalksToPlayer:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	turn_head RIGHT
	step_end
	
UndergroundPlayer1StepToTheSide:
	step RIGHT
	turn_head LEFT
	step_end
	
UndergroundSilverLeavesMovement:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
UndergroundSilverBeforeText:
	text "Hi, <PLAYER>!"
	para "…"

	para "Du willst den"
	line "KOROKANIABERG"
	cont "erklimmen, oder?"

	para "Es war eine lange"
	line "Reise."

	para "Wir beide haben"
	line "viel durchgemacht."

	para "Sind deine #MON"
	line "bereit?"

	para "Sind meine #MON"
	line "bereit?"

	para "Lass uns genau"
	line "hier gegeneinander"
	cont "antreten!"

	para "Ein Kampf zwischen"
	line "zwei Freunden!"
	done
	
UndergroundSilverWinText:
	text "…"
	done
	
UndergroundSilverLossText:
	text "…"
	done
	
UndergroundSilverAfterText:
    text "Weißt du, was mir"
    line "klar geworden ist?"

    para "Ich war so aufge-"
    line "regt, die LIGA"
    cont "herauszufordern."

    para "Ich wollte die"
    line "stärksten #MON"
    cont "haben."

    para "Ich wollte der"
    line "härteste Trainer"
    cont "sein, den es gibt."

    para "Ich wollte nur"
    line "andere Trainer"
    para "besiegen, um zu"
    line "beweisen, wie gut"
    cont "ich bin."

    para "Aber die ganze"
    line "Sache mit TEAM"
    para "ROCKET hat mich"
    line "zum Nachdenken"
    cont "gebracht."

    para "Für sie waren"
    line "#MON nichts als"
    para "Werkzeuge, die sie"
    line "für ihre Zwecke"
    cont "missbraucht haben."

    para "Und obwohl ihre"
    line "Ziele böse waren"
    para "und meine bloß"
    line "egoistisch, habe"
    para "ich erkannt, dass"
    line "ich ähnlich wie"
    para "sie über #MON"
    line "gedacht habe."

    para "Mein Team war"
    line "für mich nur ein"
    cont "Mittel zur Stärke."

    para "Dafür sind #MON"
    line "aber nicht da."

    para "Ich habe erkannt,"
    line "dass ich mein Team"
    para "mit mehr Fürsorge"
    line "behandeln muss."

    para "Und ich glaube,"
    line "ich bin noch nicht"
    para "ganz bereit, mich"
    line "der #MON LIGA"
    para "zu stellen, bis"
    line "ich an mehr an mir"
    para "gearbeitet habe"
    line "und mein Team auch"
    para "für die Herausfor-"
    line "derung bereit ist."

    para "Also werde ich"
    line "erstmal weiter"
    cont "trainieren."

    para "Ich werde sicher-"
    line "gehen, dass meine"
    para "#MON bereit für"
    line "die Herausforde-"
    cont "rung sind, damit"
    para "wir  als ein Team"
    line "kämpfen können!"

    para "Bis bald!"
	done

CrownPath_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 10, 33, CROWN_PATH_GATE, 3
	warp_event 11, 33, CROWN_PATH_GATE, 4
	warp_event 11,  1, CROWN_CITY, 1
	warp_event 12,  1, CROWN_CITY, 2

	db 1 ; coord events
	coord_event 12,  7, SCENE_DEFAULT, RivalBattleFinal

	db 2 ; bg events
	bg_event  5, 16, BGEVENT_ITEM, CrownPathHiddenFullRestore
	bg_event 12, 14, BGEVENT_ITEM, CrownPathHiddenXSpecial

	db 1 ; object events
	object_event 11,  2, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_EMERGENCY_SWITCH
