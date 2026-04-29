	object_const_def ; object_event constants
	const KUMESHIPPARTSHOUSE_GURU

KumeShipPartsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FuelLineGuruScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_FUEL_LINE
	iftrue .SSAquaDoingGreat
	checkevent EVENT_GOT_FUEL_LINE
	iffalse .GiveCard
	writetext AlreadyGotFuelLineText
	waitbutton
	closetext
	end
	
.SSAquaDoingGreat
	writetext SSAquaDoingGreatText
	waitbutton
	closetext
	end
	
.GiveCard
	writetext YouNeedAFuelLine
	waitbutton
	verbosegiveitem CARD_KEY
	writetext AlreadyGotFuelLineText
	waitbutton
	closetext
	setevent EVENT_GOT_FUEL_LINE
	end
	
SSAquaDoingGreatText:
    text "Hey, Kleiner!"

    para "Ich hörte, dass "
    line "die M.S. AQUA"
    para "wieder geschmeidig"
    line "über die Wellen"
    cont "gleitet!"
	done
	
YouNeedAFuelLine:
    text "Oh, hallo!"

    para "Du brauchs ein"
    line "Ersatzteil für ein"
    cont "Schiff?"

    para "Da bist du an der"
    line "richtigen Adresse!"

    para "…"

    para "Oh, nein!"

    para "Die BENZINLEITUNG"
    line "der M.S.AQUA ist"
    cont "kaputt?"

    para "Das Schiff ist ein"
    line "modernes Wunder!"

    para "Ich gebe dir das"
    line "passende Teil."
    cont "Komplett gratis!"
	done
	
AlreadyGotFuelLineText:
    text "So, Kleiner. Das"
    line "hier sollte das"
    cont "Teil sein!"

    para "Damit wirst du zum"
    line "Helden der ganzen"
    cont "Besatzung!"
	done

KumeShipPartsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, KUME_CITY, 3
	warp_event  3,  7, KUME_CITY, 3

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  1, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FuelLineGuruScript, -1
