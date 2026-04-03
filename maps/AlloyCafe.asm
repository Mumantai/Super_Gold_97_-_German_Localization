	object_const_def ; object_event constants
	const ALLOYCAFE_SAILOR1
	const ALLOYCAFE_FISHING_GURU
	const ALLOYCAFE_SAILOR2
	const ALLOYCAFE_CLERK

AlloyCafe_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AlloyCafeStrengthSailorScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM02_FLY
	iftrue .GotStrength
	writetext AlloyCafeStrengthSailorText
	buttonsound
	verbosegiveitem HM_FLY
	setevent EVENT_GOT_HM02_FLY
.GotStrength:
	writetext AlloyCafeStrengthSailorText_GotStrength
	waitbutton
	closetext
	end
	
AlloyCafeClerkScript:
	jumptextfaceplayer AlloyCafeClerkText

AlloyCafeFishingGuruScript:
	jumptextfaceplayer AlloyCafeFishingGuruText

AlloyCafeSailorScript:
	jumptextfaceplayer AlloyCafeSailorText

AlloyCafeStrengthSailorText:
    text "Ha! Segeln ist so"
    line "eine veraltete Art"
    cont "zu reisen!"

    para "Laufen aber auch!"

    para "Warum nicht ein-"
    line "einfach von einem"
    para "#MON FLIEGEN"
    line "lassen?"
	done

AlloyCafeStrengthSailorText_GotStrength:
    text "Schiffe braucht"
    line "man allerdings"
    cont "immer noch."

    para "Fliegende #MON"
    line "können keine"
    cont "Fracht tragen."
	done

AlloyCafeFishingGuruText:
	text "Im GENEOS CITY-"
	line "CAFE gibt es nur"
	para "delikate Seemanns-"
	line "kost für MATROSEN"
	para "auf dem"
	line "Speiseplan!"
	done

AlloyCafeSailorText:
	text "Immer wenn ich in"
	line "diese Stadt komme,"
	para "gehe ich ins"
	line "GENEOS CITY CAFE."

	para "Jedes Gericht auf"
	line "der Karte stärkt"
	para "mich. Ich kann"
	line "nicht aufhören zu"
	cont "essen!"
	done
	
AlloyCafeClerkText:
    text "Willkommen im"
    line "GENEOS CITY CAFE!"

    para "Wir haben für"
    line "jeden Appetit"
    cont "etwas zu bieten!"
	done

AlloyCafe_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ALLOY_CITY, 7
	warp_event  3,  7, ALLOY_CITY, 7

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  6,  3, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AlloyCafeStrengthSailorScript, -1
	object_event  3,  1, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AlloyCafeFishingGuruScript, -1
	object_event  5,  6, SPRITE_JANINE, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AlloyCafeSailorScript, -1
	object_event  1,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AlloyCafeClerkScript, -1
