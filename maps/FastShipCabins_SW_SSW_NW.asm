	object_const_def ; object_event constants
	const FASTSHIPCABINS_SW_SSW_NW_FISHER
	const FASTSHIPCABINS_SW_SSW_NW_BUG_CATCHER
	const FASTSHIPCABINS_SW_SSW_NW_BUENA
	const FASTSHIPCABINS_SW_SSW_NW_ROCKER

FastShipCabins_SW_SSW_NW_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerFirebreatherLyle:
	trainer FIREBREATHER, LYLE, EVENT_BEAT_FIREBREATHER_LYLE, FirebreatherLyleSeenText, FirebreatherLyleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherLyleAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherKen:
	trainer BUG_CATCHER, KEN, EVENT_BEAT_BUG_CATCHER_KEN, BugCatcherKenSeenText, BugCatcherKenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherKenAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyCassie:
	trainer BEAUTY, CASSIE, EVENT_BEAT_BEAUTY_CASSIE, BeautyCassieSeenText, BeautyCassieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyCassieAfterBattleText
	waitbutton
	closetext
	end

TrainerGuitaristClyde:
	trainer GUITARIST, CLYDE, EVENT_BEAT_GUITARIST_CLYDE, GuitaristClydeSeenText, GuitaristClydeBeatenText, 0, .Script

.Script:
	endifjustbattled
;	special Mobile_DummyReturnFalse
;	iftrue .mobile
	opentext
	writetext GuitaristClydeAfterBattleText
	waitbutton
	closetext
	end

.mobile
	opentext
	writetext GuitaristClydeAfterBattleMobileText
	waitbutton
	closetext
	end

FastShipBed:
	opentext
	writetext FastShipBedText1
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	special HealParty
	playmusic MUSIC_HEAL
	pause 60
	special RestartMapMusic
	special FadeInQuickly
	opentext
	writetext FastShipBedText2
	waitbutton
	closetext
	checkevent EVENT_FAST_SHIP_HAS_ARRIVED
	iftrue .AlreadyArrived
	checkevent EVENT_FAST_SHIP_FOUND_GIRL
	iftrue .CanArrive
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue .CanArrive
.AlreadyArrived:
	end

.CanArrive:
	playsound SFX_ELEVATOR_END
	pause 30
	checkevent EVENT_FAST_SHIP_DESTINATION_ALLOY
	iftrue .ArrivedAlloy
	opentext
	writetext FastShipArrivedAmamiText
	waitbutton
	closetext
	setevent EVENT_FAST_SHIP_HAS_ARRIVED
	end

.ArrivedAlloy:
	opentext
	writetext FastShipArrivedAlloyText
	waitbutton
	closetext
	setevent EVENT_FAST_SHIP_HAS_ARRIVED
	end

FastShipCabinsNorthwestCabinTrashcan:
	jumpstd TrashCanScript

FirebreatherLyleSeenText:
	text "Ich gehe auf die"
	line "INSELN, um meine"
	cont "Feuerspuck-Künste"
	cont "vorzuführen!"
	done

FirebreatherLyleBeatenText:
	text "Zisch… Die"
	line "Flamme ist klein…"
	done

FirebreatherLyleAfterBattleText:
	text "Ich denke, Feuer"
	line "ist schwach auf"
	cont "hoher See."

	para "Das ist egal?"
	line "Wirklich?"
	done

BugCatcherKenSeenText:
	text "Ich besuche meine"
	line "Oma, um einige"
	cont "Käfer zu fangen!"
	done

BugCatcherKenBeatenText:
	text "Oh, wow."
	line "Du bist stark!"
	done

BugCatcherKenAfterBattleText:
	text "In NIHON findest"
	line "du viele #MON"
	cont "in den Bäumen!"
	done

BeautyCassieSeenText:
	text "Ich versuche,"
	line "meine Leiden zu"
	cont "vergessen. Lass"
	cont "uns kämpfen!"
	done

BeautyCassieBeatenText:
	text "Mein Herz weint…"
	done

BeautyCassieAfterBattleText:
	text "Eine Schiffsreise"
	line "ist am besten,"
	cont "um ein gebrochenes"
	cont "Herz zu vergessen."

	para "Aber eine Reise"
	line "mit dem SCHNELL-"
	cont "BOOT ist für"
	cont "die Trauer zu"
	cont "kurz."
	done

GuitaristClydeSeenText:
	text "Ich werde meine"
	line "Lieder bei der"
	para "RADIOSTATION in"
	line "PORT ABANISHI"
	cont "vorspielen."
	done

GuitaristClydeBeatenText:
	text "Yowza!"
	line "Total verzerrt!"
	done

GuitaristClydeAfterBattleMobileText:
	text "Ich wollte mein"
	line "Debut im KANTO"
	cont "KAMPFCLUB geben…"

	para "Ich sollte nach"
	line "AMAMIA zurückgehen"
	cont "und härter"
	cont "trainieren…"
	done

GuitaristClydeAfterBattleText:
	text "Apropos RADIO-"
	line "STATION: Wie "

	para "lauten die"
	line "Glückszahlen für"
	cont "diese Woche?"
	done

FastShipBedText1:
	text "Ein weiches Bett!"
	line "Schlafenszeit…"
	done

FastShipBedText2:
	text "Ah, ausgeruht und"
	line "frisch!"
	done

FastShipArrivedAlloyText:
	text "Die M.S. AQUA legt"
	line "in PORT ABANISHI"
	cont "an."
	done

FastShipArrivedAmamiText:
	text "Die M.S. AQUA legt"
	line "in AMAMIA an."
	done

FastShipCabins_SW_SSW_NW_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  2,  0, FAST_SHIP_1F, 5
	warp_event  2, 19, FAST_SHIP_1F, 6
	warp_event  3, 19, FAST_SHIP_1F, 6
	warp_event  2, 31, FAST_SHIP_1F, 7
	warp_event  3, 31, FAST_SHIP_1F, 7

	db 0 ; coord events

	db 3 ; bg events
	bg_event  7,  1, BGEVENT_READ, FastShipBed
	bg_event  7,  2, BGEVENT_READ, FastShipBed
	bg_event  7,  7, BGEVENT_READ, FastShipCabinsNorthwestCabinTrashcan

	db 4 ; object events
	object_event  1, 15, SPRITE_FISHER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 2, TrainerFirebreatherLyle, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  6, 15, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBugCatcherKen, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  1, 26, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautyCassie, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  3, 28, SPRITE_ROCKER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 2, TrainerGuitaristClyde, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
