	object_const_def ; object_event constants
	const DAITO_APPLEFARMER


DaitoRanchOrchardHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AppleFarmerScript:
	jumptextfaceplayer AppleFarmerText
	
AppleFarmerText:
    text "Na sieh mal einer"
    line "an!"

    para "Ein Trainer, der"
    line "den weiten Weg zu"
    para "meinem OBSTGARTEN"
    line "gekommen ist!"

    para "Ich könnte deine"
    line "Hilfe gebrauchen,"
    cont "Kleiner."

    para "Wegen ihres knack-"
    line "igen und frischen"
    para "Geschmacks, werden"
    line "meine ÄPFEL auf"
    para "dem Festland für"
    line "einen hübschen"
    cont "Preis verkauft!"

    para "Allerdings ist es"
    line "echt anstrengend,"
    para "sie so weit raus"
    line "zu schicken."

    para "Wenn du mir helfen"
    line "willst, kannst du"
    para "sie mitnehmen und"
    line "anschließend für"
    cont "mich verkaufen!"

    para "Du kannst einen"
    line "Teil des Gewinns"
    cont "behalten!"

    para "Keine Sorge, ich"
    line "bekomme meinen"
    para "Anteil schon vom"
    line "SUPERMARKT zurück!"
	done


DaitoRanchOrchardHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, DAITO_RANCH, 4
	warp_event  5,  7, DAITO_RANCH, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 7, 4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AppleFarmerScript, -1
