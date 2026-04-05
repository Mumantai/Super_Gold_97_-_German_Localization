	object_const_def ; object_event constants
	const BLUE_FOREST_BLACK_BELT
	const BLUE_FOREST_COOLTRAINER_F1
	const BLUE_FOREST_YOUNGSTER1
	const BLUE_FOREST_SANTOS
	const BLUE_FOREST_COOLTRAINER_F2

BlueForest_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_OBJECTS, .Santos

.FlyPoint:
	setflag ENGINE_FLYPOINT_BLUE_FOREST
	return

.Santos:
	checkcode VAR_WEEKDAY
	ifequal SATURDAY, .SantosAppears
	disappear BLUE_FOREST_SANTOS
	return

.SantosAppears:
	appear BLUE_FOREST_SANTOS
	return

BlueForestBlackBeltScript:
	jumptextfaceplayer BlackBeltText_WeirdRadio



BlueForestCooltrainerF1Script:
	jumptextfaceplayer BlueForestCooltrainerF1Text

BlueForestYoungsterScript:
	jumptextfaceplayer BlueForestYoungsterText

BlueForestCooltrainerF2Script:
	faceplayer
	opentext
	checkevent EVENT_PRYCE_IN_GYM
	iffalse .HotshotWow
	writetext BlueForestCooltrainerF2TextNotWow
	waitbutton
	closetext
	end
	
.HotshotWow
	writetext BlueForestCooltrainerF2Text
	waitbutton
	closetext
	end

SantosScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
	iftrue .Saturday
	checkcode VAR_WEEKDAY
	ifnotequal SATURDAY, .NotSaturday
	checkevent EVENT_MET_SANTOS_OF_SATURDAY
	iftrue .MetSantos
	writetext MeetSantosText
	buttonsound
	setevent EVENT_MET_SANTOS_OF_SATURDAY
.MetSantos:
	writetext SantosGivesGiftText
	buttonsound
	verbosegiveitem SPELL_TAG
	iffalse .Done
	setevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
	writetext SantosGaveGiftText
	waitbutton
	closetext
	end

.Saturday:
	writetext SantosSaturdayText
	waitbutton
.Done:
	closetext
	end

.NotSaturday:
	writetext SantosNotSaturdayText
	waitbutton
	closetext
	end

BlueForestSign:
	jumptext BlueForestSignText

BlueForestGymSign:
	jumptext BlueForestGymSignText

DeepwaterPassageSign:
	jumptext DeepwaterPassageSignText

BlueForestPokecenterSign:
	jumpstd PokecenterSignScript

BlueForestMartSign:
	jumpstd MartSignScript

BlackBeltText_WeirdRadio:
    text "ALBERT ist der"
    line "ARENALEITER hier."

    para "Nach außen wirkt"
    line "er eiskalt, aber"
    para "er hat ein Herz"
    line "aus Gold."
	done

BlueForestCooltrainerF1Text:
    text "Willst du deine"
    line "#MON ein paar"
    para "Attacken vergessen"
    line "lassen?"

    para "Das Haus vom"
    line "ATTACKEN-VERLERNER"
    para "ist gleich hier um"
    line "die Ecke."
	done

BlueForestYoungsterText:
    text "Im TIEFWASSERPFAD"
    line "gibt es viele"
    para "#MON vom Typ"
    line "Eis."
	done

MeetSantosText:
	text "SAMSON: …"

	para "Heute ist Samstag…"

	para "Ich bin SAMSON von"
	line "Samstag…"
	done

SantosGivesGiftText:
	text "Du kannst das"
	line "haben…"
	done

SantosGaveGiftText:
	text "SAMSON: …"

	para "BANNSTICKER…"

	para "Geist-Attacken"
	line "werden stärker…"

	para "Es ist geradezu"
	line "beängstigend…"
	done

SantosSaturdayText:
	text "SAMSON: …"

	para "Wir sehen uns an"
	line "einem anderen"
	cont "Samstag wieder…"

	para "Aber ich werde"
	line "dann keine Ge-"
	cont "schenke mehr"
	cont "haben…"
	done

SantosNotSaturdayText:
	text "SAMSON: Heute ist"
	line "nicht Samstag…"
	done

BlueForestCooltrainerF2Text:
	text "Wow, du bist über"
	line "den TIEFWASSERPFAD"
	cont "gekommen?"

	para "Du musst ein rich-"
	line "tiger Heißsporn"
	cont "sein!"
	done
	
BlueForestCooltrainerF2TextNotWow:
	text "Ich war noch nie"
	line "in SPIZARDIA."

	para "Durch den"
	line "TIEFWASSERPFAD"
	para "zu reisen ist mir"
	line "zu unheimlich."
	done

BlueForestSignText:
	text "KITAOMORIA CITY"

	para "Ruhig verschneiter"
	line "Rückzugsort"
	done

BlueForestGymSignText:
	text "PKMN-ARENA von"
	line "KITAOMORIA CITY"

	para "LEITUNG: ALBERT"
	line "Der eisige"
	cont "Altmeister"
	done


DeepwaterPassageSignText:
	text "TIEFWASSERPFAD"
	line "Südlicher Eingang"
	done



BlueForest_MapEvents:
	db 0, 0 ; filler

	db 11 ; warp events
	warp_event 26, 21, BLUE_FOREST_GYM, 1
	warp_event  9,  9, BLUE_FOREST_DRAGON_SPEECH_HOUSE, 1
	warp_event 19, 13, BLUE_FOREST_EMYS_HOUSE, 1
	warp_event 25,  6, BLUE_FOREST_MART, 1
	warp_event 13, 18, BLUE_FOREST_POKECENTER_1F, 1
	warp_event  3, 22, MOVE_DELETERS_HOUSE, 1
	warp_event 27, 11, BLUE_FOREST_HOUSE_1, 1
	warp_event  5,  5, DEEPWATER_PASSAGE_ENTRANCE, 1
	warp_event 18,  3, BLUE_FOREST_ROUTE_111_GATE, 3
	warp_event 19,  3, BLUE_FOREST_ROUTE_111_GATE, 4
	warp_event 27, 21, BLUE_FOREST_GYM, 2

	db 0 ; coord events

	db 5 ; bg events
	bg_event  2, 26, BGEVENT_READ, BlueForestSign
	bg_event 28, 22, BGEVENT_READ, BlueForestGymSign
	bg_event  4,  8, BGEVENT_READ, DeepwaterPassageSign
	bg_event 26,  6, BGEVENT_READ, BlueForestMartSign
	bg_event 14, 18, BGEVENT_READ, BlueForestPokecenterSign

	db 5 ; object events
	object_event 26, 23, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlueForestBlackBeltScript, -1
	object_event 16, 23, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, BlueForestCooltrainerF1Script, -1
	object_event 13, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlueForestYoungsterScript, -1
	object_event 16,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, SantosScript, EVENT_BLUE_FOREST_SANTOS_OF_SATURDAY
	object_event 25, 16, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BlueForestCooltrainerF2Script, -1
