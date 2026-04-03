	object_const_def ; object_event constants
	const ALLOYGYM_JASMINE
	const ALLOYGYM_GYM_GUY
	const ALLOYGYM_BOULDER1
	const ALLOYGYM_BOULDER2
	const ALLOYGYM_BOULDER3
	const ALLOYGYM_GENTLEMAN
	const ALLOYGYM_GENTLEMAN2
	const ALLOYGYM_SUPERNERD

AlloyGym_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_TILES, .BouldersAlloy
	callback MAPCALLBACK_CMDQUEUE, .SetUpStoneTable


.BouldersAlloy:
	checkevent EVENT_ALLOY_GYM_BOULDER_1
	iffalse .skip1alloy
	changeblock 10, 12, $15
.skip1alloy
	checkevent EVENT_ALLOY_GYM_BOULDER_2
	iffalse .skip2alloy
	changeblock 4, 14, $15
.skip2alloy
	checkevent EVENT_ALLOY_GYM_BOULDER_3
	iffalse .skip3alloy
	changeblock 4, 0, $15
.skip3alloy
	return
	

.SetUpStoneTable:
	writecmdqueue .CommandQueue
	return

.CommandQueue:
	cmdqueue CMDQUEUE_STONETABLE, .StoneTable ; check if any stones are sitting on a warp

.StoneTable:
	stonetable 5, ALLOYGYM_BOULDER1, .Boulder1
	stonetable 4, ALLOYGYM_BOULDER2, .Boulder2
	stonetable 3, ALLOYGYM_BOULDER3, .Boulder3
	db -1 ; end

.Boulder1:
	disappear ALLOYGYM_BOULDER1
	pause 30
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 10, 12, $15
	opentext
	writetext AlloyGymBoulderFilled
	waitbutton
	closetext
	setevent EVENT_ALLOY_GYM_BOULDER_1
	end

.Boulder2:
	disappear ALLOYGYM_BOULDER2
	pause 30
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $15
	opentext
	writetext AlloyGymBoulderFilled
	waitbutton
	closetext
	setevent EVENT_ALLOY_GYM_BOULDER_2
	end

.Boulder3:
	disappear ALLOYGYM_BOULDER3
	pause 30
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 0, $15
	opentext
	writetext AlloyGymBoulderFilled
	waitbutton
	closetext
	setevent EVENT_ALLOY_GYM_BOULDER_3
	end

AlloyGymJasmineScript:
	faceplayer
	checkevent EVENT_REMATCH_AVAILABLE_JASMINE
	iftrue RematchScriptJasmine
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue PostRematchScriptJasmine
	opentext
	checkevent EVENT_BEAT_JASMINE
	iftrue .FightDone
	writetext Jasmine_SteelTypeIntro
	waitbutton
	closetext
	winlosstext Jasmine_BetterTrainer, 0
	loadtrainer JASMINE, JASMINE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_JASMINE
	opentext
	writetext Text_ReceivedMineralBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MINERALBADGE
	checkcode VAR_BADGES
	scall AlloyGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM23_IRON_TAIL
	iftrue .GotIronTail
	writetext Jasmine_BadgeSpeech
	buttonsound
	verbosegiveitem TM_IRON_TAIL
	iffalse .NoRoomForIronTail
	setevent EVENT_GOT_TM23_IRON_TAIL
	writetext Jasmine_IronTailSpeech
	waitbutton
	closetext
	end

.GotIronTail:
	writetext Jasmine_GoodLuck
	waitbutton
.NoRoomForIronTail:
	closetext
	end
	
RematchScriptJasmine:
	opentext
	writetext JasmineRematchText
	waitbutton
	closetext
	winlosstext JasmineRematchWinText, 0
	loadtrainer JASMINE, JASMINE2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_REMATCH_AVAILABLE_JASMINE
	opentext
	writetext JasmineAfterRematchText
	waitbutton
	closetext
	end

PostRematchScriptJasmine:
	opentext
	writetext JasmineAfterRematchText
	waitbutton
	closetext
	end

JasmineRematchText:
    text "Ich wusste, du"
    line "packst die #MON"
    cont "LIGA!"

    para "Dann zeig mir mal,"
    line "wie sehr du dich"
    para "seit dem letzten"
    line "Mal verbessert"
    cont "hast!"
	done

JasmineRematchWinText:
    text "Ich bin fest davon"
    line "überzeugt, dass du"
    para "der bessere Trai-"
    line "ner bist!"
	done

JasmineAfterRematchText:
	text "Ich hoffe, du"
	line "meisterst auch"
	para "jede weitere"
	line "Herausforderung!"
	done


AlloyGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .WestportRockets
	end

.WestportRockets:
	jumpstd WestportRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

AlloyGymGuyScript:
	faceplayer
	checkevent EVENT_BEAT_JASMINE
	iftrue .AlloyGymGuyWinScript
	opentext
	writetext AlloyGymGuyText
	waitbutton
	closetext
	end

.AlloyGymGuyWinScript:
	opentext
	writetext AlloyGymGuyWinText
	waitbutton
	closetext
	end


AlloyGymStatue:
	checkflag ENGINE_MINERALBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	trainertotext JASMINE, JASMINE1, MEM_BUFFER_1
	jumpstd GymStatue2Script

AlloyGymBoulder:
	jumpstd StrengthBoulderScript
	

TrainerGentlemanPreston:
	trainer GENTLEMAN, PRESTON, EVENT_BEAT_GENTLEMAN_PRESTON, GentlemanPrestonSeenText, GentlemanPrestonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanPrestonAfterBattleText
	waitbutton
	closetext
	end


TrainerGentlemanAlfred:
	trainer GENTLEMAN, ALFRED, EVENT_BEAT_GENTLEMAN_ALFRED, GentlemanAlfredSeenText, GentlemanAlfredBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanAlfredAfterBattleText
	waitbutton
	closetext
	end


TrainerSuperNerdTom:
	trainer SUPER_NERD, TOM, EVENT_BEAT_SUPER_NERD_TOM, SuperNerdTomSeenText, SuperNerdTomBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SuperNerdTomAfterBattleText
	waitbutton
	closetext
	end


Jasmine_SteelTypeIntro:
    text "Nur diejenigen,"
    line "die gezeigt haben,"
    line "dass sie es mit"
    para "den #MON meiner"
    line "Trainer aufnehmen"
    para "können, haben sich"
    line "bewiesen, würdige"
    para "Gegner für die"
    line "unglaubliche Ver-"
    para "teidigung meiner"
    line "STAHL-#MON"
    cont "zu sein."

    para "Du hast dich gut"
    line "gegen sie geschla-"
    para "gen. Aber bist du"
    line "bereit für mich?"
	done

Jasmine_BetterTrainer:
	text "…Du bist ein bes-"
	line "serer Trainer als"

	para "ich. Das betrifft"
	line "sowohl Geschick,"

	para "als auch Fein-"
	line "gefühl."

	para "In Übereinstimmung"
	line "mit den Regeln der"

	para "LIGA überreiche"
	line "ich dir diesen"
	cont "ORDEN."
	done

Text_ReceivedMineralBadge:
	text "<PLAYER> erhält"
	line "STAHLORDEN."
	done

Jasmine_BadgeSpeech:
	text "Der STAHLORDEN"
	line "erhöht die VERT"
	cont "deiner #MON."

	para "Außerdem können"
	line "deine #MON"

	para "FLIEGEN auch"
	line "außerhalb eines"
	cont "Kampfes einsetzen."

	para "Das hast du dir"
	line "auch verdient."
	done

Text_ReceivedTM09:
	text "<PLAYER> erhält"
	line "TM09."
	done

Jasmine_IronTailSpeech:
	text "Mit dieser TM"
	line "kannst du deinen"
	cont "#MON EISEN-"
	cont "SCHWEIF lehren."
	done

Jasmine_GoodLuck:
	text "Good luck with"
	line "the rest of your"
	cont "LEAGUE challenge."
	para "I expect you to"
	line "make it to the"
	cont "end."
	done

AlloyGymGuyText:
	text "JASMIN setzt den"
	line "neu entdeckten Typ"
	cont "Stahl ein."

	para "Ich weiß nicht"
	line "viel darüber."
	done

AlloyGymGuyWinText:
	text "Das war großartig!"

	para "Der Typ Stahl,"
	line "was?"

	para "Das war eine un-"
	line "heimliche Begeg-"
	cont "nung der unbe-"
	cont "kannten Art."
	done

AlloyGymBoulderFilled:
	text "Der Felsen füllt"
	line "das Loch!"
	done

GentlemanPrestonSeenText:
    text "Bist du jemals"
    line "gegen die Vertei-"
    para "digungen von"
    line "STAHL-#MON"
    cont "angetreten?"
	done

GentlemanPrestonBeatenText:
    text "Ein guter Trainer"
    line "ist gegen jeden"
    cont "Typ gerüstet."
	done

GentlemanPrestonAfterBattleText:
    text "STAHL-#MON"
    line "haben eine hohe"
    cont "VERTEIDIGUNG."

    para "Sie sind aber"
    line "nicht undurch-"
    cont "dringlich."
	done


GentlemanAlfredSeenText:
    text "In dieser ARENA"
    line "benutzte man"
    para "früher GESTEIN-"
    line "#MON."

    para "Aber JASMIN fand"
    line "den neuen Typ"
    cont "Stahl reizvoller."
	done

GentlemanAlfredBeatenText:
	text "Gute Vorstellung!"
	done

GentlemanAlfredAfterBattleText:
    text "Bis vor kurzem,"
    line "wusste man nicht,"
    para "dass ONIX eine"
    line "Weiterentwicklung"
    cont "hat."
	done
	
SuperNerdTomSeenText:
    text "Der Typ Stahl ist"
    line "selten!"

    para "Was bedeutet, dass"
    line "ich ihn natürlich"
    cont "benutzen muss!"
	done

SuperNerdTomBeatenText:
	text "Siege sind auch"
	line "selten…"
	done

SuperNerdTomAfterBattleText:
	text "Ich interessiere"
	line "mich nur für"
	cont "seltene Dinge."
	done

AlloyGym_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 16, 15, ALLOY_CITY, 2
	warp_event 17, 15, ALLOY_CITY, 13
	warp_event  4,  1, ALLOY_CITY, 1; boulder 3
	warp_event  4, 15, ALLOY_CITY, 1; boulder 2
	warp_event 10, 13, ALLOY_CITY, 1; boulder 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 15, 13, BGEVENT_READ, AlloyGymStatue
	bg_event 18, 13, BGEVENT_READ, AlloyGymStatue

	db 8 ; object events
	object_event  1,  5, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, AlloyGymJasmineScript, -1
	object_event 19, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AlloyGymGuyScript, -1
	object_event 16,  9, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AlloyGymBoulder, EVENT_ALLOY_GYM_BOULDER_1
	object_event 10, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AlloyGymBoulder, EVENT_ALLOY_GYM_BOULDER_2
	object_event 12,  3, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AlloyGymBoulder, EVENT_ALLOY_GYM_BOULDER_3
	object_event 18,  7, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerGentlemanPreston, -1
	object_event 16,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 1, TrainerGentlemanAlfred, -1
	object_event 11,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 1, TrainerSuperNerdTom, -1

