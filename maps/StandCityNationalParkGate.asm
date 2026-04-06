	object_const_def ; object_event constants
	const STANDCITYNATIONALPARKGATE_OFFICER1
	const STANDCITYNATIONALPARKGATE_YOUNGSTER1
	const STANDCITYNATIONALPARKGATE_YOUNGSTER2
	const STANDCITYNATIONALPARKGATE_ROCKER
	const STANDCITYNATIONALPARKGATE_POKEFAN_M
	const STANDCITYNATIONALPARKGATE_YOUNGSTER3
	const STANDCITYNATIONALPARKGATE_YOUNGSTER4
	const STANDCITYNATIONALPARKGATE_LASS
	const STANDCITYNATIONALPARKGATE_YOUNGSTER5
	const STANDCITYNATIONALPARKGATE_YOUNGSTER6
	const STANDCITYNATIONALPARKGATE_YOUNGSTER7
	const STANDCITYNATIONALPARKGATE_OFFICER2

StandCityNationalParkGate_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_STANDCITYNATIONALPARKGATE_NOTHING
	scene_script .DummyScene1 ; SCENE_STANDCITYNATIONALPARKGATE_UNUSED
	scene_script .LeaveContestEarly ; SCENE_STANDCITYNATIONALPARKGATE_LEAVE_CONTEST_EARLY

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .CheckIfContestRunning
	callback MAPCALLBACK_OBJECTS, .CheckIfContestAvailable

.DummyScene0:
	end

.DummyScene1:
	end

.LeaveContestEarly:
	priorityjump .LeavingContestEarly
	end

.CheckIfContestRunning:
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .BugContestIsRunning
	setscene SCENE_STANDCITYNATIONALPARKGATE_NOTHING
	return

.BugContestIsRunning:
	setscene SCENE_STANDCITYNATIONALPARKGATE_LEAVE_CONTEST_EARLY
	return

.CheckIfContestAvailable:
	checkevent EVENT_WARPED_FROM_ROUTE_103_NATIONAL_PARK_GATE
	iftrue .Return
	checkcode VAR_WEEKDAY
	ifequal TUESDAY, .SetContestOfficer
	ifequal THURSDAY, .SetContestOfficer
	ifequal SATURDAY, .SetContestOfficer
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .SetContestOfficer
	disappear STANDCITYNATIONALPARKGATE_OFFICER1
	appear STANDCITYNATIONALPARKGATE_OFFICER2
	return

.SetContestOfficer:
	appear STANDCITYNATIONALPARKGATE_OFFICER1
	disappear STANDCITYNATIONALPARKGATE_OFFICER2
.Return:
	return

.LeavingContestEarly:
	turnobject PLAYER, UP
	opentext
	checkcode VAR_CONTESTMINUTES
	addvar 1
	vartomem MEM_BUFFER_0
	writetext UnknownText_0x6b284
	yesorno
	iffalse .GoBackToContest
	writetext UnknownText_0x6b2c5
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	scall .CopyContestants
	disappear STANDCITYNATIONALPARKGATE_OFFICER1
	appear STANDCITYNATIONALPARKGATE_OFFICER2
	applymovement PLAYER, MovementData_0x6add1
	pause 15
	special FadeInQuickly
	jumpstd BugContestResultsScript

.GoBackToContest:
	writetext UnknownText_0x6b300
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	playsound SFX_EXIT_BUILDING
	special FadeBlackQuickly
	waitsfx
	warpfacing DOWN, NATIONAL_PARK_BUG_CONTEST, 32, 31
	end

.CopyContestants:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_1A
	iftrue .Not1
	appear STANDCITYNATIONALPARKGATE_YOUNGSTER1
.Not1:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_2A
	iftrue .Not2
	appear STANDCITYNATIONALPARKGATE_YOUNGSTER2
.Not2:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_3A
	iftrue .Not3
	appear STANDCITYNATIONALPARKGATE_ROCKER
.Not3:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_4A
	iftrue .Not4
	appear STANDCITYNATIONALPARKGATE_POKEFAN_M
.Not4:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_5A
	iftrue .Not5
	appear STANDCITYNATIONALPARKGATE_YOUNGSTER3
.Not5:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_6A
	iftrue .Not6
	appear STANDCITYNATIONALPARKGATE_YOUNGSTER4
.Not6:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_7A
	iftrue .Not7
	appear STANDCITYNATIONALPARKGATE_LASS
.Not7:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_8A
	iftrue .Not8
	appear STANDCITYNATIONALPARKGATE_YOUNGSTER5
.Not8:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_9A
	iftrue .Not9
	appear STANDCITYNATIONALPARKGATE_YOUNGSTER6
.Not9:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_10A
	iftrue .Not10
	appear STANDCITYNATIONALPARKGATE_YOUNGSTER7
.Not10:
	special UpdateSprites
	end

Route102OfficerScriptContest:
	checkcode VAR_WEEKDAY
	ifequal SUNDAY, _ContestNotOn
	ifequal MONDAY, _ContestNotOn
	ifequal WEDNESDAY, _ContestNotOn
	ifequal FRIDAY, _ContestNotOn
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route102Officer_ContestHasConcluded
	scall Route102ParkGate_DayToText
	writetext UnknownText_0x6add5
	yesorno
	iffalse .DecidedNotToJoinContest
	checkcode VAR_PARTYCOUNT
	ifgreater 1, .LeaveMonsWithOfficer
	special ContestDropOffMons
	clearevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
.ResumeStartingContest:
	setflag ENGINE_BUG_CONTEST_TIMER
	special PlayMapMusic
	writetext UnknownText_0x6ae87
	buttonsound
	waitsfx
	writetext UnknownText_0x6aeb1
	playsound SFX_ITEM
	waitsfx
	writetext UnknownText_0x6aecc
	waitbutton
	closetext
	setflag ENGINE_BUG_CONTEST_TIMER
	special GiveParkBalls
	turnobject PLAYER, DOWN
	applymovement PLAYER, ExitBuildingMovement
	playsound SFX_EXIT_BUILDING
	special FadeBlackQuickly
	waitsfx
	special SelectRandomBugContestContestants
	warpfacing DOWN, NATIONAL_PARK_BUG_CONTEST, 32, 31
	end

.LeaveMonsWithOfficer:
	checkcode VAR_PARTYCOUNT
	ifless PARTY_LENGTH, .ContinueLeavingMons
	checkcode VAR_BOXSPACE
	ifequal 0, .BoxFull
.ContinueLeavingMons:
	special CheckFirstMonIsEgg
	ifequal TRUE, .FirstMonIsEgg
	writetext UnknownText_0x6afb0
	yesorno
	iffalse .RefusedToLeaveMons
	special ContestDropOffMons
	iftrue .FirstMonIsFainted
	setevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
	writetext UnknownText_0x6b021
	buttonsound
	writetext UnknownText_0x6b055
	playsound SFX_GOT_SAFARI_BALLS
	waitsfx
	buttonsound
	jump .ResumeStartingContest

.DecidedNotToJoinContest:
	writetext UnknownText_0x6b0c6
	waitbutton
	closetext
	end

.RefusedToLeaveMons:
	writetext UnknownText_0x6b081
	waitbutton
	closetext
	end

.FirstMonIsFainted:
	writetext UnknownText_0x6b0f2
	waitbutton
	closetext
	end

.BoxFull:
	writetext UnknownText_0x6b166
	waitbutton
	closetext
	end

.FirstMonIsEgg:
	writetext UnknownText_0x6b209
	waitbutton
	closetext
	end

Route102Officer_ContestHasConcluded:
	checkevent EVENT_CONTEST_OFFICER_HAS_HEART_STONE
	iftrue .Sunstone
	checkevent EVENT_CONTEST_OFFICER_HAS_EVERSTONE
	iftrue .Everstone
	checkevent EVENT_CONTEST_OFFICER_HAS_GOLD_BERRY
	iftrue .GoldBerry
	checkevent EVENT_CONTEST_OFFICER_HAS_BERRY
	iftrue .Berry
	writetext UnknownText_0x6b32b
	waitbutton
	closetext
	end

.Sunstone:
	writetext UnknownText_0x6b97f
	buttonsound
	verbosegiveitem HEART_STONE
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_HEART_STONE
	closetext
	end

.Everstone:
	writetext UnknownText_0x6b97f
	buttonsound
	verbosegiveitem EVERSTONE
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_EVERSTONE
	closetext
	end

.GoldBerry:
	writetext UnknownText_0x6b97f
	buttonsound
	verbosegiveitem GOLD_BERRY
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_GOLD_BERRY
	closetext
	end

.Berry:
	writetext UnknownText_0x6b97f
	buttonsound
	verbosegiveitem BERRY
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_BERRY
	closetext
	end

.BagFull:
	writetext UnknownText_0x6b910
	waitbutton
	closetext
	end

_ContestNotOn:
	jumptextfaceplayer UnknownText_0x6b370

StandCityNationalParkGateOfficerScript:
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route102Officer_ContestHasConcluded
	writetext UnknownText_0x6b370
	waitbutton
	closetext
	end

Route102ParkGate_DayToText:
	jumpstd DayToTextScript
	end

BugCatchingContestant1BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant1BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant1BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant2BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant2BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant2BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant3BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant3BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant3BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant4BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant4BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant4BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant5BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant5BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant5BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant6BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant6BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant6BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant7BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant7BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant7BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant8BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant8BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant8BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant9BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant9BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant9BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant10BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant10BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant10BStillCompetingText
	waitbutton
	closetext
	end

UnusedBugCatchingContestExplanationSign:
; duplicate of BugCatchingContestExplanationSign in Route103NationalParkGate.asm
	jumptext UnusedBugCatchingContestExplanationText

ExitBuildingMovement:
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_0x6add1:
	big_step UP
	big_step UP
;	big_step RIGHT
	turn_head UP
	step_end

UnknownText_0x6add5:
	text "Heute ist"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Das bedeutet, dass"
	line "heute das Käfer-"
	cont "turnier statt-"
	cont "findet."

	para "Die Regeln sind"
	line "einfach."

	para "Fange ein Käfer-"
	line "#MON mit einem"
	cont "deiner eigenen"
	cont "#MON."

	para "Das Käfer-#MON"
	line "wird dann von der"
	cont "Jury bewertet."

	para "Möchtest du es"
	line "einmal versuchen?"
	done

UnknownText_0x6ae87:
	text "Hier sind die"
	line "PARKBÄLLE für das"
	cont "Turnier."
	done

UnknownText_0x6aeb1:
	text "<PLAYER> erhält"
	line "20 PARKBÄLLE."
	done

UnknownText_0x6aecc:
	text "Wer das stärkste"
	line "Käfer-#MON"
	cont "fängt, hat "
	cont "gewonnen."

	para "Du hast {d:BUG_CONTEST_MINUTES}"
	line "Minuten Zeit."

	para "Wenn du keine"
	line "PARKBÄLLE mehr"
	cont "hast, ist das"
	cont "Turnier beendet."

	para "Du darfst das"
	line "letzte #MON,"
	cont "das du gefangen"
	cont "hast, behalten."

	para "Los! Fang das"
	line "stärkste Käfer-"
	cont "#MON, das du"
	cont "finden kannst!"
	done

UnknownText_0x6afb0:
	text "Oh, oh…"

	para "Du hast mehr als"
	line "ein #MON."

	para "Du musst"
	line "@"
	text_ram wStringBuffer3
	text_start

	para "auswählen - dein"
	line "erstes #MON."

	para "Bist du damit"
	line "einverstanden?"
	done

UnknownText_0x6b021:
	text "Gut. Wir passen"
	line "währenddessen auf"
	cont "deine anderen"
	cont "#MON auf."
	done

UnknownText_0x6b055:
	text "Die #MON von"
	line "<PLAYER> wurden dem"
	cont "TURNIERHELFER"
	cont "übergeben."
	done

UnknownText_0x6b081:
	text "Wähle bitte das"
	line "#MON, mit dem"

	para "du im Turnier"
	line "antreten möchtest,"
	cont "aus und komm dann"
	cont "wieder."
	done

UnknownText_0x6b0c6:
	text "Na gut. Wir"
	line "hoffen, dass du"
	cont "später einmal"
	cont "am Turnier teil-"
	cont "nimmst."
	done

UnknownText_0x6b0f2:
	text "Oh, oh…"
	line "Das erste #MON"

	para "deines Teams kann"
	line "nicht am Turnier"
	cont "teilnehmen."

	para "Tausche es bitte"
	line "mit dem #MON"

	para "aus, das am"
	line "Turnier teilnehmen"

	para "soll und komm dann"
	line "wieder."
	done

UnknownText_0x6b166:
	text "Oh, oh…"
	line "Dein Team und"

	para "deine PC-BOX sind"
	line "voll besetzt."

	para "Du hast keinen"
	line "Platz für ein"
	cont "Käfer-#MON,"
	cont "das du fängst."

	para "Schaffe Platz in"
	line "deinem Team oder"

	para "in deiner PC-BOX"
	line "und komm dann"
	cont "wieder."
	done

UnknownText_0x6b209:
	text "Oh, oh…"
	line "Ein EI ist an"

	para "erster Stelle in"
	line "deinem Team."

	para "Tausche es bitte"
	line "mit dem #MON,"

	para "das du im Turnier"
	line "einsetzen möchtest"

	para "und komm dann"
	line "wieder."
	done

UnknownText_0x6b284:
	text "Du hast noch @"
	text_ram wStringBuffer3
	text_start
	line "Minute(n)."

	para "Möchtest du jetzt"
	line "aufhören?"
	done

UnknownText_0x6b2c5:
	text "Gut. Warte bitte"
	line "hier auf die"

	para "Bekanntgabe"
	line "der Sieger."
	done

UnknownText_0x6b300:
	text "Gut. Geh bitte"
	line "wieder zurück nach"
	cont "draußen und komm"
	cont "zum Ende."
	done

UnknownText_0x6b32b:
	text "Das heutige"
	line "Turnier ist be-"
	cont "endet. Wir hoffen,"

	para "dass du wieder"
	line "daran teilnehmen"
	cont "wirst."
	done

UnknownText_0x6b370:
	text "Manche #MON"
	line "kann man nur im"
	cont "PARK antreffen."
	done

BugCatchingContestant1BText:
	text "ULI: Wow, du hast"
	line "mich besiegt! Du"
	cont "bist sehr gut!"
	done

BugCatchingContestant1BStillCompetingText:
	text "ULI: Glück spielt"
	line "natürlich eine"
	cont "große Rolle dabei."

	para "Man weiß nie,"
	line "welches #MON"
	cont "auftauchen wird."
	done

BugCatchingContestant2BText:
	text "ALAN: Ich beneide"
	line "dich. Dieses Mal"
	cont "habe ich es"
	cont "einfach nicht"
	cont "geschafft."
	done

BugCatchingContestant2BStillCompetingText:
	text "ALAN: Du gewinnst"
	line "vielleicht mit"
	cont "großen #MON?"
	done

BugCatchingContestant3BText:
	text "LARS: Gut gemacht!"
	line "Ich werde meine"
	cont "#MON besser"
	cont "trainieren."
	done

BugCatchingContestant3BStillCompetingText:
	text "LARS: Vielleicht"
	line "erhältst du eine"

	para "höhere Wertung für"
	line "ein #MON mit"
	cont "ungewöhnlicher"
	cont "Farbe."
	done

BugCatchingContestant4BText:
	text "WILHELM: Du bist"
	line "der Sieger? Was"
	cont "hast du gefangen?"
	done

BugCatchingContestant4BStillCompetingText:
	text "WILHELM: Also, ich"
	line "bin zufrieden,"

	para "denn ich habe ein"
	line "#MON gefangen,"
	cont "das ich haben"
	cont "wollte."
	done

BugCatchingContestant5BText:
	text "AXEL: Meine"
	line "Gratulation! Du"
	cont "verdienst meinen"
	cont "ganzen Respekt!"
	done

BugCatchingContestant5BStillCompetingText:
	text "AXEL: Ich habe"
	line "vorher ein SICHLOR"
	cont "gefangen. Aber ich"
	cont "konnte nicht"
	cont "siegen."
	done

BugCatchingContestant6BText:
	text "TILL: Das #-"
	line "MON, das du"
	cont "gefangen hast…"
	cont "Das ist cool!"
	done

BugCatchingContestant6BStillCompetingText:
	text "TILL: Mit einem"
	line "Käfer-#MON, das"

	para "einen hohen Level"
	line "hat, steigen deine"
	cont "Gewinnchancen."

	para "Ich glaube aber,"
	line "dass auch noch"
	cont "andere Kriterien"
	cont "in die Bewertung"
	cont "eingehen."
	done

BugCatchingContestant7BText:
	text "CINDY: Du hast"
	line "gewonnen? Das ist"
	cont "großartig!"

	para "Hättest du Lust,"
	line "mit mir auf die"
	cont "Suche nach Käfer-"
	cont "#MON zu gehen?"
	done

BugCatchingContestant7BStillCompetingText:
	text "CINDY: Ich liebe"
	line "Käfer-#MON!"
	done

BugCatchingContestant8BText:
	text "ENNO: Ich… ich"
	line "glaube einfach"
	cont "nicht, dass ich"
	cont "beim Käfer-"
	cont "turnier verloren"
	cont "habe…"
	done

BugCatchingContestant8BStillCompetingText:
	text "ENNO: Ich hörte,"
	line "dass jemand mit"
	cont "einem RAUPY"
	cont "gewonnen hat!"
	done

BugCatchingContestant9BText:
	text "GUIDO: Das nächste"
	line "Mal gewinne ich!"
	done

BugCatchingContestant9BStillCompetingText:
	text "GUIDO: Mist! Ich"
	line "dachte, ich würde"
	cont "eine höhere"
	cont "Bewertung"
	cont "erreichen…"
	done

BugCatchingContestant10BText:
	text "MICHEL: Könntest"
	line "du mir ein paar"

	para "Tipps geben? Ich"
	line "möchte deinen Stil"
	cont "erlernen."
	done

BugCatchingContestant10BStillCompetingText:
	text "MICHEL: Ich habe"
	line "viel gelernt, aber"

	para "noch nicht genug,"
	line "um zu siegen."
	done

UnusedBellignanText:
; This text is unused and unreferenced in the final game.
; The tree Pokémon is Bellignan.
; The Silph Scope 2 was later reworked into the Squirtbottle.
	text "Ich habe gehört,"
	line "dass es ein #-"
	cont "MON gibt, das aus-"
	cont "sieht wie ein"

	para "Baum. Du kannst"
	line "seine Identität"
	cont "mit Hilfe eines"
	cont "SILPHSCOPE 2"
	cont "erkennen."
	done

UnusedBugCatchingContestExplanationText:
; duplicate of BugCatchingContestExplanationText in Route103NationalParkGate.asm
	text "Das Käferturnier"
	line "findet jeden"

	para "Dienstag,"
	line "Donnerstag und"
	cont "Samstag statt."

	para "Du erhältst nicht"
	line "nur einen Preis"

	para "allein für die"
	line "Teilnahme, sondern"

	para "auch ein Käfer-"
	line "#MON, das du"
	cont "dort fängst."
	done

UnknownText_0x6b910:
	text "Oh, oh… Dein"
	line "BEUTEL ist voll."

	para "Wir bewahren"
	line "deinen Preis auf."
	cont "Aber nur heute."

	para "Schaffe bitte"
	line "Platz und komm"
	cont "dann wieder."
	done

UnknownText_0x6b97f:
	text "<PLAYER>?"

	para "Hier ist der"
	line "Preis, den wir für"
	cont "dich aufbewahrt"
	cont "haben."
	done

StandCityNationalParkGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  7, NATIONAL_PARK, 1
	warp_event  1,  7, NATIONAL_PARK, 2
	warp_event  8,  7, STAND_CITY, 10
	warp_event  9,  7, STAND_CITY, 10

	db 0 ; coord events

	db 1 ; bg events
	bg_event  6,  0, BGEVENT_READ, BugCatchingContestExplanationSign

	db 12 ; object events
	object_event  0,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route102OfficerScriptContest, EVENT_STAND_CITY_NATIONAL_PARK_GATE_OFFICER_CONTEST_DAY
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant1BScript, EVENT_BUG_CATCHING_CONTESTANT_1B
	object_event  4,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant2BScript, EVENT_BUG_CATCHING_CONTESTANT_2B
	object_event  2,  6, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant3BScript, EVENT_BUG_CATCHING_CONTESTANT_3B
	object_event  6,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant4BScript, EVENT_BUG_CATCHING_CONTESTANT_4B
	object_event  2,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant5BScript, EVENT_BUG_CATCHING_CONTESTANT_5B
	object_event  5,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant6BScript, EVENT_BUG_CATCHING_CONTESTANT_6B
	object_event  3,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant7BScript, EVENT_BUG_CATCHING_CONTESTANT_7B
	object_event  4,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant8BScript, EVENT_BUG_CATCHING_CONTESTANT_8B
	object_event  6,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant9BScript, EVENT_BUG_CATCHING_CONTESTANT_9B
	object_event  6,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant10BScript, EVENT_BUG_CATCHING_CONTESTANT_10B
	object_event  3,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, StandCityNationalParkGateOfficerScript, EVENT_STAND_CITY_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY
