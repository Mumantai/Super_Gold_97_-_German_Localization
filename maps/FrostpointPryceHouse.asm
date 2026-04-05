	object_const_def ; object_event constants
	const FROSTPOINTPRYCEHOUSE_POKEFAN_F
	const FROSTPOINTPRYCEHOUSE_TWIN
	const FROSTPOINTPRYCEHOUSE_PRYCE

FrostpointPryceHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FrostpointPryceHousePokefanFScript:
	faceplayer
	opentext
	checkevent EVENT_PRYCE_IN_DEEPWATER
	iffalse .PryceVisitsSoonG
	checkevent EVENT_PRYCE_IN_HOME
	iffalse .PryceIsVisitingG
	checkflag ENGINE_GLACIERBADGE
	iffalse .GoBeatPryce
	checkevent EVENT_GOT_HM06_WHIRLPOOL
	iftrue .AlreadyGotWhirlpool
	writetext HereIsWhirlpool
	waitbutton
	verbosegiveitem HM_WHIRLPOOL
	setevent EVENT_GOT_HM06_WHIRLPOOL
	writetext NowYouHaveWhirlpool
	waitbutton
	closetext
	end
	
.AlreadyGotWhirlpool
	writetext PryceVisitingIsMyFavoriteG
	waitbutton
	closetext
	end
	
.PryceVisitsSoonG
	writetext PryceIsComingToVisitG
	waitbutton
	closetext
	end
	
.PryceIsVisitingG
	writetext PryceIsHereG
	waitbutton
	closetext
	end
	
.GoBeatPryce
	writetext GoBeatHimPryce
	waitbutton
	closetext
	end

FrostpointPryceHouseTwinScript:
	faceplayer
	opentext
	checkevent EVENT_PRYCE_IN_DEEPWATER
	iffalse .PryceVisitsSoon
	checkevent EVENT_PRYCE_IN_HOME
	iffalse .PryceIsVisiting
	writetext PryceVisitingIsMyFavorite
	waitbutton
	closetext
	end
	
.PryceVisitsSoon
	writetext PryceIsComingToVisit
	waitbutton
	closetext
	end
	
.PryceIsVisiting
	writetext PryceIsHere
	waitbutton
	closetext
	end
	
FrostpointPryceHousePryceScript:
	faceplayer
	opentext
	writetext FrostpointPryceHousePryceText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal UP, .PryceWalksAroundPlayer2
	applymovement FROSTPOINTPRYCEHOUSE_PRYCE, PryceLeavesMovement2
	playsound SFX_EXIT_BUILDING
	disappear FROSTPOINTPRYCEHOUSE_PRYCE
	setevent EVENT_PRYCE_IN_HOME
	clearevent EVENT_PRYCE_IN_GYM
	waitsfx
	end

.PryceWalksAroundPlayer2
	applymovement FROSTPOINTPRYCEHOUSE_PRYCE, PryceLeavesMovement2Alt
	playsound SFX_EXIT_BUILDING
	disappear FROSTPOINTPRYCEHOUSE_PRYCE
	setevent EVENT_PRYCE_IN_HOME
	clearevent EVENT_PRYCE_IN_GYM
	waitsfx
	end
	
PryceLeavesMovement2Alt:
	step RIGHT
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step_end
	
PryceLeavesMovement2:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step DOWN
	step_end

FrostpointPryceHouseBookshelf:
	jumpstd PictureBookshelfScript
	
HereIsWhirlpool:
    text "Ah, ich sehe, du"
    line "hast den EISORDEN"
    para "von meinem Mann"
    line "erhalten."

    para "Hier, ich habe"
    line "etwas für dich,"
    para "das sehr nützlich"
    line "für dich sein"
    cont "wird."
	done
	
NowYouHaveWhirlpool:
    text "Diese VM enthält"
    line "WHIRLPOOL."

    para "Sie wird dir"
    line "helfen, die rauen"
    para "Gewässer im Norden"
    line "von NIHON zu"
    cont "durchqueren."
	done
	
PryceVisitingIsMyFavoriteG:
    text "Ich respektiere"
    line "die Hingabe, die"
    para "ALBERT für seine"
    line "Verantwortungen"
    cont "zeigt."
	done
	
PryceIsComingToVisitG:
    text "ALBERT, mein Ehe-"
    line "mann, ist der"
    para "ARENALEITER in"
    line "KITAOMORIA CITY."

    para "Er reist oft"
    line "dorthin, um zu"
    cont "kämpfen."

    para "Er verbringt auch"
    line "viel Zeit mit dem"
    para "Training im TIEF-"
    line "WASSERPFAD."

    para "Aber er nimmt sich"
    line "immer Zeit, um"
    para "nach Hause zu"
    line "kommen."

    para "Er sollte bald"
    line "hier sein."
	done
	
PryceIsHereG:
    text "Es ist schön,"
    line "ALBERT zu Hause"
    cont "zu haben."
	done
	
GoBeatHimPryce:
    text "Ich sehe, dass"
    line "ALBERT auf deine"
    para "Herausforderung"
    line "wartet."

    para "Komm zu mir, wenn"
    line "du ihn besiegen"
    cont "solltest."

    para "Ich habe dann ein"
    line "Geschenk für dich."
	done

PryceVisitingIsMyFavorite:
	text "Am schönsten ist"
	line "es, wenn Opa zu"
	cont "Besuch kommt."
	done
	
PryceIsComingToVisit:
	text "Opa kommt bald"
	line "zu Besuch!"
	done
	
PryceIsHere:
	text "Juhu! Opa ist da!"
	done
	
FrostpointPryceHousePryceText:
    text "Schön, dass du es"
    line "geschafft hast,"
    cont "vorbeizuschauen."

    para "Jeder Trainer, der"
    line "es zu meinem"
    para "Trainingsplatz"
    line "schafft, ist ein"
    para "Trainer, den ich"
    line "respektiere."

    para "Wie heißt du"
    line "eigentlich?"

    para "<PLAYER>?"

    para "Also, <PLAYER>, wie"
    line "versprochen, werde"
    para "ich wieder in"
    line "meine PKMN-ARENA"
    cont "zurückkehren."

	para "Ich erwarte einen"
	line "würdigen Gegner."
	done

FrostpointPryceHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, FROSTPOINT_TOWN, 4
	warp_event  5,  7, FROSTPOINT_TOWN, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  0, BGEVENT_READ, FrostpointPryceHouseBookshelf
	bg_event  0,  0, BGEVENT_READ, FrostpointPryceHouseBookshelf

	db 3 ; object events
	object_event  1,  2, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, FrostpointPryceHousePokefanFScript, -1
	object_event  5,  2, SPRITE_TWIN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FrostpointPryceHouseTwinScript, -1
	object_event  7,  4, SPRITE_PRYCE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FrostpointPryceHousePryceScript, EVENT_PRYCE_IN_HOME
