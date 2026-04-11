	object_const_def ; object_event constants
	const RADIOTOWER5F_ROCKER
	const RADIOTOWER5F_COOLTRAINER
	const RADIOTOWER5F_SCIENTIST
	const RADIOTOWER5F_GRUNTM30

RadioTower5F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	

RadioTower5fCooltrainer:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover5fCooltrainer
	writetext RadioTower5fCooltrainerText
	waitbutton
	closetext
	end
.MidRocketTakeover5fCooltrainer
	writetext RadioTower5fCooltrainerTextTakeover
	waitbutton
	closetext
	end

RadioTower5fRocker:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover5fRocker
	writetext RadioTower5fRockerText
	waitbutton
	closetext
	end
.MidRocketTakeover5fRocker
	writetext RadioTower5fRockerTextTakeover
	waitbutton
	closetext
	end
	
TrainerGruntM30:
	trainer GRUNTM, GRUNTM_30, EVENT_BEAT_ROCKET_GRUNTM_30, GruntM30SeenText, GruntM30BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM30AfterBattleText
	waitbutton
	closetext
	end
	

TrainerScientistRich:
	trainer SCIENTIST, RICH, EVENT_BEAT_SCIENTIST_RICH, ScientistRichSeenText, ScientistRichBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistRichAfterBattleText
	waitbutton
	closetext
	end

	
RadioTower5FStudiosSign:
	jumptext RadioTower5FStudiosSignText
	
GruntM30SeenText:
	text "Ist unsere Über-"
	line "tragung nicht viel"
	cont "besser als das"
	cont "normale Zeug?"
	done
	
GruntM30BeatenText:
	text "Ehrlich gesagt,"
	line "irgendwie mag ich"
	cont "#MON-Musik…"
	done
	
GruntM30AfterBattleText:
	text "Bald wird dieser"
	line "Turm unser Signal"
	cont "zur Gedanken-"
	cont "kontrolle senden!"
	done
	
ScientistRichSeenText:
	text "Was mit dem"
	line "BETRÜGER EICH"
	cont "passiert ist?"

	para "Nunja, er ist uns"
	line "nicht mehr von"
	cont "Nutzen, da wir"
	cont "gerade niemanden"
	cont "reinlegen müssen!"

	para "Also haben wir uns"
	line "seiner entledigt!"
	done
	
ScientistRichBeatenText:
	text "Du bist zu gut"
	line "für mich…"
	done
	
ScientistRichAfterBattleText:
	text "Ich mochte den"
	line "Kerl sowieso nie."
	done
	
	
RadioTower5FStudiosSignText:
	text "4S STUDIO 3"
	done

RadioTower5fRockerText:
	text "BEN: Du magst"
	line "Musik für #MON?"

	para "Dann hör dir meine"
	line "Sendung an!"
	done
	
RadioTower5fRockerTextTakeover:
    text "BEN: Ich glaube"
    line "nicht, dass TEAM"
    cont "ROCKET plant Musik"
    cont "zu spielen, die"
    cont "#MON hilft!"
    done
	
RadioTower5fCooltrainerText:
	text "REED: Wenn du dein"
	line "Glück auf die"
	cont "Probe stellen"
	cont "willst, schalte"
	cont "meine Sendung ein!"
	done
	
RadioTower5fCooltrainerTextTakeover:
	text "REED: Ich glaube,"
	line "wir haben hier"
	cont "gerade eine"
	cont "Pechsträhne!"
	done
	

RadioTower5F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  0,  0, RADIO_TOWER_4F, 1
	warp_event  7,  0, RADIO_TOWER_6F, 1

	db 0 ; coord events


	db 1 ; bg events
	bg_event  3,  0, BGEVENT_READ, RadioTower5FStudiosSign

	db 4 ; object events
	object_event  4,  6, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower5fRocker, -1
	object_event  0,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower5fCooltrainer, -1
	object_event  6,  1, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerScientistRich, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  2,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 1, TrainerGruntM30, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
