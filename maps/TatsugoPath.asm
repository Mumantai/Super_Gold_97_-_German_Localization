	object_const_def ; object_event constants
	const TP_TEACHER
	const TP_INSTR
	const TP_SNERD
	const TP_SAILOR
	const TP_ITEMBALL

TatsugoPath_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSailorEugene:
	trainer SAILOR, EUGENE, EVENT_BEAT_SAILOR_EUGENE, SailorEugeneSeenText, SailorEugeneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorEugeneAfterBattleText
	waitbutton
	closetext
	end
	


SailorEugeneSeenText:
	text "Ich bin gerade"
	line "von der See"
	cont "zurückgekommen."

	para "Wie steht es nun"
	line "mit dem #MON-"
	cont "Kampf?"
	done

SailorEugeneBeatenText:
	text "Aah!"
	done

SailorEugeneAfterBattleText:
	text "Meine #MON"
	line "sin im Ausland"
	cont "eingefangen und"
	cont "aufgezogen worden."

	para "Sie begleiten mich"
	line "auf meinen langen"
	cont "Reisen."
	done


TrainerTeacherHolly:
	trainer TEACHER, HOLLY, EVENT_BEAT_TEACHER_HOLLY, TeacherHollySeenText, TeacherHollyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherHollyAfterBattleText
	waitbutton
	closetext
	end
	

TeacherHollySeenText:
    text "Äh, entschuldigung"
    line "aber das ist ein"
    cont "privates Treffen!"
	done

TeacherHollyBeatenText:
	text "Hau ab, du"
	line "Schwachkopf!"
	done

TeacherHollyAfterBattleText:
    text "Als ob ich nicht"
    line "auf Arbeit schon"
    para "genug mit Kindern"
    line "zu tun hätte!"
	done


TrainerInstrMoshe:
	trainer INSTRUCTOR, MOSHE, EVENT_BEAT_INSTRUCTOR_MOSHE, InstrMosheSeenText, InstrMosheBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext InstrMosheAfterBattleText
	waitbutton
	closetext
	end
	

InstrMosheSeenText:
    text "Falls du Nachhilfe"
    line "wolltest, bist du"
    para "zur falschen Zeit"
    line "gekommen!"
	done

InstrMosheBeatenText:
	text "Ach, komm schon!"
	done

InstrMosheAfterBattleText:
    text "Es ist so typisch,"
    line "dass ich nicht mal"
    para "auf ein Rendezvous"
    line "gehen kann, ohne"
    para "von irgendeinem"
    line "Kind belästigt"
    cont "zu werden!"
	done

TrainerSNNorton:
	trainer SUPER_NERD, NORTON, EVENT_BEAT_SUPER_NERD_NORTON, SNNortonSeenText, SNNortonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SNNortonAfterBattleText
	waitbutton
	closetext
	end
	

SNNortonSeenText:
    text "Ich hänge jeden"
    line "Tag am HERZTEICH"
    cont "rum!"

    para "Also warum finde"
    line "ich dann keine"
    cont "Freundin?"
	done

SNNortonBeatenText:
    text "Das Leben eines"
    line "STREBERs ist hart."
	done

SNNortonAfterBattleText:
    text "Hätte ich bessere"
    line "Chancen, wenn ich"
    para "im HERZTEICH baden"
    line "würde?"
	done
	
TatsugoPathHiddenPPUP:
	hiddenitem PP_UP, EVENT_TATSUGO_PATH_HIDDEN_PP_UP

TatsugoPathHiddenHeartStone:
	hiddenitem HEART_STONE, EVENT_TATSUGO_PATH_HIDDEN_HEART_STONE

TPItemball:
	itemball ULTRA_BALL

HeartPondSign:
	jumptext HeartPondSignText
	
HeartPondSignText:
	text "HERZTEICH"

	para "Ein Treffpunkt"
	line "für Liebende"
	done

KikaiStraitSign:
	jumptext KikaiStraitSignText
	
KikaiStraitSignText:
	text "TATSUGO PFAD"
	para "AMAMIA  -"
	line "KIKAITANI"
	done

TatsugoPath_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  4,  9, AMAMI_TATSUGO_PATH_GATE, 4

	db 0 ; coord events

	db 4 ; bg events
	bg_event 21,  7, BGEVENT_READ, HeartPondSign
	bg_event 52, 10, BGEVENT_READ, KikaiStraitSign
	bg_event  4, 15, BGEVENT_ITEM, TatsugoPathHiddenPPUP
	bg_event 26, 12, BGEVENT_ITEM, TatsugoPathHiddenHeartStone

	db 5 ; object events
	object_event 19,  9, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerTeacherHolly, -1
	object_event 19, 10, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerInstrMoshe, -1
	object_event 35,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerSNNorton, -1
	object_event 47, 12, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSailorEugene, -1
	object_event 43, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TPItemball, EVENT_TATSUGO_PATH_ITEMBALL
