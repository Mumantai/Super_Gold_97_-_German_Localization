	object_const_def ; object_event constants
	const PLAYERSHOUSE1F_MOM1
	const PLAYERSHOUSE1F_MOM2
	const PLAYERSHOUSE1F_MOM3
	const PLAYERSHOUSE1F_MOM4

PlayersHouse1F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .SetKenAndDecorForOldSaves
	
.SetKenAndDecorForOldSaves
	setmapscene PLAYERS_HOUSE_2F, SCENE_PLAYERS_HOUSE_2F_NOTHING
	setevent EVENT_DECO_N64
	setevent EVENT_DECO_CARPET_1
	setevent EVENT_DECO_BED_1
	setevent EVENT_DECO_POSTER_1
	setevent EVENT_TALKED_TO_KEN_AT_BEGINNING
	setevent EVENT_READ_OAKS_EMAIL
	return


.DummyScene0:
	end

.DummyScene1:
	end

MeetMomLeftScript:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1

MeetMomRightScript:
	playmusic MUSIC_MOM
	showemote EMOTE_SHOCK, PLAYERSHOUSE1F_MOM1, 15
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .OnRight
	applymovement PLAYERSHOUSE1F_MOM1, MomTurnsTowardPlayerMovement
	jump MeetMomScript

.OnRight:
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksToPlayerMovement
MeetMomScript:
	opentext
	writetext Oak2sLookingForYouText
	buttonsound
;	stringtotext GearName, MEM_BUFFER_1
;	scall PlayersHouse1FReceiveItemStd
	setflag ENGINE_POKEGEAR
	setflag ENGINE_PHONE_CARD
	addcellnum PHONE_MOM
	setscene SCENE_FINISHED
	setevent EVENT_PLAYERS_HOUSE_MOM_1
	clearevent EVENT_PLAYERS_HOUSE_MOM_2
	writetext MomGivesPokegearText
	buttonsound
;	special SetDayOfWeek
.SetDayOfWeek:
	writetext IsItDSTText
	yesorno
	iffalse .WrongDay
	special InitialSetDSTFlag
	yesorno
	iffalse .SetDayOfWeek
	jump .DayOfWeekDone

.WrongDay:
	special InitialClearDSTFlag
	yesorno
	iffalse .SetDayOfWeek
.DayOfWeekDone:
	writetext GearIsActiveText1
	waitbutton
	waitsfx
	writetext GearIsActiveText2
	playsound SFX_ITEM
	waitsfx
	writetext ComeHomeForDSTText
	yesorno
	iffalse .ExplainPhone
	jump .KnowPhone

.KnowPhone:
	writetext KnowTheInstructionsText
	buttonsound
	jump .FinishPhone

.ExplainPhone:
	writetext DontKnowTheInstructionsText
	buttonsound
	jump .FinishPhone

.FinishPhone:
	writetext InstructionsNextText
	waitbutton
;	closetext
;	special NameRival
;	opentext
	writetext FinalMomText
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_MOM_AT_BEGINNING
	setevent EVENT_BLUE_SILENT_TOWN
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .FromRight
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iffalse .FromLeft
	jump .Finish

.FromRight:
	applymovement PLAYERSHOUSE1F_MOM1, MomTurnsBackMovement
	jump .Finish

.FromLeft:
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksBackMovement
	jump .Finish

.Finish:
	special RestartMapMusic
	turnobject PLAYERSHOUSE1F_MOM1, LEFT
	end

MeetMomTalkedScript:
	playmusic MUSIC_MOM
	jump MeetMomScript

GearName:
	db "#COM@"

PlayersHouse1FReceiveItemStd:
	jumpstd ReceiveItemScript
	end

MomScript:
	faceplayer
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	checkscene
	iffalse MeetMomTalkedScript ; SCENE_DEFAULT
	opentext
	checkevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	iftrue .FirstTimeBanking
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue .BankOfMom
	;checkevent EVENT_GAVE_MYSTERY_EGG_TO_OAK2
	;iftrue .GaveMysteryEgg
	;checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	;iftrue .GotAPokemon
	writetext HurryUpOak2IsWaitingText
	waitbutton
	closetext
	end

.GotAPokemon:
	writetext SoWhatWasProfOak2sErrandText
	waitbutton
	closetext
	end

.FirstTimeBanking:
	writetext ImBehindYouText
	waitbutton
	closetext
	end

.GaveMysteryEgg:
	setevent EVENT_FIRST_TIME_BANKING_WITH_MOM
.BankOfMom:
	setevent EVENT_TALKED_TO_MOM_AFTER_GETTING_POKEDEX
	special BankOfMom
	waitbutton
	closetext
	end


TVScript:
	jumptext TVText

StoveScript:
	jumptext StoveText

SinkScript:
	jumptext SinkText

FridgeScript:
	jumptext FridgeText

MomTurnsTowardPlayerMovement:
	turn_head RIGHT
	step_end

MomWalksToPlayerMovement:
	slow_step RIGHT
	slow_step RIGHT
	slow_step UP
	slow_step UP
	step_end

MomTurnsBackMovement:
	turn_head LEFT
	step_end

MomWalksBackMovement:
	slow_step DOWN
	slow_step DOWN
	slow_step LEFT
	slow_step LEFT
	step_end
	
GearIsActiveText1:
	text "So, fertig!"

	para "Jetzt sollte alles"
	line "funktionieren!"
	done
	
GearIsActiveText2:
	text "<PLAYER>s #COM"
	line "ist jetzt ein-"
	cont "gerichtet!"
	done

FinalMomText:
	;text "That's right,"
	;line "<RIVAL> is"
	;cont "his name!"

    text "Übrigens, dieser"
    line "Freund von dir war"
    para "hier und hat nach"
    line "dir gefragt."

    para "Er ist bestimmt"
    line "noch in der Nähe."

    para "Du läufst ihm"
    line "bestimmt bald über"
    cont "den Weg."
	done

Oak2sLookingForYouText:
	text "Oh, <PLAYER>…!"
	line "Dein neuer #MON"

	para "COM ist noch nicht"
	line "eingerichtet!"

	para "Lass uns das tun,"
	line "bevor du das Has"
	cont "verlässt!"
	done

MomGivesPokegearText:
	text "#MON-COM oder"
	line "einfach nur"
	cont "#COM."

	para "Ein wichtiges Ge-"
	line "rät auf deinem"
	cont "Pfad als Trainer."

	para "Oh, der Wochentag"
	line "ist noch nicht"
	cont "eingestellt."

	para "Das darfst du"
	line "nicht vergessen!"
	done
IsItDSTText:
	text "Haben wir"
	line "Sommerzeit?"
	done

ComeHomeForDSTText:
	text "Geh nach Hause, um"
	line "deine Uhr auf SZ"
	cont "oder WZ einzu-"
	cont "stellen."

	para "Übrigens, weißt du"
	line "über den Umgang"
	cont "mit dem TELEFON"
	cont "Bescheid?"
	done

KnowTheInstructionsText:
	text "Muss man nicht"
	line "einfach den #-"
	cont "COM einschalten"

	para "und das TELEFON-"
	line "Symbol anwählen?"
	done

DontKnowTheInstructionsText:
	text "Ich werde die An-"
	line "leitung lesen."

	para "Schalte den #-"
	line "COM ein und wähle"
	cont "das TELEFON-Symbol"
	cont "an!"
	done

InstructionsNextText:
	text "Telefonnummern"
	line "werden gespei-"
	cont "chert. Wähle ein-"
	cont "fach den Namen der"

	para "Person, die du an-"
	line "rufen möchtest."

	para "Ist das nicht"
	line "praktisch?"

	;para "By the way, that"
	;line "friend of yours"

	;para "stopped by looking"
	;line "for you."

	;para "I can't remember"
	;line "his name though…"

	done

HurryUpOak2IsWaitingText:
	text "PROF. EICH wartet"
	line "auf dich."

	para "Beeile dich, Baby!"
	done

SoWhatWasProfOak2sErrandText:
	text "Wie lautete der"
	line "Auftrag von PROF."
	cont "EICH?"

	para "…"

	para "Das klingt nach"
	line "einer wahren He-"
	cont "rausforderung."

	para "Aber du kannst"
	line "stolz darauf sein,"
	cont "dass sich die Leu-"
	cont "te auf dich ver-"
	cont "lassen!"
	done

ImBehindYouText:
	text "<PLAYER>, du"
	line "schaffst es!"

	para "Ich werde dir"
	line "immer zur Seite"
	cont "stehen!"
	done


StoveText:
	text "Mamas Spezialität!"

	para "MINAMIDIA-VULKAN-"
	line "BURGER!"
	done

SinkText:
	text "Die Spüle ist"
	line "fleckenlos rein,"
	cont "so wie es Mama"
	cont "mag."
	done

FridgeText:
	text "Mal sehen, was da"
	line "im Kühlschrank zu"
	cont "finden ist…"

	para "TAFELWASSER"
	line "und leckere LIMO-"
	cont "NADE!"
	done

TVText:
	text "Es läuft ein Film"
	line "im TV: Die Sterne"

	para "leuchten und zwei"
	line "Jungen fahren Zug…"

	para "Ich sollte mich"
	line "auch in Bewegung"
	cont "setzen!"
	done

PlayersHouse1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  6,  7, SILENT_TOWN, 2
	warp_event  7,  7, SILENT_TOWN, 2
	warp_event  9,  0, PLAYERS_HOUSE_2F, 1

	db 2 ; coord events
	coord_event  4,  7, SCENE_DEFAULT, MeetMomLeftScript
	coord_event  9,  1, SCENE_DEFAULT, MeetMomRightScript

	db 4 ; bg events
	bg_event  0,  1, BGEVENT_READ, StoveScript
	bg_event  1,  1, BGEVENT_READ, SinkScript
	bg_event  2,  1, BGEVENT_READ, FridgeScript
	bg_event  4,  1, BGEVENT_READ, TVScript

	db 5 ; object events
	object_event  7,  4, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_1
	object_event  2,  2, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  7,  4, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  0,  2, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, NITE, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
