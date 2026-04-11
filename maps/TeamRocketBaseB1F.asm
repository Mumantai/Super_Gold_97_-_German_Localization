	object_const_def ; object_event constants
	const TEAMROCKETBASEB1F_POKE_BALL
	const TEAMROCKETBASEB1F_GRUNTM8
	const TEAMROCKETBASEB1F_GRUNTM9
	const TEAMROCKETBASEB1F_GRUNTM10
	const TEAMROCKETBASEB1F_GRUNTM14
	const TEAMROCKETBASEB1F_GRUNTM15
	const TEAMROCKETBASEB1F_GRUNTM16
	const TEAMROCKETBASEB1F_SCIENTISTROSS
	const TEAMROCKETBASEB1F_SCIENTISTMITCH
	const TEAMROCKETBASEB1F_SILVER
	const TEAMROCKETBASEB1F_IMPOSTOR
	const TEAMROCKETBASEB1F_STRAIGAR

TeamRocketBaseB1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .DamagedSystem
	
.DamagedSystem:
	checkevent EVENT_ROCKET_MACHINE_DAMAGED
	iffalse .Done
	changeblock 11, 13, $4D ; damage
	changeblock 19, 13, $4F ; damage
	changeblock 11, 15, $4C ; damage
	changeblock 19, 15, $4E ; damage
	changeblock 11, 19, $48 ; damage
	changeblock 19, 19, $4A ; damage
	changeblock 13, 19, $4B ; damage
	changeblock 15, 19, $49 ; damage
	changeblock 17, 19, $4B ; damage
.Done:
	return

ImposterCompEncounter:
	showemote EMOTE_SHOCK, TEAMROCKETBASEB1F_SILVER, 20
	applymovement TEAMROCKETBASEB1F_SILVER, SilverWalksToImposterComputer
	opentext
	writetext YoureNotOakCompScene
	waitbutton
	closetext
	showemote EMOTE_SHOCK, TEAMROCKETBASEB1F_IMPOSTOR, 20
	turnobject TEAMROCKETBASEB1F_IMPOSTOR, LEFT
	applymovement TEAMROCKETBASEB1F_IMPOSTOR, ImposterJumpsBack
	pause 5
	opentext
	writetext HowDidYouKidsGetDownHereText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB1F_IMPOSTOR, ImposterRunsOff
	opentext
	writetext SilverHeyWaitWhatsGoingOnText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB1F_SILVER, SilverRunsOffFast
	disappear TEAMROCKETBASEB1F_SILVER
	disappear TEAMROCKETBASEB1F_IMPOSTOR
	setscene SCENE_TEAMROCKETBASEB1F_NOTHING
	setevent EVENT_SILVER_AND_IMPOSTOR_DISAPPEAR
	end


TeamRocketBaseB1FTMPsychUp:
	itemball TM_PSYCH_UP

TeamRocketBaseB1FHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_TEAM_ROCKET_BASE_B1F_HIDDEN_FULL_HEAL


TrainerGruntM8:
	trainer GRUNTM, GRUNTM_8, EVENT_BEAT_ROCKET_GRUNTM_8, GruntM8SeenText, GruntM8BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM8AfterBattleText
	waitbutton
	closetext
	end
	

TrainerGruntM9:
	trainer GRUNTM, GRUNTM_9, EVENT_BEAT_ROCKET_GRUNTM_9, GruntM9SeenText, GruntM9BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM9AfterBattleText
	waitbutton
	closetext
	end


TrainerGruntM10:
	trainer GRUNTM, GRUNTM_10, EVENT_BEAT_ROCKET_GRUNTM_10, GruntM10SeenText, GruntM10BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM10AfterBattleText
	waitbutton
	closetext
	end
	

TrainerGruntM14:
	trainer GRUNTM, GRUNTM_14, EVENT_BEAT_ROCKET_GRUNTM_14, GruntM14SeenText, GruntM14BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM14AfterBattleText
	waitbutton
	closetext
	end
	

TrainerGruntM15:
	trainer GRUNTM, GRUNTM_15, EVENT_BEAT_ROCKET_GRUNTM_15, GruntM15SeenText, GruntM15BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM15AfterBattleText
	waitbutton
	closetext
	end
	

TrainerGruntM16:
	trainer GRUNTM, GRUNTM_16, EVENT_BEAT_ROCKET_GRUNTM_16, GruntM16SeenText, GruntM16BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM16AfterBattleText
	waitbutton
	closetext
	end
	
TrainerScientistRoss:
	trainer SCIENTIST, ROSS, EVENT_BEAT_SCIENTIST_ROSS, ScientistRossSeenText, ScientistRossBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistRossAfterBattleText
	waitbutton
	closetext
	end

TrainerScientistMitch:
	trainer SCIENTIST, MITCH, EVENT_BEAT_SCIENTIST_MITCH, ScientistMitchSeenText, ScientistMitchBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistMitchAfterBattleText
	waitbutton
	closetext
	end
	
TeamRocketBaseB1FComputerConsole:
	checkevent EVENT_ROCKET_COMPUTER_IS_OFF
	iftrue .SystemIsOff
	opentext
	playsound SFX_BOOT_PC
	pause 50
	writetext TeamRocketBaseB1FComputerConsoleIntroText
	waitbutton
	jump TeamRocketBaseB1FComputerConsole_loop
	
.SystemIsOff
	opentext
	writetext SystemAlreadyOff
	waitbutton
	closetext
	end

TeamRocketBaseB1FComputerConsole_loop:
	writetext ConsoleWhatDo
	loadmenu TeamRocketBaseB1FComputerConsoleMenu
	verticalmenu
	closewindow
	ifequal 1, .consolemenu1
	ifequal 2, .consolemenu2
	ifequal 3, .consolemenu3
	jump TeamRocketBaseB1FComputerConsole_cancel

	
.consolemenu1
	writetext ConsoleMenu1Text
	waitbutton
	jump TeamRocketBaseB1FComputerConsole_loop
	
.consolemenu2
	writetext ConsoleMenu2Text
	waitbutton
	jump TeamRocketBaseB1FComputerConsole_loop
	
.consolemenu3
	writetext ConsoleMenu3Text
	waitbutton
	playsound SFX_CHOOSE_PC_OPTION
TeamRocketBaseB1FComputerPower_loop:
	writetext ConsoleWhatDoPower
	loadmenu TeamRocketBaseB1FComputerConsolePowerMenu
	verticalmenu
	closewindow
	ifequal 1, .consolepowermenu1
	ifequal 2, .consolepowermenu2
	ifequal 3, .consolepowermenu3
	jump TeamRocketBaseB1FComputerConsole_loop
	
.consolepowermenu1
	writetext ConsolePowerMenu1Text
	waitbutton
	jump TeamRocketBaseB1FComputerPower_loop
	
.consolepowermenu2
	writetext ConsolePowerMenu2Text
	waitbutton
	jump TeamRocketBaseB1FComputerPower_loop
	
.consolepowermenu3
	writetext ConsolePowerMenu3Text
	waitbutton
	checkevent EVENT_ROUTE_105_BATTLE
	iftrue .KnowsPasswordShutDown
	jump TeamRocketBaseB1FComputerPower_loop
	
.KnowsPasswordShutDown
	writetext PasswordEntered
.PowerYesOrNo1:
	yesorno
	iftrue .PowerYesOrNo2
	writetext ReturningToPowerMenu
	waitbutton
	jump TeamRocketBaseB1FComputerPower_loop
	
.PowerYesOrNo2
	writetext AreYouSurePowerText
	pause 30
	yesorno
	iftrue .ShutdownTime
	writetext ReturningToPowerMenu
	waitbutton
	jump TeamRocketBaseB1FComputerPower_loop
	
.ShutdownTime
	writetext SystemShuttingDown
	waitbutton
	playsound SFX_SHUT_DOWN_PC
	closetext
	setevent EVENT_ROCKET_COMPUTER_IS_OFF
	pause 15
	moveobject TEAMROCKETBASEB1F_SILVER, 13, 25
	appear TEAMROCKETBASEB1F_SILVER
	applymovement TEAMROCKETBASEB1F_SILVER, SilverWalksLeftToMachine
	opentext
	writetext WowItsShuttingDown
	waitbutton
	closetext
	turnobject TEAMROCKETBASEB1F_SILVER, LEFT
	pause 15
	moveobject TEAMROCKETBASEB1F_STRAIGAR, 14, 20
	appear TEAMROCKETBASEB1F_STRAIGAR
	turnobject TEAMROCKETBASEB1F_SILVER, LEFT
	playsound SFX_BALL_POOF
	waitsfx
	cry STRAIGAR
	turnobject TEAMROCKETBASEB1F_SILVER, LEFT
	pause 15
	opentext
	writetext StraigarDestroyThisThing
	waitbutton
	closetext
;	pause 15
;	pause 5
	opentext
	writetext StraigarDestroyThisThing2
	waitbutton
	closetext
	turnobject TEAMROCKETBASEB1F_SILVER, UP
	playsound SFX_JUMP_OVER_LEDGE
	applymovement TEAMROCKETBASEB1F_STRAIGAR, StraigarJumpsUp
	pause 15
	opentext
	writetext StraigarDestroysTheThing
	waitbutton
	closetext
	playsound SFX_ZAP_CANNON
	earthquake 80
	special FadeOutPalettes
	special FadeInPalettes
	reloadmappart
	waitsfx
	playsound SFX_ZAP_CANNON
	earthquake 80
	special FadeOutPalettes
	special FadeInPalettes
	reloadmappart
	waitsfx
	playsound SFX_ZAP_CANNON
	earthquake 80
	special FadeOutPalettes
	special FadeInPalettes
	reloadmappart	
	waitsfx
	pause 15
	playsound SFX_JUMP_OVER_LEDGE
	applymovement TEAMROCKETBASEB1F_STRAIGAR, StraigarJumpsDown
	playsound SFX_MEGA_PUNCH
	earthquake 80
;	special FadeOutPalettes
	changeblock 13, 19, $4B ; damage
	changeblock 11, 13, $4D ; damage
	changeblock 19, 13, $4F ; damage
;	special FadeInPalettes
	reloadmappart
	waitsfx
	playsound SFX_MEGA_PUNCH
	earthquake 80
;	special FadeOutPalettes
	changeblock 11, 15, $4C ; damage
	changeblock 19, 15, $4E ; damage
	changeblock 15, 19, $49 ; damage
;	special FadeInPalettes
	reloadmappart
	waitsfx
	playsound SFX_MEGA_PUNCH
	earthquake 80
;	special FadeOutPalettes
	changeblock 17, 19, $4B ; damage
	changeblock 11, 19, $48 ; damage
	changeblock 19, 19, $4A ; damage
;	special FadeInPalettes
	reloadmappart
	playsound SFX_SHUT_DOWN_PC
	waitsfx
	playsound SFX_SHUT_DOWN_PC
	waitsfx
	playsound SFX_SHUT_DOWN_PC
	waitsfx
	pause 15
	turnobject TEAMROCKETBASEB1F_SILVER, LEFT
	opentext
	writetext StraigarDestroyedTheThing
	waitbutton
	closetext
	playsound SFX_BALL_POOF
	disappear TEAMROCKETBASEB1F_STRAIGAR
	pause 10
	turnobject TEAMROCKETBASEB1F_SILVER, LEFT
	turnobject TEAMROCKETBASEB1F_SILVER, UP
	opentext
	writetext StraigarDestroyedTheThing2
	waitbutton
	closetext
	moveobject TEAMROCKETBASEB1F_GRUNTM8, 13, 25
	appear TEAMROCKETBASEB1F_GRUNTM8
	applymovement TEAMROCKETBASEB1F_GRUNTM8, TeamRocketGuyWalksUp
	showemote EMOTE_SHOCK, TEAMROCKETBASEB1F_GRUNTM8, 20
	opentext
	writetext WhatHaveYouDoneText
	waitbutton
	closetext
	pause 15
	turnobject TEAMROCKETBASEB1F_GRUNTM8, DOWN
	opentext
	writetext WhatHaveYouDoneText2
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB1F_GRUNTM8, TeamRocketGuyLeaves
	turnobject TEAMROCKETBASEB1F_SILVER, DOWN
	showemote EMOTE_SHOCK, TEAMROCKETBASEB1F_SILVER, 20
	opentext
	writetext WaitGottaFindOut
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB1F_SILVER, TeamRocketGuyLeaves
	disappear TEAMROCKETBASEB1F_GRUNTM8
	disappear TEAMROCKETBASEB1F_GRUNTM9
	disappear TEAMROCKETBASEB1F_GRUNTM10
	disappear TEAMROCKETBASEB1F_GRUNTM14
	disappear TEAMROCKETBASEB1F_GRUNTM15
	disappear TEAMROCKETBASEB1F_GRUNTM16
	disappear TEAMROCKETBASEB1F_SCIENTISTROSS
	disappear TEAMROCKETBASEB1F_SCIENTISTMITCH
	disappear TEAMROCKETBASEB1F_SILVER
	setevent EVENT_ROCKETS_IN_ROCKET_BASE
	setevent EVENT_ROCKET_MACHINE_DAMAGED
	jumpstd RadioTowerRocketsScript
	end

	
TeamRocketBaseB1FComputerConsoleMenu:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuDataConsole
	db 1 ; default option

.MenuDataConsole:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "SYSTEMINFO@"
	db "AKT. STATUS@"
	db "ENERGIE-OPT.@"
	db "ABMELDEN@"
	
TeamRocketBaseB1FComputerConsolePowerMenu:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuDataPowerConsole
	db 1 ; default option

.MenuDataPowerConsole:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "ZUFUHR ERHÖHEN@"
	db "ZUFUHR VERRINGERN@"
	db "HERUNTERFAHREN@"
	db "VORH. MENÜ@"
	
TeamRocketBaseB1FComputerConsole_cancel:
	writetext TeamRocketBaseB1FComputerConsoleCancelText
	waitbutton
	playsound SFX_SHUT_DOWN_PC
	closetext
	end
	
TeamRocketGuyLeaves:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end
	
SilverRunsOffFast:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end
	
ImposterRunsOff:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end
	
ImposterJumpsBack:
	turn_head LEFT
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	step_end
	
SilverWalksToImposterComputer:
	step RIGHT
	step UP
	turn_head RIGHT
	step_end
	
SilverWalksLeftToMachine:
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step UP
	step_end
	
TeamRocketGuyWalksUp:
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step UP
	step_end
	
StraigarJumpsUp:
	jump_step UP
	step_end

StraigarJumpsDown:
	jump_step DOWN
	step_end
	
WaitGottaFindOut:
    text "<RIVAL>: Warte!"
    line "Da ist noch mehr?!"

    para "Komm schon,"
    line "<PLAYER>!"

    para "Ich werde heraus-"
    line "finden, was das zu"
    cont "bedeuten hat!"

    para "Du solltest besser"
    line "mitkommen!"

    para "Wir müssen diese"
    line "Typen ein für alle"
    cont "Mal ausschalten!"
	done
	
WhatHaveYouDoneText:
    text "VORSTAND: Nein!"

    para "Was habt ihr"
    line "angestellt?!"

    para "Ihr habt unsere"
    line "harte Arbeit"
    cont "vernichtet!"

    para "GIOVANNI wird"
    line "ausflippen, wenn"
    cont "er davon erfährt!"

    para "Aber auf euch zwei"
    line "wird er noch viel"
    para "wütender sein,"
    line "wenn er euch"
    cont "jemals trifft!"
	done
	
WhatHaveYouDoneText2:
    text "…"

    para "Ich habe gehofft."
    line "es würde nicht so"
    cont "weit kommen."

    para "Aber TEAM ROCKET"
    line "ist noch nicht am"
    cont "Ende!"

    para "Wir haben noch"
    line "einen letzten"
    cont "Trumpf im Ärmel."

    para "Und den werden wir"
    line "auch ausspielen!"
	done
	
StraigarDestroyedTheThing:
    text "<RIVAL>: Super,"
    line "TORADONAR!"

    para "Du hast es"
    line "geschafft!"
	done
	
StraigarDestroyedTheThing2:
    text "Dieses Ding wird"
    line "keinem #MON"
    cont "mehr Leid zufügen!"
	done
	
StraigarDestroysTheThing:
	text "TORADONAR:"
	line "Donaaar!!"
	done
	
StraigarDestroyThisThing:
	text "Los! TORADONAR!"
	done
	
StraigarDestroyThisThing2:
    text "Spring da hoch und"
    line "vernichte dieses"
    para "Teil mit deinem"
    line "allerstärksten"
    cont "DONNERBLITZ!"
	done
	
WowItsShuttingDown:
    text "<RIVAL>: Wow,"
    line "<PLAYER>!"

    para "Du hast es"
    line "ausgeschaltet!"

    para "Weißt du, was ich"
    line "herausgefunden"
    cont "habe?"

    para "Diese Maschine war"
    line "dazu gedacht, die"
    para "Gedanken der"
    line "#MON zu"
    cont "kontrollieren!"

    para "Das war also die"
    line "die ganze Zeit"
    cont "TEAM ROCKETs Plan!"

    para "Ich kann es nicht"
    line "fassen, dass sie"
    cont "das vorhatten!"

    para "Das ist"
    line "schrecklich!"

    para "Ich glaube, es"
    line "reicht nicht, das"
    para "Ding nur auszu-"
    line "schalten!"

    para "Es muss komplett"
    line "zerstört werden!"
	done
	
HowDidYouKidsGetDownHereText:
    text "BETRÜGER EICH:"
    line "Hey! wie seid ihr"
    para "Knirpse hier"
    line "runtergekommen?!"

    para "Unbefugte sollten"
    line "überhaupt nicht in"
    para "die Nähe dieser"
    line "Maschine kommen!"

    para "Das hier ist eine"
    line "sehr mächtige"
    para "Antenne, und es"
    line "dauert sehr lange,"
    para "bis sie die volle"
    line "Leistung erreicht!"

    para "Aber ist ja auch"
    line "egal. Ihr könnt"
    para "sie ja eh nicht"
    line "ausschalten, wenn"
    para "ihr das Passwort"
    line "nicht kennt!"

    para "Und das findet ihr"
    line "niemals heraus!"

    para "Ich muss dem Boss"
    line "jetzt melden, dass"
    para "wir Eindringlinge"
    line "haben!"
	done
	
SilverHeyWaitWhatsGoingOnText:
    text "Hey, Moment mal!"

    para "Was soll das?!"

    para "Ich verlange eine"
    line "Erklärung!"
	done
	
YoureNotOakCompScene:
    text "<RIVAL>: Warte!"

    para "Was geht hier"
    line "vor sich?!"

    para "Du bist nicht"
    line "PROF. EICH!"
	done
	
SystemAlreadyOff:
    text "Das System gibt"
    line "keinen Mucks von"
    para "von sich und ist"
    line "anscheinend nicht"
    cont "bedienbar…"
	done
	
SystemShuttingDown:
    text "ANFRAGE BESTÄTIGT"
    para "ENERGIEZUFUHR WIRD"
    line "HERUNTERGEFAHREN"
	para "---------"
	para "--------"
	para "-------"
	para "------"
	para "-----"
	para "----"
	para "---"
	para "--"
	para "-"
	done
	
AreYouSurePowerText:
    text "BIST DU DIR"
    line "WIRKLICH SICHER?"
	done
	
ReturningToPowerMenu:
    text "ZURÜCK ZUM"
    line "VORHERIGEN"
    cont "MENÜ…"
	done
	
PasswordEntered:
    text "<PLAYER> gibt das"
    line "Passwort ein…"

    para "'PREISET GIOVANNI'"

    para "…"

    para "WARNUNG!"
    line "DIESE AKTION KANN"
    para "NICHT EINFACH"
    line "RÜCKGÄNGIG GEMACHT"
    cont "WERDEN!"

    para "BITTE ERNEUT"
    line "BESTÄTIGEN."

    para "ENERGIEZUFUHR DES"
    line "SYSTEMS WIRKLICH"
    cont "HERUNTERFAHREN?"
	done
	
ConsoleWhatDoPower:
    text "ENERGIE-OPTIONEN"
    line "ANPASSEN"
	done
	
ConsolePowerMenu1Text:
    text "ENERGIE STEIGT"
    line "BEREITS!"
	done
	
ConsolePowerMenu2Text:
    text "FUNKTION DERZEIT"
    line "NICHT VERFÜGBAR"
	done
	
ConsolePowerMenu3Text:
    text "DIESE FUNKTION"
    line "BENÖTIGT PASSWORT"
	done
	
ConsoleWhatDo:
    text "HAUPTMENÜ -"
    line "FUNKTION WÄHLEN"
	done
	
ConsoleMenu1Text:
    text "GEDANKENKONTROLLE"
    line "SYSTEM SOFTWARE"
    cont "VERSION 1.03"
	done
	
ConsoleMenu2Text:
    text "AKTUELLE KAPAZITÄT"
    line "BEI 74 PROZENT…"
	done
	
ConsoleMenu3Text:
    text "ÖFFNE"
    line "ENERGIE-OPTIONEN"
	done
	
TeamRocketBaseB1FComputerConsoleCancelText:
    text "MELDE VON KONSOLE"
    line "AB…"
	done
	
TeamRocketBaseB1FComputerConsoleIntroText:
    text "TEAM ROCKET"
    line "#MON-KONTROLL-"
    cont "SYSTEM FÄHRT HOCH"
	done

ScientistMitchSeenText:
    text "Mit unserer"
    line "Gedankenkontrolle"
    para "werden wir die"
    line "Welt erobern!"
	done
	
ScientistMitchBeatenText:
    text "Sobald sie voll"
    line "funktionsfähig"
    cont "ist."
	done
	
ScientistMitchAfterBattleText:
    text "TEAM ROCKETs"
    line "wissenschaftliche"
    para "Errungenschaften"
    line "sind unglaublich!"
	done


ScientistRossSeenText:
    text "Du fragst, was wir"
    line "hier machen?"

    para "Nichts Besonderes."

    para "Wir stehen nur"
    line "kurz davor, die"
    para "Kontrolle über"
    line "jedes #MON auf"
    para "der Welt zu"
    line "übernehmen!"
	done
	
ScientistRossBeatenText:
    text "Deine stehen ganz"
    line "klar nicht unter"
    para "unserer Kontrolle…"
	done
	
ScientistRossAfterBattleText:
    text "Die Antenne hat"
    line "noch nicht die"
    para "volle Leistung"
    line "erreicht."

    para "Es dauert sehr"
    line "lange, bis sie die"
    para "volle Leistung"
    line "erreicht."
	done

GruntM16SeenText:
    text "Du schon wieder?"

    para "Ich bin es leid,"
    line "dich immer wieder"
    cont "zu sehen."
	done
	
GruntM16BeatenText:
    text "Ich bin es auch"
    line "leid, immer wieder"
    cont "zu velieren."
	done
	
GruntM16AfterBattleText:
    text "Für TEAM ROCKET"
    line "zu arbeiten bin"
    para "ich auch langsam"
    line "leid."
	done


GruntM15SeenText:
	text "Du bist echt"
	line "eine Plage,"
	cont "weißt du das?"
	done
	
GruntM15BeatenText:
	text "Das tat auch"
	line "ziemlich weh!"
	done
	
GruntM15AfterBattleText:
	text "Weißt du, wir alle"
	line "kriegen Ärger,"
	para "wenn ihr Knirpse"
	line "hier reinkommt und"
	cont "über uns herfallt."
	done

GruntM14SeenText:
    text "Wir sind alle"
    line "total aufgeregt"
    para "wegen dem, was"
    line "bald passieren"
    cont "wird!"

    para "Ich will nicht,"
    line "dass irgendein"
    para "Knirps uns in die"
    line "Quere kommt!"
	done
	
GruntM14BeatenText:
    text "Wie kannst du"
    line "es wagen?!"
	done
	
GruntM14AfterBattleText:
	text "Versuch uns doch"
	line "aufzuhalten!"
	done

GruntM10SeenText:
    text "Ich zeige dir, was"
    line "passiert, wenn du"
    para "mir in die Quere"
    line "kommst!"
	done
	
GruntM10BeatenText:
	text "Ich verliere…"
	done
	
GruntM10AfterBattleText:
    text "Anscheinend werde"
    line "ich besiegt, wenn"
    para "du mir in die"
    line "Quere kommst…"
	done

GruntM9SeenText:
    text "Ich bin derjenige,"
    line "der dich wirklich"
    cont "aufhalten wird!"
	done
	
GruntM9BeatenText:
    text "Warum habe ich"
    line "überhaupt etwas"
    cont "anderes erwartet?"
	done
	
GruntM9AfterBattleText:
	text "Wir RÜPEL haben"
	line "kaum Zeit, unsere"
	para "#MON richtig"
	line "zu trainieren."
	done
	
GruntM8SeenText:
    text "Du gehörst hier"
    line "nicht hin!"

    para "Nur TEAM ROCKET"
    line "Mitglieder sind"
    cont "hier erlaubt!"
	done
	
GruntM8BeatenText:
    text "Du gehörst hier"
    line "trotzdem nicht"
    cont "hin…"
	done
	
GruntM8AfterBattleText:
    text "Dann geh halt"
    line "weiter."

    para "Ich habe keine"
    line "Lust mehr, zu"
    para "versuchen, dich"
    line "aufzuhalten."
	done

TeamRocketBaseB1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  2, 10, STAND_CITY_ROCKET_HOUSE, 3
	warp_event 15,  3, TEAM_ROCKET_BASE_B2F, 1
	warp_event 23, 15, TEAM_ROCKET_BASE_B2F, 2
	warp_event 26, 26, TEAM_ROCKET_BASE_B2F, 3


	db 3 ; coord events
	coord_event 10, 20, SCENE_DEFAULT, ImposterCompEncounter
	coord_event 10, 21, SCENE_DEFAULT, ImposterCompEncounter
	coord_event 10, 22, SCENE_DEFAULT, ImposterCompEncounter


	db 5 ; bg events
	bg_event 25, 16, BGEVENT_ITEM, TeamRocketBaseB1FHiddenFullHeal
	bg_event 12, 19, BGEVENT_READ, TeamRocketBaseB1FComputerConsole
	bg_event 13, 19, BGEVENT_READ, TeamRocketBaseB1FComputerConsole
	bg_event 16, 19, BGEVENT_READ, TeamRocketBaseB1FComputerConsole
	bg_event 17, 19, BGEVENT_READ, TeamRocketBaseB1FComputerConsole

	db 12 ; object events
	object_event  7, 19, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB1FTMPsychUp, EVENT_TEAM_ROCKET_BASE_B1F_TM_PSYCH_UP
	object_event  3, 16, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 1, TrainerGruntM8, EVENT_ROCKETS_IN_ROCKET_BASE
	object_event 19,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 2, TrainerGruntM9, EVENT_ROCKETS_IN_ROCKET_BASE
	object_event 25,  4, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 3, TrainerGruntM10, EVENT_ROCKETS_IN_ROCKET_BASE
	object_event 27, 13, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 2, TrainerGruntM14, EVENT_ROCKETS_IN_ROCKET_BASE
	object_event  2,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 1, TrainerGruntM15, EVENT_ROCKETS_IN_ROCKET_BASE
	object_event 25, 25, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 4, TrainerGruntM16, EVENT_ROCKETS_IN_ROCKET_BASE
	object_event  6, 26, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 4, TrainerScientistRoss, EVENT_ROCKETS_IN_ROCKET_BASE
	object_event 26, 27, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 4, TrainerScientistMitch, EVENT_ROCKETS_IN_ROCKET_BASE
	object_event 11, 21, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SILVER_AND_IMPOSTOR_DISAPPEAR
	object_event 13, 20, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SILVER_AND_IMPOSTOR_DISAPPEAR
	object_event -5, -5, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SILVER_AND_IMPOSTOR_DISAPPEAR
