	object_const_def ; object_event constants
	const TEAMROCKETBASEOFFICE_POKE_BALL1
	const TEAMROCKETBASEOFFICE_POKE_BALL2
	const TEAMROCKETBASEOFFICE_POKE_BALL3
	const TEAMROCKETBASEOFFICE_GRUNT1
	const TEAMROCKETBASEOFFICE_GRUNT2
	const TEAMROCKETBASEOFFICE_GRUNT3
	const TEAMROCKETBASEOFFICE_GRUNT4
	const TEAMROCKETBASEOFFICE_GRUNT5
	const TEAMROCKETBASEOFFICE_IMPOSTOR
	const TEAMROCKETBASEOFFICE_EXECUTIVE

TeamRocketBaseOffice_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TeamRocketBaseOfficeHyperPotion:
	itemball HYPER_POTION

TeamRocketBaseOfficeNugget:
	itemball NUGGET

TeamRocketBaseOfficeGuardSpec:
	itemball GUARD_SPEC

TeamRocketBaseOfficeHiddenRevive:
	hiddenitem REVIVE, EVENT_TEAM_ROCKET_BASE_OFFICE_HIDDEN_REVIVE
	
RocketBossRoomGrunt1:
	jumptextfaceplayer RocketBossRoomGrunt1Text

RocketBossRoomGrunt2:
	jumptextfaceplayer RocketBossRoomGrunt2Text

RocketBossRoomGrunt3:
	jumptextfaceplayer RocketBossRoomGrunt3Text

RocketBossRoomGrunt4:
	jumptextfaceplayer RocketBossRoomGrunt4Text

RocketBossRoomGrunt5:
	jumptextfaceplayer RocketBossRoomGrunt5Text
	
ExecutiveConfrontationScene:
	turnobject PLAYER, UP
	jump ExecutiveConfrontationScript
	end
	
ExecutiveConfrontationScene2:
	applymovement PLAYER, PlayerStepsUpToImposter
	jump ExecutiveConfrontationScript
	end
	
ExecutiveConfrontationScript:
	pause 15
	opentext
	writetext ImposterTellsYouToSeeExecutive
	waitbutton
	closetext
	applymovement PLAYER, PlayerWalksToExecutive
	pause 20
	opentext
	writetext TheExecutiveGreeting
	waitbutton
	closetext
	winlosstext ExecutiveWinText, ExecutiveLossText
	loadtrainer EXECUTIVEM, EXECUTIVEM_2
	startbattle
	reloadmapafterbattle
	opentext
	writetext ExecutiveSceneAfterBattleText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEOFFICE_EXECUTIVE, ExecutiveLeavesOffice
	disappear TEAMROCKETBASEOFFICE_EXECUTIVE
	disappear TEAMROCKETBASEOFFICE_IMPOSTOR
	setevent EVENT_IMPOSTOR_AND_EXECUTIVE_DISAPPEAR
	setscene SCENE_TEAMROCKETBASEOFFICE_NOTHING
	end
	
TeamRocketBaseOfficePassword:
	opentext
	writetext BadSecurityPractices
	waitbutton
	closetext
	setevent EVENT_ROUTE_105_BATTLE
	end
	
PlayerStepsUpToImposter:
	step UP
	step_end
	
PlayerWalksToExecutive:
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end
	
ExecutiveLeavesOffice:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
RocketBossRoomGrunt1Text:
    text "Das ist die letzte"
    line "Besprechung, bevor"
    para "unsere Maschine"
    line "voll funktions-"
    cont "fähig ist."

    para "Ich bin sicher,"
    line "dass es nichts"
    para "gibt, was unserem"
    line "Plan jetzt noch"
    para "in die Quere"
    line "kommen könnte!"
	done
	
RocketBossRoomGrunt2Text:
    text "Der BETRÜGER EICH"
    line "hat gute Arbeit"
    para "geleistet, die"
    line "Bewohner von"
    para "SENDESTIA CITY"
    line "davon zu über-"
    cont "zeugen, sich keine"
    para "Sorgen wegen uns"
    line "zu machen."
	done
	
RocketBossRoomGrunt3Text:
    text "Der VORSTAND ist"
    line "der einzige, der"
    para "das Passwort zum"
    line "Abschalten der"
    para "Gedankenkontrolle"
    line "kennt."

    para "Er ist aber auch"
    line "sehr vergesslich…"
	done
	
RocketBossRoomGrunt4Text:
    text "Die Welt wird"
    line "nicht wissen, wie"
    para "ihr geschieht,"
    line "wenn die Maschine"
    para "auf Hochtouren"
    line "läuft und wir"
    para "all ihre #MON"
    line "für unsere Zwecke"
    cont "einsetzen!"

	done
	
RocketBossRoomGrunt5Text:
    text "Meinen Berechnung-"
    line "en zufolge, sollte"
    para "das Signal zur"
    line "Gedankenkontrolle"
    para "in der nächsten"
    line "Woche seine volle"
    cont "Stärke erreichen!"
	done
	
BadSecurityPractices:
    text "Was ist das?"

    para "Der VORSTAND hat"
    line "einen Zettel an"
    para "seinen Computer"
    line "geklebt…"

    para "Es ist das Pass-"
    line "wort für die"
    cont "Konsole!"

    para "…"

    para "<PLAYER> merkt sich"
    line "das Passwort!"
	done
	
ExecutiveSceneAfterBattleText:
    text "Argh!"

    para "Du hast mich zwar"
    line "im Kampf besiegt,"
    para "aber das ändert"
    line "gar nichts!"

    para "Unsere Maschine"
    line "ist schon fast bei"
    cont "voller Leistung!"

    para "Deine #MON"
    line "haben meine zwar"
    para "besiegt, aber das"
    line "wird bald egal"
    para "sein, wenn auch"
    line "sie unter meiner"
    cont "Kontrolle stehen!"

    para "Wenn du mich jetzt"
    line "entschuldigen wür-"
    cont "dest, ich habe"
    para "wichtige Dinge zu"
    line "erledigen!"
	done
	
ExecutiveWinText:
	text "Das kann ich nicht"
	line "glauben!"
	done
	
ExecutiveLossText:
	text "HA!"
	done
	
TheExecutiveGreeting:
    text "Ist dir eigentlich"
    line "klar, worauf du"
    para "dich hier einge-"
    line "lassen hast?"

    para "Offensichtlich"
    line "nicht, sonst wärst"
    cont "du nicht hier."

    para "…"

    para "Du erinnerst dich"
    line "an mich, oder?"

    para "Ich war der KÄPT'N"
    line "unseres Frachters."

    para "Doch vor allem bin"
    line "ich der leitende"
    para "VORSTAND von TEAM"
    line "ROCKET."

    para "Nur GIOVANNI,"
    line "unser Anführer,"
    cont "steht über mir."

    para "Gehe ich richtig"
    line "in der Annahme,"
    para "dass du herausge-"
    line "funden hast, was"
    cont "wir hier vorhaben?"

    para "Alle Ressourcen,"
    line "die wir gesammelt"
    para "haben, wurden in"
    line "dieses eine Ziel"
    cont "investiert!"

    para "Wir haben ein"
    line "Gerät gebaut, das"
    para "eine mächtige"
    line "Welle aussendet,"
    para "mit der man die"
    line "Gedanken von"
    para "#MON kontrol-"
    line "lieren kann!"

    para "Schon bald stehen"
    line "alle #MON unter"
    para "der Kontrolle von"
    line "TEAM ROCKET!"

    para "Unter unserer Füh-"   ; Absatz evtl. ändern
    line "rung, werden sie"
    para "endlich vernünftig"
    line "eingesetzt!"

    para "Ich werde es nicht"
    line "zulassen, dass du"
    para "dich weiter in den"
    line "Weg von TEAM"
    cont "ROCKET stellst!"
	done
	
	
ImposterTellsYouToSeeExecutive:
    text "Anscheinend haben"
    line "unsere RÜPEL es"
    para "nicht geschafft,"
    line "dich aufzuhalten."

    para "Ehrlich gesagt,"
    line "haben wir damit"
    cont "schon gerechnet."

    para "Ich glaube, du"
    line "solltest den"
    cont "VORSTAND sehen."

    para "Aber ich weiß,"
    line "dass du das eh"
    cont "vorhattest."

    para "Er ist von der"
    line "ganzen Situation"
    para "nicht besonders"
    line "begeistert."

    para "An deiner Stelle,"
    line "hätte ich jetzt"
    cont "'ne Heidenangst."
	done


TeamRocketBaseOffice_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 24, 17, TEAM_ROCKET_BASE_B2F, 4
	warp_event 25, 17, TEAM_ROCKET_BASE_B2F, 5

	db 2 ; coord events
	coord_event  7, 12, SCENE_DEFAULT, ExecutiveConfrontationScene
	coord_event  7, 13, SCENE_DEFAULT, ExecutiveConfrontationScene2


	db 3 ; bg events
	bg_event  9,  1, BGEVENT_ITEM, TeamRocketBaseOfficeHiddenRevive
	bg_event  6,  1, BGEVENT_READ, TeamRocketBaseOfficePassword
	bg_event  7,  1, BGEVENT_READ, TeamRocketBaseOfficePassword


	db 10 ; object events
	object_event  9, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseOfficeHyperPotion, EVENT_TEAM_ROCKET_BASE_OFFICE_HYPER_POTION
	object_event 16,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseOfficeNugget, EVENT_TEAM_ROCKET_BASE_OFFICE_NUGGET
	object_event 24,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseOfficeGuardSpec, EVENT_TEAM_ROCKET_BASE_OFFICE_GUARD_SPEC
	object_event 21,  3, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 1, RocketBossRoomGrunt1, EVENT_ROCKETS_IN_ROCKET_BASE
	object_event 28,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 1, RocketBossRoomGrunt2, EVENT_ROCKETS_IN_ROCKET_BASE
	object_event 22, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 1, RocketBossRoomGrunt3, EVENT_ROCKETS_IN_ROCKET_BASE
	object_event 19,  7, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 1, RocketBossRoomGrunt4, EVENT_ROCKETS_IN_ROCKET_BASE
	object_event 25,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, RocketBossRoomGrunt5, EVENT_ROCKETS_IN_ROCKET_BASE
	object_event  7, 11, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 1, ObjectEvent, EVENT_IMPOSTOR_AND_EXECUTIVE_DISAPPEAR
	object_event  4,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 1, ObjectEvent, EVENT_IMPOSTOR_AND_EXECUTIVE_DISAPPEAR
