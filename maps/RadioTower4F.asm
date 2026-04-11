	object_const_def ; object_event constants
	const RADIOTOWER4F_ROCKER
	const RADIOTOWER4F_BURGLAR
	const RADIOTOWER4F_SUPER_NERD
	const RADIOTOWER4F_TEACHER
	const RADIOTOWER4F_SCIENTIST
	const RADIOTOWER4F_GRUNTM27
	const RADIOTOWER4F_GRUNTM28

RadioTower4F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
RadioTower4FStudio2Sign:
	jumptext RadioTower4FStudio2SignText


RadioTower4fRocker:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover4fRocker
	writetext RadioTower4fRockerText
	waitbutton
	closetext
	end
.MidRocketTakeover4fRocker
	writetext RadioTower4fRockerTextTakeover
	waitbutton
	closetext
	end
	

RadioTower4fTeacher:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover4fTeacher
	writetext RadioTower4fTeacherText
	waitbutton
	closetext
	end
.MidRocketTakeover4fTeacher
	writetext RadioTower4fTeacherTextTakeover
	waitbutton
	closetext
	end

RadioTower4fSuperNerd:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover4fSuperNerd
	checkflag ENGINE_MAP_CARD
	iffalse .KenFinallyGivesMap
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .KenAfterRadioTower
	writetext RadioTower4fSuperNerdText
	waitbutton
	closetext
	end
.MidRocketTakeover4fSuperNerd
	writetext RadioTower4fSuperNerdTextTakeover
	waitbutton
	closetext
	end
.KenAfterRadioTower
	writetext RadioTower4fSuperNerdTextAfter
	waitbutton
	closetext
	end
.KenFinallyGivesMap
	writetext KenGiveMapInTower
	buttonsound
	stringtotext .mapcardname, MEM_BUFFER_1
	scall .JumpstdReceiveItem
	setflag ENGINE_MAP_CARD
	writetext KenGiveMapInTower2
	waitbutton
	closetext
	end
	

.JumpstdReceiveItem:
	jumpstd ReceiveItemScript
	end

.mapcardname
	db "MAP CARD@"
	

	
RadioTower4fBurglar:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover4fBurglar
	writetext RadioTower4fBurglarText
	waitbutton
	closetext
	end
.MidRocketTakeover4fBurglar
	writetext RadioTower4fBurglarTextTakeover
	waitbutton
	closetext
	end
	
TrainerScientistMarc:
	trainer SCIENTIST, MARC, EVENT_BEAT_SCIENTIST_MARC, ScientistMarcSeenText, ScientistMarcBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistMarcAfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM27:
	trainer GRUNTM, GRUNTM_27, EVENT_BEAT_ROCKET_GRUNTM_27, GruntM27SeenText, GruntM27BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM27AfterBattleText
	waitbutton
	closetext
	end
	

TrainerGruntM28:
	trainer GRUNTM, GRUNTM_28, EVENT_BEAT_ROCKET_GRUNTM_28, GruntM28SeenText, GruntM28BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM28AfterBattleText
	waitbutton
	closetext
	end
	

GruntM28SeenText:
	text "Überraschung!"
	done
	
GruntM28BeatenText:
	text "Darauf warst du"
	line "wohl vorbereitet…"
	done
	
GruntM28AfterBattleText:
	text "Du bist es sicher"
	line "schon gewohnt,"
	para "TEAM ROCKET Rüpel"
	line "zu sehen."
	done

KenGiveMapInTower:
	text "KEN: Hey, Bruder!"
	line "Ich hab's wirklich"
	cont "geschafft!"

	para "Ich bin ein DJ!"

	para "Deine Forschung"
	line "für PROF. EICH ist"
	cont "auch super hilf-"
	cont "reich für meine"
	cont "Radiosendung!"

	para "Du hast was gut"
	line "bei mir!"

	para "…Oh, warte!"
	line "Ich hatte noch gar"
	cont "keine Chance, dir"
	cont "das hier zu geben!"
	done
	
KenGiveMapInTower2:
    text "Wie hast du es"
    line "ohne Karte nur so"
    cont "weit geschafft,"
    cont "ohne dich zu"
    cont "verlaufen?"
	done
	
GruntM27SeenText:
	text "Du willst nach"
	line "oben gehen?"

	para "Das kannst du"
	line "vergessen!"
	done
	
GruntM27BeatenText:
	text "Die aussicht von"
	line "da oben soll echt"
	cont "schön sein."
	done
	
GruntM27AfterBattleText:
	text "Gegen mich kannst"
	line "du vielleicht"
	cont "gewinnen, aber du"
	cont "hast keine Chance"
	cont "gegen GIOVANNI!"
	done

	
ScientistMarcSeenText:
	text "Meine Daten sagen,"
	line "du bist eine Göre!"
	done
	
ScientistMarcBeatenText:
	text "Ojemine."
	done
	
ScientistMarcAfterBattleText:
	text "Du stehst der"
	line "Wissenschaft"
	cont "im Weg!"
	done
	
RadioTower4fTeacherText:
	text "MARY: Hör dir"
	line "KENs #MON-"
	cont "TALK an!"

	para "Täglich ab 10"
	line "Uhr morgens!"
	done
	
RadioTower4fTeacherTextTakeover:
	text "MARY: Ich wäre"
	line "heute besser zu"
	cont "Hause geblieben!"
	done
	
RadioTower4fBurglarText:
	text "Hey, Kleiner!"

	para "Ich leite die"
	line "Produktion von"
	cont "KENs #MON-TALK!"

	para "Hör doch mal rein."
	done
	
RadioTower4fBurglarTextTakeover:
	text "Das gehört nicht"
	line "zum Produktions-"
	cont "plan!"
	done

RadioTower4fRockerText:
	text "Ich habe Radio"
	line "gehört, als ich in"
	cont "den GLYPHONTIA"
	cont "RUINEN war."

	para "Dort gab es eine"
	line "seltsame Sendung…"
	done
	
RadioTower4fRockerTextTakeover:
	text "Unsere normalen"
	line "Sendungen werden"
	para "zur Zeit nicht"
	line "ausgestrahlt!"
	done
	
	
RadioTower4fSuperNerdText:
	text "KEN: Hey, Bruder!"
	line "Ich hab's wirklich"
	cont "geschafft!"

	para "Ich bin ein DJ!"

	para "Deine Forschung"
	line "für PROF. EICH ist"
	cont "auch super hilf-"
	cont "reich für meine"
	cont "Radiosendung!"

    para "Du hast was gut"
    line "bei mir!"
	done
	
RadioTower4fSuperNerdTextTakeover:
	text "KEN: Bruder! Was"
	line "machst du hier?!"

	para "Pass auf dich auf!"
	done
	
RadioTower4fSuperNerdTextAfter:
	text "KEN: Hast du"
	line "TEAM ROCKET"
	cont "fertiggemacht?"

	para "Wow. Du und deine"
	line "#MON, ihr seid"
	cont "echt stark!"
	done
	
RadioTower4FStudio2SignText:
	text "3S STUDIO 2"
	done

RadioTower4F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  0,  0, RADIO_TOWER_5F, 1
	warp_event  7,  0, RADIO_TOWER_3F, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event  5,  0, BGEVENT_READ, RadioTower4FStudio2Sign

	db 7 ; object events
	object_event  4,  1, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RadioTower4fRocker, -1
	object_event  7,  5, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower4fBurglar, -1
	object_event  2,  6, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower4fSuperNerd, -1
	object_event  0,  5, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, RadioTower4fTeacher, -1
	object_event  6,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerScientistMarc, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  1,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 1, TrainerGruntM27, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  6,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 1, TrainerGruntM28, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
