	object_const_def ; object_event constants
	const ROUTE119_FISHER1
	const ROUTE119_FISHER2
	const ROUTE119_ROCKET1
	const ROUTE119_ROCKET2
	const LAKEOFRAGE_WESLEY
	const ROUTE119_ITEMBALL_1
	const ROUTE119_ITEMBALL_2
	const ROUTE119_COOLTRAINER_M

Route119_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Wesley


.Wesley:
	checkcode VAR_WEEKDAY
	ifequal WEDNESDAY, .WesleyAppears
	disappear LAKEOFRAGE_WESLEY
	return

.WesleyAppears:
	appear LAKEOFRAGE_WESLEY
	return
	
Route119Roar:
	itemball TM_ROAR

Route119CrownPathSign:
	jumptext Route119CrownPathSignText

Route119LockedDoor:
	jumptext Route119LockedDoorText
	
TrainerFisherJustin:
	trainer FISHER, JUSTIN, EVENT_BEAT_FISHER_JUSTIN, FisherJustinSeenText, FisherJustinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherJustinAfterText
	waitbutton
	closetext
	end



TrainerFisherChris:
	trainer FISHER, CHRIS1, EVENT_BEAT_FISHER_CHRIS, FisherChrisSeenText, FisherChrisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_CHRIS_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_FISHER_CHRIS
	iftrue .NumberAccepted
	checkevent EVENT_CHRIS_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext FisherChrisAfterBattleText
	promptbutton
	setevent EVENT_CHRIS_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_FISHER_CHRIS
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, FISHER, CHRIS1
	scall .RegisteredNumber
	sjump .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext FisherChrisBeatenText, 0
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight2
	checkflag ENGINE_FLYPOINT_STAND
	iftrue .LoadFight1
	loadtrainer FISHER, CHRIS1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_CHRIS_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer FISHER, CHRIS2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_CHRIS_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer FISHER, CHRIS3
	startbattle
	reloadmapafterbattle
	clearevent EVENT_CHRIS_READY_FOR_REMATCH
	end

.AskNumber1:
	jumpstd AskNumber1MScript
	end

.AskNumber2:
	jumpstd AskNumber2MScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberMScript
	end

.NumberAccepted:
	jumpstd NumberAcceptedMScript
	end

.NumberDeclined:
	jumpstd NumberDeclinedMScript
	end

.PhoneFull:
	jumpstd PhoneFullMScript
	end

.Rematch:
	jumpstd RematchMScript
	end
	
	
Route119Rocket1Script:
	opentext
	writetext Route119Rocket1Text
	waitbutton
	closetext
	end
	
Route119Rocket2Script:
	opentext
	writetext Route119Rocket2Text
	waitbutton
	closetext
	end
	
WesleyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BLACKBELT_FROM_WESLEY
	iftrue WesleyWednesdayScript
	checkcode VAR_WEEKDAY
	ifnotequal WEDNESDAY, WesleyNotWednesdayScript
	checkevent EVENT_MET_WESLEY_OF_WEDNESDAY
	iftrue .MetWesley
	writetext MeetWesleyText
	buttonsound
	setevent EVENT_MET_WESLEY_OF_WEDNESDAY
.MetWesley:
	writetext WesleyGivesGiftText
	buttonsound
	verbosegiveitem BLACKBELT_I
	iffalse WesleyDoneScript
	setevent EVENT_GOT_BLACKBELT_FROM_WESLEY
	writetext WesleyGaveGiftText
	waitbutton
	closetext
	end

WesleyWednesdayScript:
	writetext WesleyWednesdayText
	waitbutton
WesleyDoneScript:
	closetext
	end

WesleyNotWednesdayScript:
	writetext WesleyNotWednesdayText
	waitbutton
	closetext
	end


Route119SoftSand:
	itemball SOFT_SAND
	
TrainerSportsmanBryson:
	trainer SPORTSMAN, BRYSON, EVENT_BEAT_SPORTSMAN_BRYSON, SportsmanBrysonSeenText, SportsmanBrysonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SportsmanBrysonAfterText
	waitbutton
	closetext
	end


FisherChrisSeenText:
	text "Ich zeige dir die"
	line "Kraft meiner ge-"
	cont "angelten #MON!"
	done

FisherChrisBeatenText:
	text "Was? Das kann"
	line "nicht sein."
	done

FisherChrisAfterBattleText:
	text "Ich will mit den"
	line "#MON, die ich"
	cont "geangelt habe,"
	cont "CHAMP werden."

	para "Das ist das Beste"
	line "am Angeln!"
	done
	

SportsmanBrysonSeenText:
	text "Puh!"

	para "Es geht doch"
	line "nichts über Joggen"
	cont "am Strand!"
	done

SportsmanBrysonBeatenText:
	text "Sand im Schuh!"
	done

SportsmanBrysonAfterText:
    text "Sand ist nicht"
    line "gerade die beste"
    cont "Oberfläche zum"
    cont "Laufen."
	done

FisherJustinSeenText:
	text "Woah!"

	para "Wegen dir ist"
	line "mir der Fisch"
	cont "entkommen!"
	done

FisherJustinBeatenText:
	text "Platsch!"
	done

FisherJustinAfterText:
    text "Ruhe, Geduld…"
    line "Die Essenz vom"
    cont "Angeln und #MON"
    cont "ist die gleiche."
	done

FisherRalph1SeenText:
    text "Ich bin sowohl im"
    line "Angeln als auch in"
    cont "#MON-Kämpfen"
    cont "richtig gut."

    para "Ich verliere nicht"
    line "gegen ein Kind!"
	done

FisherRalph1BeatenText:
	text "Tse! Ich war"
	line "zu hastig…"
	done

FisherRalphAfterText:
	text "Angeln ist eine"
	line "Leidenschaft fürs"
	cont "Leben."

	para "Und #MON sind"
	line "Freunde fürs"
	cont "Leben!"
	done

FisherRalphSwarmText:
	text "Eins, zwei, drei…"
	line "Muhahaha, was für"
	cont "ein toller Fang!"

	para "Ich bin fertig!"

	para "Fang so viele,"
	line "wie du kannst!"
	done

Route119CrownPathSignText:
	text "ROUTE 119"
	para "TEKNOPIA CITY -"
	line "KAZANAMI CITY"
	done

Route119LockedDoorText:
	text "Durch das TOR"
	line "nach KAZANAMI CITY"
	done
	
Route119Rocket1Text:
	text "Fufufufu…"

	para "Warum sind wir"
	line "überhaupt hier?"
	done
	
Route119Rocket2Text:
	text "Hehehehe…"

	para "Ich glaub, der"
	line "Boss mag uns"
	cont "nicht besonders…"
	done
	
MeetWesleyText:
	text "MITKO: Na, wie"
	line "geht es dir?"

	para "Ich bin MITKO von"
	line "Mittwoch. Soll"
	cont "heißen, heute ist"
	cont "Mittwoch."
	done

WesleyGivesGiftText:
	text "Freut mich, dich"
	line "kennen zu lernen."
	cont "Nimm dir bitte ein"
	cont "Souvenir."
	done

WesleyGaveGiftText:
	text "MITKO: SCHWARZGURT"
	line "verstärkt die"
	cont "Kraft von Kampf-"
	cont "Attacken."
	done

WesleyWednesdayText:
	text "MITKO: Da du mich"
	line "gefunden hast,"
	cont "musst du meine"
	cont "Brüder und Schwes-"
	cont "tern getroffen"
	cont "haben."

	para "Oder hattest du"
	line "einfach nur Glück?"
	done

WesleyNotWednesdayText:
	text "MITKO: Heute ist"
	line "nicht Mittwoch."

	para "Wie schade."
	done


Route119_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 10,  9, ROUTE_119_SUNPOINT_GATE, 3
	warp_event 11,  9, ROUTE_119_SUNPOINT_GATE, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event 12, 44, BGEVENT_READ, Route119CrownPathSign
	bg_event  8, 10, BGEVENT_READ, Route119LockedDoor

	db 8 ; object events
	object_event  7, 48, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherJustin, -1
	object_event 10, 41, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerFisherChris, -1
	object_event 10, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, Route119Rocket1Script, EVENT_103_SLOWPOKE_SALESMAN
	object_event 11, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, Route119Rocket2Script, EVENT_103_SLOWPOKE_SALESMAN
	object_event 12, 29, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, WesleyScript, EVENT_KIKAI_VILLAGE_WESLEY_OF_WEDNESDAY
	object_event  4, 49, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route119Roar, EVENT_ROUTE_119_ROAR_TM
	object_event 10, 31, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route119SoftSand, EVENT_PICKED_UP_CHARCOAL_FROM_HO_OH_ITEM_ROOM
	object_event  5, 27, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSportsmanBryson, -1
