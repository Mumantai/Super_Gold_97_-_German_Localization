	object_const_def ; object_event constants
	const SHIP_ROCKET_1
	const SHIP_ROCKET_2
	const SHIP_ENTRANCE_1
	const SHIP_ROCKET_3
	const SHIP_CAPTAIN_R
	const SHIP_ROCKET_4
	const SHIP_ROCKET_5
	const SHIP_BURGLAR
	const SHIP_ITEMBALL
	const SHIP_IMPOSTOR
	const SHIP_ITEMBALL_2

TeamRocketShipBase_MapScripts:
	db 2 ; scene scripts
	scene_script .SceneTeamRocketShipBaseGreetings ; SCENE_DEFAULT
	scene_script .SceneTeamRocketShipBaseImposter ;

	db 1 ; callbacks	
	callback MAPCALLBACK_TILES, .CheckBasementKey


.CheckBasementKey:
	checkevent EVENT_USED_BASEMENT_KEY
	iffalse .LockBasementDoor
	return

.LockBasementDoor:
	changeblock 28,28, $28 ; locked door
	return

.SceneTeamRocketShipBaseGreetings
	end

.SceneTeamRocketShipBaseImposter
	end

RocketGreetingsScript:
	moveobject SHIP_ENTRANCE_1, 3, 7
	appear SHIP_ENTRANCE_1
	applymovement SHIP_ENTRANCE_1, Movement_StepUpToMeShip
	showemote EMOTE_SHOCK, SHIP_ENTRANCE_1, 25
	applymovement SHIP_ENTRANCE_1, Movement_StepUpToMeShip2
	opentext
	writetext NotGonnaStandByText
	waitbutton
	closetext
	winlosstext RocketEntranceShip_WinText, RocketEntranceShip_LossText
	loadtrainer GRUNTF, GRUNTF_2
	startbattle
	reloadmapafterbattle
	jump .returnfrombattleshipentrance
	
.returnfrombattleshipentrance
	opentext
	writetext RocketEntranceShip_AfterText
	waitbutton
	closetext
	applymovement SHIP_ENTRANCE_1, Movement_StepDownFromMeShip
	disappear SHIP_ENTRANCE_1
	setscene SCENE_TEAM_ROCKET_SHIP_BASE_IMPOSTOR
	end
	
ImposterAndCaptainScript:
	showemote EMOTE_SHOCK, SHIP_IMPOSTOR, 15
	turnobject SHIP_IMPOSTOR, DOWN
	opentext
	writetext ImposterGreetingText
	waitbutton
	closetext
	applymovement SHIP_IMPOSTOR, ImposterWalksToMe
	opentext
	writetext ImposterGreetingText2
	waitbutton
	closetext
	turnobject SHIP_IMPOSTOR, UP
	pause 15
	opentext
	writetext ImposterTellsCaptainText
	waitbutton
	closetext
	pause 15
	applymovement SHIP_IMPOSTOR, ImposterWalksToCaptain
	opentext
	writetext CaptainBeckons
	waitbutton
	closetext
	pause 15
	applymovement PLAYER, PlayerWalksToCaptain
	jump CaptainRocketScript
	

BasementDoorScript::
	opentext
	checkevent EVENT_USED_BASEMENT_KEY
	iftrue .Open
	checkitem BASEMENT_KEY
	iftrue .Unlock
	writetext UnknownText_0x7c5b0
	waitbutton
	closetext
	end

.Unlock:
	playsound SFX_TRANSACTION
	writetext UnknownText_0x7c5d6
	waitbutton
	closetext
	changeblock 28, 28, $2b ; unlocked door
	reloadmappart
	closetext
	setevent EVENT_USED_BASEMENT_KEY
	end

.Open:
	writetext UnknownText_0x7c5c3
	waitbutton
	closetext
	end

TrainerGruntM11:
	trainer GRUNTM, GRUNTM_11, EVENT_BEAT_ROCKET_GRUNTM_11, GruntM11SeenText, GruntM11BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM11AfterBattleText
	waitbutton
	closetext
	end
	

TrainerGruntM13:
	trainer GRUNTM, GRUNTM_13, EVENT_BEAT_ROCKET_GRUNTM_13, GruntM13SeenText, GruntM13BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM13AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM22:
	trainer GRUNTM, GRUNTM_22, EVENT_BEAT_ROCKET_GRUNTM_22, GruntM22SeenText, GruntM22BeatenText, 0, .Script


.Script:
	setevent EVENT_ROCKET_KEY_DIALOGUE
	checkevent EVENT_USED_BASEMENT_KEY
	iftrue .HowdYouGetThat
	opentext
	writetext GruntM22AfterBattleText
	waitbutton
	closetext
	end

.HowdYouGetThat
	opentext
	writetext GruntM22HowdGetKey
	waitbutton
	closetext
	end


CaptainRocketScript:
	special FadeOutMusic
	pause 15
	faceplayer
	opentext
	writetext CaptainRBeforeText
	waitbutton
	closetext
	pause 10
	turnobject SHIP_CAPTAIN_R, LEFT
	opentext
	writetext CaptainRTellsImposterOff
	waitbutton
	closetext
	showemote EMOTE_SHOCK, SHIP_IMPOSTOR, 15
	turnobject SHIP_IMPOSTOR, RIGHT
	opentext
	writetext ImposterOakIsShocked
	waitbutton
	closetext
	pause 15
	opentext
	writetext CaptainRTellsImposterOff2
	waitbutton
	closetext
	pause 15
	opentext
	writetext ImposterOakIsShocked2
	waitbutton
	closetext
	applymovement SHIP_IMPOSTOR, ImposterLeavesRoom
	playsound SFX_EXIT_BUILDING
	disappear SHIP_IMPOSTOR
	pause 5
	turnobject SHIP_CAPTAIN_R, DOWN
	opentext
	writetext CaptainRFinishesSpeech
	waitbutton
	closetext
	winlosstext CaptainRWinText, CaptainRLossText
	loadtrainer EXECUTIVEM, EXECUTIVEM_1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	opentext
	writetext CaptainRAfterText
	waitbutton
	closetext
	special FadeBlackQuickly
	special HealParty
	pause 15
	setevent EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	clearevent EVENT_SUNPOINT_DOCKS_NPCS
	setevent EVENT_PRYCE_IN_GYM
	setevent EVENT_PRYCE_IN_HOME
	setmapscene ROUTE_104, SCENE_ROUTE104_NOTHING
	warp SUNPOINT_DOCKS, 13, 3
	end
	

TrainerGruntM25:
	trainer GRUNTM, GRUNTM_25, EVENT_BEAT_ROCKET_GRUNTM_25, GruntM25SeenText, GruntM25BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM25AfterBattleText
	waitbutton
	closetext
	end
	
TrainerGruntF3:
	trainer GRUNTF, GRUNTF_3, EVENT_BEAT_ROCKET_GRUNTF_3, GruntF3SeenText, GruntF3BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF3AfterBattleText
	waitbutton
	closetext
	end
	

TrainerBurglarEddie:
	trainer BURGLAR, EDDIE, EVENT_BEAT_BURGLAR_EDDIE, BurglarEddieSeenText, BurglarEddieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BurglarEddieAfterBattleText
	waitbutton
	closetext
	end
	
TeamRocketShipBaseSmokeBall:
	itemball SMOKE_BALL
	
TeamRocketShipBaseAmuletCoin:
	itemball AMULET_COIN
	
TrashCanBoatScript:
	jumptext TrashCanBoatText

	
Movement_StepUpToMeShip:
	step UP
	step_end
	
Movement_StepUpToMeShip2:
	step UP
	step UP
	step UP
	step_end
	
Movement_StepDownFromMeShip:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
ImposterWalksToMe:
	step DOWN
	;step LEFT
	;turn_head DOWN
	step_end
	
ImposterWalksToCaptain:
	step UP
	step UP
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	turn_head DOWN
	step_end
	
PlayerWalksToCaptain:
	step UP
	step UP
	step UP
	step_end
	
ImposterLeavesRoom:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step DOWN
	step_end
	
TrashCanBoatText:
	text "Hier gibt es"
	line "nichts…"
	done

GruntM22SeenText:
	text "Du bist weit ins"
	line "Schiff gekommen."

	para "Aber weiter"
	line "kommst du nicht!"
	done

GruntM22BeatenText:
	text "Das wird dem"
	line "KÄPT'N nicht"
	cont "gefallen…"
	done

GruntM22AfterBattleText:
    text "Ha! Nur weil du"
    line "mich besiegt hast,"
    cont "lasse ich dich"
    cont "doch nicht durch!"

    para "Hauptsächlich,"
    line "weil ich es gar"
    cont "nicht kann!"

    para "Die Tür ist ver-"
    line "schlossen und ich"
    cont "habe auch keinen"
    cont "SCHIFFÖFFNER!"

    para "Ich glaube, außer"
    line "dem KÄPT'N, hat"
    cont "niemand auf diesem"
    cont "Schiff einen."

    para "Und ohne ihn,"
    line "kommst du nicht"
    cont "zu ihm!"

    para "Sieht so aus, als"
    line "müsstest du einen"
    cont "von einem TEAM"
    cont "ROCKET Mitglied"
    cont "irgendwo anders"
    cont "besorgen!"
	done

GruntM11SeenText:
	text "Was machst du"
	line "hier?"

	para "Geh mir aus"
	line "dem Weg!"
	done

GruntM11BeatenText:
	text "Du stehst mir"
	line "im Weg!"
	done

GruntM11AfterBattleText:
    text "Ich mache hier"
    line "eigentlich nichts"
    cont "Wichtiges."

    para "Ich bin nur Teil"
    line "der Besatzung, um"
    cont "mit dem Schiff"
    cont "fahren zu können!"
	done

GruntM25SeenText:
    text "Ha! Ich wette, du"
    line "hast nicht mit mir"
    cont "hier gerechnet!"

    para "Pech gehabt, denn"
    cont "hier bin ich!"
	done

GruntM25BeatenText:
    text "Ich bleibe wohl"
    line "lieber hier in"
    cont "diesem Schrank…"
	done

GruntM25AfterBattleText:
	text "Hier hinten nervt"
	line "mich niemand."
	done

GruntM13SeenText:
	text "Es ist mir egal,"
	line "wenn du dich"
	cont "verläufst."

	para "Du tauchst hier"
	line "auf! Du bist nur"
	cont "ein Opfer!"
	done

GruntM13BeatenText:
	text "Urk! Du glaubst,"
	line "du bist cool, häh?"
	done

GruntM13AfterBattleText:
	text "Durch deine Venen"
	line "fließt wohl Eis,"
	cont "da du TEAM ROCKET"
	cont "nicht für bare"
	cont "Münze nimmst."
	done

UnknownText_0x7c5b0:
    text "Die Tür ist"
    line "verschlossen…"
	done

UnknownText_0x7c5c3:
	text "Die Tür ist offen."
	done

UnknownText_0x7c5d6:
	text "Der SCHIFFÖFFNER"
	line "öffnet die Tür."
	done

CaptainRBeforeText:
    text "Ich bin beein-"
    line "druckt, dass du es"
    cont "bis zu mir ge-"
    cont "schafft hast."

    para "Und ich bin ent-"
    line "täuscht, dass"
    cont "meine Crew dich"
    cont "nicht aufhalten"
    cont "konnte."

    para "Dieser nutzlose"
    line "Haufen."

    para "Unsere Operationen"
    line "hier sind jedoch"
    cont "abgeschlossen."

    para "Wie ziehen uns"
    line "zurück in unsere"
    cont "Geheimbasis."

    para "Unser Plan wird,"
    line "wie geplant,"
    cont "weitergehen."
	done
	
CaptainRTellsImposterOff:
	text "BETRÜGER EICH!"
	done
	
ImposterOakIsShocked:
	text "BETRÜGER EICH:"
	line "Jawohl, Sir!"
	done
	
CaptainRTellsImposterOff2:
	text "KÄPT'N: Zisch ab."

	para "Ich möchte mit"
	line "unserem Freund"
	cont "alleine sein."
	done
	
ImposterOakIsShocked2:
	text "BETRÜGER EICH:"
	line "Aye aye KÄPT'N!"
	done
	
CaptainRFinishesSpeech:
	text "…"

	para "Ich sehe, du hast"
	line "unseren BETRÜGER"
	para "EICH bereits"
	line "kennengelernt."

	para "Dich kann er wohl"
	line "nicht täuschen."

	para "Das hätte ich auch"
	line "nicht erwartet."

	para "Aber dich brauche"
	line "ich auch nicht zu"
	cont "überzeugen."

	para "Er wird uns bald"
	line "noch sehr nützlich"
	cont "sein."

	para "Jetzt setzen wir"
	line "erst einmal die"
	cont "Segel."

	para "Aber nicht, bevor"
	line "ich dich loswerde!"
	done

CaptainRWinText:
	text "Du bist gut."
	done
	
CaptainRLossText:
	text "Ha!"
	done
	
CaptainRAfterText:
    text "Hmmm. Ich sehe,"
    line "welche Gefahr von"
    cont "dir ausgeht."

    para "Aber unsere Liefe-"
    line "rungen sind schon"
    cont "abgeschlossen."

	para "Wir haben alle"
	line "Materialien für"
	para "unsere ultimative"
	line "Waffe!"

	para "Und diese Waffe"
	line "richtet keinen"
	para "physischen Schaden"
	line "an, nein."

	para "Aber bald schon,"
	line "wird sie es uns"
    para "erlauben, alle"
    line "#MON zu"
    cont "kontrollieren!"

    para "Und du hast diesen"
    line "Plan verlangsamt."

    para "Aber du hast ihn"
    line "nicht vereitelt!"

    para "Du wirst bald von"
    line "uns hören!"

    para "Genauer gesagt,"
    line "werden alle von"
    cont "uns hören!"
	done


NotGonnaStandByText:
	text "Ich sehe, du hast"
	line "unseren Türsteher"
	cont "vertrieben."


	para "Aber du bist"
	line "dümmer, als du"
	para "aussiehst, wenn du"
	line "denkst, ich lasse"
	para "dich einfach an"
	line "mir vorbei!"

	para "Versuch doch, an"
	line "an vorbeizukommen!"
	done
	
RocketEntranceShip_WinText:
	text "Du bist zäher, als"
	line "du aussiehst!"
	done
	
RocketEntranceShip_LossText:
	text "Ha!"
	done
	
RocketEntranceShip_AfterText:
	text "Argh!"

	para "Ich sollte den"
	line "KÄPT'N vor dir"
	cont "warnen."

	para "Er wird dafür"
	line "sorgen, dass du"
	para "dich nicht mehr in"
	line "unseren Angelegen-"
	cont "heiten einmischst!"
	done

GruntF3SeenText:
    text "Was hast du gegen"
    line "TEAM ROCKET?"
	done

GruntF3BeatenText:
    text "Unsere Pläne sind"
    line "immer noch größer,"
    cont "als du denkst!"
	done

GruntF3AfterBattleText:
    text "Wir sind eh gerade"
    line "dabei, von hier zu"
    cont "verschwinden."
	done


BurglarEddieSeenText:
    text "Psst! Ich gehöre"
    line "nicht zu TEAM"
    cont "ROCKET!"

    para "Ich suche nur"
    line "nach Beute."
	done

BurglarEddieBeatenText:
	text "Völlig drüber!"
	done

BurglarEddieAfterBattleText:
    text "Wenn ich von Bösen"
    line "klaue, macht mich"
    para "das dann zu einem"
    line "der Guten?"
	done
	
GruntM22HowdGetKey:
	text "Wie bist du an"
	line "den Schlüssel"
	line "gekommen?!"
	done
	
ImposterGreetingText:
	text "Na, wen haben wir"
	line "denn da?"
	done
	
ImposterGreetingText2:
    text "Erkennst du mich"
    line "denn nicht?"

    para "Ich bin es,"
    line "PROF. EICH!"

    para "Ich arbeite jetzt"
    line "mit TEAM ROCKET!"

    para "… Jaa, ich weiß,"
    line "du kaufst es mir"
    cont "nicht ab."
	done
	
ImposterTellsCaptainText:
    text "Hey, KÄPT'N!"
    line "Wir haben hier"
    cont "so 'nen Knirps!"

    para "Ich wette das ist"
    line "der, von dem wir"
    cont "ständig hören!"
	done
	
CaptainBeckons:
    text "KÄPT'N: Komm"
    line "her, du Wicht!"
	done

TeamRocketShipBase_MapEvents:
	db 0, 0 ; filler

	db 16 ; warp events
	warp_event  3,  1, SUNPOINT_DOCKS, 4
	warp_event  3,  8, TEAM_ROCKET_SHIP_BASE, 3
	warp_event 13,  1, TEAM_ROCKET_SHIP_BASE, 2
	warp_event 13, 12, TEAM_ROCKET_SHIP_BASE, 5
	warp_event 29,  1, TEAM_ROCKET_SHIP_BASE, 4
	warp_event 33,  3, TEAM_ROCKET_SHIP_BASE, 7
	warp_event  3, 18, TEAM_ROCKET_SHIP_BASE, 6
	warp_event 35,  3, TEAM_ROCKET_SHIP_BASE, 9
	warp_event 13, 24, TEAM_ROCKET_SHIP_BASE, 8
	warp_event 19, 19, TEAM_ROCKET_SHIP_BASE, 11
	warp_event  3, 34, TEAM_ROCKET_SHIP_BASE, 10
	warp_event 25, 19, TEAM_ROCKET_SHIP_BASE, 13
	warp_event 13, 34, TEAM_ROCKET_SHIP_BASE, 12
	warp_event 29, 29, TEAM_ROCKET_SHIP_BASE, 15
	warp_event 35, 22, TEAM_ROCKET_SHIP_BASE, 14
	warp_event 39, 22, TEAM_ROCKET_SHIP_BASE, 14

	db 2 ; coord events
	coord_event  3,  2, SCENE_DEFAULT, RocketGreetingsScript
	coord_event 35, 21, SCENE_TEAM_ROCKET_SHIP_BASE_IMPOSTOR, ImposterAndCaptainScript

	db 2 ; bg events
	bg_event 29, 29, BGEVENT_READ, BasementDoorScript
	bg_event 29,  7, BGEVENT_READ, TrashCanBoatScript


	db 11 ; object events
	object_event 11,  3, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 3, TrainerGruntM11, -1
	object_event 31,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 3, TrainerGruntM13, -1
	object_event -6,  2, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 28, 30, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 3, TrainerGruntM22, -1
	object_event 35, 15, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, CaptainRocketScript, -1
	object_event  3, 16, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 3, TrainerGruntM25, -1
	object_event  1, 26, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 4, TrainerGruntF3, -1
	object_event 26, 23, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerBurglarEddie, -1
	object_event  4, 26, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketShipBaseSmokeBall, EVENT_WESTPORT_UNDERGROUND_SWITCH_ROOM_ENTRANCES_SMOKE_BALL
	object_event 35, 19, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  1, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketShipBaseAmuletCoin, EVENT_GOT_TEAM_ROCKET_AMULET_COIN



