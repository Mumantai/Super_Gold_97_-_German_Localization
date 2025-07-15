	object_const_def ; object_event constants
	const PLAYERSHOUSE2F_CONSOLE
	const PLAYERSHOUSE2F_DOLL_1
	const PLAYERSHOUSE2F_DOLL_2
	const PLAYERSHOUSE2F_BIG_DOLL
	const PLAYERSHOUSE2F_CLEFAIRY
	const PLAYERSHOUSE2F_KEN

PlayersHouse2F_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .InitializeRoom
	callback MAPCALLBACK_TILES, .SetSpawn

; unused
.Null:
	end

.InitializeRoom:
	special ToggleDecorationsVisibility
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	checkevent EVENT_INITIALIZED_EVENTS
	iftrue .SkipInitialization
	jumpstd InitializeEventsScript
	return

.SkipInitialization:
	return

.SetSpawn:
	special ToggleMaptileDecorations
	return

	db 0, 0, 0 ; filler
	
MeetKenScript:
	turnobject PLAYER, LEFT
	turnobject PLAYERSHOUSE2F_KEN, RIGHT
PlayersHouse2F_Ken:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_MOM_AT_BEGINNING
	iftrue .KenPart2
	writetext KenGreeting1
	setevent EVENT_TALKED_TO_KEN_AT_BEGINNING
	checkevent EVENT_READ_OAKS_EMAIL
	iffalse .KenEmailScript
	waitbutton
	closetext
	setscene SCENE_PLAYERS_HOUSE_2F_NOTHING
	end
	
.KenEmailScript
	waitbutton
	writetext KenGreeting1pt2
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal UP, .DontNeedToWalk
	applymovement PLAYER, PlayerToReadEmailMovement
	turnobject PLAYERSHOUSE2F_KEN, DOWN
	end
	
.DontNeedToWalk
	end
	
.KenPart2
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue .KenGiveMapCard
	writetext KenGreeting2
	waitbutton
	closetext
	end
	
.KenGiveMapCard
	checkflag ENGINE_MAP_CARD
	iftrue .KenAlreadyGaveMap
	writetext KenGreeting3
	buttonsound
	stringtotext .mapcardname, MEM_BUFFER_1
	scall .JumpstdReceiveItem
	setflag ENGINE_MAP_CARD
	writetext KenGreeting4
	waitbutton
	closetext
	end
	
.KenAlreadyGaveMap
	writetext KenGreeting5
	waitbutton
	closetext
	end

.JumpstdReceiveItem:
	jumpstd ReceiveItemScript
	end

.mapcardname
	db "KARTENMODUL@"
	


Doll1Script:
	describedecoration DECODESC_LEFT_DOLL

Doll2Script:
	describedecoration DECODESC_RIGHT_DOLL

BigDollScript:
	describedecoration DECODESC_BIG_DOLL

GameConsoleScript:
	describedecoration DECODESC_CONSOLE

PlayersHousePosterScript:
	conditional_event EVENT_PLAYERS_ROOM_POSTER, .Script

.Script:
	describedecoration DECODESC_POSTER

PlayersHouseRadioScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue .NormalRadio
	opentext
	writetext PlayersRadioText1
	waitbutton
	closetext
	end

.NormalRadio:
	checkevent EVENT_ROUTE_102_SILVER
	iftrue .NormalRadio2
	opentext
	writetext PlayersRadioText5
	waitbutton
	closetext
	end	
	
.NormalRadio2
	jumpstd Radio1Script

.AbbreviatedRadio:
	opentext
	writetext PlayersRadioText4
	pause 45
	closetext
	end

PlayersHouseBookshelfScript:
	jumpstd PictureBookshelfScript

PlayersHousePCScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue .PlayersHousePC2
	opentext
	playsound SFX_BOOT_PC
	writetext PlayersRadioText2
	yesorno
	iffalse DontReadEmailNow
	writetext PlayersRadioTextNew
	waitbutton
	closetext
	setevent EVENT_READ_OAKS_EMAIL
	checkevent EVENT_TALKED_TO_KEN_AT_BEGINNING
	iffalse .DontSetKenScene
	setscene SCENE_PLAYERS_HOUSE_2F_NOTHING
	end
	
.DontSetKenScene
	end

.Warp:
	warp NONE, 0, 0
	end

.PlayersHousePC2
	opentext
	special PlayersHousePC
	iftrue .Warp
	closetext
	end
	
DontReadEmailNow:
	writetext NoTimeToReadEmail
	waitbutton
	closetext
	end

PlayersDollScript:
	opentext
	writetext PlayersDollText
	waitbutton
	closetext
	end
	
PlayerToReadEmailMovement:
	step DOWN
	step_end
	
NoTimeToReadEmail:
	text "Dafür ist gerade"
	line "keine Zeit…"
	done
	
PlayersRadioText5:
	text "Es ist wohl nicht"
	line "eingeschaltet…"
	done
	
KenGreeting1:
    text "KEN: Hey, Bruder!"

    para "Das Glänzende Ding"
    line "an deinem Hand-"
    cont "gelenk…"

    para "Du hast endlich"
    line "ein #COM"
    cont "bekommen!"

    para "Ohne MODULE, kann"
    line "es aber noch nicht"
    cont "so viel…"

    para "Vielleicht sollte"
    line "ich dir das"
    para "KARTEN-MODUL"
    line "besorgen!"

    para "Also, falls du es"
    line "jemals brauchen"
    cont "solltest."

    para "Schau bei mir"
    line "vorbei, bevor du"
    cont "irgendwo hingehst!"
	done
	
KenGreeting1pt2:
    text "Oh,stimmt!"

    para "Ich glaube, du"
    line "hast vorhin eine"
    para "neue E-Mail auf"
    line "dem PC bekommen."

    para "Lies sie lieber,"
    line "bevor du das Haus"
    cont "verlässt."
	done
	
KenGreeting2:
    text "Schau bei mir"
    line "vorbei, bevor du"
    cont "irgendwo hingehst!"
	done
	
KenGreeting3:
    text "KEN: Hey, Bruder!"

    para "PROF: EICH hat"
    line "dich gebeten, ihm"
    para "bei einem neuen"
    line "#DEX zu helfen?"

    para "Da kommt das hier"
    line "wie gerufen!"
	done
	
KenGreeting4:
    text "Dein #COM kann"
    line "dir jetzt immer"
    para "zeigen, wo du"
    line "gerade bist!"

    para "Damit verläufst du"
    line "dich nie wieder!"

    para "Und weißt du was?"

    para "Ich habe ein Vor-"
    line "stellungsgespräch"
    para "für einen Job als"
    line "Radio-Moderator in"
    cont "PORT AABANTIA!"

    para "Vielleicht hörst"
    line "du mich bald im"
    cont "Radio, Bruder!"

    para "Wünsch mir Glück!"

    para "Und dir auch viel"
    line "Glück da draußen!"
	done
	
KenGreeting5:
	text "Ich habe ein Vor-"
    line "stellungsgespräch"
    para "für einen Job als"
    line "Radio-Moderator in"
    cont "PORT AABANTIA!"

    para "Vielleicht hörst"
    line "du mich bald im"
    cont "Radio, Bruder!"

    para "Wünsch mir Glück!"

    para "Und dir auch viel"
    line "Glück da draußen!"
	done

PlayersDollText:
    text "Eine Puppe, die du"
    line "zu Weihnachten von"
    para "einem Verwandten"
    line "aus KANTO bekommen"
    cont "hast."
	done

PlayersRadioText1:
	text "<PLAYER> schaltet"
	line "das Radio an."
	
	para "…"

	para "Sie hören JOPM,"
	line "das #MON-Radio!"
	
	para "Und jetzt: #-"
	line "MON-Nachrichten!"

	para "… Der weltberühmte"
	line "#MON-Forscher,"
	para "PROF. EICH aus"
	line "aus KANTO, wird"
	cont "vermisst!"

	para "Einige vermuten,"
	line "er könnte bloß"
	para "einen neuen Ort"
	line "für seine For-"
	cont "schung suchen."

	para "Es könnte jedoch"
	line "auch sein, dass er"
	para "in einen Vorfall"
	line "verwickelt war."

	para "Die Sorge unter"
	line "den Beteiligten"
	cont "ist groß."

	para "…"
	
	para "Und das waren die"
	line "heutigen #-"
	cont "MON-Nachrichten!"
	
	para "…"
	done

PlayersRadioText2:
	text "<PLAYER> schaltet"
	line "den PC ein."
	
	para "Was ist das?"
	line "Eine neue E-Mail?"
	
	para "Die E-Mail lesen?"
	
	done
	
PlayersRadioTextNew:
    text "Ich hoffe, du"
    line "entschuldigst die"
    para "plötzliche E-Mail,"
    line "aber es gibt da"
    para "etwas, was ich dir"
    line "anvertrauen will."

    para "Kommst du bitte"
    line "vorbei, um es dir"
    cont "abzuholen?"

	para "#MON-Professor"
	line "EICH"
	
	done

PlayersRadioText3:
	text "Hier ist DJ"
	line "MARGIT, Ihr Co-"
	cont "Moderator!"
	done

PlayersRadioText4:
	text "#MON!"
	line "#MON-PROGRAMM!"
	done

PlayersHouse2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  9,  0, PLAYERS_HOUSE_1F, 3

	db 1 ; coord events
	coord_event  9,  1, SCENE_DEFAULT, MeetKenScript


	db 5 ; bg events
	bg_event  3,  1, BGEVENT_UP, PlayersHousePCScript
	bg_event  2,  1, BGEVENT_READ, PlayersHouseRadioScript
	bg_event  5,  1, BGEVENT_READ, PlayersHouseBookshelfScript
	bg_event  1,  1, BGEVENT_READ, PlayersHouseBookshelfScript
	bg_event  8,  0, BGEVENT_IFSET, PlayersHousePosterScript

	db 6 ; object events
	object_event  7,  2, SPRITE_CONSOLE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GameConsoleScript, EVENT_PLAYERS_HOUSE_2F_CONSOLE
	object_event  4,  6, SPRITE_DOLL_1, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Doll1Script, EVENT_PLAYERS_HOUSE_2F_DOLL_1
	object_event  5,  6, SPRITE_DOLL_2, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Doll2Script, EVENT_PLAYERS_HOUSE_2F_DOLL_2
	object_event  0,  6, SPRITE_BIG_DOLL, SPRITEMOVEDATA_BIGDOLL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BigDollScript, EVENT_PLAYERS_HOUSE_2F_BIG_DOLL
	object_event  6,  1, SPRITE_CLEFAIRY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PlayersDollScript, -1
	object_event  8,  1, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PlayersHouse2F_Ken, EVENT_ROUTE_102_SILVER
