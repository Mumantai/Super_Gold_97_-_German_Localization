	object_const_def ; object_event constants
	const KANTOCAFE2_SUPER_NERD
	const KANTOCAFE2_FISHER1
	const KANTOCAFE2_FISHER2
	const KANTOCAFE2_FISHER3
	const KANTOCAFE2_TEACHER

KantoRestaurant_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoCafe2Chef:
	faceplayer
	opentext
	writetext ChefText_Eatathon
	waitbutton
	closetext
	end

KantoCafe2Fisher1:
	opentext
	writetext Fisher1Text_Snarfle
	waitbutton
	closetext
	faceplayer
	opentext
	writetext Fisher1Text_Concentration
	waitbutton
	closetext
	turnobject KANTOCAFE2_FISHER1, LEFT
	end

KantoCafe2Fisher2:
	opentext
	writetext Fisher2Text_GulpChew
	waitbutton
	closetext
	faceplayer
	opentext
	writetext Fisher2Text_Quantity
	waitbutton
	closetext
	turnobject KANTOCAFE2_FISHER2, RIGHT
	end

KantoCafe2Fisher3:
	opentext
	writetext Fisher3Text_MunchMunch
	waitbutton
	closetext
	faceplayer
	opentext
	writetext Fisher3Text_WestportIsBest
	waitbutton
	closetext
	turnobject KANTOCAFE2_FISHER3, RIGHT
	end

KantoCafe2Teacher:
	checkitem COIN_CASE
	iftrue .HasCoinCase
	opentext
	writetext TeacherText_CrunchCrunch
	waitbutton
	closetext
	faceplayer
	opentext
	writetext TeacherText_NoCoinCase
	waitbutton
	closetext
	turnobject KANTOCAFE2_TEACHER, LEFT
	end

.HasCoinCase:
	opentext
	writetext TeacherText_KeepEating
	waitbutton
	closetext
	turnobject KANTOCAFE2_TEACHER, RIGHT
	opentext
	writetext TeacherText_MoreChef
	waitbutton
	closetext
	turnobject KANTOCAFE2_TEACHER, LEFT
	end

EatathonContestPoster:
	jumptext EatathonContestPosterText

KantoCafe2Trashcan:
	checkevent EVENT_FOUND_MYSTERYBERRY_IN_KANTO_CAFE
	iftrue .TrashEmpty
	giveitem MYSTERYBERRY
	iffalse .PackFull
	opentext
	itemtotext MYSTERYBERRY, MEM_BUFFER_0
	writetext FoundLeftoversText2
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	setevent EVENT_FOUND_MYSTERYBERRY_IN_KANTO_CAFE
	end

.PackFull:
	opentext
	itemtotext MYSTERYBERRY, MEM_BUFFER_0
	writetext FoundLeftoversText2
	buttonsound
	writetext NoRoomForLeftoversText2
	waitbutton
	closetext
	end

.TrashEmpty:
	jumpstd TrashCanScript

ChefText_Eatathon:
	text "Hi!"

	para "Wir halten gerade"
	line "ein Wettessen ab."

	para "Wir können dich"
	line "im Moment leider"
	cont "nicht bedienen."
	done

Fisher1Text_Snarfle:
	text "…Schlürf,"
	line "schlabber…"
	done

Fisher1Text_Concentration:
	text "Sprich mich"
	line "nicht an!"

	para "Du störst meine"
	line "Konzentration!"
	done

Fisher2Text_GulpChew:
	text "…Schluck…"
	line "Schling…"
	done

Fisher2Text_Quantity:
	text "Quantität ist mir"
	line "wichtiger als"
	cont "Qualität!"

	para "Ich bin erst"
	line "glücklich, wenn"
	cont "ich platze!"
	done

Fisher3Text_MunchMunch:
	text "Mampf, mampf…"
	done

Fisher3Text_WestportIsBest:
	text "Das Essen hier ist"
	line "gut, aber in"
	cont "GENEOS CITY gibt"
	cont "es die besten"
	cont "Speisen der Welt."
	done

TeacherText_CrunchCrunch:
	text "Krümel… Mampf…"
	done

TeacherText_NoCoinCase:
	text "Hier wird dir"
	line "niemand einen"

	para "MÜNZKORB geben."
	line "Den bekommst du"
	cont "in JOHTO."
	done

TeacherText_KeepEating:
	text "Krümel… Kau…"

	para "Ich esse immer"
	line "weiter!"
	done

TeacherText_MoreChef:
	text "Nachschub,"
	line "CHEFKOCH!"
	done

EatathonContestPosterText:
	text "Wettessen! Essen"
	line "bis zum Umfallen!"

	para "Kein Zeitlimit!"
	line "Der größte"

	para "Vielfraß bekommt"
	line "alles umsonst!"
	done

FoundLeftoversText2:
	text "<PLAYER> hat"
	line "@"
	text_ram wStringBuffer3
	text_start
	cont "gefunden."
	done

NoRoomForLeftoversText2:
	text "Aber <PLAYER> kann"
	line "kein weiteres Item"
	cont "aufnehmen…"
	done

KantoRestaurant_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  9, KANTO_REGION, 30
	warp_event  5,  9, KANTO_REGION, 31

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5,  0, BGEVENT_READ, EatathonContestPoster
	bg_event  9,  9, BGEVENT_READ, KantoCafe2Trashcan

	db 5 ; object events
	object_event  5,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, KantoCafe2Chef, -1
	object_event  2,  8, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoCafe2Fisher1, -1
	object_event  7,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KantoCafe2Fisher2, -1
	object_event  7,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoCafe2Fisher3, -1
	object_event  2,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoCafe2Teacher, -1
