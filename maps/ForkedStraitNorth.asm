	object_const_def ; object_event constants
	const FS_FISHER1
	const FS_FISHER2
	const FS_ITEMBALL

ForkedStraitNorth_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FSItemball:
	itemball LURE_BALL

TrainerFS1:
	trainer FISHER, STIRNER, EVENT_BEAT_FS_STIRNER, FisherStirnerSeenText, FisherStirnerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherStirnerAfterBattleText
	waitbutton
	closetext
	end

FisherStirnerSeenText:
    text "Ich will bei den"
    line "SÜDLICHEN INSELN"
    para "angeln gehen, aber"
    line "sie lassen nur"
    para "Wissenschaftler"
    line "dort hin!"
	done
	
FisherStirnerBeatenText:
    text "Philosophie ist"
    line "eine Wissenschaft!"
    cont "Lasst mich rein!"
	done
	
FisherStirnerAfterBattleText:
    text "Das Gesetz ist ein"
    line "Schreckgespenst!"

    para "Ich angle, wo ich"
    line "will!"
	done


TrainerFS2:
	trainer FISHER, DALTON, EVENT_BEAT_FS_DALTON, FisherDaltonSeenText, FisherDaltonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherDaltonAfterBattleText
	waitbutton
	closetext
	end

FisherDaltonSeenText:
    text "Ich bin der"
    line "stärkste Angler"
    cont "der Welt!"

    para "Fordere mich"
    line "heraus… Wenn"
    cont "du dich traust!"
	done

FisherDaltonBeatenText:
	text "Du bist einer"
	line "SUPERANGEL würdig…"
	done
	
FisherDaltonAfterBattleText:
    text "Ich kann dir"
    line "nichts mehr bei-"
    cont "bringen, Kleiner."

    para "Du bist jetzt der"
    line "Angelmeister!"
	done

CheckpointSignpost:
	jumptext CheckpointSignpostText
	
CheckpointSignpostText:
	text "SÜDLICHE INSELN"
	line "KONTROLLPUNKT"
	
	para "OFFIZIELLE"
	line "ERLAUBSNIS ZUM"
	cont "BETRETEN BENÖTIGT
	done

ForkedStraitNorth_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 61, FORKED_STRAIT_GATE, 1
	warp_event  9, 61, FORKED_STRAIT_GATE, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event  8, 58, BGEVENT_READ, CheckpointSignpost

	db 3 ; object events
	object_event  9, 13, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerFS1, -1
	object_event  4, 40, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerFS2, -1
	object_event  9, 42, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, FSItemball, EVENT_FS_LUREBALL_ITEM
	