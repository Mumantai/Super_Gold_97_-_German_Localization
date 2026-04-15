	object_const_def ; object_event constants
	const CROWN_HOUSE_1_GRANNY

CrownHouse1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
CrownHouse1GrannyScript:
	faceplayer
	opentext
	checkevent EVENT_GET_SCOPE_LENS_GRANNY
	iftrue .alreadygavescopelens
	writetext CrownHouse1GrannyText1
	waitbutton
	verbosegiveitem SCOPE_LENS
	iffalse .Done
	setevent EVENT_GET_SCOPE_LENS_GRANNY
	jump .alreadygavescopelens
	end
	
.alreadygavescopelens
	writetext CrownHouse1GrannyText2
	waitbutton
	closetext
	end
	
.Done
	closetext
	end
	
CrownHouse1GrannyText1:
    text "Früher habe ich"
    line "auch die LIGA"
    cont "herausgefordert."

    para "Weißt du, was das"
    line "Geheimnis ist?"

    para "Strategie."

    para "Du musst wissen,"
    line "Items richtig"
    cont "einzusetzen."

    para "Hier, ich habe ein"
    line "gutes für dich."
	done
	
CrownHouse1GrannyText2:
    text "Eine SCOPE-LINSE"
    line "erlaubt es deinen"
    para "#MON öfter"
    line "Volltreffer zu"
    cont "landen."

    para "Deine Gegner"
    line "werden nicht"
    part "wissen, wie ihnen"
    line "geschieht!"
	done

CrownHouse1_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, CROWN_CITY, 6
	warp_event  5,  7, CROWN_CITY, 6

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  7,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CrownHouse1GrannyScript, -1
