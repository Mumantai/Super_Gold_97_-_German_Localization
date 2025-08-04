	object_const_def ; object_event constants
	const WESTPORTDEPTSTORE3F_CLERK
	const WESTPORTDEPTSTORE3F_CLERK2
	const WESTPORTDEPTSTORE3F_SUPER_NERD
	const WESTPORTDEPTSTORE3F_ROCKER

WestportDeptStore3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WestportDeptStore3FClerkScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_WESTPORT_3F
	closetext
	end
	
WestportDeptStore3FClerk2Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_WESTPORT_NEW
	closetext
	end

WestportDeptStore3FSuperNerdScript:
	jumptextfaceplayer WestportDeptStore3FSuperNerdText

WestportDeptStore3FRockerScript:
	jumptextfaceplayer WestportDeptStore3FRockerText

WestportDeptStore3FDirectory:
	jumptext WestportDeptStore3FDirectoryText

WestportDeptStore3FElevatorButton:
	jumpstd ElevatorButtonScript

WestportDeptStore3FSuperNerdText:
    text "Es ist so schwer,"
    line "sich zu ent-"
    cont "scheiden."

    para "Bestimmte Items,"
    line "wie X-ANGRIFF,"
    para "funktionieren nur,"
    line "wenn der Trainer"
    cont "sie einsetzt."

    para "Andere Items, wie"
    line "SPITZHORN, können"
    para "von einem #MON"
    line "benutzt werden,"
    cont "wenn es sie trägt."

    para "Welche Art ist"
    cont "besser?"
	done

WestportDeptStore3FRockerText:
    text "X-SPEZIAL ist sehr"
    line "nützlich, wenn du"
    para "ein #MON mit"
    line "SPEZIALATTACKEN"
    cont "hast."
	done

WestportDeptStore3FDirectoryText:
	text "Für Sieges-"
	line "hungrige"

	para "2S KAMPF-"
	line "   KOLLEKTION"
	done

WestportDeptStore3F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12,  0, WESTPORT_DEPT_STORE_2F, 1
	warp_event 15,  0, WESTPORT_DEPT_STORE_4F, 2
	warp_event  2,  0, WESTPORT_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, WestportDeptStore3FDirectory
	bg_event  3,  0, BGEVENT_READ, WestportDeptStore3FElevatorButton

	db 4 ; object events
	object_event  6,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportDeptStore3FClerkScript, -1
	object_event  7,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportDeptStore3FClerk2Script, -1
	object_event   2,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, WestportDeptStore3FSuperNerdScript, -1
	object_event  12,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportDeptStore3FRockerScript, -1
