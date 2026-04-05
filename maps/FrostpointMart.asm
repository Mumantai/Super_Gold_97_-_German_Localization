	object_const_def ; object_event constants
	const FROSTPOINTMART_CLERK
	const FROSTPOINTMART_POKEFAN_M
	const FROSTPOINTMART_ROCKER

FrostpointMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FrostpointMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_ACTUAL_FROSTPOINT
	closetext
	end

FrostpointMartPokefanMScript:
	jumptextfaceplayer FrostpointMartPokefanMText

FrostpointMartRockerScript:
	jumptextfaceplayer FrostpointMartRockerText

FrostpointMartPokefanMText:
	text "Es ist unabding-"
	line "bar, SCHUTZ bei"

	para "sich zu haben,"
	line "wenn man Höhlen"
	cont "erkundet."

	para "Obwohl ich Höhlen"
	line "sehr gerne"

	para "erforsche, habe"
	line "ich noch nicht"
	cont "alle erforscht."
	done

FrostpointMartRockerText:
	text "Ich habe von einem"
	line "Kunstschmied"
	para "gehört, der maß-"
	line "gefertigte #-"
	para "BÄLLE in PAGETIA"
	line "CITY herstellt."

	para "Ich habe noch nie"
	line "welche benutzt.

    para "Ich wette, sie"
    line "funktionieren in"
    para "einigen Szenarien"
    line "sogar besser als"
    cont "HYPERBÄLLE."
	done

FrostpointMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, FROSTPOINT_TOWN, 3
	warp_event  5,  7, FROSTPOINT_TOWN, 3

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FrostpointMartClerkScript, -1
	object_event  8,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, FrostpointMartPokefanMScript, -1
	object_event  9,  2, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FrostpointMartRockerScript, -1
