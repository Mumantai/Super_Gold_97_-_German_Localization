	object_const_def ; object_event constants
	const WESTPORTDEPTSTORE1F_RECEPTIONIST
	const WESTPORTDEPTSTORE1F_POKEFAN_F
	const WESTPORTDEPTSTORE1F_BUG_CATCHER
	const WESTPORTDEPTSTORE1F_GENTLEMAN

WestportDeptStore1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WestportDeptStore1FReceptionistScript:
	jumptextfaceplayer WestportDeptStore1FReceptionistText

WestportDeptStore1FGentlemanScript:
	jumptextfaceplayer WestportDeptStore1FGentlemanText

WestportDeptStore1FPokefanFScript:
	jumptextfaceplayer WestportDeptStore1FPokefanFText

WestportDeptStore1FBugCatcherScript:
	jumptextfaceplayer WestportDeptStore1FBugCatcherText

WestportDeptStore1FDirectory:
	jumptext WestportDeptStore1FDirectoryText

WestportDeptStore1FElevatorButton:
	jumpstd ElevatorButtonScript

WestportDeptStore1FReceptionistText:
	text "Willkommen im"
	line "KAUFHAUS von"
	cont "PORT ABANISHI."
	done

WestportDeptStore1FGentlemanText:
	text "Das KAUFHAUS"
	line "bietet eine große"
	cont "Auswahl."

	para "Aber einige Items"
	line "erhält man nur an"

	para "den Ständen im"
	line "Keller."
	done

WestportDeptStore1FPokefanFText:
	text "Ich freue mich"
	line "heute schon wieder"
	cont "aufs Einkaufen!"
	done

WestportDeptStore1FBugCatcherText:
	text "Mama ist sehr gut"
	line "im Schnäppchen-"
	cont "finden."

	para "Sie kauft ständig"
	line "Waren unter dem"
	cont "Normalpreis."
	done

WestportDeptStore1FDirectoryText:
	text "EG INFO-SCHALTER"

	para "1S TRAINER-"
	line "   MARKT"

	para "2S KAMPF-"
	line "   KOLLEKTION"

	para "3S ARZNEI"

	para "4S TM-ECKE"

	para "5S PLATZ DER"
	line "   EWIGEN STILLE"
	done

WestportDeptStore1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 13,  7, WESTPORT_CITY, 5
	warp_event 14,  7, WESTPORT_CITY, 9
	warp_event 15,  0, WESTPORT_DEPT_STORE_2F, 2
	warp_event  2,  0, WESTPORT_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, WestportDeptStore1FDirectory
	bg_event  3,  0, BGEVENT_READ, WestportDeptStore1FElevatorButton

	db 4 ; object events
	object_event  7,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportDeptStore1FReceptionistScript, -1
	object_event  6,  5, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportDeptStore1FPokefanFScript, -1
	object_event  6,  6, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WestportDeptStore1FBugCatcherScript, -1
	object_event 11,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportDeptStore1FGentlemanScript, -1
