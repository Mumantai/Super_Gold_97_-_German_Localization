	object_const_def ; object_event constants
	const MISTYSROOM_MISTY

MistysRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .MistysRoomDoors

.LockDoor:
	priorityjump .MistysDoorLocksBehindYou
	end

.DummyScene:
	end

.MistysRoomDoors:
	checkevent EVENT_MISTYS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_MISTYS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $05 ; open door
.KeepExitClosed:
	return

.MistysDoorLocksBehindYou:
	applymovement PLAYER, MistysRoom_EnterMovement
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	reloadmappart
	closetext
	setscene SCENE_FINISHED
	setevent EVENT_MISTYS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

MistyScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_MISTY
	iftrue MistyScript_AfterBattle
	writetext MistyScript_MistyBeforeText
	waitbutton
	closetext
	winlosstext MistyScript_MistyBeatenText, 0
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue MistyRematchTeam
	loadtrainer KAREN, KAREN1
ReturnToMainMisty:
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_MISTY
	opentext
	writetext MistyScript_MistyDefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $05 ; open door
	reloadmappart
	closetext
	setevent EVENT_MISTYS_ROOM_EXIT_OPEN
	waitsfx
	end

MistyScript_AfterBattle:
	writetext MistyScript_MistyDefeatText
	waitbutton
	closetext
	end
	
MistyRematchTeam:
	loadtrainer KAREN, KAREN2
	jump ReturnToMainMisty
	end

MistysRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

MistyScript_MistyBeforeText:
	text "Hallo!"

	para "Ich bin MISTY von"
	line "der TOP VIER."

	para "Du bist <PLAYER>?"
	line "Freut mich, dich"
	cont "kennenzulernen."

	para "Ich bin aber nicht"
	line "nur für Nettig-"
	cont "keiten hier!"

	para "Meine Wasser-"
	line "#MON sind"
	cont "kampfbereit."

	para "Und ich bin"
	line "bereit, mit ihnen"
	cont "daran zu arbeiten,"
	cont "dich zu besiegen!"

	para "Bereit? Ich nehme"
	line "deine Heraus-"
	line "forderung an!"
	done

MistyScript_MistyBeatenText:
	text "Sieht so aus,"
	line "als warst du"
	para "auch bereit,"
	line "an der Seite"
	cont "deiner #MON"
	cont "zu kämpfen!"
	done

MistyScript_MistyDefeatText:
    text "Die besten Trainer"
    line "sind nicht die,"
    para "die die stärksten"
    line "#MON benutzen."

    para "Es sind die, die"
    line "mit ihren"
    para "Lieblings-#MON"
    line "kämpfen und eine"
    para "starke Bindung"
    line "zwischen Trainer"
    cont "und #MON"
    cont "aufbauen."

    para "Und so gewinnen"
    line "sie."

    para "Ich glaube, du"
    line "hast das schon"
    cont "herausgefunden."

    para "Geh weiter."
    line "Der CHAMP wartet."
	done

MistysRoom_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4, 17, AGATHAS_ROOM, 3
	warp_event  5, 17, AGATHAS_ROOM, 4
	warp_event  4,  2, LANCES_ROOM, 1
	warp_event  5,  2, LANCES_ROOM, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  7, SPRITE_MISTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MistyScript_Battle, -1
