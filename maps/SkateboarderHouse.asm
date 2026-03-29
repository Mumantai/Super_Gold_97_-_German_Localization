	object_const_def ; object_event constants
	const SKATEBOARDERHOUSE_GRAMPS

SkateboarderHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SkateboarderHouseSkateboarderDude:
	faceplayer
	opentext
	checkevent EVENT_GOT_BICYCLE
	iffalse .nobicycleyet
	checkevent EVENT_GOT_SKATEBOARD
	iftrue .alreadygotskateboard
	writetext SkateboarderHouseSkateboarderDudeText
	waitbutton
	verbosegiveitem SKATEBOARD
	setevent EVENT_GOT_SKATEBOARD
	writetext SkateboarderHouseSkateboarderDudeText2
	waitbutton
	closetext
	end
	
.alreadygotskateboard
	writetext SkateboarderHouseSkateboarderDudeText2
	waitbutton
	closetext
	end

.nobicycleyet
	writetext SkateboarderHouseSkateboarderDudeTextNoBike
	waitbutton
	closetext
	end

SkateboarderHouseSkateboarderDudeText:
    text "Woah, Alter!"

    para "Du fährst noch"
    line "'nen Drahtesel?"

    para "Geh mit der Zeit!"

    para "Es wird Zeit, dass"
    line "du mal richtig"
    cont "shreddest!"

    para "Hier, nimm das!"
	done
	
SkateboarderHouseSkateboarderDudeText2:
    text "Woah, Alter!"

    para "Mit dem Board da,"
    line "kommst du an noch"
    cont "mehr Orten schnell"
    cont "voran, als mit dem"
    cont "Fahrrad!"
	done
	
SkateboarderHouseSkateboarderDudeTextNoBike:
    text "Woah, Alter!"

    para "Was läufst du noch"
    line "zu Fuß herum?"

    para "Wenn du nicht mal"
    line "radfahren kannst,"
    cont "bist du nie im"
    cont "Leben bereit zu"
    cont "shredden!"
	done
	

SkateboarderHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, SUNPOINT_CITY, 7
	warp_event  5,  7, SUNPOINT_CITY, 7

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  3, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SkateboarderHouseSkateboarderDude, -1
