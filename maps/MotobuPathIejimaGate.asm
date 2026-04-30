	object_const_def ; object_event constants
	const MOTOBUPATHIEJIMAGATE_OFFICER

MotobuPathIejimaGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MotobuPathIejimaGateOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_FUEL_LINE
	iffalse .BikersInGate
	checkevent EVENT_IEJIMA_TOWN_FIXED
	iffalse .BikersInTown
	writetext MotobuPathIejimaGateOfficerText
	waitbutton
	closetext
	end
	
.BikersInGate
	writetext MotobuPathIejimaGateOfficerText2
	waitbutton
	closetext
	end
	
.BikersInTown
	writetext MotobuPathIejimaGateOfficerText3
	waitbutton
	closetext
	end
	
MotobuPathIejimaGateBikerScript:
	opentext
	writetext BikersInGateText
	waitbutton
	closetext
	end
	
BikersInGateText:
	text "Wuhuu!"

	para "Los, machen wir"
	line "uns bereit zum"
	cont "Abfahren!"
	done

MotobuPathIejimaGateOfficerText:
    text "Der Wasserfall von"
    line "II-SHIMA ist"
    cont "ein herrlicher"
    cont "Anblick!"
	done
	
MotobuPathIejimaGateOfficerText2:
    text "Was um alles auf"
    line "der Welt haben"
    cont "diese BIKER vor?"
	done

MotobuPathIejimaGateOfficerText3:
    text "Eine große Gruppe"
    line "von BIKERn macht"
    para "Ärger im WASSER-"
    line "KRAFTWERK."

    para "Anscheinend haben"
    line "sie den Damm, der"
    para "II-SHIMA mit"
    line "Wasser versorgt,"
    cont "geschlossen."
	done

MotobuPathIejimaGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  7, IEJIMA_TOWN, 1
	warp_event  1,  7, IEJIMA_TOWN, 1
	warp_event  8,  7, MOTOBU_PATH, 1
	warp_event  9,  7, MOTOBU_PATH, 1

	db 0 ; coord events

	db 0 ; bg events

	db 9 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, MotobuPathIejimaGateOfficerScript, -1
	object_event  0,  7, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MotobuPathIejimaGateBikerScript, EVENT_RETURNED_FUEL_LINE
	object_event  1,  7, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, MotobuPathIejimaGateBikerScript, EVENT_RETURNED_FUEL_LINE
	object_event  1,  6, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, MotobuPathIejimaGateBikerScript, EVENT_RETURNED_FUEL_LINE
	object_event  0,  5, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MotobuPathIejimaGateBikerScript, EVENT_RETURNED_FUEL_LINE
	object_event  1,  5, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, MotobuPathIejimaGateBikerScript, EVENT_RETURNED_FUEL_LINE
	object_event  1,  4, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MotobuPathIejimaGateBikerScript, EVENT_RETURNED_FUEL_LINE
	object_event  2,  5, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MotobuPathIejimaGateBikerScript, EVENT_RETURNED_FUEL_LINE
	object_event  3,  4, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, MotobuPathIejimaGateBikerScript, EVENT_RETURNED_FUEL_LINE
