	object_const_def ; object_event constants
	const OAK2ENTRANCE_AIDE
	const OAK2ENTRANCE_SILVER
	const OAK2ENTRANCE_BLUE
	const OAK2ENTRANCE_DAISY
	const OAK2ENTRANCE_DEX1
	const OAK2ENTRANCE_DEX2
	const OAK2ENTRANCE_OAK
	const OAK2ENTRANCE_SILVER2
	const OAK2ENTRANCE_BLUE2

OakLabFrontRoom_MapScripts:
	db 8 ; scene scripts
	scene_script .SceneOak2DoorLocked ; SCENE_DEFAULT
	scene_script .SceneHeadToTheBack ;
	scene_script .SceneOakLabFrontRoomNothing ;does this work?
	scene_script .SceneOakLabFrontRoomPokedex ;seems to!
	scene_script .SceneOakLabFrontRoomDaisy
	scene_script .SceneOakLabFrontGoSeeOak
	scene_script .SceneOakLabFrontRoomBattle
	scene_script .SceneOakLabFrontRoomAfterTalkingToClerk

	db 0 ; callbacks
	
.SceneOak2DoorLocked:
	end
	
.SceneOakLabFrontRoomAfterTalkingToClerk
	end
	
.SceneHeadToTheBack:
	priorityjump .SceneHeadToTheBack2
	end
	
.SceneHeadToTheBack2
	turnobject OAK2ENTRANCE_BLUE, DOWN
	turnobject PLAYER, UP
	opentext
	writetext Text_InBack
	waitbutton
	closetext
	applymovement PLAYER, PlayerLabDummyMovement
	follow OAK2ENTRANCE_BLUE, PLAYER
	applymovement OAK2ENTRANCE_BLUE, Movement_BlueToBack
	stopfollow
	showemote EMOTE_SHOCK, OAK2ENTRANCE_OAK, 15
	opentext
	writetext Oak2Text_Intro
	waitbutton
	closetext
	turnobject OAK2ENTRANCE_SILVER2, RIGHT
	opentext
	writetext Text_OakIsOld
	waitbutton
	closetext
	turnobject OAK2ENTRANCE_SILVER2, UP
	pause 15
	opentext
	writetext Text_OakSpeech
	waitbutton
	closetext
	showemote EMOTE_SHOCK, OAK2ENTRANCE_SILVER2, 15
	opentext
	writetext Text_Interesting
	waitbutton
	closetext
	pause 15
	opentext
	writetext Text_OakSpeechComeToBack
	waitbutton
	closetext
	applymovement OAK2ENTRANCE_OAK, OakGoesIntoBackMovement
	playsound SFX_ENTER_DOOR
	disappear OAK2ENTRANCE_OAK
	applymovement OAK2ENTRANCE_SILVER2, SilverGoesIntoBackMovement
	playsound SFX_ENTER_DOOR
	disappear OAK2ENTRANCE_SILVER2
	setscene SCENE_OAK_LAB_FRONT_ROOM_GO_SEE_OAK
	setevent EVENT_BLUE_IN_OAK_LAB_BACK_ROOM
	end

.SceneOakLabFrontRoomNothing:
	end

.SceneOakLabFrontRoomPokedex
	end

.SceneOakLabFrontRoomDaisy:
	end
	
.SceneOakLabFrontGoSeeOak:
	end

.SceneOakLabFrontRoomBattle:
	end
	

GetDexScript:
	applymovement PLAYER, Movement_OverToBlue
	playsound SFX_EXIT_BUILDING
	moveobject OAK2ENTRANCE_SILVER, 4, 0
	appear OAK2ENTRANCE_SILVER
	applymovement OAK2ENTRANCE_SILVER, Movement_SilverToBlue
	turnobject OAK2ENTRANCE_BLUE2, RIGHT
	opentext
	writetext BlueWillGiveDexText
	waitbutton
	closetext
	applymovement OAK2ENTRANCE_BLUE2, BlueGoesToGetDex1Movement
	pause 10
	applymovement OAK2ENTRANCE_BLUE2, BlueGoesToGetDex2Movement
	disappear OAK2ENTRANCE_DEX1
	disappear OAK2ENTRANCE_DEX2
	pause 20
	applymovement OAK2ENTRANCE_BLUE2, BlueGoesToGetDex3Movement
	opentext
	writetext BlueText_Pokedex
	waitbutton
	closetext
	applymovement OAK2ENTRANCE_BLUE2, BlueGoesToGetDex4Movement
	pause 10
	applymovement OAK2ENTRANCE_BLUE2, BlueGoesToGetDex5Movement
	pause 10
	opentext
	writetext Lab_GetDexText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_POKEDEX
	pause 15
	waitbutton
	closetext
	applymovement OAK2ENTRANCE_BLUE2, BlueGoesToGetDex6Movement
	playsound SFX_EXIT_BUILDING
	moveobject OAK2ENTRANCE_OAK, 4, 0
	appear OAK2ENTRANCE_OAK
	applymovement OAK2ENTRANCE_OAK, OakWalksOverToGivePhoneNumber
	pause 5
	turnobject PLAYER, RIGHT
	turnobject OAK2ENTRANCE_SILVER, RIGHT
	opentext
	writetext Oak2DirectionsText1
	waitbutton
	addcellnum PHONE_OAK2
	opentext
	writetext GotOak2sNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	waitbutton
	closetext
	pause 5
	opentext
	writetext Oak2DirectionsText3
	waitbutton
	closetext
	applymovement OAK2ENTRANCE_OAK, OakWalksBackToBackRoom
	playsound SFX_ENTER_DOOR
	disappear OAK2ENTRANCE_OAK
	setscene SCENE_OAK_LAB_FRONT_ROOM_BATTLE
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	end
	
BattleScript2:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse YouReloadedMapScriptRight
	applymovement OAK2ENTRANCE_SILVER, SilverConfrontsYouR1
	turnobject OAK2ENTRANCE_SILVER, RIGHT
	turnobject PLAYER, LEFT
	jump BattleScriptMainBranch
	end

BattleScript:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse YouReloadedMapScriptLeft
	applymovement OAK2ENTRANCE_SILVER, SilverConfrontsYouL1
	turnobject OAK2ENTRANCE_SILVER, LEFT
	turnobject PLAYER, RIGHT
	jump BattleScriptMainBranch
	end
	
BattleScriptMainBranch:
	special FadeOutMusic
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext TimeToBattle
	waitbutton
	closetext
	checkevent EVENT_GOT_PALSSIO_FROM_OAK
	iftrue .Palssio
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .Chikorita
	winlosstext SilverEntranceWinText, SilverEntranceLossText
	loadtrainer RIVAL1, RIVAL1_1_PALSSIO
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	jump .AfterYourDefeat


.Palssio:
	winlosstext SilverEntranceWinText, SilverEntranceLossText
	loadtrainer RIVAL1, RIVAL1_1_CHIKORITA
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	jump .AfterYourDefeat

.Chikorita:
	winlosstext SilverEntranceWinText, SilverEntranceLossText
	loadtrainer RIVAL1, RIVAL1_1_CUBBURN
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	jump .AfterYourDefeat

.AfterVictorious:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext EntranceRivalText_YouWon
	waitbutton
	closetext
	jump .FinishRival

.AfterYourDefeat:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext EntranceRivalText_YouLost
	waitbutton
	closetext
.FinishRival:
	applymovement OAK2ENTRANCE_SILVER, SilverLeavesLab
	disappear OAK2ENTRANCE_SILVER
	setscene SCENE_OAK_LAB_FRONT_ROOM_DAISY
	special HealParty
	playmapmusic
	end
	
	
YouReloadedMapScriptRight:
	applymovement OAK2ENTRANCE_SILVER, SilverConfrontsYouR2
	turnobject OAK2ENTRANCE_SILVER, RIGHT
	turnobject PLAYER, LEFT
	jump BattleScriptMainBranch
	end

	
YouReloadedMapScriptLeft:
	applymovement OAK2ENTRANCE_SILVER, SilverConfrontsYouL2
	turnobject OAK2ENTRANCE_SILVER, LEFT
	turnobject PLAYER, RIGHT
	jump BattleScriptMainBranch
	end


DoorLockedScript:
	opentext
	writetext DoorLockedText
	waitbutton
	closetext
	applymovement PLAYER, DoorLocked_Movement
	end
	
DoorLockedScriptWeekends:
	checkcode VAR_WEEKDAY
	ifequal SATURDAY, .DoorIsLockedWeekend
	checkcode VAR_WEEKDAY
	ifequal SUNDAY, .DoorIsLockedWeekend
	end

.DoorIsLockedWeekend
	opentext
	writetext DoorLockedText
	waitbutton
	closetext
	applymovement PLAYER, DoorLocked_Movement
	end
	
DaisyStopsScript1:
	applymovement OAK2ENTRANCE_DAISY, DaisyWalksUp1
	jump .DaisySpeech

.DaisySpeech:
	opentext
	writetext DaisySpeechText
	buttonsound
	itemtotext POTION, MEM_BUFFER_1
	scall DaisyScript_ReceiveThePotion
	giveitem POTION, 1
	itemnotify
	writetext DaisySpeechText2
	buttonsound
	itemtotext POKE_BALL, MEM_BUFFER_1
	scall DaisyScript_ReceiveTheBalls
	giveitem POKE_BALL, 5
	itemnotify
	writetext DaisySpeechText3
	waitbutton
	closetext
	applymovement OAK2ENTRANCE_DAISY, DaisyLeftMovement
	setscene SCENE_OAK_LAB_FRONT_ROOM_NOTHING
	setmapscene ROUTE_101, SCENE_ROUTE101_CATCH_TUTORIAL
	end
	
.JumpstdReceiveItem:
	jumpstd ReceiveItemScript
	end

.mapcardname
	db "MAP CARD@"
	

DaisyStopsScript2:
	applymovement OAK2ENTRANCE_DAISY, DaisyWalksUp2
	jump .DaisySpeech
	
.DaisySpeech:
	opentext
	writetext DaisySpeechText
	buttonsound
	itemtotext POTION, MEM_BUFFER_1
	scall DaisyScript_ReceiveThePotion
	giveitem POTION, 1
	itemnotify
	writetext DaisySpeechText2
	buttonsound
	itemtotext POKE_BALL, MEM_BUFFER_1
	scall DaisyScript_ReceiveTheBalls
	giveitem POKE_BALL, 5
	itemnotify
	writetext DaisySpeechText3
	waitbutton
	closetext
	applymovement OAK2ENTRANCE_DAISY, DaisyLeftMovement
	setscene SCENE_OAK_LAB_FRONT_ROOM_NOTHING
	setmapscene ROUTE_101, SCENE_ROUTE101_CATCH_TUTORIAL
	end
	
.JumpstdReceiveItem:
	jumpstd ReceiveItemScript
	end

.mapcardname
	db "KARTEN-MODUL@"
	
DaisyScript_ReceiveTheBalls:
	jumpstd ReceiveItemScript
	end
	
DaisyScript_ReceiveThePotion:
	jumpstd ReceiveItemScript
	end
	
OakLabFrontRoomDexScript:
	opentext
	writetext WhatIsDexText
	waitbutton
	closetext
	end
	
OakLabFrontRoomBlueScript:
	checkevent EVENT_BLUE_ON_RAINBOW_ISLAND
	iftrue .BlueAfterBlueBattle
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .BlueAfterEliteFour
	faceplayer
	opentext
	writetext Oak2Text_Accepted
	waitbutton
	closetext
	end
	
.BlueAfterEliteFour
	faceplayer
	opentext
	writetext Oak2Text_Accepted2
	waitbutton
	closetext
	end
	
.BlueAfterBlueBattle
	faceplayer
	opentext
	writetext Oak2Text_Accepted3
	waitbutton
	closetext
	end


	
OakLabFrontRoomDaisyScript:
	jumptextfaceplayer Text_RootingText

OakLabFrontRoomSilverScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue .SilverLabScriptAfterMon
	writetext OakLabFrontRoomSilverText
	waitbutton
	closetext
	end
	
.SilverLabScriptAfterMon:
	writetext OakLabFrontRoomSilverText2
	waitbutton
	closetext
	end

OakLabFrontRoomAideScript:
	jumptextfaceplayer OakLabFrontRoomAideText
	
OakLabFrontRoomComputerScript:
	jumptext OakLabFrontRoomComputerText
	
OakLabFrontRoomBookshelf:
	jumpstd DifficultBookshelfScript
	
OakLabFrontRoomSign:
	jumptext OakLabFrontRoomSignText
	
GoSeeOakScript:
	turnobject OAK2ENTRANCE_BLUE, DOWN
	opentext
	writetext Text_GoSeeOak
	waitbutton
	closetext
	applymovement PLAYER, GoSeeOakOneUp
	end

OakWalksOverToGivePhoneNumber:
	step DOWN
	step DOWN
	step DOWN
	turn_head LEFT
	step_end
	
OakWalksBackToBackRoom:
	step UP
	step UP
	slow_step UP
	step_end

OakGoesIntoBackMovement:
	step UP
	slow_step UP
	step_end
	
SilverGoesIntoBackMovement:
	big_step UP
	big_step UP
	big_step RIGHT
	big_step UP
	big_step UP
	step_end
	
SilverConfrontsYouR1:
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step DOWN
	step_end

SilverConfrontsYouL1:
	big_step RIGHT
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step DOWN
	step_end
	
SilverConfrontsYouR2:
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step DOWN
	step_end
	
SilverConfrontsYouL2:
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step DOWN
	step_end
	
GoSeeOakOneUp:
	slow_step UP
	step_end
	
BlueGoesToGetDex1Movement:
	step LEFT
	step UP
	step_end
	
BlueGoesToGetDex2Movement:
	step RIGHT
	turn_head UP
	step_end
	
BlueGoesToGetDex3Movement:
	step LEFT
	step DOWN
	turn_head RIGHT
	step_end
	
BlueGoesToGetDex4Movement:
	step DOWN
	step RIGHT
	step_end
	
BlueGoesToGetDex5Movement:
	step UP
	turn_head RIGHT
	step_end
	
BlueGoesToGetDex6Movement:
	step LEFT
	turn_head RIGHT
	step_end
	

Oak2Text_Accepted:
    text "Danke, <PLAYER>!"

    para "Ich bin froh, dass"
    line "du meinem Opa"
    cont "aushilfst."
	done

Oak2Text_Accepted2:
    text "Wie stehen die"
    line "Dinge jetzt, wo du"
    cont "der CHAMP bist?"

    para "Ich hoffe, alles"
    line "läuft bestens."

    para "Hast du <RIVAL> in"
    line "letzter Zeit mal"
    cont "gesehen?"

    para "Ich weiß, dass er"
    line "fleißig mit seinen"
    cont "#MON trainiert."

    para "Ich glaube, er hat"
    line "gelernt, mit ihnen"
    para "zusammen als Team"
    line "zu arbeiten."
	done
	
Oak2Text_Accepted3:
    text "Hi, <PLAYER>!"

    para "Danke für den un-"
    line "glaublichen Kampf!"

    para "Meine #MON und"
    line "ich waren schon"
    para "lange nicht mehr"
    line "so in Fahrt!"
	done
	
	
OakLabFrontRoomSilverText2:
    text "Mein #MON wird"
    line "das Beste sein,"
    cont "das es je gab!"
	done
	
Oak2DirectionsText3:
	text "<PLAYER>."

	para "<RIVAL>."

	para "Ich zähle auf"
	line "euch beide!"
	done

Oak2DirectionsText1:
    text "EICH: Mit diesem"
    line "#DEX bist du"
    para "bereit für das"
    line "Abenteuer deines"
    cont "Lebens!"

    para "ROUTE 101 und die"
    line "SILENITIA HÜGEL"
    para "wären ein guter"
    line "Start, um nach"
    cont "#MON zu suchen."

    para "Wenn du ein paar"
    line "#BÄLLE brauchst,"
    para "solltest du im"
    line "<PKMN>-SUPERMARKT"
    para "von PAGOTIA CITY"
    line "vorbeischauen."

	text "Ist dein #MON"
	line "verletzt, solltest"
    para "solltest du es"
    line "im <PKMN>-CENTER"
    para "direkt hinter dem"
    line "Labor heilen."

    para "Besuche es, wann"
    line "immer du möchtest."

    para "Ich bin sicher, du"
    line "machst das super!"

	para "Aber nur für den"
	line "Fall, dass… hier"
	para "ist meine Nummer."
	line "Ruf an, wenn es"
	cont "etwas gibt!"
	done
	

GotOak2sNumberText:
	text "<PLAYER> erhält"
	line "EICHs Nummer."
	done
	
	
Lab_GetDexText:
	text "<PLAYER> erhält"
	line "#DEX!"
	done


BlueText_Pokedex:
    text "BLAU: Ich wollte"
    line "früher immer der"
    para "beste #MON-"
    line "Trainer der Welt"
    cont "werden."

    para "Doch als ich zu"
    line "arrogant wurde…"

    para "Gab es jemanden,"
    line "der mir Demut"
    cont "beibrachte."

    para "<PLAYER>, du"
    line "erinnerst mich"
    cont "sehr an ihn."

    para "Und <RIVAL>!"
    line "Du erinnerst mich"
    cont "an mich selbst!"

    para "So, genug davon!"

    para "Hier! Nehmt diesen"
    line "#DEX!"

    para "Er speichert auto-"
    line "matisch Daten über"
    para "#MON, die ihr"
    line "fang oer denen ihr"
    cont "begegnet!"
	done


	
BlueWillGiveDexText:
    text "BLAU: Ah, ihr habt"
    line "also beide ein"
    cont "#MON bekommen!"

    para "Hier, ich habe"
    line "noch etwas für"
    cont "euch!"
	done

Text_GoSeeOak:
    text "BLAU: Opa wartet"
    line "hinten auf euch!"
	done

Text_Interesting:
	text "<RIVAL>: Hey,"
	line "<PLAYER>!"

    para "Jetzt wird's"
    line "spannend!"
	done

Text_OakSpeechComeToBack:
    text "EICH: Würdet ihr"
    line "mir bitte nach"
    cont "hinten folgen?"
	done
	
Text_OakSpeech:
    text "EICH: Es stimmt!"
    line "Ich bin wirklich"
    cont "PROF. EICH!"

    para "Du hast ein ganz"
    line "schön loses Mund-"
    cont "werk, Jungchen!"

    para "Vor einem Jahr"
    line "habe ich zwei"
    para "Jungen in KANTO"
    line "mit einem #MON"
    para "und einem #DEX"
    line "ausgestattet, um"
    para "meine Forschungen"
    line "zu unterstützen."

    para "Am Ende haben sie"
    line "großartige Arbeit"
    cont "geleistet!"

    para "Sie haben 150"
    line "Arten von #MON"
    cont "dokumentiert!"

    para "Doch überall in"
    line "NIHON werden neue"
    cont "#MON gefunden!"

    para "Deshalb habe ich"
    line "mein Labor hier"
    para "nach SILENITIA"
    line "verlegt, um meine"
    para "Forschungen weiter"
    line "fortzusetzen."

    para "Mein Enkel BLAU"
    line "und meine ASSIS-"
    para "TENTEN helfen mir"
    line "dabei, doch das"
    cont "reicht nicht aus!"

    para "<PLAYER>!"

    para "<RIVAL>!"

    text "Bitte helft mir,"
    line "die #MON zu"
    cont "erforschen!"
	done
	
	

Oak2Text_Intro:
	text "EICH: <PLAYER>!"
	line "Da bist du ja!"

	done	
	
Text_OakIsOld:
    text "<RIVAL>: Ich kann"
    line "es nicht fassen."

    para "Dieser alte Kauz"
    line "soll PROF. EICH"
    para "sein…"
	done
	
WhatIsDexText:
	text "Was ist das?"

	para "Eine Art Lexikon?"
	done
	
OakLabFrontRoomSignText:
	text "SICHERE regelmäßig"
	line "deinen Spielstand!"
	done	
	
OakLabFrontRoomComputerText:
    text "Ein Bericht über"
    line "#MON Habitate."
	done
	
Text_RootingText:
	text "Ich drück dir die"
	line "Daumen!"
	done
	
DaisySpeechText:
    text "Der Junge, der"
    line "dich hierher"
    para "gebracht hat, ist"
    line "mein kleiner"
    cont "Bruder."

    para "Ich bin also PROF."
    line "EICHs Enkelin!"

    para "Opa ist ein"
    line "großartiger"
    cont "Forscher!"

    para "…Aber manchmal ist"
    line "er ein bischen"
    cont "vergesslich."

    para "Er sollte dir"
    line "eigentlich noch"
    cont "das hier geben!"
	done

DaisySpeechText2:
    text "Ein TRANK kann die"
    line "KP deines #MON"
    para "außerhalb vom"
    line "#MON-CENTER"
    cont "wiederherstellen."

    para "Ich gebe dir auch"
    line "noch ein paar"
    para "#BÄLLE mit, um dir"
    line "den Start etwas zu"
    cont "erleichtern."
	done

DaisySpeechText3:
    text "Aber wie Opa schon"
    line "sagte, wenn du"
    para "mehr #BÄLLE"
    line "brauchst, kannst"
    para "du dir in jedem"
    line "<PKMN>-SUPERMARKT"
    cont "neue kaufen."

    para "Vergiss nicht,"
    line "dich von deiner"
    para "MUTTER und KEN"
    line "zu verabschieden,"
    para "bevor du die Stadt"
    line "verlässt!"

    para "Ich drück dir die"
    line "Daumen!"
	done

SilverEntranceWinText:
    text "Wow! Ich dachte,"
    line "mein #MON wäre"
    cont "das Beste!"
	done

EntranceRivalText_YouLost:
    text "<PLAYER>! Ich bin"
    line "bereit der Welt zu"
    para "zeigen, wie stark"
    line "mein #MON ist!"

    para "Wir sehen uns!"
	done

SilverEntranceLossText:
    text "Alles klar!"
    line "Mein #MON ist"
    cont "der Hammer!"
	done

EntranceRivalText_YouWon:
    text "<PLAYER>! Ich bin"
    line "bereit der Welt zu"
    para "zeigen, wie stark"
    line "mein #MON ist!"

    para "Wir sehen uns!"
	done
	
TimeToBattle:
	text "<PLAYER>!"

	para "So einfach kommst"
	line "du nicht davon!"

	para "PROF. EICH hat uns"
	line "diese #MON ge-"
	para "geben, also müssen"
	line "wir jetzt mit"
	cont "ihnen kämpfen!"

	para "Ich werde mich"
	line "nicht zurückhalten!"
	done
	
Text_InBack:
    text "PROF. EICH ist"
    line "gerade wiederge-"
    para "kommen. Er wartet"
    line "schon auf dich!"
	done

OakLabFrontRoomAideText:
    text "Ich bin einer von"
    line "PROF. EICHs ASSIS-"
    cont "TENTEN."

    para "Natürlich respek-"
    line "tieren wir uns"
    cont "gegenseitig."
	done
	
DoorLockedText:
    text "Die Tür ist"
    line "verschlossen…"
	done
	
OakLabFrontRoomSilverText:
    text "Y, <PLAYER>!"

    para "Anscheinend ist"
    line "PROF. EICH gerade"
    cont "nicht da!"

    para "Was hat er denn"
    line "gedacht, wann wir"
    cont "hier sein würden?"
	done
	
DaisyLeftMovement:
	step LEFT
	step LEFT
	turn_head DOWN
	step_end
	
DaisyWalksUp1:
	step RIGHT
	step RIGHT
	step UP
	step_end
	
DaisyWalksUp2:
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_end
	
SilverLeavesLab:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
Movement_SilverToBlue:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	slow_step LEFT
	step_end
	
Movement_OverToBlue:
	step DOWN
	step DOWN
	step LEFT
	slow_step LEFT
	step_end	
	
PlayerLabDummyMovement:
	step_end

DoorLocked_Movement:
	turn_head DOWN
	slow_step DOWN
	step_end

Movement_BlueToBack:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	slow_step UP
	slow_step RIGHT
	turn_head UP
	step_end
	
Movement_BlueThroughDoor:
	step UP
	step_end
	
Movement_PlayerThroughDoor:
	step UP
	step UP
	step_end

OakLabFrontRoom_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3, 15, SILENT_TOWN, 1
	warp_event  4, 15, SILENT_TOWN, 5
	warp_event  4,  0, OAK_LAB_BACK_ROOM, 1


	db 9 ; coord events
	coord_event  4,  1, SCENE_DEFAULT, DoorLockedScript
	coord_event  3,  7, SCENE_OAK_LAB_FRONT_ROOM_GO_SEE_OAK, GoSeeOakScript
	coord_event  4,  7, SCENE_OAK_LAB_FRONT_ROOM_GO_SEE_OAK, GoSeeOakScript
	coord_event  4,  1, SCENE_OAK_LAB_FRONT_ROOM_POKEDEX, GetDexScript
	coord_event  3, 11, SCENE_OAK_LAB_FRONT_ROOM_DAISY, DaisyStopsScript1
	coord_event  4, 11, SCENE_OAK_LAB_FRONT_ROOM_DAISY, DaisyStopsScript2
	coord_event  3,  8, SCENE_OAK_LAB_FRONT_ROOM_BATTLE, BattleScript
	coord_event  4,  8, SCENE_OAK_LAB_FRONT_ROOM_BATTLE, BattleScript2
	coord_event  4,  1, SCENE_OAK_LAB_FRONT_ROOM_AFTER_TALKING_TO_CLERK, DoorLockedScriptWeekends

	db 14 ; bg events
	bg_event  6,  1, BGEVENT_READ, OakLabFrontRoomComputerScript
	bg_event  0,  7, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  1,  7, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  2,  7, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  5,  7, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  6,  7, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  7,  7, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  0, 11, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  1, 11, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  2, 11, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  5, 11, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  6, 11, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  7, 11, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  2,  0, BGEVENT_READ, OakLabFrontRoomSign


	db 9 ; object events
	object_event  6, 13, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, OakLabFrontRoomAideScript, EVENT_OAK2S_AIDE_IN_LAB
	object_event  3,  4, SPRITE_SILVER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OakLabFrontRoomSilverScript, EVENT_RIVAL_OAK_LAB_FRONT_ROOM
	object_event  4, 14, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OakLabFrontRoomBlueScript, EVENT_BLUE_OAK_LAB_FRONT_ROOM
	object_event  1, 13, SPRITE_DAISY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OakLabFrontRoomDaisyScript, EVENT_DAISY_OAK_LAB_FRONT_ROOM
	object_event  1,  1, SPRITE_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OakLabFrontRoomDexScript, EVENT_OAK_LAB_DEX_TABLE
	object_event  0,  1, SPRITE_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OakLabFrontRoomDexScript, EVENT_OAK_LAB_DEX_TABLE
	object_event  4,  2, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, OakLabFrontRoomDexScript, EVENT_OAK_OAK_LAB_FRONT_ROOM
	object_event  3,  4, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OakLabFrontRoomSilverScript, EVENT_RIVAL_OAK_LAB_FRONT_ROOM_2
	object_event  1,  3, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OakLabFrontRoomBlueScript, EVENT_BLUE_OAK_LAB_FRONT_ROOM_2

	
