	object_const_def ; object_event constants
	const CROWNLEGENDARYSPEECHHOUSE_GRANNY

CrownLegendarySpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CrownLegendarySpeechHouseGrannyScript:
	jumptextfaceplayer CrownLegendarySpeechHouseGrannyText

CrownLegendarySpeechHouseGrannyText:
    text "Vor vielen Jahren,"
    line "erzählte mir meine"
    para "Mutter von einem"
    line "mystischen"
    para "#MON, das wie"
    line "Feuer am Himmel"
    para "erschien und eine"
    line "Spur aus Asche"
    para "hinterließ, als es"
    line "die Luft ver-"
    cont "brannte."

    para "Dieses #MON"
    line "schuf aus seiner"
    para "Asche drei legen-"
    line "däre Bestien, die"
    para "ins Land gesandt"
    line "wurden."

    para "Bis heute hat"
    line "niemand diese drei"
    para "Bestien persönlich"
    line "gesehen."
	done

CrownLegendarySpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, BIRDON_TOWN, 10
	warp_event  5,  7, BIRDON_TOWN, 10

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  7,  5, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CrownLegendarySpeechHouseGrannyScript, -1
