;It seems like the branching scripts for whether you win or lose are backwards. Apparently this is
;also the case for ones that were in the final game, like rival 1 in crown city. But it's not
;apparent there because the text is the same in either case
	object_const_def ; object_event constants
	const BATTLECLUB_SUNDAY_FLEDGLING
	const BATTLECLUB_MONDAY_YOUNGSTER
	const BATTLECLUB_TUESDAY_LASS
	const BATTLECLUB_WEDNESDAY_SPORTSMAN
	const BATTLECLUB_THURSDAY_INSTRUCTOR
	const BATTLECLUB_FRIDAY_COOLTRAINERF
	const BATTLECLUB_SATURDAY_COOLTRAINERM
	const BATTLECLUB_RECEPTIONIST
	const BATTLECLUB_POKEFANM
	const BATTLECLUB_JANINE
	const BATTLECLUB_YOUNGSTER
	const BATTLECLUB_GENTLEMAN
	const BATTLECLUB_LASS
	const BATTLECLUB_YOUNGSTER2
	const BATTLECLUB_GRANNY


KantoBattleClubB1F_MapScripts:
	db 0 ; scene scripts

	db 0  ; callbacks
	
BattleClubScriptSun:
	faceplayer
	opentext
	checkcode VAR_WEEKDAY
	ifequal SUNDAY, .SundayBattleContinue
	jump BattleClubOver
	end

.SundayBattleContinue
	checkflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	iftrue .AlreadyBattledSunday
	writetext SundayTrainerGreeting
	yesorno
	iffalse .NoBattleNowSunday
	writetext TrainerAcceptsChallenge
	waitbutton
	closetext
	turnobject BATTLECLUB_SUNDAY_FLEDGLING, LEFT
	checkcode VAR_FACING
	ifequal LEFT, .SundayLeftWalk
	ifequal RIGHT, .SundayRightWalk
	ifequal UP, .SundayUpWalk
	ifequal DOWN, .SundayDownWalk

.SundayLeftWalk
	applymovement PLAYER, PlayerWalksToOtherSideLeft
	jump .SundayBattleContinue2
	end
	
.SundayRightWalk
	applymovement PLAYER, PlayerWalksToOtherSideRight
	jump .SundayBattleContinue2
	end
	
.SundayUpWalk
	applymovement PLAYER, PlayerWalksToOtherSideUp
	jump .SundayBattleContinue2
	end
	
.SundayDownWalk
	applymovement PLAYER, PlayerWalksToOtherSideDown
	jump .SundayBattleContinue2
	end
	
.NoBattleNowSunday
	writetext NoBattleNowSundayText
	waitbutton
	closetext
	end
	
.SundayBattleContinue2
	winlosstext SundayWinText, SundayLossText
	loadtrainer FLEDGLING, EARNEST
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictoriousSunday
	jump .AfterYourDefeatSunday
	end
	
.AfterVictoriousSunday
	opentext
	writetext SundayAfterVictoriousText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AfterYourDefeatSunday
	opentext
	writetext SundayAfterYourDefeatText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AlreadyBattledSunday
	jump BattleClubOver
	end
	
BattleClubScriptMon:
	faceplayer
	opentext
	checkcode VAR_WEEKDAY
	ifequal MONDAY, .MondayBattleContinue
	jump BattleClubOver
	end

.MondayBattleContinue
	checkflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	iftrue .AlreadyBattledMonday
	writetext MondayTrainerGreeting
	yesorno
	iffalse .NoBattleNowMonday
	writetext TrainerAcceptsChallenge
	waitbutton
	closetext
	turnobject BATTLECLUB_MONDAY_YOUNGSTER, LEFT
	checkcode VAR_FACING
	ifequal LEFT, .MondayLeftWalk
	ifequal RIGHT, .MondayRightWalk
	ifequal UP, .MondayUpWalk
	ifequal DOWN, .MondayDownWalk

.MondayLeftWalk
	applymovement PLAYER, PlayerWalksToOtherSideLeft
	jump .MondayBattleContinue2
	end
	
.MondayRightWalk
	applymovement PLAYER, PlayerWalksToOtherSideRight
	jump .MondayBattleContinue2
	end
	
.MondayUpWalk
	applymovement PLAYER, PlayerWalksToOtherSideUp
	jump .MondayBattleContinue2
	end
	
.MondayDownWalk
	applymovement PLAYER, PlayerWalksToOtherSideDown
	jump .MondayBattleContinue2
	end
	
.NoBattleNowMonday
	writetext NoBattleNowMondayText
	waitbutton
	closetext
	end
	
.MondayBattleContinue2
	winlosstext MondayWinText, MondayLossText
	loadtrainer YOUNGSTER, JIMMY
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictoriousMonday
	jump .AfterYourDefeatMonday
	end
	
.AfterVictoriousMonday
	opentext
	writetext MondayAfterVictoriousText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AfterYourDefeatMonday
	opentext
	writetext MondayAfterYourDefeatText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AlreadyBattledMonday
	jump BattleClubOver
	end
	
BattleClubScriptTues:
	faceplayer
	opentext
	checkcode VAR_WEEKDAY
	ifequal TUESDAY, .TuesdayBattleContinue
	jump BattleClubOver
	end

.TuesdayBattleContinue
	checkflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	iftrue .AlreadyBattledTuesday
	writetext TuesdayTrainerGreeting
	yesorno
	iffalse .NoBattleNowTuesday
	writetext TrainerAcceptsChallenge
	waitbutton
	closetext
	turnobject BATTLECLUB_TUESDAY_LASS, LEFT
	checkcode VAR_FACING
	ifequal LEFT, .TuesdayLeftWalk
	ifequal RIGHT, .TuesdayRightWalk
	ifequal UP, .TuesdayUpWalk
	ifequal DOWN, .TuesdayDownWalk

.TuesdayLeftWalk
	applymovement PLAYER, PlayerWalksToOtherSideLeft
	jump .TuesdayBattleContinue2
	end
	
.TuesdayRightWalk
	applymovement PLAYER, PlayerWalksToOtherSideRight
	jump .TuesdayBattleContinue2
	end
	
.TuesdayUpWalk
	applymovement PLAYER, PlayerWalksToOtherSideUp
	jump .TuesdayBattleContinue2
	end
	
.TuesdayDownWalk
	applymovement PLAYER, PlayerWalksToOtherSideDown
	jump .TuesdayBattleContinue2
	end
	
.NoBattleNowTuesday
	writetext NoBattleNowTuesdayText
	waitbutton
	closetext
	end
	
.TuesdayBattleContinue2
	winlosstext TuesdayWinText, TuesdayLossText
	loadtrainer LASS, MICHELLE
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictoriousTuesday
	jump .AfterYourDefeatTuesday
	end
	
.AfterVictoriousTuesday
	opentext
	writetext TuesdayAfterVictoriousText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AfterYourDefeatTuesday
	opentext
	writetext TuesdayAfterYourDefeatText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AlreadyBattledTuesday
	jump BattleClubOver
	end

	
BattleClubScriptWed:
	faceplayer
	opentext
	checkcode VAR_WEEKDAY
	ifequal WEDNESDAY, .WednesdayBattleContinue
	jump BattleClubOver
	end

.WednesdayBattleContinue
	checkflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	iftrue .AlreadyBattledWednesday
	writetext WednesdayTrainerGreeting
	yesorno
	iffalse .NoBattleNowWednesday
	writetext TrainerAcceptsChallenge
	waitbutton
	closetext
	turnobject BATTLECLUB_WEDNESDAY_SPORTSMAN, LEFT
	checkcode VAR_FACING
	ifequal LEFT, .WednesdayLeftWalk
	ifequal RIGHT, .WednesdayRightWalk
	ifequal UP, .WednesdayUpWalk
	ifequal DOWN, .WednesdayDownWalk

.WednesdayLeftWalk
	applymovement PLAYER, PlayerWalksToOtherSideLeft
	jump .WednesdayBattleContinue2
	end
	
.WednesdayRightWalk
	applymovement PLAYER, PlayerWalksToOtherSideRight
	jump .WednesdayBattleContinue2
	end
	
.WednesdayUpWalk
	applymovement PLAYER, PlayerWalksToOtherSideUp
	jump .WednesdayBattleContinue2
	end
	
.WednesdayDownWalk
	applymovement PLAYER, PlayerWalksToOtherSideDown
	jump .WednesdayBattleContinue2
	end
	
.NoBattleNowWednesday
	writetext NoBattleNowWednesdayText
	waitbutton
	closetext
	end
	
.WednesdayBattleContinue2
	winlosstext WednesdayWinText, WednesdayLossText
	loadtrainer SPORTSMAN, MANNY
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictoriousWednesday
	jump .AfterYourDefeatWednesday
	end
	
.AfterVictoriousWednesday
	opentext
	writetext WednesdayAfterVictoriousText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AfterYourDefeatWednesday
	opentext
	writetext WednesdayAfterYourDefeatText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AlreadyBattledWednesday
	jump BattleClubOver
	end

BattleClubScriptThurs:
	faceplayer
	opentext
	checkcode VAR_WEEKDAY
	ifequal THURSDAY, .ThursdayBattleContinue
	jump BattleClubOver
	end

.ThursdayBattleContinue
	checkflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	iftrue .AlreadyBattledThursday
	writetext ThursdayTrainerGreeting
	yesorno
	iffalse .NoBattleNowThursday
	writetext TrainerAcceptsChallenge
	waitbutton
	closetext
	turnobject BATTLECLUB_THURSDAY_INSTRUCTOR, LEFT
	checkcode VAR_FACING
	ifequal LEFT, .ThursdayLeftWalk
	ifequal RIGHT, .ThursdayRightWalk
	ifequal UP, .ThursdayUpWalk
	ifequal DOWN, .ThursdayDownWalk

.ThursdayLeftWalk
	applymovement PLAYER, PlayerWalksToOtherSideLeft
	jump .ThursdayBattleContinue2
	end
	
.ThursdayRightWalk
	applymovement PLAYER, PlayerWalksToOtherSideRight
	jump .ThursdayBattleContinue2
	end
	
.ThursdayUpWalk
	applymovement PLAYER, PlayerWalksToOtherSideUp
	jump .ThursdayBattleContinue2
	end
	
.ThursdayDownWalk
	applymovement PLAYER, PlayerWalksToOtherSideDown
	jump .ThursdayBattleContinue2
	end
	
.NoBattleNowThursday
	writetext NoBattleNowThursdayText
	waitbutton
	closetext
	end
	
.ThursdayBattleContinue2
	winlosstext ThursdayWinText, ThursdayLossText
	loadtrainer INSTRUCTOR, MORGAN
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictoriousThursday
	jump .AfterYourDefeatThursday
	end
	
.AfterVictoriousThursday
	opentext
	writetext ThursdayAfterVictoriousText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AfterYourDefeatThursday
	opentext
	writetext ThursdayAfterYourDefeatText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AlreadyBattledThursday
	jump BattleClubOver
	end


BattleClubScriptFri:
	faceplayer
	opentext
	checkcode VAR_WEEKDAY
	ifequal FRIDAY, .FridayBattleContinue
	jump BattleClubOver
	end

.FridayBattleContinue
	checkflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	iftrue .AlreadyBattledFriday
	writetext FridayTrainerGreeting
	yesorno
	iffalse .NoBattleNowFriday
	writetext TrainerAcceptsChallenge
	waitbutton
	closetext
	turnobject BATTLECLUB_FRIDAY_COOLTRAINERF, LEFT
	checkcode VAR_FACING
	ifequal LEFT, .FridayLeftWalk
	ifequal RIGHT, .FridayRightWalk
	ifequal UP, .FridayUpWalk
	ifequal DOWN, .FridayDownWalk

.FridayLeftWalk
	applymovement PLAYER, PlayerWalksToOtherSideLeft
	jump .FridayBattleContinue2
	end
	
.FridayRightWalk
	applymovement PLAYER, PlayerWalksToOtherSideRight
	jump .FridayBattleContinue2
	end
	
.FridayUpWalk
	applymovement PLAYER, PlayerWalksToOtherSideUp
	jump .FridayBattleContinue2
	end
	
.FridayDownWalk
	applymovement PLAYER, PlayerWalksToOtherSideDown
	jump .FridayBattleContinue2
	end
	
.NoBattleNowFriday
	writetext NoBattleNowFridayText
	waitbutton
	closetext
	end
	
.FridayBattleContinue2
	winlosstext FridayWinText, FridayLossText
	loadtrainer COOLTRAINERF, KATE
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictoriousFriday
	jump .AfterYourDefeatFriday
	end
	
.AfterVictoriousFriday
	opentext
	writetext FridayAfterVictoriousText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AfterYourDefeatFriday
	opentext
	writetext FridayAfterYourDefeatText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AlreadyBattledFriday
	jump BattleClubOver
	end
	

BattleClubScriptSat:
	faceplayer
	opentext
	checkcode VAR_WEEKDAY
	ifequal SATURDAY, .SaturdayBattleContinue
	jump BattleClubOver
	end

.SaturdayBattleContinue
	checkflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	iftrue .AlreadyBattledSaturday
	writetext SaturdayTrainerGreeting
	yesorno
	iffalse .NoBattleNowSaturday
	writetext TrainerAcceptsChallenge
	waitbutton
	closetext
	turnobject BATTLECLUB_SATURDAY_COOLTRAINERM, LEFT
	checkcode VAR_FACING
	ifequal LEFT, .SaturdayLeftWalk
	ifequal RIGHT, .SaturdayRightWalk
	ifequal UP, .SaturdayUpWalk
	ifequal DOWN, .SaturdayDownWalk

.SaturdayLeftWalk
	applymovement PLAYER, PlayerWalksToOtherSideLeft
	jump .SaturdayBattleContinue2
	end
	
.SaturdayRightWalk
	applymovement PLAYER, PlayerWalksToOtherSideRight
	jump .SaturdayBattleContinue2
	end
	
.SaturdayUpWalk
	applymovement PLAYER, PlayerWalksToOtherSideUp
	jump .SaturdayBattleContinue2
	end
	
.SaturdayDownWalk
	applymovement PLAYER, PlayerWalksToOtherSideDown
	jump .SaturdayBattleContinue2
	end
	
.NoBattleNowSaturday
	writetext NoBattleNowSaturdayText
	waitbutton
	closetext
	end
	
.SaturdayBattleContinue2
	winlosstext SaturdayWinText, SaturdayLossText
	loadtrainer COOLTRAINERM, ALLEN
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictoriousSaturday
	jump .AfterYourDefeatSaturday
	end
	
.AfterVictoriousSaturday
	opentext
	writetext SaturdayAfterVictoriousText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AfterYourDefeatSaturday
	opentext
	writetext SaturdayAfterYourDefeatText
	waitbutton
	closetext
	setevent EVENT_BEAT_COOLTRAINERM_ALLEN
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AlreadyBattledSaturday
	jump BattleClubOver
	end

BattleClubOver:
	writetext TrainerClubDone
	waitbutton
	closetext
	end
	
BattleClubReceptionistScript:
	jumptextfaceplayer BattleClubReceptionistText
	
BattleClubPokefanMScript:
	jumptextfaceplayer BattleClubPokefanMText

BattleClubJanineScript:
	jumptextfaceplayer BattleClubJanineText
	
BattleClubYoungsterScript:
	checkevent EVENT_BEAT_COOLTRAINERM_ALLEN
	iftrue .WowYouBeatAllen
	faceplayer
	opentext
	writetext BattleClubYoungsterText
	waitbutton
	closetext
	end

.WowYouBeatAllen
	faceplayer
	opentext
	checkevent EVENT_GOT_TOGEPI_FROM_TRAINER_CLUB
	iftrue .AlreadyGotTogepi
	checkevent EVENT_ALREADY_GOT_CONGRATS_FROM_YOUNGSTER
	iftrue .AlreadyGotCongrats
	writetext BattleClubYoungsterText
	setevent EVENT_ALREADY_GOT_CONGRATS_FROM_YOUNGSTER
	waitbutton
.AlreadyGotCongrats
	writetext IHaveAWeirdEggText
	yesorno
	iffalse .DontTakeTogepi
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullTogepi
	writetext PlayerGotTogepiText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke TOGEPI, 5
	writetext GiveTogepiText
	waitbutton
	closetext
	setevent EVENT_GOT_TOGEPI_FROM_TRAINER_CLUB
	end
	
.AlreadyGotTogepi
	writetext BattleClubYoungsterTextBeat
	waitbutton
	closetext
	end
	
.DontTakeTogepi
	writetext NoTogepiText
	waitbutton
	closetext
	end
	
.PartyFullTogepi
	writetext PartyFullTogepiText
	waitbutton
	closetext
	end


BattleClubGentlemanScript:
	jumptextfaceplayer BattleClubGentlemanText
	
	
BattleClubLassScript:
	jumptextfaceplayer BattleClubLassText
	
BattleClubYoungster2Script:
	jumptextfaceplayer BattleClubYoungster2Text
	
BattleClubGrannyScript:
	jumptextfaceplayer BattleClubGrannyText
	
PlayerWalksToOtherSideLeft:
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	turn_head RIGHT
	step_end
	
PlayerWalksToOtherSideRight:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head RIGHT
	step_end
	
PlayerWalksToOtherSideUp:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	turn_head RIGHT
	step_end
	
PlayerWalksToOtherSideDown:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	turn_head RIGHT
	step_end
	
PartyFullTogepiText:
	text "Oh, warte!"
	para "Du musst erst"
	line "Platz schaffen!"
	done
	
NoTogepiText:
	text "Bist du sicher?"

	para "Ich dachte, du"
	line "möchtest es haben."
	done
	
GiveTogepiText:
	text "Bei dir ist es"
	line "sicher bestens"
	cont "aufgehoben."
	done
	
IHaveAWeirdEggText:
	text "Wow! Du hast echt"
	line "diesen superstarken"
	para "ASS-TRAINER"
	line "besiegt?"

	para "Unglaublich!"

	para "Hör mal, ich hatte"
	line "so dieses seltsame"
	cont "#MON-EI."

	para "Es ist geschlüpft,"
	line "aber es sieht"
	para "immer noch wie ein"
	line "EI aus!"

	para "Ein echt seltsames"
	line "#MON."

	para "Ich glaube es ist"
	line "bei einem Top-"
	para "Trainer, wie dir,"
	line "besser aufgehoben."

	para "Willst du es?"
	done
	
PlayerGotTogepiText:
	text "<PLAYER> erhält"
	line "TOGEPI."
	done
	
BattleClubYoungsterTextBeat:
	text "Ehrlich, wie hast"
	line "du den Kerl"
	cont "besiegt?"

	para "Echt krass!"
	done
	
BattleClubGrannyText:
	text "Früher war ich"
	line "eine starke"
	cont "Trainerin."

	para "Heute kämpfe ich"
	line "nicht mehr so"
	cont "oft."

	para "Aber es ist immer"
	line "schön, hierher zu"
	para "kommen und den"
	line "starken Trainern"
	para "von heute beim"
	line "Kämpfen zuzusehen."
	done
	
BattleClubYoungster2Text:
	text "Ich bin hier, um"
	line "meinen kleinen"
	cont "Bruder anzufeuern."

	para "Er macht das noch"
	line "nicht so lange."

	para "Vielleicht könn-"
	line "test du gegen ihn"
	para "mit ein paar"
	line "schwächeren"
	cont "#MON kämpfen?"
	done
	
BattleClubLassText:
    text "Hier sind jeden"
    line "Tag verschiedene"
    cont "Trainer."

    para "Die stärkeren"
    line "kommen eher gegen"
    cont "Ende der Woche."
	done
	
BattleClubRockerText:
	text "Ich bin völlig"
	line "platt von den"
	cont "Kämpfen."

	para "Wenn du jetzt"
	line "eine Herausfor-"
	cont "derung suchst,"
	para "könntest du den"
	line "SPORTLER da drüben"
	cont "ja mal fragen."
	done
	
BattleClubGentlemanText:
    text "Ich muss sagen,"
    line "dieses Etablisse-"
    cont "ment ist großartig"
    para "für Trainer, die"
    line "nicht viel reisen"
    para "möchten, aber"
    line "trotzdem neue"
    para "Herausforderungen"
    line "suchen."
	done
	
BattleClubYoungsterText:
	text "Neulich war ein"
	line "ASS-TRAINER hier."

	para "Seine #MON"
	line "waren unglaublich"
	cont "stark."

	para "Ich hatte keine"
	line "Chance gegen ihn."

	para "Ich glaube, er"
	line "kommt samstags."

	para "Kannst du ihn"
	line "besiegen?"

	para "Sag mir Bescheid,"
	line "wenn du es"
	cont "geschafft hast!"
	done
	
BattleClubJanineText:
	text "Einige Trainer"
	line "hier sind zu"
	cont "tough!"

	para "Ich muss stärker"
	line "werden."
	done
	
BattleClubPokefanMText:
	text "Alle lieben einen"
	line "guten Kampf!"

	para "Manchmal macht das"
	line "Zuschauen allein"
	cont "schon Spaß!"
	done
	
BattleClubReceptionistText:
	text "Willkommen im"
	line "KANTO-KAMPFCLUB."

	para "Wir ziehen ernst-"
	line "hafte Trainer"
	cont "jeder Stärke an."

	para "Ein paar echt"
	line "starke Trainer"
	para "schauen hier"
	line "regelmäßig"
	cont "vorbei."

	para "Hab keine Angst,"
	line "sie herauszufor-"
	cont "dern!"
	done
	
NoBattleNowSundayText:
	text "Ach, Mann!"

	para "Vielleicht ein"
	line "andermal."
	done
	
SundayAfterYourDefeatText:; backwards
    text "Ich bin noch nicht"
    line "so stark, aber ich"
    cont "arbeite daran!"
	done
	
SundayAfterVictoriousText:; backwards
    text "Meine #MON"
    line "werden jeden Tag"
    cont "stärker!"
	done
	
SundayWinText:
	text "Wow, du bist"
	line "echt stark!"
	done
	
SundayLossText:
	text "Ich hab gewonnen!"
	line "Wow!"
	done

	
SundayTrainerGreeting:
    text "Hey! Ich bin noch"
    line "ein Anfänger was"
    para "#MON und Kämpfe"
    line "angeht."

    para "Aber ich träume"
    line "davon, eines Tages"
    para "ein großartiger"
    line "Trainer zu werden!"

    para "Ich setze #MON"
    line "ein, die um"
    cont "Level 10 sind."

    para "Möchtest du gegen"
    line "mich kämpfen?"
	done
	
NoBattleNowMondayText:
	text "Ich warte hier,"
	line "falls du es dir"
	cont "anders überlegst!"
	done

MondayAfterYourDefeatText:; backwards
	text "Sieht aus, als"
	line "müsste ich mehr"
	cont "trainieren!"
	done
	
MondayAfterVictoriousText:; backwards
	text "Mein Training"
	line "zahlt sich aus!"
	done
	
MondayWinText:
	text "Mann, bist du gut!"
	done
	
MondayLossText:
	text "Oh ja!"
	done
	
MondayTrainerGreeting:
    text "Yo, möchtest du"
    line "kämpfen?"

    para "Ich werde langsam"
    line "echt gut darin,"
    cont "glaube ich."

    para "Ich setze #MON"
    line "ein, die um"
    cont "Level 20 sind."

    para "Möchtest du gegen"
    line "mich kämpfen?"
	done
	
NoBattleNowTuesdayText:
	text "Ich bin wohl zu"
	line "gut, was?"
	done
	
TuesdayAfterYourDefeatText:; backwards
	text "Wow, du bist hier"
	line "wohl der Starke!"
	done
	
TuesdayAfterVictoriousText:; backwards
	text "Ich werde echt gut"
	line "darin!"
	done
	
TuesdayWinText:
	text "Woah, Moment!"
	done
	
TuesdayLossText:
	text "Das schaffe ich!"
	done

	
TuesdayTrainerGreeting:
    text "Hey, du!"

    para "Ich suche nach"
    line "einem Kampf!"

    para "Ich glaube ich bin"
    line "ziemlich stark."

    para "Ich setze #MON"
    line "ein, die um"
    cont "Level 30 sind."

    para "Meinst du, du"
    line "kannst es mit mir"
    cont "aufnehmen?"
	done
	
	
NoBattleNowWednesdayText:
	text "Schon okay!"

	para "Ich bleibe noch"
	line "etwas hier."
	done
	
WednesdayAfterYourDefeatText:; backwards
	text "Hey, du bist auch"
	line "ziemlich gut!"
	done
	
WednesdayAfterVictoriousText:; backwards
	text "Meine #MON sind"
	line "immer bereit für"
	cont "einen Kampf!"
	done
	
WednesdayWinText:
	text "Hey, das war gut!"
	done
	
WednesdayLossText:
	text "Was für ein"
	line "Workout!"
	done

WednesdayTrainerGreeting:
    text "Hi! Ich war gerade"
    line "mit meinen #MON"
    cont "eine Runde laufen!"

    para "Ich bin ziemlich"
    line "fit, was Kämpfe"
    cont "angeht."

    para "Meine #MON sind"
    line "um Level 40."

    para "Willst du mich"
    line "herausfordern?"
	done
	
	
NoBattleNowThursdayText:
	text "Das ist auch O.K."
	done
	
ThursdayAfterYourDefeatText:; backwards
	text "Das war eine gute"
	line "Herausforderung."
	done
	
ThursdayAfterVictoriousText:; backwards
    text "Meine #MON"
    line "haben ihre Stärke"
    cont "bewiesen!"
	done
	
ThursdayWinText:
	text "Sehr gut."
	done
	
ThursdayLossText:
	text "Ah, Triumph."
	done

	
ThursdayTrainerGreeting:
	text "Guten Tag."

	para "Ich habe viel"
	line "Kampferfahrung."

	para "Mein Team ist um"
	line "Level 50."

	para "Möchtest du einen"
	line "Kampf wagen?"
	done
	

NoBattleNowFridayText:
	text "Schon okay, die"
	line "meisten trauen"
	cont "sich nicht."
	done
	
FridayAfterYourDefeatText:; backwards
	text "Wow, du hast mich"
	line "besiegt!"
	done
	
FridayAfterVictoriousText:; backwards
	text "Ein weiterer Sieg"
	line "für mein Team!"
	done
	
FridayWinText:
	text "Ich bin geschockt!"
	done
	
FridayLossText:
	text "Das habe ich super"
	lin "gemacht!"
	done

	
FridayTrainerGreeting:
    text "Na, hallo!"

    para "Ich möchte nicht"
    line "angeben, aber ich"
    cont "bin verdammt gut."

    para "Ich habe #MON"
    line "um Level 60."

    para "Denkst du, du"
    line "kannst es mit"
    cont "ihnen aufnehmen?"
	done
	

NoBattleNowSaturdayText:
    text "Eines Tages bist"
    line "du vielleicht gut"
    para "genug, um mich"
    line "herauszufordern."
	done
	
SaturdayAfterYourDefeatText:; backwards
    text "Du gehörst zu den"
    line "wenigen, die mich"
    cont "besiegt haben."

    para "Gut gemacht."
	done
	
SaturdayAfterVictoriousText:; backwards
	text "Dieses Ergebnis"
	line "war zu erwarten."
	done
	
SaturdayWinText:
	text "Unglaublich!"
	done
	
SaturdayLossText:
	text "Wieder ein Sieg"
	line "für mich!"
	done

	
;SaturdayTrainerGreeting:
;	text "Hi I'm strong."
;	line "My #MON is at"
;	cont "level 70."
;	para "I am the bestest +"
;	para "Shall we battle?"
;	done

SaturdayTrainerGreeting:
    text "Es passiert nicht"
    line "oft, dass ich auf"
    para "einen Trainer auf"
    line "meinem Niveau"
    cont "treffe."

    para "Meine #MON sind"
    line "um Level 70."

    para "Also sag mir,"
    line "glaubst du, du"
    para "bist jemand, der"
    line "es mit mir in"
    para "einem Kampf"
    line "aufnehmen kann?"
	done
	
	
TrainerAcceptsChallenge:
	text "Okay!"

	para "Stell dich auf die"
	line "andere Seite, dann"
	cont "legen wir los!"
	done
	
TrainerClubDone:
    text "Puh!"

    para "Ich bin jetzt erst"
    line "mal platt von all"
    cont "dem Kämpfen."

    para "Komm morgen wieder"
    line "und kämpfe gegen"
    cont "jemanden Neuen!"
	done
	

KantoBattleClubB1F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7,  0, KANTO_BATTLE_CLUB_1F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 15 ; object events
	object_event 16,  8, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleClubScriptSun, EVENT_SWITCH_1
	object_event 14, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleClubScriptMon, EVENT_SWITCH_2
	object_event 16,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BattleClubScriptTues, EVENT_SWITCH_3
	object_event 16,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, BattleClubScriptWed, EVENT_SWITCH_4
	object_event  6, 10, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BattleClubScriptThurs, EVENT_SWITCH_5
	object_event 14, 14, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BattleClubScriptFri, EVENT_SWITCH_6
	object_event  6, 10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, BattleClubScriptSat, EVENT_SWITCH_7
	object_event 11,  2, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleClubReceptionistScript, -1
	object_event  3,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, BattleClubPokefanMScript, -1
	object_event  3, 15, SPRITE_JANINE, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BattleClubJanineScript, -1
	object_event  9,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleClubYoungsterScript, EVENT_SWITCH_2
	object_event 13, 15, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BattleClubGentlemanScript, EVENT_SWITCH_3
	object_event 15,  6, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BattleClubLassScript, EVENT_SWITCH_5
	object_event  3, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleClubYoungster2Script, EVENT_SWITCH_1
	object_event 13,  6, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BattleClubGrannyScript, EVENT_SWITCH_6
