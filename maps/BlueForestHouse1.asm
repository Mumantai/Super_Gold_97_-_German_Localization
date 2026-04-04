	object_const_def ; object_event constants
	const BLUE_FORESTHOUSE_1_GRANNY
	const BLUE_FORESTHOUSE_1_MIMMEO

BlueForestHouse1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BlueForestHouse1GrannyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM50_NIGHTMARE
	iftrue .AlreadyGotNightmare
	writetext Text_NightmareIntro
	buttonsound
	verbosegiveitem TM_NIGHTMARE
	iffalse .BagFull
	setevent EVENT_GOT_TM50_NIGHTMARE
.AlreadyGotNightmare:
	writetext Text_NightmareOutro
	waitbutton
.BagFull:
	closetext
	end	

BlueForestHouse1MimmeoScript:
	faceplayer
	opentext
	writetext BlueForestHouse1MonText
	cry MIMMEO
	waitbutton
	closetext
	end
	
BlueForestHouse1MonText:
	text "MIMMEO: Uoi!"
	done

Text_NightmareIntro:
    text "Ich hatte letzte"
    line "Nacht einen"
    para "schrecklichen"
    line "Albtraum, in dem"
    para "mein MIMMEO"
    line "verschwunden war."

    para "Es hat mir so das"
    line "Herz gebrochen."

    para "Glücklicherweise"
    line "war es nicht echt."

    para "Aber heute habe"
    line "ich das hier zu"
    cont "Hause gefunden."

    para "Ich will es nicht."
    line "Nimm es, bitte."
	done
	
Text_NightmareOutro:
	text "TM50 enthält"
	line "NACHTMAHR."

	para "Dies ist eine"
	line "gemeine Attacke,"
	para "die einem schlaf-"
	line "enden Gegner"
	cont "kontinuierlich"
	cont "KP abzieht."
	done

BlueForestHouse1_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, BLUE_FOREST, 7
	warp_event  5,  7, BLUE_FOREST, 7

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  8, 3, SPRITE_GRANNY, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BlueForestHouse1GrannyScript, -1
	object_event  9, 6, SPRITE_GRIMER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, BlueForestHouse1MimmeoScript, -1
