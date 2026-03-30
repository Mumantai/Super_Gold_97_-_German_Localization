	object_const_def ; object_event constants
	const JADEFOREST_ROCKER
	const JADEFOREST_POKE_BALL1
	;const JADEFOREST_KURT
	const JADEFOREST_LASS
	const JADEFOREST_YOUNGSTER2
	const JADEFOREST_POKE_BALL2
	const JADEFOREST_POKE_BALL3
	const JADEFOREST_POKE_BALL4
	const JADEFOREST_HIKER
	const JADEFOREST_FIREBREATHER
	const JADEFOREST_COOLTRAINERF
	const ROUTEU4U_FRUIT_TREE1
	const ROUTEU4U_FRUIT_TREE2
	const ROUTEU4U_FRUIT_TREE3

JadeForest_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


JadeForestHeadbuttGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM02_HEADBUTT
	iftrue .AlreadyGotHeadbutt
	writetext Text_HeadbuttIntro
	buttonsound
	verbosegiveitem TM_HEADBUTT
	iffalse .BagFull
	setevent EVENT_GOT_TM02_HEADBUTT
.AlreadyGotHeadbutt:
	writetext Text_HeadbuttOutro
	waitbutton
.BagFull:
	closetext
	end

TrainerBugCatcherWayne:
	trainer BUG_CATCHER, WAYNE, EVENT_BEAT_BUG_CATCHER_WAYNE, BugCatcherWayneSeenText, BugCatcherWayneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherWayneAfterBattleText
	waitbutton
	closetext
	end
	
TrainerHikerLeonard:
	trainer HIKER, LEONARD, EVENT_BEAT_HIKER_LEONARD, HikerLeonardSeenText, HikerLeonardBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerLeonardAfterBattleText
	waitbutton
	closetext
	end
	

TrainerFirebreatherBill:
	trainer FIREBREATHER, BILL, EVENT_BEAT_FIREBREATHER_BILL, FirebreatherBillSeenText, FirebreatherBillBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherBillAfterBattleText
	waitbutton
	closetext
	end
	

TrainerCooltrainerfGwen:
	trainer COOLTRAINERF, GWEN, EVENT_BEAT_COOLTRAINERF_GWEN, CooltrainerfGwenSeenText, CooltrainerfGwenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfGwenAfterBattleText
	waitbutton
	closetext
	end

JadeForestLassScript:
	jumptextfaceplayer Text_JadeForestLass

JadeForestRevive:
	itemball REVIVE

JadeForestPrettyTail:
	itemball PRETTY_TAIL

JadeForestAntidote:
	itemball ANTIDOTE

JadeForestEther:
	itemball ETHER

JadeForestHiddenEther:
	hiddenitem ETHER, EVENT_JADE_FOREST_HIDDEN_ETHER

JadeForestHiddenPowerWings:
	hiddenitem POWER_WINGS, EVENT_JADE_FOREST_HIDDEN_SUPER_POTION

JadeForestHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_JADE_FOREST_HIDDEN_FULL_HEAL

JadeForestHiddenAwakening:
	hiddenitem AWAKENING, EVENT_JADE_FOREST_HIDDEN_AWAKENING

JadeForestBoulder:
; unused
	jumpstd StrengthBoulderScript

JadeForestSignpost:
	clearevent EVENT_BEAT_BUG_CATCHER_WAYNE
	jumptext JadeForestSignpostText

JadeForestSignpost2:
	jumptext JadeForestSignpost2Text
	

RouteU4UFruitTree1:
	fruittree FRUITTREE_TREE_JADE_FOREST_1

RouteU4UFruitTree2:
	fruittree FRUITTREE_TREE_JADE_FOREST_2

RouteU4UFruitTree3:
	fruittree FRUITTREE_TREE_JADE_FOREST_3
	
Text_HeadbuttIntro:
	text "Was ich mache?"
	line "Ich setze"

	para "KOPFNUSS ein, um"
	line "Bäume zu"

	para "schütteln."
	line "Das macht Spaß!"

	para "Probier es doch"
	line "auch einmal!"
	done

Text_HeadbuttOutro:
	text "Benutze KOPFNUSS,"
	line "um Bäume zu"
	cont "schütteln. Manch-"
	cont "mal fallen schla-"
	cont "fende #MON"
	cont "herunter."
	done

Text_JadeForestLass:
    text "Im WALD gibt es"
    line "viele #MON, die"
    para "Statusveränderung-"
    line "en verursachen"
    cont "können."

    para "Es ist eine gute"
    line "Idee, ein paar"
    cont "Items mitzunehmen."
	done

JadeForestSignpostText:
	text "Der JADEWALD ist"
	line "ist so dicht, dass"

	para "man den Himmel"
	line "nicht sehen kann."

	para "Halte Ausschau"
	line "nach verlorenen"
	cont "Gegenständen."
	done
	
JadeForestSignpost2Text:
    text "ROUTE 106"
    line "Ausgang rechts"
	done

BugCatcherWayneSeenText:
	text "Schleich dich"
	line "nicht an!"

	para "Du hast ein"
	line "#MON verjagt!"
	done

BugCatcherWayneBeatenText:
	text "Dieses #MON"
	line "habe ich noch nie"
	cont "zuvor gesehen…"
	done

BugCatcherWayneAfterBattleText:
	text "Ein #MON, das"
	line "ich noch nie zuvor"

	para "sah, fiel aus dem"
	line "Baum, als ich"
	cont "KOPFNUSS"
	cont "einsetzte."

	para "Ich sollte"
	line "KOPFNUSS auch an"
	cont "anderen Stellen"
	cont "einsetzen."
	done


HikerLeonardSeenText:
    text "Ich laufe durch"
    line "diesen WALD, bis"
    para "ich jedes #MON"
    line "gesehen habe, das"
    cont "hier lebt!"
	done

HikerLeonardBeatenText:
    text "Ich sollte beim"
    line "Wandern bleiben!"
	done

HikerLeonardAfterBattleText:
    text "Im WALD gibt es"
    line "viele #MON,"
    para "die es nirgendwo"
    line "sonst gibt."
	done


FirebreatherBillSeenText:
    text "In diesem WALD,"
    line "kann nichts mit"
    para "meinen Feuer-#-"
    line "MON mithalten!"
	done

FirebreatherBillBeatenText:
	text "Auauautsch!"
	done

FirebreatherBillAfterBattleText:
    text "Ich muss vorsich-"
    line "tig sein, dass ich"
    para "die Bäume nicht in"
    line "Brand setze!"
	done
	

CooltrainerfGwenSeenText:
    text "Ich habe mich"
    line "nicht verlaufen!"

    para "Und selbst wenn,"
    line "mein Team kann es"
    para "mit allem und"
    line "jedem aufnehmen!"
	done

CooltrainerfGwenBeatenText:
    text "Es ist wichtig,"
    line "auf alles vorbe-"
    cont "reitet zu sein!"
	done

CooltrainerfGwenAfterBattleText:
    text "Ich weiß schon, wo"
    line "ich langgehe!"
	done

JadeForest_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event  0, 26, ROUTE_106, 3
	warp_event  0, 27, ROUTE_106, 4
	warp_event 49, 26, ROUTE_106, 5
	warp_event 49, 27, ROUTE_106, 6
	warp_event  4, 56, ROUTE_U10U, 4
	warp_event  4, 57, ROUTE_U10U, 5
	warp_event  4,  4, JADE_FOREST_SNORLAX_ROOM, 1
	warp_event  5,  4, JADE_FOREST_SNORLAX_ROOM, 2
	
	db 0 ; coord events

	db 6 ; bg events
	bg_event 27, 41, BGEVENT_READ, JadeForestSignpost
	bg_event 32,  6, BGEVENT_ITEM, JadeForestHiddenEther
	bg_event 13, 55, BGEVENT_ITEM, JadeForestHiddenPowerWings
	bg_event 30, 53, BGEVENT_ITEM, JadeForestHiddenFullHeal
	bg_event 30, 43, BGEVENT_ITEM, JadeForestHiddenAwakening
	bg_event 39, 29, BGEVENT_READ, JadeForestSignpost2

	db 13 ; object events
	object_event 19,  9, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JadeForestHeadbuttGuyScript, -1
	object_event 23, 55, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, JadeForestRevive, EVENT_JADE_FOREST_REVIVE
	;object_event 12, 29, SPRITE_KURT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_JADE_FOREST_KURT
	object_event 17, 23, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, JadeForestLassScript, -1
	object_event 34, 40, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerBugCatcherWayne, -1
	object_event 31, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, JadeForestPrettyTail, EVENT_JADE_FOREST_X_ATTACK
	object_event 31, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, JadeForestAntidote, EVENT_JADE_FOREST_ANTIDOTE
	object_event 42,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, JadeForestEther, EVENT_JADE_FOREST_ETHER
	object_event 27, 35, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerHikerLeonard, -1
	object_event 43, 51, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerFirebreatherBill, -1
	object_event 19, 46, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerfGwen, -1
	object_event 13, 49, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RouteU4UFruitTree1, -1
	object_event 12, 51, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RouteU4UFruitTree2, -1
	object_event 15, 51, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RouteU4UFruitTree3, -1

