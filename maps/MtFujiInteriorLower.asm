	object_const_def ; object_event constants
	const MTFUJIINTERIOR_POKE_BALL1
	const MTFUJIINTERIOR_POKE_BALL2
	const MTFUJIINTERIOR_POKE_BALL3
	const MTFUJIINTERIOR_POKE_BALL4
	const MTFUJIINTERIOR_POKE_BALL5
	const MTFUJIINTERIOR_COOLTRAINER_M
	const MTFUJIINTERIOR_COOLTRAINER_M2
	const MTFUJIINTERIOR_COOLTRAINER_F
	const MTFUJIINTERIOR_INSTRUCTOR
	const MTFUJIINTERIOR_SWIMMERM
	const MTFUJIINTERIOR_SWIMMERF
	const MTFUJIINTERIOR_ENGINEER
	const MTFUJIINTERIOR_COOLTRAINER_M3
	const MTFUJIINTERIOR_COOLTRAINER_F2

MtFujiInteriorLower_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


MtFujiInteriorLowerTMEarthquake:
	itemball TM_EARTHQUAKE

MtFujiInteriorLowerMaxRevive:
	itemball MAX_REVIVE

MtFujiInteriorLowerFullRestore:
	itemball FULL_RESTORE

MtFujiInteriorLowerFullHeal:
	itemball FULL_HEAL

MtFujiInteriorLowerHPUp:
	itemball HP_UP

MtFujiInteriorLowerHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_MT_FUJI_INTERIOR_LOWER_HIDDEN_MAX_POTION

MtFujiInteriorLowerHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_MT_FUJI_INTERIOR_LOWER_HIDDEN_FULL_HEAL

TrainerCooltrainermCody:
	trainer COOLTRAINERM, CODY, EVENT_BEAT_COOLTRAINERM_CODY, CooltrainermCodySeenText, CooltrainermCodyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermCodyAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermJake:
	trainer COOLTRAINERM, JAKE, EVENT_BEAT_COOLTRAINERM_JAKE, CooltrainermJakeSeenText, CooltrainermJakeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermJakeAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfJoyce:
	trainer COOLTRAINERF, JOYCE, EVENT_BEAT_COOLTRAINERF_JOYCE, CooltrainerfJoyceSeenText, CooltrainerfJoyceBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfJoyceAfterBattleText
	waitbutton
	closetext
	end


TrainerInstructorGeoff:
	trainer INSTRUCTOR, GEOFF, EVENT_BEAT_INSTRUCTOR_GEOFF, InstructorGeoffSeenText, InstructorGeoffBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext InstructorGeoffAfterBattleText
	waitbutton
	closetext
	end
	

TrainerSwimmermHarold:
	trainer SWIMMERM, HAROLD, EVENT_BEAT_SWIMMERM_HAROLD, SwimmermHaroldSeenText, SwimmermHaroldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermHaroldAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfLisa:
	trainer SWIMMERF, LISA, EVENT_BEAT_SWIMMERF_LISA, SwimmerfLisaSeenText, SwimmerfLisaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfLisaAfterBattleText
	waitbutton
	closetext
	end

TrainerEngineerDavidson:
	trainer ENGINEER, DAVIDSON, EVENT_BEAT_ENGINEER_DAVIDSON, EngineerDavidsonSeenText, EngineerDavidsonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext EngineerDavidsonAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermErick:
	trainer COOLTRAINERM, ERICK, EVENT_BEAT_COOLTRAINERM_ERICK, CooltrainermErickSeenText, CooltrainermErickBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermErickAfterBattleText
	waitbutton
	closetext
	end


TrainerCooltrainerfQuinn:
	trainer COOLTRAINERF, QUINN, EVENT_BEAT_COOLTRAINERF_QUINN, CooltrainerfQuinnSeenText, CooltrainerfQuinnBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfQuinnAfterBattleText
	waitbutton
	closetext
	end

CooltrainermErickSeenText:
    text "Wirst du schon"
    line "müde?"
	done

CooltrainermErickBeatenText:
    text "Wie es aussieht,"
    line "bin ich ziemlich"
    cont "müde."
	done

CooltrainermErickAfterBattleText:
    text "Bis zum Gipfel ist"
    line "es noch ein weiter"
    para "Weg. Ich hörte,"
    line "das letzte Stück"
    para "sei wie ein"
    line "Labyrinth."
	done

CooltrainermJakeSeenText:
	text "Ich treffe die"
	line "letzten Vorberei-"
	cont "tungen für die"
	cont "#MON LIGA."
	done

CooltrainermJakeBeatenText:
	text "Ich habe es"
	line "vermasselt!"
	done

CooltrainermJakeAfterBattleText:
	text "Es ist sehr"
	line "schwer, in der"
	cont "LIGA zu gewinnen."

	para "Ich muss mehr"
	line "trainieren."

	para "Ich habe gehört,"
	line "dass die TOP VIER"

	para "aus der LIGA noch"
	line "stärker sind als"
	cont "die ARENALEITER."
	done

CooltrainerfJoyceSeenText:
	text "Da du es bis"
	line "hierher geschafft"
	cont "hast, musst du"
	cont "gut sein."

	para "Ich werde in"
	line "diesem Kampf"
	cont "alles geben!"
	done

CooltrainerfJoyceBeatenText:
	text "Nein! Ich kann"
	line "das nicht glauben!"
	done

CooltrainerfJoyceAfterBattleText:
	text "Ich bezwang acht"
	line "ARENALEITER, also"
	para "hatte ich genug"
	line "Selbstbewusstsein."

	para "Das nächste Mal"
	line "muss ich mich mehr"
	cont "anstrengen."
	done

InstructorGeoffSeenText:
    text "Die Trainer hier"
    line "sind sehr stark."

    para "Jeder Kampf kann"
    line "eine gute Lern-"
    cont "erfahrung sein."
	done
	
InstructorGeoffBeatenText:
    text "Ich habe definitiv"
    line "etwas gelernt."
	done
	
InstructorGeoffAfterBattleText:
    text "Die wilden #MON"
    line "hier sind auch"
    cont "sehr stark."
	done


SwimmermHaroldSeenText:
    text "Du benutzt ein"
    line "#MON, um durch"
    cont "die Höhle zu"
    cont "gelangen?"

    para "Wärst du bereit"
    line "für die LIGA,"
    cont "würdest du selber"
    cont "schwimmen!"
	done

SwimmermHaroldBeatenText:
	text "Gulp…"
	done

SwimmermHaroldAfterBattleText:
    text "Schwimmen zu kön-"
    line "nen hilft wohl in"
    para "einem Kampf nicht"
    line "wirklich."
	done

SwimmerfLisaSeenText:
    text "Das Wasser ist"
    line "wärmer, als ich"
    cont "erwartet habe."
	done

SwimmerfLisaBeatenText:
	text "Ich gehe unter!"
	done

SwimmerfLisaAfterBattleText:
    text "Ich schwimme"
    line "lieber in Höhlen,"
    cont "als im Freien."
	done
	
EngineerDavidsonSeenText:
    text "Ich werde einen"
    line "schnelleren Weg"
    para "zum Gipfel finden,"
    line "als durch diese"
    cont "Höhlen zu laufen!"
	done
	
EngineerDavidsonBeatenText:
    text "Vielleicht laufe"
    line "ich einfach."
	done
	
EngineerDavidsonAfterBattleText:
    text "Du bist ziemlich"
    line "stark."

    para "Verlier nicht in"
    line "der LIGA, oder ich"
    para "fühle mich noch"
    line "schlechter, gegen"
    para "dich verloren zu"
    line "haben!"
	done


CooltrainermCodySeenText:
    text "Der KOROKANIABERG"
    line "ist riesig."

    para "Sei besser vor-"
    line "bereitet, denn du"
    para "wirst eine Weile"
    line "hier sein!"
	done

CooltrainermCodyBeatenText:
	text "Mist! Wenn ich"
	line "doch nur bessere"
	cont "#MON hätte!"
	done

CooltrainermCodyAfterBattleText:
    text "Dieser Berg ist in"
    line "fünf Abschnitte"
    cont "unterteilt."

    para "Dieser hier, ist"
    line "erst der erste!"
	done
	
CooltrainerfQuinnSeenText:
	text "Du da!"
	line "Willst du kämpfen?"
	done

CooltrainerfQuinnBeatenText:
	text "Versagt und weg…"
	done

CooltrainerfQuinnAfterBattleText:
	text "Du bist stark."

	para "Du hast offenbar"
	line "hart trainiert."
	done


MtFujiInteriorLower_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event  9, 51, CROWN_CITY, 5
	warp_event 17, 41, MOUNT_FUJI_OUTSIDE, 1
	warp_event  5, 33, MOUNT_FUJI_OUTSIDE, 2
	warp_event 29, 23, MOUNT_FUJI_OUTSIDE, 3
	warp_event 23, 15, MOUNT_FUJI_OUTSIDE, 4
	warp_event  5,  3, MOUNT_FUJI_OUTSIDE, 5
	warp_event 34, 25, MT_FUJI_INTERIOR_LOWER, 8
	warp_event 34, 42, MT_FUJI_INTERIOR_LOWER, 7
	warp_event 31,  2, MT_FUJI_INTERIOR_UPPER, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event 23, 22, BGEVENT_ITEM, MtFujiInteriorLowerHiddenMaxPotion
	bg_event  3, 40, BGEVENT_ITEM, MtFujiInteriorLowerHiddenFullHeal

	db 14 ; object events
	object_event  8, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MtFujiInteriorLowerTMEarthquake, EVENT_MT_FUJI_INTERIOR_LOWER_TM_EARTHQUAKE
	object_event 37, 42, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MtFujiInteriorLowerMaxRevive, EVENT_MT_FUJI_INTERIOR_LOWER_MAX_REVIVE
	object_event 11, 31, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MtFujiInteriorLowerFullRestore, EVENT_MT_FUJI_INTERIOR_LOWER_FULL_RESTORE
	object_event  7, 41, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MtFujiInteriorLowerFullHeal, EVENT_MT_FUJI_INTERIOR_LOWER_FULL_HEAL
	object_event 34,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MtFujiInteriorLowerHPUp, EVENT_MT_FUJI_INTERIOR_LOWER_HP_UP
	object_event 13, 46, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermCody, -1
	object_event 31, 44, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermJake, -1
	object_event 24, 46, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerfJoyce, -1
	object_event 18, 49, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerInstructorGeoff, -1
	object_event 10, 24, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_TRAINER, 3, TrainerSwimmermHarold, -1
	object_event 18, 25, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfLisa, -1
	object_event 28, 24, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 3, TrainerEngineerDavidson, -1
	object_event  3,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainermErick, -1
	object_event 27, 11, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfQuinn, -1
