	object_const_def ; object_event constants
	const KANTOHOUSE_1_TWIN
	const KANTOHOUSE_1_BUGCATCHER
	const KANTOHOUSE_1_TEACHER

KantoHouse1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoHouse1Twin:
	jumptextfaceplayer KantoHouse1TwinText
	
KantoHouse1BugCatcher:
	jumptextfaceplayer KantoHouse1BugCatcherText
	
KantoHouse1Teacher:
	jumptextfaceplayer KantoHouse1TeacherText
	
KantoHouse1TwinText:
    text "Eines Tages werde"
    line "ich stärker als"
    para "ein ARENALEITER"
    line "sein!"
	done
	
KantoHouse1BugCatcherText:
    text "Vielleicht könnte"
    line "ich die LIGA nur"
    para "mit Käfer-#MON"
    line "gewinnen…"
	done
	
KantoHouse1TeacherText:
    text "Meine beiden"
    line "Kinder lieben"
    cont "#MON."

    para "Ich war nie ein"
    line "Trainer, also bin"
    para "ich mir manchmal"
    line "nicht sicher, was"
    para "ich ihnen über das"
    line "Aufziehen von"
    para "#MON beibringen"
    line "soll."
	done

KantoHouse1_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KANTO_REGION, 24
	warp_event  5,  7, KANTO_REGION, 24

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  5, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoHouse1Twin, -1
	object_event  7,  3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoHouse1BugCatcher, -1
	object_event  4,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoHouse1Teacher, -1
