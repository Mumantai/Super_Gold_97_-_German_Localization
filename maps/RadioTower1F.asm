	object_const_def ; object_event constants
	const RADIOTOWER1F_LASS
	const RADIOTOWER1F_YOUNGSTER
	const RADIOTOWER1F_GENTLEMAN
	const RADIOTOWER1F_COOLTRAINER_F
	const RADIOTOWER1F_GRUNTM12

RadioTower1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


RadioTower1FLuckyNumberManScript:
	faceplayer
	opentext
	writetext UnknownText_0x5ceba
	buttonsound
	special CheckLuckyNumberShowFlag
	iffalse .skip
	special ResetLuckyNumberShowFlag
.skip
	special PrintTodaysLuckyNumber
	checkflag ENGINE_LUCKY_NUMBER_SHOW
	iftrue .GameOver
	writetext UnknownText_0x5cf3a
	buttonsound
	closetext
	opentext
	writetext UnknownText_0x5cf5a
	buttonsound
	waitsfx
	writetext UnknownText_0x5cf79
	playsound SFX_DEX_FANFARE_20_49
	waitsfx
	buttonsound
	special CheckForLuckyNumberWinners
	closetext
	opentext
	ifequal 1, .FirstPlace
	ifequal 2, .SecondPlace
	ifequal 3, .ThirdPlace
	jump .NoPrize

.GameOver:
	writetext UnknownText_0x5cf7e
	waitbutton
	closetext
	end

.FirstPlace:
	writetext UnknownText_0x5cfb5
	playsound SFX_1ST_PLACE
	waitsfx
	buttonsound
	giveitem MASTER_BALL
	iffalse .BagFull
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	jump .GameOver

.SecondPlace:
	writetext UnknownText_0x5d023
	playsound SFX_2ND_PLACE
	waitsfx
	buttonsound
	giveitem EXP_SHARE
	iffalse .BagFull
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	jump .GameOver

.ThirdPlace:
	writetext UnknownText_0x5d076
	playsound SFX_3RD_PLACE
	waitsfx
	buttonsound
	giveitem PP_UP
	iffalse .BagFull
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	jump .GameOver

.NoPrize:
	writetext UnknownText_0x5d0c0
	waitbutton
	closetext
	end

.BagFull:
	writetext UnknownText_0x5d0e6
	waitbutton
	closetext
	end

RadioTower1FRadioCardWomanScript:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .ReceptionistTakeover
	checkflag ENGINE_RADIO_CARD
	iftrue .GotCard
	writetext UnknownText_0x5d12d
	yesorno
	iffalse .NoQuiz
	writetext UnknownText_0x5d1f2
	yesorno
	iffalse .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext UnknownText_0x5d231
	yesorno
	iffalse .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext UnknownText_0x5d282
	yesorno
	iftrue .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext UnknownText_0x5d2bc
	yesorno
	iffalse .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext UnknownText_0x5d30e
	yesorno
	iftrue .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext UnknownText_0x5d37b
	buttonsound
	stringtotext .RadioCardText, MEM_BUFFER_1
	scall .ReceiveItem
	writetext UnknownText_0x5d3c0
	buttonsound
	setflag ENGINE_RADIO_CARD
.GotCard:
	writetext UnknownText_0x5d3e5
	waitbutton
	closetext
	end
.ReceptionistTakeover:
	writetext ReceptionistTakeoverText
	waitbutton
	closetext
	end

.RadioCardText:
	db "RADIO-MODUL@"

.ReceiveItem:
	jumpstd ReceiveItemScript
	end

.WrongAnswer:
	playsound SFX_WRONG
	writetext UnknownText_0x5d409
	waitbutton
	closetext
	end

.NoQuiz:
	writetext UnknownText_0x5d443
	waitbutton
	closetext
	end

RadioTower1FLassScript:
	jumptextfaceplayer RadioTower1FLassText

RadioTower1FYoungsterScript:
	jumptextfaceplayer RadioTower1FYoungsterText


RadioTower1FDirectory:
	jumptext RadioTower1FDirectoryText

RadioTower1FLuckyChannelSign:
	jumptext RadioTower1FLuckyChannelSignText
	
TrainerGruntM12:
	trainer GRUNTM, GRUNTM_12, EVENT_BEAT_ROCKET_GRUNTM_12, GruntM12SeenText, GruntM12BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM12AfterBattleText
	waitbutton
	closetext
	end

MovementData_0x5ce71:
	step RIGHT
	turn_head UP
	step_end

MovementData_0x5ce74:
	step LEFT
	turn_head UP
	step_end
	
GruntM12SeenText:
	text "Willkommen im"
	line "RADIOTURM!"

	para "TEAM ROCKET kann"
	line "dir sicherlich"
    cont "alles zeigen, was"
    cont "du heute sehen"
    cont "möchtest!"
	done
	
GruntM12BeatenText:
	text "Losing a battle"
	line "isn't what I was"
	cont "talking about…"

	text "Einen Kampf zu"
	line "verlieren hab' ich"
	cont "damit eigentlich"
	cont "nicht gemeint…"
	done
	
GruntM12AfterBattleText:
	text "TEAM ROCKET arbei-"
	line "tet daran, dass"
	cont "wir uns hier wie"
	cont "zu Hause fühlen!"
	done

ReceptionistTakeoverText:
    text "Guten Tag! Leider"
    line "bieten wir in der"
    cont "momentanen Lage"
    cont "keine Führungen"
    cont "oder Events an."
	done

UnknownText_0x5ce77:
	text "Willkommen!"
	done



UnknownText_0x5ceba:
	text "Hallo! Bist du"
	line "wegen der GLÜCKS-"
	cont "ZAHLSHOW hier?"

	para "Soll ich die"
	line "ID-Nummern deiner"
	cont "#MON über-"
	cont "prüfen?"

	para "Wenn du Glück"
	line "hast, gewinnst du"
	cont "einen Preis."
	done

UnknownText_0x5cf3a:
	text "Die ID-Nummer"
	line "dieser Woche"
	cont "lautet @"
	text_ram wStringBuffer3
	text "."
	done

UnknownText_0x5cf5a:
	text "Mal sehen, ob"
	line "du Glück hast."
	done

UnknownText_0x5cf79:
	text "…"
	line "…"
	done

UnknownText_0x5cf7e:
	text "Versuche nächste"
	line "Woche erneut"
	cont "dein Glück bei der"
	cont "GLÜCKSZAHLSHOW."
	done

UnknownText_0x5cfb5:
	text "Wow! Alle fünf"
	line "Ziffern stimmen"
	cont "überein!"

	para "Du gewinnst den"
	line "Hauptpreis!"

	para "Du gewinnst einen"
	line "MEISTERBALL!"
	done

UnknownText_0x5d023:
	text "Hey! Die letzten"
	line "drei Ziffern"
	cont "stimmen überein!"

	para "Du hast den"
	line "zweiten Preis"
	cont "gewonnen: Den"
	cont "EP-TEILER!"
	done

UnknownText_0x5d076:
	text "Ooh, die letzten"
	line "beiden Ziffern"
	cont "stimmen überein."

	para "Du hast den"
	line "dritten Preis"
	cont "gewonnen: AP-PLUS."
	done

UnknownText_0x5d0c0:
	text "Leider stimmt"
	line "keine deiner"
	cont "Ziffern überein."
	done

UnknownText_0x5d0e6:
	text "Du kannst den"
	line "Preis nicht"
	cont "tragen."

	para "Schaffe Platz und"
	line "komm gleich"
	cont "wieder zurück."
	done

UnknownText_0x5d12d:
	text "Bei uns läuft"
	line "momentan ein"
	cont "besonderes Quiz."

	para "Beantworte die"
	line "fünf Fragen"
	cont "richtig, um ein"
	cont "RADIO-MODUL"
	cont "zu gewinnen."

	para "Stecke es in den"
	line "#COM, um"

	para "überall und zu"
	line "jeder Zeit Radio"
	cont "hören zu können."

	para "Möchtest du am"
	line "Quiz teilnehmen?"
	done

UnknownText_0x5d1f2:
	text "Frage 1:"

	para "Gibt es ein #-"
	line "MON, das nur VOR-"
	cont "MITTAGs erscheint?"
	done

UnknownText_0x5d231:
	text "Korrekt!"
	line "Frage 2:"

	para "Ist diese Aussage"
	line "korrekt?"

	para "Du kannst BEEREN"
	line "nicht im SUPER-"
	cont "MARKT erstehen."
	done

UnknownText_0x5d282:
	text "Richtig!"
	line "Frage 3:"

	para "Ist VM01 BLITZ?"
	done

UnknownText_0x5d2bc:
	text "Nicht übel!"
	line "Frage 4:"

	para "Ist FALK der"
	line "ARENALEITER von"

	para "PAGETIA CITY, der"
	line "Vogel-#MON"
	cont "einsetzt?"
	done

UnknownText_0x5d30e:
	text "Wieder richtig!"
	line "Hier die letzte"
	cont "Frage:"

    para "Ist die Route 102"
    line "die Route nördlich"
    cont "von PORT ABANISHI?"
	done

UnknownText_0x5d37b:
	text "Bingo! Richtig!"
	line "Glückwunsch!"

	para "Hier hast du"
	line "deinen Preis:"
	cont "ein RADIO-MODUL!"
	done

UnknownText_0x5d3c0:
	text "<PLAYER>s #COM"
	line "kann jetzt auch"
	cont "als Radio ver-"
	cont "wendet werden!"
	done

UnknownText_0x5d3e5:
	text "Höre dir bitte"
	line "unsere Shows an!"
	done

UnknownText_0x5d409:
	text "Oh, nein."
	line "Das war leider"

	para "falsch. Versuch's"
	line "noch einmal!"
	done

UnknownText_0x5d443:
	text "Oh. Ich verstehe."
	line "Komm wieder, wenn"
	cont "du deine Meinung"
	cont "geändert hast."
	done

RadioTower1FLassText:
	text "KEN ist ein"
	line "großartiger DJ."

	para "Seine sonore"
	line "Stimme lässt mich"
	cont "dahinschmelzen!"
	done

RadioTower1FYoungsterText:
	text "Ich liebe MARGIT"
	line "vom #MON-TALK."

	para "Ich habe sie"
	line "einmal persönlich"
	cont "getroffen. Sie ist"
	cont "echt freundlich!"
	done


RadioTower1FDirectoryText:
	text "EG REZEPTION"
	line "1S STUDIO 1"

	para "2S PERSONAL"
	line "3S STUDIO 2"

	para "4S STUDIO 3"
	line "5S BÜRO DES"
	cont "   INTENDANTEN"
	done

RadioTower1FLuckyChannelSignText:
	text "GLÜCKSKANAL!"

	para "Gewinne mit #-"
	line "MON-ID-Nummern!"

	para "Tausche deine "
	line "#MON, um viele"
	cont "ID-Nummern zu"
	cont "erhalten!"
	done

RadioTower1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2,  7, WESTPORT_CITY, 6
	warp_event  3,  7, WESTPORT_CITY, 11
	warp_event  7,  0, RADIO_TOWER_2F, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5,  0, BGEVENT_READ, RadioTower1FDirectory
	bg_event  3,  0, BGEVENT_READ, RadioTower1FLuckyChannelSign

	db 5 ; object events
	object_event  4,  1, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, RadioTower1FLassScript, EVENT_WESTPORT_CITY_CIVILIANS
	object_event  2,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower1FYoungsterScript, EVENT_WESTPORT_CITY_CIVILIANS
	object_event  7,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower1FLuckyNumberManScript, EVENT_WESTPORT_CITY_CIVILIANS
	object_event  6,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower1FRadioCardWomanScript, -1
	object_event  0,  5, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 4, TrainerGruntM12, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
