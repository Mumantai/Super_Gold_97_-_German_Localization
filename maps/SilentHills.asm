	object_const_def ; object_event constants
	const SILENTHILLS_LASS
	const SILENTHILLS_YOUNGSTER
	const SILENTHILLS_BUG_CATCHER
	const SILENTHILLS_BUG_CATCHER2
	const SILENTHILLS_FRUIT_TREE1
	const SILENTHILLS_SUNNY
	const SILENTHILLS_FRUIT_TREE2
	const SILENTHILLS_FRUIT_TREE3
	const SILENTHILLS_ROCKER
	const SILENTHILLS_POKEBALL

SilentHills_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Sunny

.Sunny:
	checkcode VAR_WEEKDAY
	ifequal SUNDAY, .SunnyAppears
	disappear SILENTHILLS_SUNNY
	return

.SunnyAppears:
	appear SILENTHILLS_SUNNY
	return

TrainerLassEllen:
	trainer LASS, ELLEN, EVENT_BEAT_LASS_ELLEN, LassEllenSeenText, LassEllenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassEllenAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterAlbert:
	trainer YOUNGSTER, ALBERT, EVENT_BEAT_YOUNGSTER_ALBERT, YoungsterAlbertSeenText, YoungsterAlbertBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterAlbertAfterBattleText
	waitbutton
	closetext
	end
	
TrainerFledglingClayton:
	trainer FLEDGLING, CLAYTON, EVENT_BEAT_FLEDGLING_CLAYTON, FledglingClaytonSeenText, FledglingClaytonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FledglingClaytonAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherDon:
	trainer BUG_CATCHER, DON, EVENT_BEAT_BUG_CATCHER_DON, BugCatcherDonSeenText, BugCatcherDonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherDonAfterBattleText
	waitbutton
	closetext
	end

SunnyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_MAGNET_FROM_SUNNY
	iftrue SunnySundayScript
	checkcode VAR_WEEKDAY
	ifnotequal SUNDAY, SunnyNotSundayScript
	checkevent EVENT_MET_SUNNY_OF_SUNDAY
	iftrue .MetSunny
	writetext MeetSunnyText
	buttonsound
	setevent EVENT_MET_SUNNY_OF_SUNDAY
.MetSunny:
	writetext SunnyGivesGiftText1
	buttonsound
	jump .next
.next
	verbosegiveitem MAGNET
	iffalse SunnyDoneScript
	setevent EVENT_GOT_MAGNET_FROM_SUNNY
	writetext SunnyGaveGiftText
	waitbutton
	closetext
	end

SunnySundayScript:
	writetext SunnySundayText
	waitbutton
SunnyDoneScript:
	closetext
	end

SunnyNotSundayScript:
	writetext SunnyNotSundayText
	waitbutton
	closetext
	end

SilentHillsSign:
	jumptext SilentHillsSignText

SilentHillsSign2:
	jumptext SilentHillsSign2Text

SilentHillsFruitTree1:
	fruittree FRUITTREE_TREE_SILENT_HILLS_1

SilentHillsFruitTree2:
	fruittree FRUITTREE_TREE_SILENT_HILLS_2

SilentHillsFruitTree3:
	fruittree FRUITTREE_TREE_SILENT_HILLS_3

SilentHillsHiddenEther:
	hiddenitem ETHER, EVENT_SILENT_HILLS_HIDDEN_ETHER
	
AmpareCavernB1FPotion:
	itemball POTION
	
SilentHillsRockerScript:
	jumptextfaceplayer SilentHillsRockerText
	
SilentHillsRockerText:
    text "Ich bin kein"
    line "Trainer, aber hier"
    cont "gibt es einige!"

    para "Wenn sie dich"
    line "sehen, musst du"
    cont "gegen sie kämpfen."

    para "Sei darauf"
    line "vorbereitet!"
	done

BugCatcherDonSeenText:
    text "Diese Hügel sind"
    line "ein guter Ort, um"
    cont "noch mehr Käfer zu"
    cont "finden!"
	done

BugCatcherDonBeatenText:
	text "Ich habe verloren."
	line "So ein Mist…"
	done

BugCatcherDonAfterBattleText:
    text "Mir sind die #-"
    line "BÄLLE ausgegangen,"
    para "als ich #MON"
    line "fangen wollte."

    para "Ich hätte mehr"
    line "kaufen sollen…"
	done
	
YoungsterAlbertSeenText:
    text "Dich habe ich hier"
    line "noch nie gesehen."

    para "Hälst dich wohl"
    line "für stark, was?"
	done

YoungsterAlbertBeatenText:
	text "Du bist stark!"
	done

YoungsterAlbertAfterBattleText:
    text "Ich versuche, der"
    line "Beste mit meinen"
    para "Lieblings-#MON"
    line "zu werden."

    para "Ich benutze nicht"
    line "die gleichen #-"
    para "MON wie alle"
    line "anderen."
	done
	
FledglingClaytonSeenText:
    text "Das ist für mich"
    line "noch alles neu…"

    para "Oh, für dich auch?"
	done

FledglingClaytonBeatenText:
	text "Du bist hart!"
	done

FledglingClaytonAfterBattleText:
    text "Ich glaube daran,"
    line "dass Niederlagen"
    para "mir helfen, ein"
    line "besserer Trainer"
    cont "zu werden."
	done
	
LassEllenSeenText:
    text "Oh, du bist ja ein"
    line "süßer Trainer!"

    para "Ich mag dich, aber"
    line "ich halte mich"
    para "nicht zurück!"
	done

LassEllenBeatenText:
    text "Dann mal los… Ups,"
    line "schon vorbei?"
	done

LassEllenAfterBattleText:
    text "Wow, du musst echt"
    line "gut sein, um mich"
    cont "zu besiegen!"

    para "Mach weiter so!"
	done

MeetSunnyText:
	text "SONNFRIED: Hi!"

	para "Ich bin SONNFRIED"
	line "von Sonntag. Soll"
	cont "heißen, heute ist"
	cont "Sonntag!"
	done

SunnyGivesGiftText1:
	text "Man hat mir auf-"
	line "getragen, dir das"
	cont "zu geben, wenn ich"
	cont "dich treffe!"
	done

SunnyGivesGiftText2:
	text "Mir wurde aufge-"
	line "tragen, dir das"

	para "zu überreichen,"
	line "wenn ich dich"
	cont "treffe!"
	done

SunnyGaveGiftText:
	text "SONNFRIED: Dieses"
	line "Ding…"

	para "Äh…"

	para "…Was war das"
	line "nochmal…"

	para "…"

	para "Ah! Jetzt erinnere"
	line "ich mich!"

	para "Ein #MON, das"
	line "Elektro-Attacken"

	para "verwendet, sollte"
	line "dies erhalten."

	para "Meine Schwester"
	line "MONJA behauptet,"
	cont "es verstärkt"
	cont "Elektro-Attacken!"
	done

SunnySundayText:
	text "SONNFRIED: Meine"
	line "Geschwister heißen"
	cont "MONJA, DIETLINDE,"
	cont "MITKO, DONATUS,"
	cont "FRIEDA und SAMSON."

	para "Sie sind alle"
	line "älter als ich!"
	done

SunnyNotSundayText:
	text "SONNFRIED: Ist"
	line "heute nicht Sonn-"
	cont "tag? Äh… Das habe"
	cont "ich vergessen!"
	done

SilentHillsSignText:
	text "SILENITIA HÜHEL"

	para "Ein Sammelpunkt"
	line "for Trainer"
	done

SilentHillsSign2Text:
	text "SILENITIA HÜGEL"

	para "Nach Norden zum"
	line "Ausgang."

	para "Weiter nach Norden"
	line "nach PAGERTIA CITY."
	done

SilentHills_MapEvents:
	db 0, 0 ; filler

	db 10 ; warp events
	warp_event  4,  0, ROUTE_101N, 3
	warp_event  5,  0, ROUTE_101N, 3
	warp_event  6,  0, ROUTE_101N, 3
	warp_event  7,  0, ROUTE_101N, 4
	warp_event  8,  0, ROUTE_101N, 4
	warp_event  9,  0, ROUTE_101N, 4
	warp_event 49, 28, ROUTE_101, 1
	warp_event 49, 29, ROUTE_101, 1
	warp_event 49, 30, ROUTE_101, 2
	warp_event 49, 31, ROUTE_101, 2
	
	db 0 ; coord events

	db 3 ; bg events
	bg_event 47, 28, BGEVENT_READ, SilentHillsSign
	bg_event  9,  4, BGEVENT_READ, SilentHillsSign2
	bg_event 21, 13, BGEVENT_ITEM, SilentHillsHiddenEther

	db 10 ; object events
	object_event 34, 18, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 2, TrainerLassEllen, -1
	object_event  7, 19, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 4, TrainerYoungsterAlbert, -1
	object_event 41, 19, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherDon, -1
	object_event 15, 20, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerFledglingClayton, -1
	object_event 25, 26, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SilentHillsFruitTree1, -1
	object_event 26, 14, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunnyScript, EVENT_SILENT_HILLS_SUNNY_OF_SUNDAY
	object_event 24, 27, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SilentHillsFruitTree2, -1
	object_event 27, 29, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SilentHillsFruitTree3, -1
	object_event 41, 28, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SilentHillsRockerScript, -1
	object_event 19,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, AmpareCavernB1FPotion, EVENT_AMPARE_CAVERN_B1F_POTION
