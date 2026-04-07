	object_const_def ; object_event constants
	const STANDGYM_OKERA
	const STANDGYM_GYMGUY2
	const STANDGYM_COOLTRAINER
	const STANDGYM_COOLTRAINER2
	const STANDGYM_COOLTRAINER3
	const STANDGYM_COOLTRAINER4

StandGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

StandGymOkeraScript:
	faceplayer
	checkevent EVENT_OKERA_OWES_YOU_ONE
	iffalse OkeraOwesYouOneScript
	checkevent EVENT_REMATCH_AVAILABLE_OKERA
	iftrue RematchScriptOkera
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue PostRematchScriptOkera
	faceplayer
	opentext
	checkevent EVENT_BEAT_OKERA
	iftrue .FightDone
	writetext ChuckIntroText1
	waitbutton
	closetext
	winlosstext OkeraLossText, 0
	loadtrainer CHUCK, CHUCK1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OKERA
	opentext
	writetext GetStormBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_STORMBADGE
	setmapscene STAND_CITY, SCENE_STAND_CITY_IMPOSTOR
	checkcode VAR_BADGES
;	scall StandGymActivateRockets
.FightDone:
	checkevent EVENT_ACTUALLY_GOT_TM46_THIEF
	iftrue .AlreadyGotTM
	setevent EVENT_BEAT_COOLTRAINERM_AARON
	setevent EVENT_BEAT_COOLTRAINERF_KELLY
	setevent EVENT_BEAT_COOLTRAINERF_JULIA
	setevent EVENT_BEAT_COOLTRAINERF_IRENE
	writetext ChuckExplainBadgeText
	buttonsound
	verbosegiveitem TM_THIEF
	iffalse .BagFull
	setevent EVENT_ACTUALLY_GOT_TM46_THIEF
	writetext OkeraExplainTMText
	waitbutton
	closetext
	end

.AlreadyGotTM:
	writetext OkeraAfterText
	waitbutton
.BagFull:
	closetext
	end

.WestportRockets:
	jumpstd WestportRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript
	
OkeraOwesYouOneScript:
	opentext
	writetext OkeraGivesYouSomething
	waitbutton
	verbosegiveitem BLACKGLASSES
	iffalse .NoRoom
	writetext OkeraGivesYouSomething2
	waitbutton
	closetext
	setevent EVENT_OKERA_OWES_YOU_ONE
	end
	
.NoRoom:
	closetext
	end


RematchScriptOkera:
	opentext
	writetext OkeraRematchText
	waitbutton
	closetext
	winlosstext OkeraRematchWinText, 0
	loadtrainer CHUCK, CHUCK2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_REMATCH_AVAILABLE_OKERA
	opentext
	writetext OkeraAfterRematchText
	waitbutton
	closetext
	end

PostRematchScriptOkera:
	opentext
	writetext OkeraAfterRematchText
	waitbutton
	closetext
	end

StandGymStatue:
	checkflag ENGINE_STORMBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	trainertotext CHUCK, CHUCK1, MEM_BUFFER_1
	jumpstd GymStatue2Script
	

StandGymGuyScript2:
	faceplayer
	checkevent EVENT_BEAT_OKERA
	iftrue .StandGymGuyWinScript2
	opentext
	writetext StandGymGuyText2
	waitbutton
	closetext
	end

.StandGymGuyWinScript2:
	opentext
	writetext StandGymGuyWinText2
	waitbutton
	closetext
	end
	
TrainerCooltrainerfIrene:
	trainer COOLTRAINERF, IRENE, EVENT_BEAT_COOLTRAINERF_IRENE, CooltrainerfIreneSeenText, CooltrainerfIreneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfIreneAfterText
	waitbutton
	closetext
	end
	
TrainerCooltrainerfJulia:
	trainer COOLTRAINERF, JULIA, EVENT_BEAT_COOLTRAINERF_JULIA, CooltrainerfJuliaSeenText, CooltrainerfJuliaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfJuliaAfterText
	waitbutton
	closetext
	end
	
	

TrainerCooltrainermAaron:
	trainer COOLTRAINERM, AARON, EVENT_BEAT_COOLTRAINERM_AARON, CooltrainermAaronSeenText, CooltrainermAaronBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermAaronAfterBattleText
	waitbutton
	closetext
	end




TrainerCooltrainerfKelly:
	trainer COOLTRAINERF, KELLY, EVENT_BEAT_COOLTRAINERF_KELLY, CooltrainerfKellySeenText, CooltrainerfKellyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfKellyAfterBattleText
	waitbutton
	closetext
	end
	
LightSwitch:
	opentext
	writetext ItsASwitch
	yesorno
	iffalse .no
	closetext
	playsound SFX_MOONLIGHT
	special FadeOutPalettes
	changeblock   23,  31, $3D ; floor
	changeblock   21,  31, $3D ; floor
	reloadmappart
	special FadeInPalettes
	special FadeBlackQuickly
	changeblock   23,  31, $39 ; floor
	changeblock   21,  31, $39 ; floor
	reloadmappart
	special FadeInQuickly
	opentext
	writetext ItsASwitch2
	waitbutton
	closetext
	end
.no
	closetext
	end
	
LightSwitch2:
	opentext
	writetext ItsASwitch
	yesorno
	iffalse .no
	closetext
	playsound SFX_MOONLIGHT
	special FadeOutPalettes
	changeblock   19,  27, $3F ; floor
	changeblock   25,  23, $3D ; floor
	changeblock   27,  23, $19 ; floor
	changeblock   27,  21, $19 ; floor
	changeblock   27,  19, $19 ; floor
	reloadmappart
	special FadeInPalettes
	special FadeBlackQuickly
	changeblock   19,  27, $3B ; floor
	changeblock   25,  23, $39 ; floor
	changeblock   27,  23, $10 ; floor
	changeblock   27,  21, $10 ; floor
	changeblock   27,  19, $10 ; floor
	reloadmappart
	special FadeInQuickly
	opentext
	writetext ItsASwitch2
	waitbutton
	closetext
	end
.no
	closetext
	end
	
LightSwitch3:
	opentext
	writetext ItsASwitch
	yesorno
	iffalse .no
	closetext
	playsound SFX_MOONLIGHT
	special FadeOutPalettes
	changeblock   21,  13, $19 ; floor
	reloadmappart
	special FadeInPalettes
	special FadeBlackQuickly
	changeblock   21,  13, $10 ; floor
	reloadmappart
	special FadeInQuickly
	opentext
	writetext ItsASwitch2
	waitbutton
	closetext
	end
.no
	closetext
	end
	
LightSwitch4:
	opentext
	writetext ItsASwitch
	yesorno
	iffalse .no
	closetext
	playsound SFX_MOONLIGHT
	special FadeOutPalettes
	changeblock   7,  13, $3F ; floor
	changeblock   7,  11, $3F ; floor
	changeblock   7,   9, $3F ; floor
	changeblock  13,  15, $3D ; floor
	reloadmappart
	special FadeInPalettes
	special FadeBlackQuickly
	changeblock   7,  13, $3B ; floor
	changeblock   7,  11, $3B ; floor
	changeblock   7,   9, $3B ; floor
	changeblock  13,  15, $39 ; floor
	reloadmappart
	special FadeInQuickly
	opentext
	writetext ItsASwitch2
	waitbutton
	closetext
	end
.no
	closetext
	end
	
LightSwitch5:
	opentext
	writetext ItsASwitch
	yesorno
	iffalse .no
	closetext
	playsound SFX_MOONLIGHT
	special FadeOutPalettes
	changeblock    3,  7, $3F ; floor
	changeblock    3,  9, $3F ; floor
	changeblock    7,  9, $3F ; floor
	reloadmappart
	special FadeInPalettes
	special FadeBlackQuickly
	changeblock    3,  7, $3B ; floor
	changeblock    3,  9, $3B ; floor
	changeblock    7,  9, $3B ; floor
	reloadmappart
	special FadeInQuickly
	opentext
	writetext ItsASwitch2
	waitbutton
	closetext
	end
.no
	closetext
	end

OkeraGivesYouSomething:
    text "Hey, Mann."

    para "Ich glaube, ich"
    line "schulde dir was"
    para "dafür, dass du die"
    line "Loser von TEAM"
    para "ROCKET rausge-"
    line "schmissen hast."

    para "Hier, ich habe was"
    line "für dich, das dir"
    cont "vielleicht hilft."
	done
	
OkeraGivesYouSomething2:
    text "Vielleicht findest"
    line "du es nützlich,"
    para "wenn du ein paar"
    line "Unlicht-#MON"
    cont "hast."
	done

ItsASwitch:
    text "Es steht"
    line "'DEFEKT' drauf."

    para "Drücken?"
	done
	
ItsASwitch2:
    text "Das Licht bleibt"
    line "nicht an!"
	done
	
CooltrainerfIreneSeenText:
	text "Uargh! Ich"
	line "wurde entdeckt!"
	done

CooltrainerfIreneBeatenText:
	text "Ohhh!"
	line "Zu stark!"
	done

CooltrainerfIreneAfterText:
    text "Die Dunkelheit"
    line "kann einem Angst"
    cont "einjagen."

    para "Aber sie kann auch"
    line "Sicherheit bieten."
	done
	
CooltrainerfJuliaSeenText:
    text "Glaubst du an"
    line "Pech?"
	done

CooltrainerfJuliaBeatenText:
    text "Ich habe auf jeden"
    line "Fall Pech!"
	done

CooltrainerfJuliaAfterText:
    text "Diese Schalter"
    line "haben noch nie"
    para "so richtig"
    line "funktioniert."
	done

OkeraRematchText:
    text "Was willst du?"

    para "Bist du jetzt"
    line "nicht der CHAMP?"

    para "Willst du jetzt"
    line "'nen zweiten ORDEN"
    cont "von mir, oder was?"

    para "Glaub nicht, dass"
    line "ich vor so einer"
    para "Herausforderung"
    line "zurückschrecke!"
	done

OkeraRematchWinText:
	text "Heh."
	done

OkeraAfterRematchText:
    text "Ich hab nicht"
    line "erwartet zu ge-"
    para "winnen, aber ich"
    line "drücke mich nie"
    cont "vor einem Kampf."

    para "Auch nicht, wenn"
    line "alles gegen mich"
    cont "sprechen sollte."

    para "Du bist genauso,"
    line "nicht wahr?"
	done


CooltrainerfKellySeenText:
    text "Was siehst du,"
    line "wenn du deine"
    para "Augen im Dunkeln"
    line "öffnest?"
	done

CooltrainerfKellyBeatenText:
	text "Gut. Dann habe ich"
	line "eben verloren."
	done

CooltrainerfKellyAfterBattleText:
    text "Wo der ARENALEITER"
    line "ist? Er lebt in"
    para "den Schatten,"
    line "jenseits dem, was"
    cont "man sehen kann."
	done

CooltrainermAaronSeenText:
    text "Hast du Angst vor"
    line "der Dunkelheit?"
	done

CooltrainermAaronBeatenText:
	text "Wow…"
	line "Toller Kampf!"
	done

CooltrainermAaronAfterBattleText:
    text "Diese ARENA ist"
    line "nicht wirklich so"
    cont "gruselig."

    para "Das Licht ist nur"
    line "ausgeschaltet."
	done

StandGymGuyText2:
    text Hey, CHAMP in spe!"

    para "Hier drinnen ist"
    line "es echt dunkel!"

    para "RABAN kann ein"
    line "bisschen launisch"
    para "sein und er mag"
    line "die Dunkelheit."

    para "Aber lass dich von"
    line "seinem Alter und"
    para "seinem Verhalten"
    line "nicht täuschen."

    para "Er ist ein echt"
    line "harter Trainer!"
	done
	
StandGymGuyWinText2:
    text "Ich wusste, du"
    line "hast keine Angst"
    cont "im Dunkeln!"
	done

ChuckIntroText1:
    text "Heh."

    para "Du bist einen"
    line "weiten Weg"
    para "von zu Hause"
    line "gereist, was?"

    para "Du hast viele neue"
    line "Dinge erlebt."

    para "Viele Leute"
    line "getroffen."

    para "Viele Herausforde-"
    line "rungen gemeistert."

    para "…"

    para "Aber bist du schon"
    line "der schieren Kraft"
    para "gegenübergetreten,"
    line "die ihre Stärke"
    para "aus der Dunkelheit"
    para "zieht?"

    para "Unlicht-#MON"
    line "besitzen eine"
    para "Kraft, die ihres"
    line "gleichen sucht."

    para "Selbst in der"
    line "kurzen Zeit, in"
    para "der ich ARENA-"
    line "LEITER bin, habe"
    para "ich viel darüber"
    line "gelernt, wozu sie"
    cont "in der Lage sind."

    para "Ich werde es dir"
    line "jetzt zeigen."
	done


OkeraLossText:
    text "Hm. Ich habe"
    line "verloren."

    para "Das habe ich"
    line "nicht erwartet."

    para "Aber es zeigt,"
    line "dass du es würdig"
    para "bist den FINSTER-"
    line "ORDEN zu tragen."
	done

GetStormBadgeText:
	text "<PLAYER> erhält"
	line "FINSTERORDEN."
	done

ChuckExplainBadgeText:
	text "Durch den FINSTER-"
	line "ORDEN gehorchen"
	para "dir alle #MON"
	line "bis LV 70. Dies"
	para "gilt auch für Ge-"
	line "tauschte."

	para "Außerdem können"
	line "deine #MON"
	para "ZERTRÜMMERER auch"
	line "außerhalb eines"
	cont "Kampfes einsetzen."

	para "Ich bin in guter"
	line "Stimmung, also"
	para "kannst du das hier"
	line "auch noch haben."
	done

OkeraExplainTMText:
    text "Das ist RAUB."

    para "Diese Attacke fügt"
    line "Schaden zu und sie"
    cont "kann auch das"
    para "getragene Item des"
    line "Gegners stehlen."
	done

OkeraAfterText:
    text "Das war ein"
    line "guter Kampf."

    para "Deine Herausfor-"
    line "derung war meine"
    cont "Zeit wert."
	done

StandGym_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 26, 35, STAND_CITY, 3
	warp_event 27, 35, STAND_CITY, 12
	warp_event 26, 33, STAND_GYM, 4
	warp_event  7, 35, STAND_GYM, 3

	db 0 ; coord events

	db 7 ; bg events
	bg_event 25, 33, BGEVENT_READ, StandGymStatue
	bg_event 28, 33, BGEVENT_READ, StandGymStatue
	bg_event 24, 28, BGEVENT_READ, LightSwitch
	bg_event 22, 22, BGEVENT_READ, LightSwitch2
	bg_event 20,  8, BGEVENT_READ, LightSwitch3
	bg_event  8, 12, BGEVENT_READ, LightSwitch4
	bg_event  4,  4, BGEVENT_READ, LightSwitch5

	db 6 ; object events
	object_event  6, 33, SPRITE_CHUCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, StandGymOkeraScript, EVENT_OKERA_NOT_IN_GYM
	object_event 29, 33, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, StandGymGuyScript2, -1
	object_event 20, 25, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermAaron, -1
	object_event 23,  9, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfKelly, -1
	object_event 10, 13, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfIrene, -1
	object_event  5,  5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfJulia, -1

