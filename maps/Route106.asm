	object_const_def ; object_event constants
	;const ROUTE106_FISHER
	const ROUTE106_YOUNGSTER
	const ROUTE106_BUG_CATCHER
	const ROUTE106_COOLTRAINER_M
	const ROUTE106_FRUIT_TREE
	const ROUTE106_POKE_BALL1
	const ROUTE106_POKE_BALL2
	const ROUTE106_GRAMPS
	const ROUTE113_DAY_CARE_MON_1
	const ROUTE113_DAY_CARE_MON_2
;	const ROUTE106_POKEFAN_M
	const ROUTE106_BUG_CATCHER_2
	const ROUTE106_YOUNGSTER_2

Route106_MapScripts:
	db 0 ; scene scripts


	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .EggCheckCallback

.EggCheckCallback:
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftrue .PutDayCareManOutside
	clearevent EVENT_DAY_CARE_MAN_IN_DAY_CARE
	setevent EVENT_DAY_CARE_MAN_ON_ROUTE_113
	jump .CheckMon1

.PutDayCareManOutside:
	setevent EVENT_DAY_CARE_MAN_IN_DAY_CARE
	clearevent EVENT_DAY_CARE_MAN_ON_ROUTE_113
	jump .CheckMon1

.CheckMon1:
	checkflag ENGINE_DAY_CARE_MAN_HAS_MON
	iffalse .HideMon1
	clearevent EVENT_DAY_CARE_MON_1
	jump .CheckMon2

.HideMon1:
	setevent EVENT_DAY_CARE_MON_1
	jump .CheckMon2

.CheckMon2:
	checkflag ENGINE_DAY_CARE_LADY_HAS_MON
	iffalse .HideMon2
	clearevent EVENT_DAY_CARE_MON_2
	return

.HideMon2:
	setevent EVENT_DAY_CARE_MON_2
	return

DayCareManScript_Outside:
	faceplayer
	opentext
	special DayCareManOutside
	waitbutton
	closetext
	ifequal TRUE, .end_fail
	clearflag ENGINE_DAY_CARE_MAN_HAS_EGG
	checkcode VAR_FACING
	ifequal RIGHT, .walk_around_player
	applymovement ROUTE106_GRAMPS, Route113MovementData_DayCareManWalksBackInside
	playsound SFX_ENTER_DOOR
	disappear ROUTE106_GRAMPS
.end_fail
	end

.walk_around_player
	applymovement ROUTE106_GRAMPS, Route113MovementData_DayCareManWalksBackInside_WalkAroundPlayer
	playsound SFX_ENTER_DOOR
	disappear ROUTE106_GRAMPS
	end

DayCareMon1Script:
	opentext
	special DayCareMon1
	closetext
	end

DayCareMon2Script:
	opentext
	special DayCareMon2
	closetext
	end


TrainerSchoolboyChad1:
	trainer SCHOOLBOY, CHAD1, EVENT_BEAT_SCHOOLBOY_CHAD, SchoolboyChad1SeenText, SchoolboyChad1BeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	checkevent EVENT_CHAD_READY_FOR_REMATCH
	iftrue .ChadRematch
	checkcellnum PHONE_SCHOOLBOY_CHAD
	iftrue .HaveChadsNumber
	checkevent EVENT_CHAD_ASKED_FOR_PHONE_NUMBER
	iftrue .SecondTimeAsking
	writetext SchoolboyChadSoManyTestsText
	promptbutton
	setevent EVENT_CHAD_ASKED_FOR_PHONE_NUMBER
	scall .AskPhoneNumber1
	sjump .AskToRegisterNumber

.SecondTimeAsking:
	scall .AskPhoneNumber2
.AskToRegisterNumber:
	askforphonenumber PHONE_SCHOOLBOY_CHAD
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .SaidNo
	gettrainername STRING_BUFFER_3, SCHOOLBOY, CHAD1
	scall .RegisteredChad
	sjump .HaveChadsNumber

.ChadRematch:
	scall .Rematch
	winlosstext SchoolboyChad1BeatenText, 0
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight2
	checkflag ENGINE_FLYPOINT_STAND
	iftrue .LoadFight1
	loadtrainer SCHOOLBOY, CHAD1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_CHAD_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer SCHOOLBOY, CHAD2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_CHAD_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer SCHOOLBOY, CHAD3
	startbattle
	reloadmapafterbattle
	clearevent EVENT_CHAD_READY_FOR_REMATCH
	end

.AskPhoneNumber1:
	jumpstd AskNumber1MScript
	end

.AskPhoneNumber2:
	jumpstd AskNumber2MScript
	end

.RegisteredChad:
	jumpstd RegisteredNumberMScript
	end

.HaveChadsNumber:
	jumpstd NumberAcceptedMScript
	end

.SaidNo:
	jumpstd NumberDeclinedMScript
	end

.PhoneFull:
	jumpstd PhoneFullMScript
	end

.Rematch:
	jumpstd RematchMScript
	end


TrainerFledglingPaulson:
	trainer FLEDGLING, PAULSON, EVENT_BEAT_FLEDGLING_PAULSON, FledglingPaulsonSeenText, FledglingPaulsonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FledglingPaulsonAfterText
	waitbutton
	closetext
	end


TrainerBugCatcherRob:
	trainer BUG_CATCHER, ROB, EVENT_BEAT_BUG_CATCHER_ROB, BugCatcherRobSeenText, BugCatcherRobBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherRobAfterBattleText
	waitbutton
	closetext
	end

Route106YoungsterScript:
	jumptextfaceplayer Route106YoungsterText

Route106Sign:
	jumptext Route106SignText

DarkCaveSign:
	jumptext DarkCaveSignText

JadeSign:
	jumptext JadeSignText
	
Route106PokecenterSign:
	jumpstd PokecenterSignScript

Route106CooltrainerMScript:
	jumptextfaceplayer Route106CooltrainerMText

Route106FruitTree:
	fruittree FRUITTREE_TREE_ROUTE_106

Route106SuperPotion:
	itemball SUPER_POTION

Route106GreatBall:
	itemball GREAT_BALL
	
Route113MovementData_DayCareManWalksBackInside:
	slow_step LEFT
	slow_step LEFT
	slow_step UP
	step_end

Route113MovementData_DayCareManWalksBackInside_WalkAroundPlayer:
	slow_step DOWN
	slow_step LEFT
	slow_step LEFT
	slow_step UP
	slow_step UP
	step_end
	
BugCatcherRobSeenText:
    text "Hast du im WALD"
    line "coole Käfer"
    cont "gesehen?"
	done
	
BugCatcherRobBeatenText:
	text "Meine Käfer sind"
	line "am Boden!"
	done
	
BugCatcherRobAfterBattleText:
    text "Das war eine"
    line "Fangfrage. Alle"
    cont "Käfer sind cool."
	done


SchoolboyChad1SeenText:
    text "Ich lerne etwas"
    line "über seltene"
    cont "#MON."
	done

SchoolboyChad1BeatenText:
	text "Ich fürchte, ich"
	line "habe noch nicht"
	cont "genug gelernt."
	done

SchoolboyChadSoManyTestsText:
    text "Hast du schon mal"
    line "von EVOLI gehört?"

    para "Angeblich leben"
    line "sie genau hier!"

    para "Ich habe bisher"
    line "aber noch keines"
    cont "gesehen."

    para "Ich werde es dir"
    line "definitiv sagen,"
    para "wenn ich jemals"
    line "eines sehe."
	done

FledglingPaulsonSeenText:
    text "Ich kämpfe direkt"
    line "neben dem #MON-"
    cont "CENTER."

    para "So kann ich, nach"
    line "einer Niederlage,"
    para "einfach meine"
    line "#MON heilen."
	done

FledglingPaulsonBeatenText:
	text "Nicht schon"
	line "wieder!"
	done

FledglingPaulsonAfterText:
    text "Meine #MON"
    line "werden langsam"
    para "aber sicher immer"
    line "stärker."
	done

Route106CooltrainerMText:
    text "Hast du schon mal"
    line "eine PENSION für"
    cont "#MON genutzt?"

    para "Das nette ältere"
    line "Pärchen in diesem"
    para "Haus zieht deine"
    line "#MON für dich"
    cont "auf!"
	done

BugCatcherWade1SeenText:
	text "Ich habe einige"
	line "#MON gefangen."
	cont "Lass uns kämpfen!"
	done

BugCatcherWade1BeatenText:
	text "Awwwww…"
	done

BugCatcherWade1AfterText:
	text "Du kannst #MON"
	line "fangen, auch wenn"

	para "du bereits sechs"
	line "bei dir trägst."

	para "Fängst du eines,"
	line "wird es automa-"
	cont "tisch auf die BOX"
	cont "im PC übertragen."
	done

Route106YoungsterText:
	text "Ich habe ein gutes"
	line "#MON im JADE-"
	cont "WALD gefunden."

	para "Ich ziehe es groß,"
	line "um später gegen"
	cont "JASMIN anzutreten."

	para "Sie ist die ARENA-"
	line "LEITERIN von"
	cont "GENEOS CITY."
	done

Route106SignText:
	text "ROUTE 106"

	para "GENEOS CITY -"
	line "TOTOMONIA"
	done

DarkCaveSignText:
	text "PENSION"

	para "Wir Ziehen Dein"
	line "#MON Für"
	cont "Dich Auf!"
	done

JadeSignText:
	text "JADEWALD"
	line "Eingang rechts."
	done

HikerAnthony2SeenText:
	text "Ich bin durch den"
	line "WALD gegangen,"
	cont "aber ich habe noch"
	para "viel Energie"
	line "übrig."
	done

HikerAnthony2BeatenText:
	text "Wow! Du hast mehr"
	line "Mumm als ich!"
	done

HikerAnthony2AfterText:
	text "In den Bergen sind"
	line "wir WANDERER"
	cont "in unserem"
	cont "Element."
	done

HikerAnthonyParaText:
    text "Hey, konntest du"
    line "ein EVOLI fangen?"

    para "Ich habe auch"
    line "eines gefangen."

    para "Sie sind so weich!"
	done

Route106_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event  8,  5, ROUTE_105_ROUTE_106_GATE, 3
	warp_event  9,  5, ROUTE_105_ROUTE_106_GATE, 4
	warp_event 16, 12, JADE_FOREST, 1
	warp_event 16, 13, JADE_FOREST, 2
	warp_event 23,  8, JADE_FOREST, 3
	warp_event 23,  9, JADE_FOREST, 4
	warp_event 33,  5, DAY_CARE, 1
	warp_event 36,  5, DAY_CARE, 3
	warp_event  9, 10, ROUTE_106_POKECENTER_1F, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event 52,  8, BGEVENT_READ, Route106Sign
	bg_event 30,  5, BGEVENT_READ, DarkCaveSign
	bg_event 12, 12, BGEVENT_READ, JadeSign
	bg_event 10, 10, BGEVENT_READ, Route106PokecenterSign

	db 11 ; object events
	;object_event 52, 11, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route106MailRecipientScript, -1
	object_event  7, 13, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route106YoungsterScript, -1
	object_event 24,  5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerBugCatcherRob, -1
	object_event 42, 12, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route106CooltrainerMScript, -1
	object_event  4, 11, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route106FruitTree, -1
	object_event 11,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route106SuperPotion, EVENT_ROUTE_106_POTION
	object_event 33, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route106GreatBall, EVENT_ROUTE_106_GREAT_BALL
	object_event 38,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareManScript_Outside, EVENT_DAY_CARE_MAN_ON_ROUTE_113
	object_event 40,  7, SPRITE_DAY_CARE_MON_1, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareMon1Script, EVENT_DAY_CARE_MON_1
	object_event 42,  6, SPRITE_DAY_CARE_MON_2, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareMon2Script, EVENT_DAY_CARE_MON_2
;	object_event 49,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerAnthony, -1
	object_event  4,  9, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerFledglingPaulson, -1
	object_event 50,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyChad1, -1
