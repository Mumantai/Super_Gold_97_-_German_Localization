	object_const_def ; object_event constants
	const NAGO_VILLAGE_TEACHER
	const NAGO_VILLAGE_FISHING_GURU

NagoVillage_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_NAGO
	return

NagoVillagePokecenterSign:
	jumpstd PokecenterSignScript
	
NagoVillageSign:
	jumptext NagoVillageSignText


NagoVillageTeacherScript:
	jumptextfaceplayer NagoVillageTeacherText
	
NagoVillageFishingGuruScript:
	jumptextfaceplayer NagoVillageFishingGuruText
	
NagoVillageFishingGuruText:
    text "Auch wenn es hier"
    line "sonst nichts gibt,"
    para "ist dieser Ort ein"
    line "toller Angelplatz!"
	done
	
NagoVillageTeacherText:
	text "Kaum ist man hier"
	line "angekommen, ist"
	para "man auch schon"
	line "wieder durch."

	para "Es gibt hier nicht"
	line "wirklich viel zu"
	cont "sehen, aber ich"
	para "hoffe, du findest"
	line "es hier immerhin"
	cont "reizvoll."
	done
	
NagoVillageSignText:
	text "NAGOTANI"
	para "Eine Ruhige"
	line "Siedlung am Meer"
	done

NagoVillage_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  4, NAGO_POKECENTER_1F, 1
	warp_event 10, 15, NAGO_IMPOSTOR_HOUSE, 1
	warp_event  5, 21, NAGO_CHARMANDER_HOUSE, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event  6,  4, BGEVENT_READ, NagoVillagePokecenterSign
	bg_event  7, 11, BGEVENT_READ, NagoVillageSign

	db 2 ; object events
	object_event  7,  9, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NagoVillageTeacherScript, -1
	object_event 17, 20, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NagoVillageFishingGuruScript, -1
