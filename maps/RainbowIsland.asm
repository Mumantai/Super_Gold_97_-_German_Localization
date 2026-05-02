	object_const_def ; object_event constants
	const RAINBOWISLAND_BLUE

RainbowIsland_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BlueScriptRI:
	special FadeOutMusic
	faceplayer
	opentext
	writetext BlueSeenText
	waitbutton
	closetext
	winlosstext BlueWinLossText, BlueWinLossText
	loadtrainer BLUE, BLUE1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special FadeOutMusic
	opentext
	writetext BlueLeavesText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear RAINBOWISLAND_BLUE
	setevent EVENT_BLUE_ON_RAINBOW_ISLAND
	setevent EVENT_DECO_SILVER_TROPHY; blue trophy
	clearevent EVENT_BLUE_OAK_LAB_FRONT_ROOM_2
	pause 15
	special FadeInQuickly
	pause 30
	special HealParty
	refreshscreen
	credits
	end
	
BlueWinLossText:
    text "Es ist vorbei!"

    para "Das war wirklich"
    line "ein Kampf für die"
    cont "Geschichtsbücher!"
	done

BlueSeenText:
    text "Hey, <PLAYER>!"

    para "Ich untersuche die"
    line "vielen Arten von"
    para "#MON, die hier"
    line "auf dieser Insel"
    cont "leben."

    para "Aber ich sehe das"
    line "Feuer in deinen"
    cont "Augen."

    para "Ich kenne dieses"
    line "Gefühl nur zu gut."

    para "Es war das, was"
    line "mich dazu antrieb,"
    cont "CHAMP zu werden."

    para "Tja… Es gibt"
    line "nur eine Sache,"
    para "die du dir wohl"
    line "wünschen könntest!"

    para "<PLAYER>!"

    para "Als ehemaliger"
    line "CHAMP der #MON"
    para "LIGA, fordere ich"
    line "dich heraus!"
	done
	
BlueLeavesText:
	text "Puh…"

	para "So ins Schwitzen"
	line "gebracht wurde ich"
	para "das zuletzt, als"
    line "ich gegen meinen"
    para "alten Kumpel um"
    line "meinen Titel"
    cont "gekämpft habe!"

    para "Mann… Das fühlt"
    line "sich an, als wäre"
    cont "es erst gestern"
    cont "gewesen…"

    para "Naja! Ich denke,"
    line "es ist Zeit für"
    para "mich, meine For-"
    line "schungsreise zu"
    cont "beenden."

    para "Was für eine Zeit"
    line "das doch war!"

    para "<PLAYER>! Ich…"

    para "Ciao!"
	done

RainbowIsland_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 30,  8, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlueScriptRI, EVENT_BLUE_ON_RAINBOW_ISLAND
