	object_const_def ; object_event constants
	const FSG_COP
	const FSG_SCIENTIST1
	const FSG_SCIENTIST2
	const FSG_SCIENTIST3

ForkedStraitGate_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT

	db 0 ; callbacks

.DummyScene:
	end

NeedToWalkOverOneTile:
	step LEFT
	step_end

CredCheckLeft:
	checkevent EVENT_DONE_FS_GATE_CHECK
	iftrue .finish
	opentext
	writetext EventCopHALT
	waitbutton
	closetext
	turnobject PLAYER, LEFT
	opentext
	checkevent EVENT_IEJIMA_TOWN_FIXED
	iffalse .NoEntryYet
	writetext EventCopText
	waitbutton
	closetext
	setevent EVENT_DONE_FS_GATE_CHECK
	setevent EVENT_BLUE_OAK_LAB_FRONT_ROOM_2 ; blue no longer in the lab at silent town
	setevent EVENT_MEW_SPOT_2_FOUND ; islands events initializing
	setevent EVENT_MEW_SPOT_3_FOUND
	setevent EVENT_MEW_SPOT_4_FOUND
	setevent EVENT_MEW_SPOT_5_FOUND
	setevent EVENT_MEW_SPOT_6_FOUND
	setevent EVENT_MEW_SPOT_7_FOUND
	setevent EVENT_MEW_SPOT_8_FOUND
	setevent EVENT_INIT_RIC_OBJECTS_HIDDEN
	setevent EVENT_RIC_BLUE_HIDDEN
	setevent EVENT_RI_BLUEBATTLE_HIDDEN
.finish
	end
	
.NoEntryYet
	writetext NoEntryYetText
	waitbutton
	closetext
	applymovement PLAYER, OneStepUpNoEntryYet
	end
	

CredCheckRight:
	checkevent EVENT_DONE_FS_GATE_CHECK
	iftrue .finish
	opentext
	writetext EventCopHALT
	waitbutton
	closetext
	turnobject PLAYER, LEFT
	applymovement PLAYER, NeedToWalkOverOneTile
	opentext
	checkevent EVENT_IEJIMA_TOWN_FIXED
	iffalse .NoEntryYet2
	writetext EventCopText
	waitbutton
	closetext
	setevent EVENT_DONE_FS_GATE_CHECK
	setevent EVENT_BLUE_OAK_LAB_FRONT_ROOM_2
	setevent EVENT_MEW_SPOT_2_FOUND ; islands events initializing
	setevent EVENT_MEW_SPOT_3_FOUND
	setevent EVENT_MEW_SPOT_4_FOUND
	setevent EVENT_MEW_SPOT_5_FOUND
	setevent EVENT_MEW_SPOT_6_FOUND
	setevent EVENT_MEW_SPOT_7_FOUND
	setevent EVENT_MEW_SPOT_8_FOUND
	setevent EVENT_INIT_RIC_OBJECTS_HIDDEN
	setevent EVENT_RIC_BLUE_HIDDEN
	setevent EVENT_RI_BLUEBATTLE_HIDDEN
.finish
	end
	
.NoEntryYet2
	writetext NoEntryYetText
	waitbutton
	closetext
	applymovement PLAYER, OneStepUpNoEntryYet
	end

OneStepUpNoEntryYet:
	step UP
	step_end
	
NoEntryYetText:
    text "Wir haben ein Team"
    line "von Forschern auf"
    para "den SÜDLICHEN"
    line "INSELN, das eine"
    para "kontrollierte Stu-"
    line "die über #MON"
    cont "durchführt."

    para "Wir können nieman-"
    line "den reinlassen."

    para "Nicht einmal die,"
    line "die normalerweise"
    cont "berechtigt wären."

    para "Bitte komm später"
    line "wieder, wenn du"
    para "die dafür nötige"
    line "Freigabe hast."
	done

EventCopHALT:
	text "HALT!"
	done

EventCopText:
    text "Das hier ist ein"
    line "Sperrgebiet!"

    para "Ab hier, sind"
    line "keine Trainer erl-"

    para "Moment."

    para "… … …"
    line "… … …"

    para "Bist du…"

    para "<PLAYER>, der neue"
    line "CHAMP der #MON"
    cont "LIGA von NIHON?"

    para "Du bist es!"
    line "Entschuldige!"

    para "Die beiden"
    line "SÜDLICHEN INSELN"
    para "sind nur für die"
    line "Allgemeinheit"
    para "gesperrt, aber"
    line "jemanden deines"
    para "Kalibers, kann ich"
    line "durchlassen."

    para "Diese Inseln sind"
    line "ein Paradies für"
    para "#MON. Völlig"
    line "unberührte Natur."

    para "Deshalb sind sie"
    line "für die Forschung"
    cont "auch so wichtig."

    para "Ich nehme an, du"
    line "wurdest von BLAU"
    cont "informiert."

    para "Er ist hier auf"
    line "dem Weg zu seiner"
    para "Forschung auf der"
    line "REGENBOGENINSEL"
    cont "vorbeigekommen."

    para "Geh ruhig weiter!"
	done

FSGCopScript:
	jumptextfaceplayer FSGCopNormalText
	
FSGCopNormalText:
	text "<PLAYER>!"
	line "Du darfst durch!"
	done


FSGScientist1Script:
	jumptextfaceplayer FSGScientist1Text
	
FSGScientist1Text:
    text "Die TROPENINSEL"
    line "im Osten ist voll"
    para "mit seltenen Arten"
    line "von #MON!"

    para "Ich erforsche das"
    line "Potenzial einer"
    para "NEUEN ART auf der"
    line "Insel."
	done

FSGScientist2Script:
	jumptextfaceplayer FSGScientist2Text
	
FSGScientist2Text:
    text "Ich bin einer der"
    line "Glücklichen, die"
    para "die Freigabe zum"
    line "Studieren der"
    para "SÜDLICHEN INSELN"
    line "bekommen hat."

    para "Es soll soga ein"
    line "Promokartenset mit"
    para "den unglaublichen"
    line "#MON-Fotos der"
    para "Forschungsreise"
    line "gedruckt werden!"
	done


FSGScientist3Script:
	jumptextfaceplayer FSGScientist3Text
	
FSGScientist3Text:
    text "Es gibt alte"
    line "Manuskripte, in"
    para "denen die REGEN-"
    line "BOGENINSEL als ein"
    para "wundersamer Ort"
    line "beschrieben wird,"
    para "der immer in"
    line "Regenbogenlicht"
    cont "gehüllt ist."

    para "Ich frage mich, ob"
    line "das bloß eine"
    para "Legende ist oder"
    line "ob diese Insel"
    para "wirklich eine"
    line "besondere Kraft"
    cont "hat…"
	done

TropicalSign:
	jumptext TropicalSignText
	
RainbowSign:
	jumptext RainbowSignText
	
TropicalSignText:
	text "TROPENINSEL"
	line "nach Osten"
	done
	
RainbowSignText:
	text "REGENBOGENINSEL"
	line "nach Westen"
	done


ForkedStraitGate_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event 18,  0,  FORKED_STRAIT_NORTH, 1
	warp_event 19,  0,  FORKED_STRAIT_NORTH, 2
	warp_event 37, 13,  FORKED_STRAIT_EAST, 1
	warp_event 36, 13,  FORKED_STRAIT_EAST, 1
	warp_event  0, 13, FORKED_STRAIT_WEST, 1
	warp_event  1, 13, FORKED_STRAIT_WEST, 1

	db 2 ; coord events
	coord_event 18,  4, SCENE_DEFAULT, CredCheckLeft
	coord_event 19,  4, SCENE_DEFAULT, CredCheckRight

	db 2 ; bg events
	bg_event 34,  6, BGEVENT_READ, TropicalSign
	bg_event  2,  6, BGEVENT_READ, RainbowSign

	db 4 ; object events
	object_event 16,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FSGCopScript, -1
	object_event 16,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FSGScientist1Script, -1
	object_event  8,  7, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FSGScientist2Script, -1
	object_event 28,  8, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FSGScientist3Script, -1
	