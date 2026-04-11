	object_const_def ; object_event constants
	const RADIOTOWER3F_ROCKER
	const RADIOTOWER3F_TEACHER
	const RADIOTOWER3F_SUPER_NERD
	const RADIOTOWER3F_JANINE
	const RADIOTOWER3F_GRUNTF5
	const RADIOTOWER3F_SCIENTIST

RadioTower3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
RadioTower3FPersonnelSign:
	jumptext RadioTower3FPersonelSignText

RadioTower3fRocker:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover3fRocker
	writetext RadioTower3fRockerText
	waitbutton
	closetext
	end
.MidRocketTakeover3fRocker
	writetext RadioTower3fRockerTextTakeover
	waitbutton
	closetext
	end
	

RadioTower3fTeacher:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover3fTeacher
	writetext RadioTower3fTeacherText
	waitbutton
	closetext
	end
.MidRocketTakeover3fTeacher
	writetext RadioTower3fTeacherTextTakeover
	waitbutton
	closetext
	end


RadioTower3fJanine:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover3fJanine
	writetext RadioTower3fJanineText
	waitbutton
	closetext
	end
.MidRocketTakeover3fJanine
	writetext RadioTower3fJanineTextTakeover
	waitbutton
	closetext
	end


RadioTower3fSuperNerd:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover3fSuperNerd
	writetext RadioTower3fSuperNerdText
	waitbutton
	closetext
	end
.MidRocketTakeover3fSuperNerd
	writetext RadioTower3fSuperNerdTextTakeover
	waitbutton
	closetext
	end
	

TrainerGruntF5:
	trainer GRUNTF, GRUNTF_5, EVENT_BEAT_ROCKET_GRUNTF_5, GruntF5SeenText, GruntF5BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF5AfterBattleText
	waitbutton
	closetext
	end
	

TrainerScientistJed:
	trainer SCIENTIST, JED, EVENT_BEAT_SCIENTIST_JED, ScientistJedSeenText, ScientistJedBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistJedAfterBattleText
	waitbutton
	closetext
	end
	

ScientistJedSeenText:
	text "Es sollte nicht"
    line "allzu schwer sein,"
    cont "unser Signal zur"
    cont "Gedankenkontrolle"
    cont "hier zu senden!"
    done
	
ScientistJedBeatenText:
	text "#MON-Kämpfe"
    line "sind schwerer"
    cont "als Wissenschaft…"
    done
	
ScientistJedAfterBattleText:
    text "Wie wär's, wenn du"
	line "endlich aufhörst,"
	cont "dich in unsere"
	cont "Angelegenheiten"
	cont "einzumischen?"
	done
	
GruntF5SeenText:
	text "Die Angestellten"
	line "wussten gar nicht,"
	cont "wie ihnen geschah!"
	done
	
GruntF5BeatenText:
	text "Uff, ich weiß,"
	line "wie mir geschah!"
	done
	
GruntF5AfterBattleText:
    text "Sieht so aus, als"
	line "wären alle hier"
	cont "bald ihren Job"
	cont "los!"
	done

	
RadioTower3fRockerText:
    text "Wir haben Auf-"
    line "nahmen von den"
    cont "Rufen aller bisher"
    cont "bekannten #MON."

    para "Es müssen so an"
    line "die 200 sein."
	done
	
RadioTower3fRockerTextTakeover:
	text "Was ist hier los?!"

	para "Mit all diesen"
	line "Kriminellen hier,"
	cont "kann ich nicht"
	cont "arbeiten!"
	done
	
RadioTower3fJanineText:
	text "KEN ist wohl der"
	line "beliebteste DJ"
	cont "hier im Sender."
	done
	
RadioTower3fJanineTextTakeover:
	text "Hilfe! Was hat"
	line "TEAM ROCKET mit"
	cont "unserer Antenne"
	cont "vor?"
	done
	
RadioTower3fSuperNerdText:
	text "Wir senden 24"
	line "Stunden am Tag"
	cont "Unterhaltung für"
	cont "unsere Region."

	para "Also gebe auch ich"
	line "rund um die Uhr"
	cont "mein Bestes!"
	done
	
RadioTower3fSuperNerdTextTakeover:
	text "Das kann nichts"
	line "Gutes bedeuten!"

	para "TEAM ROCKET wird"
	line "#MON wehtun,"
	para "wenn sie die Kon-"
	line "trolle über den"
	para "RADIOTURM"
	line "behalten!"
	done
	
RadioTower3fTeacherText:
	text "<PKMN>-Schlaflied hält"
	line "dir wilde #MON"
	cont "vom Leib!"
	done
	
RadioTower3fTeacherTextTakeover:
	text "Was sollen wir"
	line "nur tun?"
	done
	
RadioTower3FPersonelSignText:
	text "2S PERSONAL"
	done

RadioTower3F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  0,  0, RADIO_TOWER_2F, 1
	warp_event  7,  0, RADIO_TOWER_4F, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event  5,  0, BGEVENT_READ, RadioTower3FPersonnelSign

	db 6 ; object events
	object_event  1,  6, SPRITE_ROCKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower3fRocker, -1
	object_event  3,  1, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, RadioTower3fTeacher, -1
	object_event  4,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, RadioTower3fSuperNerd, -1
	object_event  6,  5, SPRITE_JANINE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RadioTower3fJanine, -1
	object_event  1,  3, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 2, TrainerGruntF5, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  6,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerScientistJed, EVENT_RADIO_TOWER_ROCKET_TAKEOVER

