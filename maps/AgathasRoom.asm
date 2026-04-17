	object_const_def ; object_event constants
	const AGATHASROOM_AGATHA

AgathasRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .AgathasRoomDoors

.LockDoor:
	priorityjump .AgathasDoorLocksBehindYou
	end

.DummyScene:
	end

.AgathasRoomDoors:
	checkevent EVENT_AGATHAS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_AGATHAS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $05 ; open door
.KeepExitClosed:
	return

.AgathasDoorLocksBehindYou:
	applymovement PLAYER, AgathasRoom_EnterMovement
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	reloadmappart
	closetext
	setscene SCENE_FINISHED
	setevent EVENT_AGATHAS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

AgathaScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_AGATHA
	iftrue AgathaScript_AfterBattle
	writetext AgathaScript_AgathaBeforeText
	waitbutton
	closetext
	winlosstext AgathaScript_BrunoBeatenText, 0
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue AgathaRematchTeam
	loadtrainer BRUNO, BRUNO1
ReturnToMainAgatha:
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_AGATHA
	opentext
	writetext AgathaScript_AgathaDefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $05 ; open door
	reloadmappart
	closetext
	setevent EVENT_AGATHAS_ROOM_EXIT_OPEN
	waitsfx
	end

AgathaScript_AfterBattle:
	writetext AgathaScript_AgathaDefeatText
	waitbutton
	closetext
	end
	
AgathaRematchTeam:
	loadtrainer BRUNO, BRUNO2
	jump ReturnToMainAgatha
	end

AgathasRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

AgathaScript_AgathaBeforeText:
	text "Oho!"

	para "Da hat der alte"
	line "EICH also wieder"
	para "ein neues Kind"
	line "als Laufburschen"
	cont "losgeschickt…"

    para "Ich bin AGATHE"
    line "aus dem Team der"
    cont "TOP VIER!"

    para "In meinem Leben,"
    line "habe ich schon"
    cont "viel gesehen und"
    cont "erlebt."

    para "EICH, dieser alte"
    line "Narr, lebt nur in"
    cont "seinen Kindheits-"
    cont "träumen."

    para "#MON waren"
    line "schon immer zum"
    cont "Kämpfen da!"

    para "Sag mir, Kind."

    para "Wie weit wird dein"
    line "Ehrgeiz dich, auf"
    para "deiner Reise, den"
    line "#DEX zu"
    cont "vervollständigen,"
    cont "bringen?"

    para "Fufufufu…"
    line "Finden wir es"
    cont "doch heraus!"
	done

AgathaScript_BrunoBeatenText:
	text "Meine Güte!"

	para "Da hast es echt"
	line "drauf, mein Kind!"
	done

AgathaScript_AgathaDefeatText:
	text "Hmm…"

	para "Vielleicht hat der"
	line "alte Narr doch ein"
	cont "gutes Gespür."

	para "Nun geh weiter."

	para "Dein Weg ist noch"
	line "nicht zu Ende."
	done

AgathasRoom_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4, 17, KOGAS_ROOM, 3
	warp_event  5, 17, KOGAS_ROOM, 4
	warp_event  4,  2, MISTYS_ROOM, 1
	warp_event  5,  2, MISTYS_ROOM, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  7, SPRITE_BLAINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, AgathaScript_Battle, -1
