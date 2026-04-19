	object_const_def ; object_event constants
	const NAGO_CHARMANDER_1
	const NAGO_CHARMANDER_2
	const NAGO_CHARMANDER_3
	const NAGO_CHARMANDER_4
	const NAGO_CHARMANDER_5
	const NAGO_CHARMANDER_6

NagoCharmanderHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
NagoCharmanderHouseCharmander:
	opentext
	writetext NagoCharmanderHouseCharmanderText
	cry CHARMANDER
	waitbutton
	closetext
	end
	
NagoCharmanderHouseTeacher:
	faceplayer
	opentext
	checkevent EVENT_GOT_CHARMANDER_FROM_CRAZY_LADY
	iftrue .AlreadyGotCharmander
	writetext ILoveCharmanderText
	yesorno
	iffalse .DontTakeCharmander
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullCharmander
	writetext UnknownText_0x7e355a
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke CHARMANDER, 5
	writetext GiveCharmanderText
	waitbutton
	closetext
	setevent EVENT_GOT_CHARMANDER_FROM_CRAZY_LADY
	end
	
.AlreadyGotCharmander
	writetext AlreadyGotCharmanderText
	waitbutton
	closetext
	end
	
.DontTakeCharmander
	writetext NoCharmanderText
	waitbutton
	closetext
	end
	
.PartyFullCharmander
	writetext PartyFullCharmanderText
	waitbutton
	closetext
	end
	
UnknownText_0x7e355a:
	text "<PLAYER> erhält"
	line "GLUMANDA."
	done
	
AlreadyGotCharmanderText:
    text "Meine süßen"
    line "GLUMANDA sind"
    cont "meine Lieblinge!"
	done
	
PartyFullCharmanderText:
    text "Du trägst zu viele"
    line "#MON mit dir!"
	done
	
NoCharmanderText:
	text "Oh, du magst sie"
	line "nicht so sehr, wie"
	cont "ich?"
	done
	

NagoCharmanderHouseCharmanderText:
	text "GLUMANDA: Glu!"
	done
	
ILoveCharmanderText:
	text "Oooh, ich liebe"
	line "GLUMANDA!"

	para "Sie sind einfach"
	line "zuckersüß!"

	para "Mein Lebensziel"
	line "ist es, meine"
	para "Liebe zu GLUMANDA"
	line "mit der Welt zu"
	cont "teilen."

	para "Möchtest du gerne"
	line "eins haben?"
	done
	
GiveCharmanderText:
	text "Kümmere dich gut"
	line "darum, Schätzchen!"
	done

NagoCharmanderHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, NAGO_VILLAGE, 3
	warp_event  5,  7, NAGO_VILLAGE, 3

	db 0 ; coord events

	db 0 ; bg events

	db 7 ; object events
	object_event  9,  7, SPRITE_CHARMANDER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, NagoCharmanderHouseCharmander, -1
	object_event  6,  2, SPRITE_CHARMANDER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, NagoCharmanderHouseCharmander, -1
	object_event  8,  1, SPRITE_CHARMANDER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, NagoCharmanderHouseCharmander, -1
	object_event  4,  5, SPRITE_CHARMANDER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, NagoCharmanderHouseCharmander, -1
	object_event  2,  3, SPRITE_CHARMANDER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, NagoCharmanderHouseCharmander, -1
	object_event  1,  4, SPRITE_CHARMANDER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, NagoCharmanderHouseCharmander, -1
	object_event  7,  4, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, NagoCharmanderHouseTeacher, -1
