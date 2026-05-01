	object_const_def ; object_event constants
	const IEJIMA_GRAMPS
	const IEJIMA_BIKER1
	const IEJIMA_BIKER2
	const IEJIMA_BIKER3
	const IEJIMA_YOUNGSTER
	const IEJIMA_BIKER4
	const IEJIMA_BIKER5
	const IEJIMA_BIKER6
	const IEJIMA_SWIMMERF
	const IEJIMA_SWIMMERM
	const IEJIMA_LASS
	const IEJIMA_TRIWING

IejimaTown_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_TILES, .NoWater

.NoWater:
	checkevent EVENT_IEJIMA_TOWN_FIXED
	iftrue .IejimaTownFixed
	changeblock  11,  7, $7A ; floor
	changeblock  13,  7, $7A ; floor
	changeblock  15,  7, $7A ; floor
	changeblock  17,  7, $7A ; floor
	changeblock  13,  9, $7A ; floor
	changeblock  15,  9, $7A ; floor
	changeblock  17,  9, $7A ; floor
	changeblock  11, 11, $7A ; floor
	changeblock  13, 11, $7A ; floor
	changeblock  15, 11, $7A ; floor
	changeblock  17, 11, $7A ; floor
	changeblock  15, 13, $7A ; floor
	changeblock  13, 13, $7A ; floor
	changeblock  11, 13, $7A ; floor
	changeblock  19, 11, $7A ; floor
	changeblock  19,  9, $7A ; floor
	changeblock  19,  7, $6B ; rock
	changeblock  17, 13, $6B ; rock
	changeblock  11,  9, $6B ; rock
	changeblock  13,  1, $60 ; dry
	changeblock  13,  3, $60 ; dry
	changeblock  13,  5, $60 ; dry
	changeblock  15,  1, $60 ; dry
	changeblock  15,  3, $60 ; dry
	changeblock  15,  5, $60 ; dry
	changeblock  17,  1, $60 ; dry
	changeblock  17,  3, $60 ; dry
	changeblock  17,  5, $60 ; dry
	changeblock   9,  7, $10 ; left edge
	changeblock   9,  9, $10 ; left edge
	changeblock   9, 11, $10 ; left edge
	changeblock   9, 13, $10 ; left edge
	changeblock  21,  7, $12 ; right edge
	changeblock  21,  9, $12 ; right edge
	changeblock  21, 11, $12 ; right edge
	return
	
.IejimaTownFixed
	return
	
	
.FlyPoint:
	setflag ENGINE_FLYPOINT_IEJIMA
	return
	
IejimaTownPokecenterSign:
	jumpstd PokecenterSignScript
	
IejimaTownGrampsBefore:
	jumptextfaceplayer IejimaTownGrampsBeforeText
	
IejimaTownBiker1:
	jumptextfaceplayer IejimaTownBiker1Text
	
IejimaTownBiker2:
	jumptextfaceplayer IejimaTownBiker2Text
	
IejimaTownBiker3:
	jumptextfaceplayer IejimaTownBiker3Text	
	
	
IejimaTownBiker4:
	jumptextfaceplayer IejimaTownBiker4Text
	
	
IejimaTownBiker5:
	jumptextfaceplayer IejimaTownBiker5Text
	
	
IejimaTownBiker6:
	jumptextfaceplayer IejimaTownBiker6Text
	
IejimaTownTriWingItem:
	turnobject IEJIMA_YOUNGSTER, DOWN
	opentext
	writetext ItemWashedUpText
	waitbutton
	closetext
	disappear IEJIMA_TRIWING
	opentext
	waitsfx
	giveitem TRI_WING
	writetext GotTriWingText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	setevent EVENT_IEJIMA_TOWN_TRI_WING
	end
	
IejimaTownLass:
	faceplayer
	opentext
	checkevent EVENT_IEJIMA_TOWN_FIXED
	iffalse .LassNotFixedYet
	writetext IejimaTownLassText
	waitbutton
	closetext
	end
	
.LassNotFixedYet
	writetext IejimaTownLassText2
	waitbutton
	closetext
	end

IejimaTownYoungster:
	faceplayer
	opentext
	checkevent EVENT_IEJIMA_TOWN_FIXED
	iffalse .YoungsterNotFixedYet
	checkevent EVENT_IEJIMA_TOWN_TRI_WING
	iffalse .GetTriWing
	writetext IejimaTownYoungsterText
	waitbutton
	closetext
	end
	
.GetTriWing
	writetext ItemWashedUpText
	waitbutton
	closetext
	pause 15
	turnobject IEJIMA_YOUNGSTER, DOWN
	disappear IEJIMA_TRIWING
	pause 15
	faceplayer
	opentext
	waitsfx
	giveitem TRI_WING
	writetext GotTriWingText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	setevent EVENT_IEJIMA_TOWN_TRI_WING
	end
	
.YoungsterNotFixedYet
	writetext IejimaTownYoungsterText2
	waitbutton
	closetext
	end
	
IejimaTownSwimmerGirl:
	jumptextfaceplayer IejimaTownSwimmerGirlText
	
IejimaTownSwimmerGuy:
	jumptextfaceplayer IejimaTownSwimmerGuyText
	
ItemWashedUpText:
    text "Hey, sieh mal!"

    para "Etwas wurde an die"
    line "Küste gespült, als"
    para "das Wasser wieder"
    line "zu fließen begann!"

    para "Es sieht aus, wie"
    line "eine Art Feder."

    para "Ich wüsste nicht,"
    line "was ich damit tun"
    para "soll, also nimm du"
    line "es ruhig!"
	done
	
GotTriWingText:
	text "<PLAYER> erhält"
	line "TRI-SCHWINGE!"
	done
	
IejimaTownLassText:
    text "Zum Glück ist mit"
    line "dem WASSERKRAFT-"
    cont "WERK wieder alles"
    cont "in Ordnung."
	done
	
IejimaTownLassText2:
    text "Der Wasserfall und"
    line "der Teich, den er"
    para "speist, sind der"
    line "ganze Stolz dieser"
    cont "Stadt."

    para "Es ist wirklich"
    line "schlimm, dass das"
    para "Wasser jetzt nicht"
    line "mehr fließt."
	done
	
IejimaTownSwimmerGirlText:
    text "Dieser Teich ist"
    line "so friedlich."
	done
	
IejimaTownSwimmerGuyText:
    text "Ich schwimme hier"
    line "gerne ein paar"
    para "Runden, um zu"
    line "trainieren!"
	done
	
IejimaTownBiker4Text:
    text "Wir wurden von ein"
    line "paar Polizisten"
    para "aus dem Becken"
    line "gejagt."

    para "Zum Glück, denn"
    line "das Wasser fing an"
    cont "wieder zu fließen!"
	done
	
IejimaTownBiker5Text:
    text "Die Leute mochten"
    line "es gar nicht, als"
    para "wir den Wasserfall"
    line "gestoppt haben."

    para "Vielleicht sollten"
    line "wir das nicht noch"
    para "einmal machen,"
    line "wenn wir keinen"
    cont "Ärger wollen."
	done

IejimaTownBiker6Text:
    text "Ich hätte Lust,"
    line "woanders hin zu"
    cont "fahren."
	done
	
IejimaTownBiker1Text:
	text "Hehe!"

	para "Dieser Ort ist"
	line "super, um mit dem"
	para "Motorrad herum"
	line "zu fahren!"
	done
	
IejimaTownBiker2Text:
    text "II-SHIMA, pass"
    line "auf!"

    para "Wir sind gekommen,"
    line "um zu bleiben!"
	done
	
IejimaTownBiker3Text:
    text "Seit wir den Damm"
    line "im WASSERKRAFTWERK"
    para "geschlossen haben,"
    line "ist der Boden hier"
    cont "schön trocken!"

    para "Jetzt haben wir so"
    line "viel Platz zum"
    cont "Fahren!"
	done
	
IejimaTownYoungsterText:
    text "Es ist so schön,"
    line "hier am Wasser zu"
    cont "stehen."
	done
	
IejimaTownYoungsterText2:
    text "Das ist furchtbar!"

    para "Das Wasser sollte"
    line "hier bis zu meinen"
    cont "Füßen reichen!"

    para "Was ist denn da"
    line "nur los im WASSER-"
    cont "KRAFTWERK?"
	done
	
IejimaTownGrampsBeforeText:
    text "Oje!"

    para "Was ist nur mit"
    line "unserem geliebten"
    cont "Wasserfall los?"

    para "Dahinter stecken"
    line "bestimmt diese"
    para "BIKER, die hier"
    line "aufgetaucht sind!"
	done

IejimaTown_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 23,  7, MOTOBU_PATH_IEJIMA_GATE, 1
	warp_event  1,  6, IEJIMA_POKECENTER_1F, 1
	warp_event  7, 15, IEJIMA_HOUSE_1, 1
	warp_event 19, 14, IEJIMA_HOUSE_2, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  2,  6, BGEVENT_READ, IejimaTownPokecenterSign

	db 12 ; object events
	object_event 13,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, IejimaTownGrampsBefore, EVENT_IEJIMA_TOWN_FIXED
	object_event 11, 11, SPRITE_BIKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, IejimaTownBiker1, EVENT_IEJIMA_TOWN_FIXED
	object_event 15, 12, SPRITE_BIKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, IejimaTownBiker2, EVENT_IEJIMA_TOWN_FIXED
	object_event 16,  8, SPRITE_BIKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, IejimaTownBiker3, EVENT_IEJIMA_TOWN_FIXED
	object_event  7, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, IejimaTownYoungster, -1
	object_event 14, 14, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, IejimaTownBiker4, EVENT_IEJIMA_TOWN_NOT_FIXED
	object_event 13, 14, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, IejimaTownBiker5, EVENT_IEJIMA_TOWN_NOT_FIXED
	object_event 12, 14, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, IejimaTownBiker6, EVENT_IEJIMA_TOWN_NOT_FIXED
	object_event 12,  9, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, IejimaTownSwimmerGirl, EVENT_IEJIMA_TOWN_NOT_FIXED
	object_event 17, 10, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, IejimaTownSwimmerGuy, EVENT_IEJIMA_TOWN_NOT_FIXED
	object_event 24, 11, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, IejimaTownLass, -1
	object_event  7, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IejimaTownTriWingItem, EVENT_IEJIMA_TOWN_TRI_WING
