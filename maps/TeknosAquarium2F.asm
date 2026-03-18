	object_const_def ; object_event constants
	const AQUA2F_ROCKET1
	const AQUA2F_ROCKET3
	const AQUA2F_POKEFAN_M
	const AQUA2F_POKEFAN_F
	const AQUA2F_WHITNEY

TeknosAquarium2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


TrainerGruntM1:
	trainer GRUNTM, GRUNTM_1, EVENT_BEAT_ROCKET_GRUNTM_1, GruntM1SeenText, GruntM1BeatenText, 0, .Script

.Script:
	opentext
	writetext TrainerGruntM1WhenTalkText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear AQUA2F_ROCKET1
	pause 15
	special FadeInQuickly
	pause 30
	setevent EVENT_WHITNEY_2_AQUARIUM
	setevent EVENT_WHITNEY_1_AQUARIUM
	setevent EVENT_ROCKETS_TAKE_OVER_AQUARIUM; this is the event for the rocket objects
	clearflag ENGINE_ROCKETS_IN_SANSKRIT
	checkevent EVENT_GIRL_IS_BACK_AT_HOUSE
	iffalse .AlreadyRescuedGirl
	special FadeBlackQuickly; shouldn't be here ever, mine is mandatory first now
	special HealParty
	pause 15
	warp TEKNOS_CITY, 6, 28
	end

.AlreadyRescuedGirl:
	moveobject AQUA2F_WHITNEY, 9, 5
	appear AQUA2F_WHITNEY
	applymovement AQUA2F_WHITNEY, WhitneyWalksUpAfterRocketsMovement
	applymovement PLAYER, PlayerWalksUpToWhitneyAfterRocketsMovement
	opentext
	writetext WhitneyWayToGoText
	waitbutton
	closetext
	applymovement AQUA2F_WHITNEY, WhitneyWalksAwayAfterRocketsMovement
	disappear AQUA2F_WHITNEY
	pause 30
	applymovement PLAYER, PlayerInAquariumDummyMovement
	clearevent EVENT_WHITNEY_BACK_IN_TEKNOS_GYM
	special FadeBlackQuickly
	special HealParty
	pause 15
	warp TEKNOS_CITY, 6, 28
	end


TrainerGruntM3:
	trainer GRUNTM, GRUNTM_3, EVENT_BEAT_ROCKET_GRUNTM_3, GruntM3SeenText, GruntM3BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM3AfterBattleText
	waitbutton
	closetext
	end

AquaPokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	iftrue .PokefanMNoRockets
	writetext AquaPokefanMRocketsText
	waitbutton
	closetext
	end

.PokefanMNoRockets:
	writetext AquaPokefanMNoRocketsText
	waitbutton
	closetext
	end
	
AquaPokefanFScript:
	faceplayer
	opentext
	checkevent EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	iftrue .PokefanFNoRockets
	writetext AquaPokefanFRocketsText
	waitbutton
	closetext
	end

.PokefanFNoRockets:
	writetext AquaPokefanFNoRocketsText
	waitbutton
	closetext
	end
	
Aqua2FExhibit1Script:
	jumptext Aqua2FExhibit1Text

Aqua2FExhibit2Script:
	jumptext Aqua2FExhibit2Text
	
Aqua2FExhibit3Script:
	jumptext Aqua2FExhibit3Text
	
PlayerInAquariumDummyMovement:
	step_end
	
WhitneyWalksUpAfterRocketsMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end
	
WhitneyWalksAwayAfterRocketsMovement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end
	
PlayerWalksUpToWhitneyAfterRocketsMovement:
	step UP
	turn_head LEFT
	step_end
	

WhitneyWayToGoText:
	text "Gut gemacht,"
	line "<PLAYER>!"

	para "Du hast es ihnen"
	line "echt gezeigt!"

	para "TEAM ROCKET wird"
	line "diesen Wasser-#"
	cont "MON nichts mehr"
	cont "antun."

	para "Hey…"

	para "Du bist wirklich"
	line "ziemlich stark!"

	para "Schau doch später"
	line "mal in meiner"
	cont "ARENA vorbei!"

	para "Ich würde gerne"
	line "gegen dich"
	cont "kämpfen!"

	para "Wo wir gerade"
	line "dabei sind: Ich"
	cont "sollte langsam"
	cont "mal zurück!"

	para "Wir sehen uns!"
	done
	

Aqua2FExhibit1Text:
	text "GOLUPPY gehören zu"
	line "den kleinsten"
	cont "Wasser-#MON."
	done

Aqua2FExhibit2Text:
	text "NEUE AUSSTELLUNG"
	line "IN KÜRZE"
	done
	
Aqua2FExhibit3Text:
	text "BISTURBAN können"
	line "an Land und unter"
	cont "Wasser leben."

	para "Sie haben eine"
	line "enge Beziehung zur"
	cont "FLEGMON-Familie."
	done

GruntM1SeenText:
	text "Was willst du?"

	para "Wer uns bei der"
	line "Arbeit stört, kann"
	cont "keine Gnade"
	cont "erwarten!"
	done

GruntM1BeatenText:
    text "Dieses Mal warst"
    line "du OK, aber das"
    cont "nächste Mal, bist"
    cont "du dran!"
	done

TrainerGruntM1WhenTalkText:
    text "Ja, TEAM ROCKET"
    line "wurde vor einem"
    cont "Jahr zerschlagen."

    para "Aber wir haben im"
    line "Geheimen weiter-"
    cont "gemacht."

    para "Jetzt kannst du"
    line "dich freuen, uns"
    cont "beim Unruhestiften"
    cont "zuzusehen!"

    para "Wir haben diesen"
    line "Ort nicht nötig!"

    para "Es gibt genügend"
    line "Möglichkeiten für"
    cont "uns, Geld zu"
    cont "verdienen."

    para "Unsere Ziele sind"
    line "weitaus größer als"
    cont "das Bisschen Geld!"

    para "Du hast uns noch"
    line "nicht zum letzten"
    cont "Mal gesehen!"
	done
	

GruntM3SeenText:
	text "Wir zeigen dir,"
	line "wie furchteinflö-"
	cont "ßend wir sind!"
	done

GruntM3BeatenText:
	text "Zu stark!"

	para "Wir behalten dich"
	line "im Auge…"
	done

GruntM3AfterBattleText:
	text "Du bist zu stark."

	para "Unser Vorhaben"
	line "hier ist eh nicht"
	cont "der wichtigste"
	cont "Teil des Plans."

	para "Du bist lediglich"
	line "ein Stolperstein."
	done
	
AquaPokefanMRocketsText:
	text "Ich finde, diese"
	line "Unruhestifter"
	cont "gehören hier"
	cont "nicht her."
	done
	
AquaPokefanMNoRocketsText:
	text "Gehörten diese"
	line "Leute echt zu"
	cont "TEAM ROCKET?"

	para "Ich dachte, man"
	line "hätte sich letztes"
	cont "Jahr schon um die"
	cont "gekümmert."
	done
	
AquaPokefanFRocketsText:
    text "Oh man, das sollte"
    line "doch ein ruhiger"
    cont "Tag werden."
	done
	
AquaPokefanFNoRocketsText:
	text "Ich mochte Fische"
	line "eh nie besonders."
	done

TeknosAquarium2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  0,  7, TEKNOS_AQUARIUM_1F, 3

	db 0 ; coord events

	db 3 ; bg events
	bg_event  3,  3, BGEVENT_READ, Aqua2FExhibit1Script
	bg_event  7,  3, BGEVENT_READ, Aqua2FExhibit2Script
	bg_event 11,  3, BGEVENT_READ, Aqua2FExhibit3Script

	db 5 ; object events
	object_event 14,  7, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 0, TrainerGruntM1, EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	object_event  5,  3, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 4, TrainerGruntM3, EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	object_event  7,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, AquaPokefanMScript, -1
	object_event 10,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AquaPokefanFScript, -1
	object_event 17, -4, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_WHITNEY_AQUARIUM_2F
