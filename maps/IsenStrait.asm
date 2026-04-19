	object_const_def ; object_event constants
	const ISENSTRAIT_SWIMMER_GIRL1
	const ISENSTRAIT_SWIMMER_GIRL2
	const ISENSTRAIT_SWIMMER_GUY

IsenStrait_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .IsenStraitClearRocks
	
.IsenStraitClearRocks:
	checkevent EVENT_RETURNED_FUEL_LINE
	iftrue .Done20
	changeblock  51, 5, $63 ; rock
.Done20:
	return


TrainerSwimmerfNicole:
	trainer SWIMMERF, NICOLE, EVENT_BEAT_SWIMMERF_NICOLE, SwimmerfNicoleSeenText, SwimmerfNicoleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfNicoleAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfLori:
	trainer SWIMMERF, LORI, EVENT_BEAT_SWIMMERF_LORI, SwimmerfLoriSeenText, SwimmerfLoriBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfLoriAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermCameron:
	trainer SWIMMERM, CAMERON, EVENT_BEAT_SWIMMERM_CAMERON, SwimmermCameronSeenText, SwimmermCameronBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermCameronAfterBattleText
	waitbutton
	closetext
	end

FrostpointGymSign:
	jumptext FrostpointGymSignText

SwimmerfNicoleSeenText:
	text "Im Wasser fühle"
	line "ich mich so"
	cont "leicht."
	done

SwimmerfNicoleBeatenText:
	text "Oh, nein!"
	done

SwimmerfNicoleAfterBattleText:
	text "Beim Schwimmen"
	line "wird der gesamte"

	para "Körper trainiert."
	line "Schwimmen ist"
	cont "gesund."
	done

SwimmerfLoriSeenText:
	text "Du besitzt eine"
	line "umwerfende Anzahl"

	para "ARENA-ORDEN. Lass"
	line "uns kämpfen!"
	done

SwimmerfLoriBeatenText:
	text "Nein!"
	done

SwimmerfLoriAfterBattleText:
	text "SURFER ist nicht"
	line "mehr die einzige"
	cont "VM, die du im"
	cont "Wasser einsetzen"
	cont "kannst."
	done

SwimmermCameronSeenText:
	text "Ich denke es ist"
	line "unmöglich, den"

	para "ganzen Weg zum"
	line "Festland zu"
	cont "schwimmen."
	done

SwimmermCameronBeatenText:
	text "Yippie!"
	done

SwimmermCameronAfterBattleText:
	text "Ich schwimme auch"
	line "in Teichen und"
	cont "Flüssen."
	done

FrostpointGymSignText:
    text "EINRICHTUNG ZUR"
    line "#MON-FORSCHUNG"

    para "…über der Schrift"
    line "steht das Wort"
    cont "'STILLGELEGT'…"
	done

IsenStrait_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 53, 11, SEASIDE_PATH_ISEN_STRAIT_GATE, 1
	warp_event 18,  3, ISEN_LAB_FRONT, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 20,  2, BGEVENT_READ, FrostpointGymSign

	db 3 ; object events
	object_event 14, 13, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfNicole, -1
	object_event 24, 13, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfLori, -1
	object_event 36, 11, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 3, TrainerSwimmermCameron, -1
