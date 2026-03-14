	object_const_def ; object_event constants
	const RADIOTOWER2F_JIGGLYPUFF
	const RADIOTOWER2F_ROCKER
	const RADIOTOWER2F_GRUNTM24
	const RADIOTOWER2F_GRUNTM26
	const RADIOTOWER2F_BUENA

RadioTower2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RadioTower2FUnusedDummyScene:
; unused
	end


RadioTowerJigglypuff:
	opentext
	writetext RadioTowerJigglypuffText
	cry JIGGLYPUFF
	waitbutton
	closetext
	end




RadioTower2FSalesSign:
	jumptext RadioTower2FSalesSignText

RadioTower2FOaksPKMNTalkSign:
	jumptext RadioTower2FOaksPKMNTalkSignText

RadioTower2FPokemonRadioSign:
	jumptext RadioTower2FPokemonRadioSignText
	
RadioTower2fRocker:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover2fRocker
	writetext RadioTower2fRockerText
	waitbutton
	closetext
	end
.MidRocketTakeover2fRocker
	writetext RadioTower2fRockerTextTakeover
	waitbutton
	closetext
	end
	

RadioTower2fBuena:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover2fBuena
	writetext RadioTower2fBuenaText
	waitbutton
	closetext
	end
.MidRocketTakeover2fBuena
	writetext RadioTower2fBuenaTextTakeover
	waitbutton
	closetext
	end
	
TrainerGruntM24:
	trainer GRUNTM, GRUNTM_24, EVENT_BEAT_ROCKET_GRUNTM_24, GruntM24SeenText, GruntM24BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM24AfterBattleText
	waitbutton
	closetext
	end
	
TrainerGruntM26:
	trainer GRUNTM, GRUNTM_26, EVENT_BEAT_ROCKET_GRUNTM_26, GruntM26SeenText, GruntM26BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM26AfterBattleText
	waitbutton
	closetext
	end
	
RadioTower2fBuenaText:
    text "Hi! Ich bin BUENA!"

    para "Ich wurde gerade"
    line "erst eingestellt,"
    cont "um eine neue"
    cont "Radiosendung zu"
    cont "moderieren!"

    para "Ich kann es kaum"
    line "erwarten, dass sie"
    cont "gesendet wird!"
	done
	
RadioTower2fBuenaTextTakeover:
    text "Wuah!"

    para "So habe ich mir"
    line "das Radio aber"
    cont "nicht vorgestellt!"
	done

GruntM24SeenText:
    text "TEAM ROCKET arbei-"
    line "tet normalerweise"
    cont "in geheimen"
    cont "Unterschlupfen."

    para "Wir haben aber"
    line "auch kein Problem,"
    cont "reinzustürmen und"
    cont "uns zu nehmen, was"
    cont "wir wollen!"
	done
	
GruntM24BeatenText:
    text "Und du hattest"
    line "kein Problem, mich"
    cont "zu besiegen!"
	done
	
GruntM24AfterBattleText:
    text "Hast du unseren"
    line "Anführer schon"
    cont "getroffen?"

    para "Ich glaube, ihr"
    line "würdet euch gar"
    cont "nicht verstehen."
	done

GruntM26SeenText:
    text "Warum wir hier"
    line "sind?"

    para "Weil du und dein"
    line "Freund unsere"
    cont "Antenne zerstört"
    cont "habt!"

    para "Warum eine neue"
    line "bauen, wenn wir"
    cont "uns einfach diese"
    cont "nehmen können?"
	done
	
GruntM26BeatenText:
	text "Autsch!"
	done
	
GruntM26AfterBattleText:
    text "Du bist Schuld,"
    line "an all unseren"
    cont "Problemen!"
	done

	
RadioTower2fRockerTextTakeover:
	text "Jeder Sender be-"
	line "richtet nur noch"
	cont "über TEAM ROCKET!"
	done

RadioTower2fRockerText:
	text "Hast du schon den"
	line "#MON-Marsch"
	cont "gehört?"

	para "Er lässt wilde"
	line "#MON häufiger"
	cont "erscheinen."
	done

RadioTowerJigglypuffText:
	text "PUMMELUFF:"
    line "Pummel…"
	done


RadioTower2FSalesSignText:
	text "1S STUDIO 1"
	done

RadioTower2FOaksPKMNTalkSignText:
	text "PROF. EICHs #-"
    line "MON-TALK"

    para "Die beste Show"
    line "am Äther!"
	done

RadioTower2FPokemonRadioSignText:
	text "Überall, jederzeit"
    line "#MON Radio"
	done

RadioTower2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  0,  0, RADIO_TOWER_3F, 1
	warp_event  7,  0, RADIO_TOWER_1F, 3

	db 0 ; coord events

	db 3 ; bg events
	bg_event  5,  0, BGEVENT_READ, RadioTower2FSalesSign
	bg_event  6, -1, BGEVENT_READ, RadioTower2FOaksPKMNTalkSign
	bg_event  3,  0, BGEVENT_READ, RadioTower2FPokemonRadioSign

	db 5 ; object events
	object_event  4,  1, SPRITE_JIGGLYPUFF, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, RadioTowerJigglypuff, -1
	object_event  6,  5, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower2fRocker, -1
	object_event  2,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 1, TrainerGruntM24, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  6,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 4, TrainerGruntM26, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  0,  5, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower2fBuena, -1
