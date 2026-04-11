	object_const_def ; object_event constants
	const KANTOMANSIONROOFHOUSE_PHARMACIST

KantoMansionRoofHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoMansionRoofHousePharmacistScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM03_CURSE
	iftrue .GotCurse
	writetext KantoMansionRoofHousePharmacistIntroText
	buttonsound
	checktime NITE
	iftrue .Night
	writetext KantoMansionRoofHousePharmacistNotNightText
	waitbutton
	closetext
	end

.Night:
	writetext KantoMansionRoofHousePharmacistStoryText
	buttonsound
	verbosegiveitem TM_CURSE
	iffalse .NoRoom
	setevent EVENT_GOT_TM03_CURSE
.GotCurse:
	writetext KantoMansionRoofHousePharmacistCurseText
	waitbutton
.NoRoom:
	closetext
	end

KantoMansionRoofHousePharmacistIntroText:
	text "Lass mich eine"
	line "gruselige Ge-"
	cont "schichte erzählen…"
	done

KantoMansionRoofHousePharmacistNotNightText:
	text "Allerdings so"
	line "unheimlich ist"

	para "sie gar nicht,"
	line "wenn es draußen"
	cont "noch hell ist."

	para "Komm wieder, wenn"
	line "die Sonne unterge-"
	cont "gangen ist, O.K.?"
	done

KantoMansionRoofHousePharmacistStoryText:
	text "Es war einmal ein"
	line "kleiner Junge. Er"

	para "hat eines Tages"
	line "ein neues FAHRRAD"
	cont "bekommen…"

	para "Er wollte sofort"
	line "darauf fahren…"

	para "Das machte ihm so"
	line "viel Spaß, dass er"

	para "gar nicht be-"
	line "merkte, dass die"

	para "Sonne unterge-"
	line "gangen war…"

	para "Auf dem Weg nach"
	line "Hause durch die"

	para "pechschwarze Nacht"
	line "wurde das Rad"
	cont "langsamer!"

	para "Die Pedale wurden"
	line "schwer wie Blei!"

	para "Als er aufhörte,"
	line "in die Pedale zu"

	para "treten, rollte das"
	line "Rad rückwärts!"

	para "Es schien fast,"
	line "als wäre das Rad"

	para "verhext und ver-"
	line "suche, ihn ins"

	para "Verderben zu"
	line "bringen!"

	para "…"

	para "…"

	para "Kreiiisch!"

	para "Der Junge war den"
	line "RADWEG bergauf"
	cont "gefahren!"

	para "…"
	line "Ba-dum ba-dum!"

	para "Es ist schön, dass"
	line "du meiner Ge-"
	cont "schichte so"
	cont "aufmerksam"
	cont "gelauscht hast."
	cont "Nimm dies - TM03!"
	done

KantoMansionRoofHousePharmacistCurseText:
	text "TM03 enthält"
	line "FLUCH."

	para "Das ist eine"
	line "schreckliche"

	para "Attacke, bei der"
	line "die KP des Opfers"
	cont "verringert werden."
	done

KantoMansionRoofHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, KANTO_MANSION_ROOF, 3
	warp_event  4,  7, KANTO_MANSION_ROOF, 3

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  4,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KantoMansionRoofHousePharmacistScript, -1
