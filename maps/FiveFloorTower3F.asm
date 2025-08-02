	object_const_def ; object_event constants
	const SPROUTTOWER3F_SAGE1
	const SPROUTTOWER3F_SAGE2
	const SPROUTTOWER3F_SAGE3
	const SPROUTTOWER3F_SAGE4


FiveFloorTower3F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end


FiveFloorTower3FSign:
	setevent EVENT_READ_5F3F_SIGN
	jumptext FiveFloorTower3FSignText
	
FiveFloorTower3FSignText:
    text "Eine Statue von"
    line "TENTOXA."

    para "Trotz seines"
    line "einschüchternden"
    para "Aussehens, lehrt"
    line "uns TENTOXA, dass"
    para "alle #MON reine"
    line "Herzen haben."

    para "Diese Statue ist"
    line "einem TENTOXA ge-"
    para "widmet, das mit"
    line "seinen Tentakeln"
    para "ein Kind vor dem"
    line "Ertrinken im Fluss"
    para "neben diesem Turm"
    line "rettete."
	done


TrainerSageJeffrey:
	trainer SAGE, JEFFREY, EVENT_BEAT_SAGE_JEFFREY, SageJeffreySeenText, SageJeffreyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageJeffreyAfterBattleText
	waitbutton
	closetext
	end


SageJeffreySeenText:
    text "Was bedeutet es"
    line "für dich, diesen"
    cont "Turm zu erklimmen?"
	done

SageJeffreyBeatenText:
    text "Nun denn."
	done

SageJeffreyAfterBattleText:
    text "Suche einen Sinn"
    line "auf deiner Reise."

    para "Nicht nur hier im"
    line "Turm, sondern auch"
    para "in allem, was"
    line "danach kommt."
	done
	
TrainerSagePing:
	trainer SAGE, PING, EVENT_BEAT_SAGE_PING, SagePingSeenText, SagePingBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SagePingAfterBattleText
	waitbutton
	closetext
	end


SagePingSeenText:
    text "Im fünften Stock"
    line "befindet sich der"
    cont "Zugang zum Dach."

    para "Aber selbst wir"
    line dürfen diesen"
    para "geweihten Ort"
    line "nicht betreten."
	done

SagePingBeatenText:
    text "Du scheinst deine"
    line "#MON sehr gut"
    cont "zu behandeln."
	done

SagePingAfterBattleText:
    text "Hoffentlich kehrt"
    line "das legendäre"
    para "regenbogenfarbene"
    line "#MON eines"
    cont "Tages zurück."
	done
	
TrainerSageEdmond:
	trainer SAGE, EDMOND, EVENT_BEAT_SAGE_EDMOND, SageEdmondSeenText, SageEdmondBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageEdmondAfterBattleText
	waitbutton
	closetext
	end


SageEdmondSeenText:
    text "Ich spüre, dass du"
    line "eine lange Reise"
    cont "vor dir hast."
	done

SageEdmondBeatenText:
	text "Dies war nur der"
	line "erste Schritt."
	done

SageEdmondAfterBattleText:
    text "Bist du bereit,"
    line "für das, was"
    cont "dir bevorsteht?"
	done
	
TrainerSageNeal:
	trainer SAGE, NEAL, EVENT_BEAT_SAGE_NEAL, SageNealSeenText, SageNealBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageNealAfterBattleText
	waitbutton
	closetext
	end


SageNealSeenText:
    text "Du hast es weit"
    line "geschafft."

    para "Beeindruckend."
	done

SageNealBeatenText:
    text "Bitte, fahre fort."
	done

SageNealAfterBattleText:
    text "Wenn KURT dich ge-"
    line "beten hat, diesen"
    para "Turm zu erklimmen,"
    line "dann muss er eine"
    para "große Zukunft in"
    line "dir sehen."
	done

FiveFloorTower3F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  7,  7, FIVE_FLOOR_TOWER_2F, 2
	warp_event  0,  1, FIVE_FLOOR_TOWER_4F, 1

	db 0 ; coord events


	db 1 ; bg events
	bg_event 4, 1, BGEVENT_READ, FiveFloorTower3FSign

	db 4 ; object events
	object_event  2,  3, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSageJeffrey, EVENT_ALLOY_CAPTAIN_AT_HOME
	object_event  5,  5, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSagePing, EVENT_ALLOY_CAPTAIN_AT_HOME
	object_event  4,  4, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSageEdmond, EVENT_ALLOY_CAPTAIN_AT_HOME
	object_event  3,  4, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSageNeal, EVENT_ALLOY_CAPTAIN_AT_HOME

