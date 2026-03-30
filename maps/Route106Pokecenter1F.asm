	object_const_def ; object_event constants
	const ROUTE106POKECENTER1F_NURSE
	const ROUTE106POKECENTER1F_COOLTRAINER_F
	const ROUTE106POKECENTER1F_COOLTRAINER_M

Route106Pokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route106Pokecenter1FNurseScript:
	jumpstd PokecenterNurseScript


Route106Pokecenter1FCooltrainerFScript:
	;setflag ENGINE_FOREST_IS_RESTLESS
	jumptextfaceplayer Route106Pokecenter1FCooltrainerFText
	
Route106Pokecenter1FCooltrainerMScript:
	jumptextfaceplayer Route106Pokecenter1FCooltrainerMText


Route106Pokecenter1FCooltrainerFText:
	text "Was soll mein"
	line "#MON tragen?"

	para "Vielleicht ein"
	line "Item, das seinen"

	para "ANGR-Wert"
	line "verstärkt…"
	done
	
Route106Pokecenter1FCooltrainerMText:
    text "Es ist praktisch,"
    line "dass es hier ein"
    para "#MON-CENTER"
    line "gibt."

    para "Der JADEWALD ist"
    line "ein hartes Stück,"
    para "da bin ich froh,"
    line "dass meine #MON"
    para "hier etwas Ruhe"
    line "bekommen können."
	done

Route106Pokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, ROUTE_106, 9
	warp_event  6,  7, ROUTE_106, 9
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route106Pokecenter1FNurseScript, -1
	object_event  8,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, Route106Pokecenter1FCooltrainerFScript, -1
	object_event  3,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, Route106Pokecenter1FCooltrainerMScript, -1
