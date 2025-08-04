	object_const_def ; object_event constants
	const OAK2SLAB_OAK2
	const OAK2SLAB_POKE_BALL1
	const OAK2SLAB_POKE_BALL2
	const OAK2SLAB_POKE_BALL3
	const OAK2SLAB_BLUE
	const OAK2SLAB_SILVER

OakLabBackRoom_MapScripts:
	db 6 ; scene scripts
	scene_script .MeetOak2 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_OAK2SLAB_CANT_LEAVE
	scene_script .DummyScene2 ; SCENE_OAK2SLAB_NOTHING
	scene_script .DummyScene3 ; SCENE_OAK2SLAB_MEET_OFFICER
	scene_script .DummyScene4 ; SCENE_OAK2SLAB_UNUSED
	scene_script .DummyScene5 ; SCENE_OAK2SLAB_AIDE_GIVES_POTION

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .MoveOak2Callback

.MeetOak2:
	priorityjump .WalkUpToOak2
	end

.DummyScene1:
	end

.DummyScene2:
	end

.DummyScene3:
	end

.DummyScene4:
	end

.DummyScene5:
	end

.MoveOak2Callback:
	checkscene
	iftrue .Skip ; not SCENE_DEFAULT
	moveobject OAK2SLAB_OAK2, 4, 2
.Skip:
	return

.WalkUpToOak2:
	applymovement PLAYER, OakLabBackRoom_WalkUpToOak2Movement
	pause 5
	opentext
	writetext Text_OakTakeAMon
	waitbutton
	closetext
	showemote EMOTE_SHOCK, OAK2SLAB_SILVER, 15
	opentext
	writetext Text_SilverGetsOneToo
	waitbutton
	closetext
	pause 15
	opentext
	writetext Text_YesSilverGetsOneToo
	waitbutton
	closetext
	applymovement OAK2SLAB_SILVER, MoveHeadLeft
	opentext
	writetext Text_RivalGenerous
	waitbutton
	closetext
	applymovement OAK2SLAB_SILVER, MoveHeadUp
	setscene SCENE_OAK2SLAB_CANT_LEAVE
	end

OakLabBackRoomSilverScript:
	jumptextfaceplayer Text_Best

OakLabBackRoomBlueScript:
	end

ProfOak2Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_SS_TICKET_FROM_OAK
	iftrue Oak2CheckMasterBall
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue Oak2GiveTicketScript
Oak2CheckMasterBall:
	checkevent EVENT_GOT_MASTER_BALL_FROM_OAK
	iftrue Oak2CheckEverstone
	checkflag ENGINE_RISINGBADGE
	iftrue Oak2GiveMasterBallScript
Oak2CheckEverstone:
	checkevent EVENT_GOT_EVERSTONE_FROM_OAK
	iftrue Oak2Script_CallYou
	checkevent EVENT_TOLD_OAK2_ABOUT_TOGEPI_OVER_THE_PHONE
	iffalse Oak2CheckTogepiEgg
	waitbutton
	closetext
	end

Oak2CheckTogepiEgg:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue Oak2AfterLeagueInPerson
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue Oak2AfterRadioTowerInPerson
	checkevent EVENT_103_SLOWPOKE_SALESMAN
	iftrue Oak2RocketsReturnedScript
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_OAKS_AIDE ; why are we checking it again?
	iftrue OakHearsYouChallengeLeagueScript ; gonna make this about league challenge
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue Oak2DescribesMrPokemonScript
	writetext Oak2Text_LetYourMonBattleIt
	waitbutton
	closetext
	end

LabTryToLeaveScript:
	turnobject OAK2SLAB_OAK2, DOWN
	opentext
	writetext LabWhereGoingText
	waitbutton
	closetext
	applymovement PLAYER, OakLabBackRoom_CantLeaveMovement
	end
	
OakHearsYouChallengeLeagueScript:
	writetext OakHearsYouChallengeLeagueText
	waitbutton
	closetext
	end
	
Oak2RocketsReturnedScript:
	writetext Oak2RocketsReturnedText
	waitbutton
	closetext
	end
	
Oak2AfterRadioTowerInPerson:
	writetext Oak2YoureBasicallyAHeroText
	waitbutton
	closetext
	end
	
Oak2AfterLeagueInPerson:
	writetext Oak2AfterLeagueInPersonText
	waitbutton
	closetext
	end

CubburnPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue LookAtOak2PokeBallScript
	turnobject OAK2SLAB_OAK2, DOWN
	refreshscreen
	setval CUBBURN
	special ShowPokedexEntry
	opentext
	writetext TakeCubburnText
	yesorno
	iffalse DidntChooseStarterScript
	disappear OAK2SLAB_POKE_BALL1
	setevent EVENT_GOT_CUBBURN_FROM_OAK
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem CUBBURN, MEM_BUFFER_0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke CUBBURN, 5, BERRY
	closetext
	applymovement OAK2SLAB_SILVER, SilverGetCruiseMovement
	opentext
	writetext Text_SilverTakeThisOne
	waitbutton
	closetext
	disappear OAK2SLAB_POKE_BALL2
	opentext
	writetext Text_SilverGetCruise
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	closetext
	setevent EVENT_PALSSIO_POKEBALL_IN_OAK_LAB_BACK_ROOM
	jump Oak2DirectionsScript

CruisePokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue LookAtOak2PokeBallScript
	turnobject OAK2SLAB_OAK2, DOWN
	refreshscreen
	setval PALSSIO
	special ShowPokedexEntry
	opentext
	writetext TakeCruiseText
	yesorno
	iffalse DidntChooseStarterScript
	disappear OAK2SLAB_POKE_BALL2
	setevent EVENT_GOT_PALSSIO_FROM_OAK
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem PALSSIO, MEM_BUFFER_0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke PALSSIO, 5, BERRY
	closetext
	applymovement OAK2SLAB_SILVER, SilverGetChikoritaMovement
	opentext
	writetext Text_SilverTakeThisOne
	waitbutton
	closetext
	disappear OAK2SLAB_POKE_BALL3
	opentext
	writetext Text_SilverGetChikorita
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	closetext
	setevent EVENT_CHIKORITA_POKEBALL_IN_OAK_LAB_BACK_ROOM
	jump Oak2DirectionsScript

ChikoritaPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue LookAtOak2PokeBallScript
	turnobject OAK2SLAB_OAK2, DOWN
	refreshscreen
	setval CHIKORITA
	special ShowPokedexEntry
	opentext
	writetext TakeChikoritaText
	yesorno
	iffalse DidntChooseStarterScript
	disappear OAK2SLAB_POKE_BALL3
	setevent EVENT_GOT_CHIKORITA_FROM_OAK
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem CHIKORITA, MEM_BUFFER_0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke CHIKORITA, 5, BERRY
	closetext
	applymovement OAK2SLAB_SILVER, SilverGetCubburnMovement
	opentext
	writetext Text_SilverTakeThisOne
	waitbutton
	closetext
	disappear OAK2SLAB_POKE_BALL1
	opentext
	writetext Text_SilverGetCubburn
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	closetext
	setevent EVENT_CUBBURN_POKEBALL_IN_OAK_LAB_BACK_ROOM
	jump Oak2DirectionsScript

DidntChooseStarterScript:
	writetext DidntChooseStarterText
	waitbutton
	closetext
	end

Oak2DirectionsScript:
	applymovement OAK2SLAB_OAK2, Oak2ToTable
	turnobject PLAYER, UP
	opentext
	
	
	writetext Oak2DirectionsTextNew
	waitbutton
	closetext
	applymovement OAK2SLAB_OAK2, Oak2BackFromTable
	setevent EVENT_GOT_A_POKEMON_FROM_OAK
	setevent EVENT_RIVAL_CROWN_CITY
	setevent EVENT_BLUE_OAK_LAB_FRONT_ROOM
	setscene SCENE_OAK2SLAB_NOTHING
	setmapscene SILENT_TOWN, SCENE_SILENT_NOTHING
	setmapscene OAK_LAB_FRONT_ROOM, SCENE_OAK_LAB_FRONT_ROOM_POKEDEX
	setevent EVENT_SILVER_IN_OAK_LAB_BACK_ROOM
	clearevent EVENT_DAISY_OAK_LAB_FRONT_ROOM
	clearevent EVENT_BLUE_OAK_LAB_FRONT_ROOM_2
	end

Oak2DescribesMrPokemonScript:
	writetext Oak2DescribesMrPokemonText
	waitbutton
	closetext
	end

LookAtOak2PokeBallScript:
	opentext
	writetext Oak2PokeBallText
	waitbutton
	closetext
	end



Oak2GiveEverstoneScript:
	writetext Oak2GiveEverstoneText1
	buttonsound
	verbosegiveitem EVERSTONE
	iffalse Oak2Script_NoRoomForEverstone
	writetext Oak2GiveEverstoneText2
	waitbutton
	closetext
	setevent EVENT_GOT_EVERSTONE_FROM_OAK
	end

Oak2Script_CallYou:
	writetext Oak2Text_CallYou
	waitbutton
Oak2Script_NoRoomForEverstone:
	closetext
	end

Oak2GiveMasterBallScript:
	writetext Oak2GiveMasterBallText1
	buttonsound
	verbosegiveitem MASTER_BALL
	iffalse .notdone
	setevent EVENT_GOT_MASTER_BALL_FROM_OAK
	writetext Oak2GiveMasterBallText2
	waitbutton
.notdone
	closetext
	end

Oak2GiveTicketScript:
	writetext Oak2GiveTicketText1
	buttonsound
	verbosegiveitem S_S_TICKET
	setevent EVENT_GOT_SS_TICKET_FROM_OAK
	writetext Oak2GiveTicketText2
	waitbutton
	closetext
	end

Oak2JumpBackScript1:
	closetext
	checkcode VAR_FACING
	ifequal DOWN, Oak2JumpDownScript
	ifequal UP, Oak2JumpUpScript
	ifequal LEFT, Oak2JumpLeftScript
	ifequal RIGHT, Oak2JumpRightScript
	end

Oak2JumpBackScript2:
	closetext
	checkcode VAR_FACING
	ifequal DOWN, Oak2JumpUpScript
	ifequal UP, Oak2JumpDownScript
	ifequal LEFT, Oak2JumpRightScript
	ifequal RIGHT, Oak2JumpLeftScript
	end

Oak2JumpUpScript:
	applymovement OAK2SLAB_OAK2, Oak2JumpUpMovement
	opentext
	end

Oak2JumpDownScript:
	applymovement OAK2SLAB_OAK2, Oak2JumpDownMovement
	opentext
	end

Oak2JumpLeftScript:
	applymovement OAK2SLAB_OAK2, Oak2JumpLeftMovement
	opentext
	end

Oak2JumpRightScript:
	applymovement OAK2SLAB_OAK2, Oak2JumpRightMovement
	opentext
	end



OakLabBackRoomTrashcan:
	jumptext OakLabBackRoomTrashcanText


OakLabBackRoomBookshelf:
	jumpstd DifficultBookshelfScript
	
Oak2BackFromTable:
	step LEFT
	step LEFT
	step DOWN
	step_end

MoveHeadLeft:
	turn_head LEFT
	step_end
	
MoveHeadUp:
	turn_head UP
	step_end
	
Oak2ToTable:
	step UP
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end
	
SilverGetCruiseMovement:
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end
	
SilverGetCubburnMovement:
	step RIGHT
	step UP
	step UP
	step_end
	
SilverGetChikoritaMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

OakLabBackRoom_WalkUpToOak2Movement:
	step UP
	slow_step UP
	step_end

OakLabBackRoom_CantLeaveMovement:
	step UP
	step_end

MeetCopScript2_StepLeft:
	step LEFT
	step_end

MeetCopScript_WalkUp:
	step UP
	step UP
	step UP
	step UP
	turn_head RIGHT
	step_end

OfficerLeavesMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

AideWalksRight1:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	turn_head LEFT
	step_end

AideWalksRight2:
	step DOWN
	step LEFT
	step LEFT
	turn_head LEFT
	step_end

AideWalksLeft1:
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

AideWalksLeft2:
	step UP
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

Oak2JumpUpMovement:
	fix_facing
	big_step UP
	remove_fixed_facing
	step_end

Oak2JumpDownMovement:
	fix_facing
	big_step DOWN
	remove_fixed_facing
	step_end

Oak2JumpLeftMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	step_end

Oak2JumpRightMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	step_end

OakLabBackRoom_Oak2ToDefaultPositionMovement1:
	step UP
	step_end

OakLabBackRoom_Oak2ToDefaultPositionMovement2:
	step RIGHT
	step RIGHT
	step UP
	turn_head DOWN
	step_end

AfterCubburnMovement:
	step LEFT
	step UP
	turn_head UP
	step_end

AfterCruiseMovement:
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end

AfterChikoritaMovement:
	step LEFT
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end
	
BlueGivesDex1:
	step RIGHT
	step RIGHT
	step DOWN
	step_end
	
BlueGivesDex2:
	step LEFT
	turn_head DOWN
	step_end
	
BlueGivesDex3:
	step UP
	step LEFT
	turn_head DOWN
	step_end
	
Text_YesSilverGetsOneToo:
	text "EICH: Ja, aber"
	line "natürlich."

	para "Los, such dir"
	line "eins aus!"
	done
	
Text_SilverGetsOneToo:
	text "<RIVAL>: Wir beide"
	line "bekommen eins?"

	para "Ich etwa auch?!"
	done
	

	
Text_SilverTakeThisOne:
    text "Bist du sicher, du"
    line "hast die richtige"        ; ggf. nur "Bist du dir sicher, PLAYER?"
    para "Wahl getroffen,"
    line "<PLAYER>?"

    para "Dieses #MON"
    line "sieht viel stärker"
    cont "aus!"
	done
	
Text_SilverGetCruise:
	text "<RIVAL> erhält"
	line "AMISSIO!"
	done
	
Text_SilverGetCubburn:
	text "<RIVAL> erhält"
	line "PYROXIO!"
	done
	
Text_SilverGetChikorita:
	text "<RIVAL> erhält"
	line "ENDIVIE!"
	done
		
Text_Best:
	text "Mein #MON wird"
	line "das beste werden!"
	done

Text_OakTakeAMon:
    text "EICH: Dort auf dem"
    line "Tisch liegen drei"
    cont "#BÄLLE."

    para "Ihr dürft euch"
    line "beide einen davon"
    cont "aussuchen."

    para "Das #MON darin"
    line "wird euer Partner!"
	done
	
Text_RivalGenerous:
    text "<RIVAL>: Ich werde"
    line "dir den Vortritt"
    cont "lassen, <PLAYER>."

    para "Ich bin eben ein"
    line "großzügiger Kerl!"
	done





Oak2Text_LetYourMonBattleIt:
	text "Erscheint ein"
	line "wildes #MON,"
	cont "lass deine #MON"
	cont "dagegen kämpfen."
	done

LabWhereGoingText:
	text "EICH: Warte! Wohin"
	line "gehst du?"
	done

TakeCubburnText:
	text "EICH: Willst du"
	line "PYROXIO, das"
	cont "Feuer-#MON?"
	done

TakeCruiseText:
	text "EICH: Wählst du"
	line "AMISSIO, das"
	cont "Wasser-#MON?"
	done

TakeChikoritaText:
	text "EICH: Entscheidest"
	line "du dich für"
	para "ENDIVIE, das"
	line "Pflanzen-#MON?"
	done

DidntChooseStarterText:
	text "EICH: Überlege es"
	line "dir gut!"

	para "Die Wahl deines"
	line "Partners ist sehr"
	cont "wichtig."
	done

ChoseStarterText:
	text "EICH: Ich bin auch"
	line "der Meinung, dass"
	cont "dieses #MON"
	cont "sehr gut ist!"
	done

ReceivedStarterText:
	text "<PLAYER> erhält"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done
	
Oak2DirectionsTextNew:
    text "EICH: Eure #MON"
    line "werden auf eurer"
    cont "Reise eure besten"
    cont "Freunde sein."

    para "Behandelt sie gut."

    para "Jetzt geht bitte"
    line "zu BLAU, er hat"
    cont "etwas Wichtiges"
    cont "für euch."
	done


Oak2DirectionsText2:
	text "notused"
	done


Oak2DescribesMrPokemonText:
	text "This is such an"
	line "exciting"
	cont "opportunity!"
	done

Oak2PokeBallText:
	text "Er beinhaltet ein"
	line "von PROF. EICH ge-"
	cont "fangenes #MON."
	done

OakLabBackRoomHealingMachineText1:
	text "Ich frage mich,"
	line "wozu das gut ist!"
	done

OakLabBackRoomHealingMachineText2:
	text "Willst du deine"
	line "#MON heilen?"
	done

Oak2AfterTheftText1:
	text "EICH2: <PLAYER>, es"
	line "ist schrecklich…"

	para "Oh, was hat MR."
	line "#MON denn"
	cont "Großes entdeckt?"
	done

Oak2AfterTheftText2:
	text "<PLAYER> übergibt"
	line "PROF. EICH2 das"
	cont "RÄTSEL-EI."
	done

Oak2AfterTheftText3:
	text "EICH2: Das hier?"
	done

Oak2AfterTheftText4:
	text "Aber… ist das auch"
	line "ein #MON-EI?"

	para "Falls ja, dann ist"
	line "es in der Tat eine"
	cont "große Entdeckung!"
	done

Oak2AfterTheftText5:
	text "EICH2: Wie?!?"

	para "PROF. EICH hat dir"
	line "einen #DEX"
	cont "gegeben?"

	para "<PLAYER>, ist das"
	line "wahr? D-Das ist ja"
	cont "unglaublich!"

	para "Kein anderer ist"
	line "wie er in der"
	para "Lage, das wahre"
	line "Potenzial eines"
	para "Trainers zu er-"
	line "kennen."

	para "Wow, <PLAYER>. Es"
	line "ist vielleicht"
	para "deine Bestimmung,"
	line "der CHAMP zu"
	cont "werden."

	para "Es sieht auch so"
	line "aus, als könntest"
	para "du hervorragend"
	line "mit #MON um-"
	cont "gehen."

	para "Du solltest die"
	line "Herausforderung"
	para "der PKMN-ARENEN"
	line "annehmen."

	para "Die nächste PKMN-"
	line "ARENA befindet"
	cont "sich in PAGETIA."
	done

Oak2AfterTheftText6:
	text "…<PLAYER>. Der"
    line "Weg zum Ruhm ist"
    para "lang und beschwer-"
    line "lich."

    para "Bevor du los-"
    line "ziehst, solltest"
    cont "du mit deiner Mama"
    cont "sprechen."
	done

Oak2StudyingEggText:
	text "EICH2: Gib nicht"
	line "auf! Ich rufe dich"
	para "an, wenn ich etwas"
	line "über dieses EI he-"
	cont "rausgefunden habe."
	done

Oak2AideHasEggText:
	text "EICH2: <PLAYER>?"
	line "Hast du schon mei-"
	cont "nen Assistenten"
	cont "getroffen?"

	para "Er sollte mit dem"
	line "EI im #MON-"
	cont "CENTER von PAGETIA"
	cont "CITY warten."

	para "Du musst ihn ver-"
	line "passt haben. Ver-"
	cont "suche, ihn dort zu"
	cont "finden."
	done

OakHearsYouChallengeLeagueText:
    text "Wie ich höre,"
    line "stellst du dich"
    para "der #MON LIGA"
    line "von NIHON."               ; evtl. angleichen an Dialog aus /data/phone/text/oak2.asm

    para "Das ist großartig!"

    para "Ich bin sicher, du"
    line "du hast das Zeug,"
    cont "um Großes zu"
    cont "erreichen!"
	done


Oak2GiveEverstoneText1:
	text "Danke, <PLAYER>!"
	line "Du hilfst uns beim"
	para "Aufklären vieler"
	line "#MON-Mysterien!"

	para "Bitte nimm dies"
	line "als Zeichen unser-"
	cont "er Wertschätzung."
	done



AideText_AfterTheft:
	text "Wir schätzen deine"
	line "Hilfe sehr!"
	done

Oak2GiveMasterBallText1:
	text "EICH2: Hi, <PLAYER>!"
	line "Dank dir komme ich"
	para "mit meinen For-"
	line "schungen hervor-"
	cont "ragend voran!"

	para "Nimm dies als"
	line "Zeichen meiner"
	cont "Dankbarkeit!"
	done

Oak2GiveMasterBallText2:
	text "Der MEISTERBALL"
	line "ist der Beste von"
	cont "allen!"

	para "Er ist der ultima-"
	line "tive BALL! Ihm"
	para "kann kein #MON"
	line "entwischen."

	para "Er wird nur aner-"
	line "kannten #MON-"
	cont "Forschern"
	cont "überreicht."

	para "Aber ich glaube,"
	line "du hast bessere"
	para "Verwendung dafür"
	line "als ich, <PLAYER>!"
	done

Oak2GiveTicketText1:
	text "EICH: <PLAYER>!"
	line "Da bist du ja!"

	para "Ich habe dich ge-"
	line "rufen, weil ich"
	cont "dir etwas geben"
	cont "möchte."

	para "Es handelt sich um"
	line "ein BOOTSTICKET."
	done
Oak2GiveTicketText2:
    text "Am Hafen von PORT"
    line "ABANISHI kannst du"
    para "mit dem Schiff zu"
    line "den SÜDWESTINSELN"
    cont "NIHON fahren."

    para "Dort gibt es viele"
    line "seltene #MON,"
    para "die du auf dem"
    line "Festland nicht"
    cont "finden kannst."

    para "Du solltest mal"
    line "vorbeischauen,"
    para "wenn du die"
    line "Gelegenheit dazu"
    cont "hast."
	done


AideText_GiveYouPotion:
	text "<PLAYER>, ich"
    line "möchte, dass du"
    cont "das mitnimmst."
	done

AideText_AlwaysBusy:
	text "Wir sind nur zu"          ;eigentlich "Wir schätzen deine Hilfe sehr!"
	line "zweit und wir ha-"
	cont "ben viel zu tun."
	done

AideText_TheftTestimony:
	text "Wir schätzen deine"
	line "Hilfe sehr!"
	done



OakLabBackRoomTravelTip1Text:
	text "<PLAYER> öffnet"
	line "ein Buch."

	para "Reise-Tipp 1:"

	para "Drücke START, um"
	line "das MENÜ zu"
	cont "öffnen."
	done

OakLabBackRoomTravelTip2Text:
	text "<PLAYER> öffnet"
	line "ein Buch."

	para "Reise-Tipp 2:"

	para "Speichere deine"
	line "Fortschritte mit"
	cont "SICHERN!"
	done

OakLabBackRoomTravelTip3Text:
	text "<PLAYER> öffnet"
	line "ein Buch."

	para "Reise-Tipp 3:"

	para "Öffne deinen"
	line "BEUTEL und drücke"
	cont "SELECT, um deine"
	cont "Items zu ver-"
	cont "walten."
	done

OakLabBackRoomTravelTip4Text:
	text "<PLAYER> öffnet"
	line "ein Buch."

	para "Reise-Tipp 4:"

	para "Verwalte die At-"
	line "tacken deiner"
	cont "#MON. Drücke"
	cont "den A-Knopf, um"
	cont "ihre Position zu"
	cont "verändern."
	done

OakLabBackRoomTrashcanText:
	text "Die Verpackung"
	line "des Snacks, den"
	cont "PROF. EICH geges-"
	cont "sen hat, befindet"
	cont "sich hier…"
	done

Oak2GiveEverstoneText2:
	text "Das ist ein"
	line "EWIGSTEIN."

	para "Einige #MON"
	line "entwickeln sich"

	para "weiter, wenn sie"
	line "einen bestimmten"
	cont "Level erreichen."

	para "Ein #MON,"
	line "das den EWIGSTEIN"
	cont "trägt, wird sich"
	cont "aber nicht ent-"
	cont "wickeln."

	para "Gib ihn einem"
	line "#MON, das"
	cont "sich nicht weiter-"
	cont "entwickeln soll!"
	done

Oak2Text_CallYou:
	text "EICH: <PLAYER>, ich"
	line "rufe dich an, wenn"
	cont "sich etwas tut."
	done
	
Oak2RocketsReturnedText:
    text "Ich befürchte,"
    line "dass TEAM ROCKET"
    para "etwas wirklich"
    line "Schreckliches"
    cont "plant…"
	done
	
Oak2YoureBasicallyAHeroText:
    text "Unglaublich, dass"
    line "du und <RIVAL> es"
    para "mit TEAM ROCKET"
    line "aufgenommen habt!"

    para "Ihr seid Helden"
    line "für alle #MON!"

    para "Macht weiter so"
    line "und kämpft euch"
    cont "zum FUJIYAMA!"        ;evtl. ändern
	done
	
Oak2AfterLeagueInPersonText:
    text "Glückwunsch zu"
    line "deinem Sieg über"
    cont "die #MON LIGA!"

    para "Das ist eine"
    line "große Leistung!"

    para "Vielen Dank auch"
    line "für deine Unter-"
    para "stützung bei"
    line "meiner Forschung."

    para "Mit dem, was du"
    line "schon geschafft"
    para "hast, liegt eine"
    line "großartige Zukunft"
    cont "vor dir!"
	done

OakLabBackRoom_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, OAK_LAB_FRONT_ROOM, 3
	warp_event  4,  7, OAK_LAB_FRONT_ROOM, 3


	db 2 ; coord events
	coord_event  3,  7, SCENE_OAK2SLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  4,  7, SCENE_OAK2SLAB_CANT_LEAVE, LabTryToLeaveScript

	db 7 ; bg events
	bg_event  0,  1, BGEVENT_READ, OakLabBackRoomBookshelf
	bg_event  1,  1, BGEVENT_READ, OakLabBackRoomBookshelf
	bg_event  2,  1, BGEVENT_READ, OakLabBackRoomBookshelf
	bg_event  3,  1, BGEVENT_READ, OakLabBackRoomBookshelf
	bg_event  0,  0, BGEVENT_READ, OakLabBackRoomBookshelf
	bg_event  1,  0, BGEVENT_READ, OakLabBackRoomBookshelf
	bg_event  9,  3, BGEVENT_READ, OakLabBackRoomTrashcan

	db 6 ; object events
	object_event  4,  2, SPRITE_OAK2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, ProfOak2Script, -1
	object_event  5,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CubburnPokeBallScript, EVENT_CUBBURN_POKEBALL_IN_OAK_LAB_BACK_ROOM
	object_event  6,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CruisePokeBallScript, EVENT_PALSSIO_POKEBALL_IN_OAK_LAB_BACK_ROOM
	object_event  7,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ChikoritaPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_OAK_LAB_BACK_ROOM
	object_event  2,  3, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OakLabBackRoomBlueScript, EVENT_BLUE_IN_OAK_LAB_BACK_ROOM
	object_event  4,  5, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OakLabBackRoomSilverScript, EVENT_SILVER_IN_OAK_LAB_BACK_ROOM
