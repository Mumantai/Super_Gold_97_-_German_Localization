	object_const_def ; object_event constants
	const AMAMIFISHINGSPEECHHOUSE_FISHING_GURU

AmamiFishingSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FishingDude:
	jumptextfaceplayer FishingDudeText

FishingDudesHousePhoto:
	jumptext FishingDudesHousePhotoText

FishingDudeText:
	text "Ich bin der ANG-"
	line "LER, der Ältere"
	cont "der ANGLERBRÜDER."

    para "Kennst du den"
    line "ANGLER ALFRIED?"

    para "Er angelt auf"
    line "ROUTE 44."

    para "Er hat mir einen"
    line "tollen Tipp am"
    cont "Telefon gegeben."

    para "Dank ihm habe ich"
    line "jede Menge eines"
    cont "seltenen #MON"
    cont "gefangen."

    para "Was für ein Tag"
    line "das war!"
	done

FishingDudesHousePhotoText:
	text "Das ist ein Foto,"
	line "auf dem Angler zu"
	cont "sehen sind…"

	para "Sie haben viel"
	line "Spaß beim Angeln…"
	done

AmamiFishingSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, AMAMI_TOWN, 1
	warp_event  3,  7, AMAMI_TOWN, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  3,  0, BGEVENT_READ, FishingDudesHousePhoto

	db 1 ; object events
	object_event  2,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FishingDude, -1
