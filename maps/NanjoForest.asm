	object_const_def ; object_event constants
	const NANJO_FOREST_YOUNGSTER
	const NANJO_FOREST_BUG_CATCHER
	const NANJO_FOREST_SILVER
	const NANJO_FOREST_ITEMBALL_1
	const NANJO_FOREST_ITEMBALL_2
	const NANJO_FOREST_ITEMBALL_3
	const NANJO_FOREST_ITEMBALL_4
	const NANJO_FOREST_TREE_1
	const NANJO_FOREST_TREE_2

NanjoForest_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .CheckDayOfWeekSZ
	
.CheckDayOfWeekSZ:
	checkcode VAR_WEEKDAY
	ifequal WEDNESDAY, .WednesdaySZ
.disapearSZSilver
	disappear NANJO_FOREST_SILVER
	return
	
.WednesdaySZ
	checkevent EVENT_DEFEATED_SILVER_IN_NANJO_FOREST
	iftrue .disapearSZSilver
	appear NANJO_FOREST_SILVER
	return

LuckyEggYoungsterScript:
	faceplayer
	checkevent EVENT_GOT_LUCKY_EGG_FROM_NANJO_FOREST_GUY
	iftrue .AlreadyGaveLuckyEgg
	checkevent EVENT_RETURNED_FUEL_LINE
	iftrue .TryGivingLuckyEgg
.NoLuckyEggYet
	opentext
	writetext NoLuckyEggYetText
	waitbutton
	closetext
	turnobject NANJO_FOREST_YOUNGSTER, RIGHT
	end
	
.TryGivingLuckyEgg
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .NoLuckyEggYet
	checkevent EVENT_TALKED_TO_NANJO_FOREST_GUY_ONCE
	iffalse .SetUpLuckyEgg
	opentext
	writetext HeresLuckyEggText
	waitbutton
	verbosegiveitem LUCKY_EGG
	iffalse .NoEggFull
	writetext WhatDoesLuckyEggDoText
	waitbutton
	closetext
	setevent EVENT_GOT_LUCKY_EGG_FROM_NANJO_FOREST_GUY
	turnobject NANJO_FOREST_YOUNGSTER, RIGHT
	end
	
.NoEggFull
	closetext
	end
	
.SetUpLuckyEgg
	opentext
	writetext NoLuckyEggYetText
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_NANJO_FOREST_GUY_ONCE
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	turnobject NANJO_FOREST_YOUNGSTER, RIGHT
	end
	
.AlreadyGaveLuckyEgg
	opentext
	writetext AlreadyGaveLuckyEggText
	waitbutton
	closetext
	turnobject NANJO_FOREST_YOUNGSTER, RIGHT
	end
	
LuckyEggBugCatcherScript:
	faceplayer
	opentext
	writetext LuckyEggBugCatcherText
	waitbutton
	closetext
	turnobject NANJO_FOREST_BUG_CATCHER, RIGHT
	end
	
NanjoFruitTree1:
	fruittree FRUITTREE_TREE_NANJO_FOREST
	
NanjoFruitTree2:
	fruittree FRUITTREE_TREE_NANJO_FOREST_2
	
NanjoForestSilverScript:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .TalkToSilverAfterBattle
	playmusic MUSIC_RIVAL_ENCOUNTER
	faceplayer
	opentext
	writetext NanjoForestSilverBefore
	waitbutton
	closetext
	checkevent EVENT_GOT_PALSSIO_FROM_OAK
	iftrue .Cruise
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .Chikorita
	winlosstext NanjoForestSilverTextWin, NanjoForestSilverTextLoss
	loadtrainer RIVAL2, RIVAL2_1_PALSSIO
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.Cruise:
	winlosstext NanjoForestSilverTextWin, NanjoForestSilverTextLoss
	loadtrainer RIVAL2, RIVAL2_1_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.Chikorita:
	winlosstext NanjoForestSilverTextWin, NanjoForestSilverTextLoss
	loadtrainer RIVAL2, RIVAL2_1_CUBBURN
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.FinishBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext NanjoForestSilverAfter
	waitbutton
	closetext
	setevent EVENT_DEFEATED_SILVER_IN_NANJO_FOREST
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	playmapmusic
	end
	
.TalkToSilverAfterBattle
	faceplayer
	opentext
	writetext NanjoForestSilverAfter
	waitbutton
	closetext
	end
	

NanjoForestMaxRevive:
	itemball MAX_REVIVE

NanjoForestUltraBall:
	itemball ULTRA_BALL

NanjoForestFullHeal:
	itemball FULL_HEAL

NanjoForestFullRestore:
	itemball FULL_RESTORE
	
NanjoForestSign:
	jumptext NanjoForestSignText
	
NanjoForestSign2:
	jumptext NanjoForestSign2Text
	
NanjoForestSignText:
    text "KEINEN MÜLL"
    line "ABLADEN"

    para "Bitte räumt hinter"
    line "euch auf."
	done
	
NanjoForestSign2Text:
	text "Ausgang zur"
	line "GROẞEN ÖTSLICHEN"
	para "STRAẞE"
	done
	
NanjoForestSilverBefore:
	text "<RIVAL>: Hey,"
	line "<PLAYER>!"

	para "Lange nicht"
	line "gesehen!"

	para "Ich bin hier auf"
	line "den INSELN, um"
	para "weiter zu trainie-"
	line "ren und das Band"
	para "mit meinen #MON"
	line "zu stärken."

	para "Ich habe mehr da-"
	line "rüber gelernt, wie"
	para "ich mit ihnen als"
    line "Team arbeite."

    para "Wir sind uns in"
    line "letzter Zeit viel"
    cont "näher gekommen."

    para "Wir sind auch viel"
    line "stärker geworden!"

    para "Du weißt, was das"
    line "bedeutet!"
	done
	
NanjoForestSilverTextWin:
	text "Du hast mich!"
	done
	
NanjoForestSilverTextLoss:
	text "Alles klar!"
	done
	
NanjoForestSilverAfter:
	text "Puh, das war ein"
	line "guter Kampf."

	para "Ich glaube, ich"
	line "bin mit dem Trai-"
	cont "ning hier fertig."

	para "Vielleicht treffe"
	line "ich dich irgendwo"
	cont "anders mal wieder!"
	done
	
WhatDoesLuckyEggDoText:
	text "Ich frage mich,"
	line "woher es kommt."

	para "Können #MON das"
	line "benutzen?"
	done
	
HeresLuckyEggText:
    text "Hey, schau dir"
    line "das mal an!"

    para "Ich habe etwas"
    line "gefunden!"

    para "Es ist eine Art"
    line "von EI?"

    para "Ich bin mir nicht"
    line "sicher, was es"
    para "ist, aber du"
    line "kannst es haben!"
	done
	
AlreadyGaveLuckyEggText:
	text "Man weiß nie, was"
	line "man hier findet."
	done
	
NoLuckyEggYetText:
    text "Ich suche nach"
    line "interessanten"
    para "Sachen, die an den"
    line "Strand gespült"
    cont "werden."

    para "Ich finde viele"
    line "Items, wie TRÄNKE"
    cont "und HYPERHEILER."

    para "Einmal habe ich"
    line "sogar ein NUGGET"
    cont "gefunden!"

    para "Hier kann man"
    line "echt coole Sachen"
    cont "finden."

    para "Komm doch irgend-"
    line "wann mal wieder"
    para "und schau bei mir"
    line "vorbei."

    para "Ich teile dann ein"
    line "Bisschen von dem,"
    para "was ich gefunden"
    line "habe, mit dir!"
	done
	
LuckyEggBugCatcherText:
    text "Mein Bruder und"
    line "ich finden viele"
    para "coole Sachen, die"
    line "an den Strand ge-"
    cont "spült werden!"

    para "Wir sehen das"
    line "nicht als Müll,"
    para "denn manchmal sind"
    line "es echte Schätze!"
	done	

NanjoForest_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0, 18, URASOE_TRAIL, 3
	warp_event  0, 19, URASOE_TRAIL, 4
	warp_event 39,  6, GREAT_EAST_STRAIT, 1
	warp_event 39,  7, GREAT_EAST_STRAIT, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event 29, 21, BGEVENT_READ, NanjoForestSign
	bg_event 37,  7, BGEVENT_READ, NanjoForestSign2

	db 9 ; object events
	object_event 23,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, LuckyEggYoungsterScript, -1
	object_event 23,  6, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, LuckyEggBugCatcherScript, -1
	object_event  6,  8, SPRITE_SILVER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NanjoForestSilverScript, EVENT_SILVER_APPEARS_IN_NANJO_FOREST
	object_event 32, 31, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NanjoForestMaxRevive, EVENT_PICKED_UP_MAX_REVIVE_FROM_NANJO_FOREST
	object_event 12,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NanjoForestUltraBall, EVENT_PICKED_UP_ULTRA_BALL_FROM_NANJO_FOREST
	object_event  8, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NanjoForestFullHeal, EVENT_PICKED_UP_FULL_HEAL_FROM_NANJO_FOREST
	object_event 16, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NanjoForestFullRestore, EVENT_PICKED_UP_FULL_RESTORE_FROM_NANJO_FOREST
	object_event 33, 29, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NanjoFruitTree1, -1
	object_event 10, 23, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NanjoFruitTree2, -1
