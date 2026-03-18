	object_const_def ; object_event constants
	const AQUA1F_RECEPTIONIST
	const AQUA1F_ROCKET2
	const AQUA1F_ROCKETF1
	const AQUA1F_YOUNGSTER
	const AQUA1F_LASS
	const AQUA1F_WHITNEYROCKET1
	const AQUA1F_WHITNEYROCKET2
	const AQUA1F_WHITNEYAQUA1
	const AQUA1F_WHITNEYAQUA2

TeknosAquarium1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	

TrainerGruntM2:
	trainer GRUNTM, GRUNTM_2, EVENT_BEAT_ROCKET_GRUNTM_2, GruntM2SeenText, GruntM2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM2AfterBattleText
	waitbutton
	closetext
	end
	
TrainerGruntF1:
	trainer GRUNTF, GRUNTF_1, EVENT_BEAT_ROCKET_GRUNTF_1, GruntF1SeenText, GruntF1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF1AfterBattleText
	waitbutton
	closetext
	end
	
AquaReceptionistScript:
	faceplayer
	opentext
	checkevent EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	iftrue .ReceptionistNoRockets
	writetext AquaReceptionistRocketsText
	waitbutton
	closetext
	end

.ReceptionistNoRockets:
	writetext AquaReceptionistNoRocketsText
	waitbutton
	closetext
	end
	
AquaYoungsterScript:
	faceplayer
	opentext
	checkevent EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	iftrue .YoungsterNoRockets
	writetext AquaYoungsterRocketsText
	waitbutton
	closetext
	end

.YoungsterNoRockets:
	writetext AquaYoungsterNoRocketsText
	waitbutton
	closetext
	end
	
AquaLassScript:
	faceplayer
	opentext
	checkevent EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	iftrue .LassNoRockets
	writetext AquaLassRocketsText
	waitbutton
	closetext
	end

.LassNoRockets:
	writetext AquaLassNoRocketsText
	waitbutton
	closetext
	end
	
Aqua1FExhibit1Script:
	jumptext Aqua1FExhibit1Text
	
Aqua1FExhibit2Script:
	jumptext Aqua1FExhibit2Text
	
Aqua1FExhibit3Script:
	jumptext Aqua1FExhibit3Text
	
Aqua1FExhibit4Script:
	jumptext Aqua1FExhibit4Text
	
WhitneyRocket1:
	faceplayer
	opentext
	writetext WhitneyRocket1Text
	waitbutton
	closetext
	turnobject AQUA1F_WHITNEYROCKET1, DOWN
	end
	
WhitneyRocket2:
	faceplayer
	opentext
	writetext WhitneyRocket2Text
	waitbutton
	closetext
	turnobject AQUA1F_WHITNEYROCKET2, RIGHT
	end
	
TeknosAquariumLeftScene:
	pause 15
	playsound SFX_ENTER_DOOR
	moveobject AQUA1F_WHITNEYAQUA1, 13, 7
	appear AQUA1F_WHITNEYAQUA1
	turnobject AQUA1F_WHITNEYAQUA1, UP
	pause 15
	applymovement AQUA1F_WHITNEYAQUA1, WhitneyDummyMovement
	opentext
	writetext WhitneyWhatIsThisText
	waitbutton
	closetext
	applymovement AQUA1F_WHITNEYAQUA1, WhitneyWalksToRockets
	applymovement PLAYER, PlayerWalksOverLeftScene
	turnobject AQUA1F_WHITNEYAQUA1, DOWN
	opentext
	writetext WhitneyWhatIsThisText2
	waitbutton
	closetext
	setscene SCENE_TEKNOS_AQUARIUM_1F_NOTHING
	setevent EVENT_WHITNEY_2_AQUARIUM
	clearevent EVENT_WHITNEY_1_AQUARIUM
	appear AQUA1F_WHITNEYAQUA2
	disappear AQUA1F_WHITNEYAQUA1
	end

TeknosAquariumUpLeftScene:
	pause 15
	playsound SFX_ENTER_DOOR
	moveobject AQUA1F_WHITNEYAQUA1, 13, 7
	appear AQUA1F_WHITNEYAQUA1
	turnobject AQUA1F_WHITNEYAQUA1, UP
	pause 15
	applymovement AQUA1F_WHITNEYAQUA1, WhitneyDummyMovement
	opentext
	writetext WhitneyWhatIsThisText
	waitbutton
	closetext
	applymovement AQUA1F_WHITNEYAQUA1, WhitneyWalksToRockets
	applymovement PLAYER, PlayerWalksOverLeftUpScene
	turnobject AQUA1F_WHITNEYAQUA1, DOWN
	opentext
	writetext WhitneyWhatIsThisText2
	waitbutton
	closetext
	setscene SCENE_TEKNOS_AQUARIUM_1F_NOTHING
	setevent EVENT_WHITNEY_2_AQUARIUM
	clearevent EVENT_WHITNEY_1_AQUARIUM
	appear AQUA1F_WHITNEYAQUA2
	disappear AQUA1F_WHITNEYAQUA1
	end
TeknosAquariumUpRightScene:
	pause 15
	playsound SFX_ENTER_DOOR
	moveobject AQUA1F_WHITNEYAQUA1, 12, 7
	appear AQUA1F_WHITNEYAQUA1
	turnobject AQUA1F_WHITNEYAQUA1, UP
	pause 15
	applymovement AQUA1F_WHITNEYAQUA1, WhitneyDummyMovement
	opentext
	writetext WhitneyWhatIsThisText
	waitbutton
	closetext
	applymovement AQUA1F_WHITNEYAQUA1, WhitneyWalksToRockets2
	applymovement PLAYER, PlayerWalksOverRightUpScene
	turnobject AQUA1F_WHITNEYAQUA1, DOWN
	opentext
	writetext WhitneyWhatIsThisText2
	waitbutton
	closetext
	setscene SCENE_TEKNOS_AQUARIUM_1F_NOTHING
	setevent EVENT_WHITNEY_2_AQUARIUM
	clearevent EVENT_WHITNEY_1_AQUARIUM
	appear AQUA1F_WHITNEYAQUA2
	disappear AQUA1F_WHITNEYAQUA1
	end
	
WhitneyAquaScript:
	opentext
	writetext WhitneyInAquaText
	waitbutton
	closetext
	end
	
PlayerWalksOverRightUpScene:
	step LEFT
	step LEFT
	step LEFT
	turn_head UP
	step_end
	
PlayerWalksOverLeftUpScene:
	step LEFT
	step LEFT
	turn_head UP
	step_end
	
WhitneyWalksToRockets2:
	step UP
	step UP
	step LEFT
	step LEFT
	step_end
		
WhitneyWalksToRockets:
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step_end
	
PlayerWalksOverLeftScene:
	step LEFT
	step UP
	step_end
	
WhitneyDummyMovement:
	step_end
	
WhitneyInAquaText:
	text "Glaub nicht,"
	line "dass ich mich"
	cont "zurückhalte!"
	done
	
WhitneyRocket1Text:
	text "Uff, sie ist"
	line "echt hart drauf."
	done
	
WhitneyRocket2Text:
	text "Ich habe noch nie"
	line "so ein starkes"
	para "MILTANK gesehen…"
	done
	
WhitneyWhatIsThisText:
	text "Was ist hier los?"

	para "Das ist absolut"
	line "inakzeptabel!"

	para "TEAM ROCKET hat"
	line "hier nichts zu"
	cont "suchen!"
	done
	
WhitneyWhatIsThisText2:
	text "Du bist <PLAYER>,"
	line "oder?"

	para "Haben wir uns"
	line "nicht in der"
	cont "MINE getroffen?"

	para "Wie wär's, wenn"
	line "ich mich um diese"
	cont "Typen hier kümmere"
	cont "und du schon mal"
	cont "vorgehst?"

	para "Zeigen wir es"
	line "ihnen!"
	done
	
Aqua1FExhibit1Text:
	text "KRABBY verstecken"
	line "sich gerne im"
	cont "Sand."

	para "Sieh genau hin,"
	line "um das vergrabene"
	cont "#MON zu finden."
	done
	
Aqua1FExhibit2Text:
	text "NEUE AUSSTELLUNG"
	line "DEMNÄCHST"
	done

Aqua1FExhibit3Text:
	text "MOLAMBINO und"
	line "KARPADOR teilen"
	cont "sich friedlich"
	cont "ihren Lebensraum."

	para "Diese #MON"
	line "wohnen oft in den"
	cont "gleichen Wässern."
	done
	
GruntM2SeenText:
	text "Wir kommen hier"
	line "rein, nehmen uns,"
	cont "was wir wollen,"
	cont "und verkaufen es!"

	para "Wir brauchen das"
	line "Geld für unsere"
	cont "großen Pläne!"
	done

GruntM2BeatenText:
	text "Einfach…"
	line "Zu stark…"
	done

GruntM2AfterBattleText:
    text "Du wirst noch mehr"
    line "von uns zu sehen!"
	done

Aqua1FExhibit4Text:
	text "LAPRAS-STATUE"

	para "Es gibt Berichte,"
	line "dass LAPRAS tief"
	cont "in der MINE im"
	cont "Westen der Stadt"
	cont "leben sollen."
	done

AquaReceptionistRocketsText:
	text "Vorsicht! Kinder"
	line "sollten jetzt"
	cont "nicht hier sein."

	para "Wir haben gerade"
	line "ein Problem mit"
	cont "gefährlichen"
	cont "Kriminellen."
	done

AquaReceptionistNoRocketsText:
	text "Willkommen im"
	line "AQUARIUM von"
	cont "TEKNOPIA CITY!"

	para "Sieh dich gerne"
	line "um."
	done

GruntF1SeenText:
	text "Hier gibt es"
	line "seltene #MON,"
	cont "die wir stehlen"
	cont "und verkaufen"
	cont "können!"

	para "Steh uns nicht im"
	line "Weg, Kleiner!"
	done

GruntF1BeatenText:
	text "Du freches Gör!"
	done

GruntF1AfterBattleText:
	text "TEAM ROCKET wird"
	line "das nicht"
	cont "vergessen!"
	done
	
AquaYoungsterRocketsText:
	text "Hmm… Ich glaube"
	line "nicht, dass diese"
	cont "Typen in Schwarz"
	cont "hier sein sollten…"
	done

AquaYoungsterNoRocketsText:
    text "Ich habe gehofft,"
    line "hier ein echtes"
    cont "ANKORASCH sehen zu"
    cont "können, aber es"
    cont "gibt hier keins."
	done
	
AquaLassRocketsText:
	text "Huch!"

	para "Oh, du gehörst"
	line "nicht zu denen."

	para "Diese Leute machen"
	line "mir Angst."

	para "Ich sollte wohl"
	line "besser gehen."
	done

AquaLassNoRocketsText:
	text "Dieses AQUARIUM"
	line "ist noch relativ"
	cont "neu, deshalb gibt"
	cont "es hier auch noch"
	cont "nicht so viele"
	cont "Exponate."
	done

TeknosAquarium1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12,  7, TEKNOS_CITY, 9
	warp_event 13,  7, TEKNOS_CITY, 5
	warp_event  0,  7, TEKNOS_AQUARIUM_2F, 1

	db 3 ; coord events
	coord_event 11,  7, SCENE_DEFAULT, TeknosAquariumLeftScene
	coord_event 12,  6, SCENE_DEFAULT, TeknosAquariumUpLeftScene
	coord_event 13,  6, SCENE_DEFAULT, TeknosAquariumUpRightScene

	db 4 ; bg events
	bg_event  1,  3, BGEVENT_READ, Aqua1FExhibit1Script
	bg_event  7,  3, BGEVENT_READ, Aqua1FExhibit2Script
	bg_event 10,  3, BGEVENT_READ, Aqua1FExhibit3Script
	bg_event  4,  1, BGEVENT_READ, Aqua1FExhibit4Script


	db 9 ; object events
	object_event 15,  5, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AquaReceptionistScript, -1
	object_event  7,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 3, TrainerGruntM2, EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	object_event  5,  7, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 3, TrainerGruntF1, EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	object_event 13,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AquaYoungsterScript, -1
	object_event  3,  5, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AquaLassScript, -1
	object_event 10,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, WhitneyRocket1, EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	object_event  9,  5, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, WhitneyRocket2, EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	object_event  7,  6, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, WhitneyAquaScript, EVENT_WHITNEY_2_AQUARIUM
	object_event 10,  5, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, WhitneyAquaScript, EVENT_WHITNEY_1_AQUARIUM
