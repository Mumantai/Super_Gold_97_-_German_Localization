	object_const_def ; object_event constants
	const RYUKYU_HOTEL_RECEPTIONIST
	const RYUKYU_HOTEL_CLERK_1
	const RYUKYU_HOTEL_PLACEHOLDER
	const RYUKYU_HOTEL_CLERK_2
	const RYUKYU_HOTEL_YOUNGSTER
	const RYUKYU_HOTEL_BUG_CATCHER
	const RYUKYU_HOTEL_TEACHER
	const RYUKYU_HOTEL_LASS
	const RYUKYU_HOTEL_JANINE

RyukyuHotel_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .CheckForRoomPass
	

.CheckForRoomPass:
	checkitem ROOM_PASS
	iffalse .UpstairsClosed
	appear RYUKYU_HOTEL_CLERK_2
	disappear RYUKYU_HOTEL_PLACEHOLDER
	disappear RYUKYU_HOTEL_CLERK_1
	return

.UpstairsClosed:
	disappear RYUKYU_HOTEL_CLERK_2
	appear RYUKYU_HOTEL_PLACEHOLDER
	appear RYUKYU_HOTEL_CLERK_1	
	return

RyukyuHotelHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_RYUKYU_HOTEL_HIDDEN_MAX_POTION
	
	
RyukyuHotelReceptionist:
	faceplayer
	checkevent EVENT_RETURNED_FUEL_LINE
	iffalse .NoPassYet
	checkevent EVENT_GOT_HOTEL_PASS
	iftrue .AfterGotHotelPass
	opentext
	writetext HotelReceptionistText2
	waitbutton
	writetext HotelReceptionistText
	special PlaceMoneyTopRight
	yesorno
	iffalse HotelReceptionist_NoSale
	checkmoney YOUR_MONEY, 10000
	ifequal HAVE_LESS, HotelReceptionist_NoMoney
	takemoney YOUR_MONEY, 10000
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	writetext HotelReceptionist_GotPass
	waitbutton
	verbosegiveitem ROOM_PASS
	writetext HotelReceptionistText3
	waitbutton
	closetext
	disappear RYUKYU_HOTEL_CLERK_1
	disappear RYUKYU_HOTEL_PLACEHOLDER
	appear RYUKYU_HOTEL_CLERK_2
	setmapscene OAK_LAB_FRONT_ROOM, SCENE_OAK_LAB_FRONT_ROOM_AFTER_TALKING_TO_CLERK
	setevent EVENT_CUBBURN_POKEBALL_IN_OAK_LAB_BACK_ROOM
	setevent EVENT_PALSSIO_POKEBALL_IN_OAK_LAB_BACK_ROOM
	setevent EVENT_CHIKORITA_POKEBALL_IN_OAK_LAB_BACK_ROOM
	setevent EVENT_GOT_HOTEL_PASS
	end
	
.AfterGotHotelPass
	opentext
	writetext HotelReceptionistText3
	waitbutton
	closetext
	end
	
.NoPassYet
	opentext
	writetext HotelReceptionistText2
	waitbutton
	writetext HotelReceptionistText4
	waitbutton
	closetext
	end
	
HotelReceptionist_NoSale:
	writetext HotelReceptionistNoSaleText
	waitbutton
	closetext
	end
	
HotelReceptionist_NoMoney:
	writetext HotelReceptionistNoMoneyText
	waitbutton
	closetext
	end
	
RyukyuHotelClerk:
	jumptextfaceplayer RyukyuHotelClerkText
	
RyukyuHotelClerk2:
	jumptextfaceplayer RyukyuHotelClerk2Text
	
RyukyuHotelElevatorNeedsPass:
	jumptextfaceplayer RyukyuHotelElevatorNeedsPassText
	
RyukyuHotelYoungster:
	jumptextfaceplayer RyukyuHotelYoungsterText
	
RyukyuHotelBugCatcher:
	jumptextfaceplayer RyukyuHotelBugCatcherText
	
RyukyuHotelTeacher:
	jumptextfaceplayer RyukyuHotelTeacherText
	
RyukyuHotelLass:
	jumptextfaceplayer RyukyuHotelLassText
	
RyukyuHotelJanine:
	jumptextfaceplayer RyukyuHotelJanineText
	
RyukyuHotelYoungsterText:
	text "Ich war noch nie"
	line "in so einem"
	cont "großen Hotel!"
	done
	
RyukyuHotelBugCatcherText:
	text "Ich will raus an"
	line "den Strand!"
	done
	
RyukyuHotelTeacherText:
	text "Unsere Suite ist"
	line "so gemütlich!"
	done

RyukyuHotelLassText:
	text "Auf welcher Etage"
	line "ist mein Zimmer?"
	done
	
RyukyuHotelJanineText:
	text "Das Wetter hier"
	line "ist wunderschön!"
	done
	
RyukyuHotelElevatorNeedsPassText:
    text "Man braucht eine"
    line "ZIMMERKARTE, um"
    cont "reinzukommen…"
	done
	
RyukyuHotelClerkText:
	text "Es tut mir Leid,"
	line "aber kann nur"
	para "Gästen mit einer"
	line "ZIMMERKARTE Zugang"
	cont "gewähren."
	done
	
RyukyuHotelClerk2Text:
	text "Willkommen!"

	para "Viele unserer"
	line "Gäste sind starke"
	para "#MON-TRAINER,"
	line "die in ihren"
	para "Suiten auf Kämpfe"
	line "warten!"
	done
	
HotelReceptionistNoSaleText:
	text "Kein Interesse?"

	para "Das Angebot bleibt"
	line "natürlich."
	done
	
HotelReceptionistNoMoneyText:
	text "Oh, ich dachte,"
	line "der CHAMP könne"
	cont "sich das leisten."
	done
	
HotelReceptionist_GotPass:
	text "Hier, bitte!"

	para "Dein Zimmer liegt"
	line "im 4. Stock."
	done
	

HotelReceptionistText:
	text "…Moment, bist du"
	line "nicht <PLAYER>?"

	para "Als CHAMP von"
	line "NIHON willst du"
	para "sicher ein Zimmer"
	line "bei uns buchen."

	para "Darf ich dir eine"
	line "vergünstigte"
	cont "ZIMMERKARTE"
	cont "anbieten?"

	para "Sie gilt das ganze"
	line "Jahr und kostet"
	cont "nur ¥10000."
	done
	
HotelReceptionistText2:
	text "Willkommen im"
	line "RUUCHUU HOTEL!"

	para "Wir sind eine der"
	line "größten Touristen-"
	cont "attraktionen in"
	cont "ganz NIHON!"

	para "Bei uns checken"
	line "oft auch bekannte"
	cont "Gesichter ein!"
	done

HotelReceptionistText3:
	text "Du kennst doch"
	line "PROF.EICH, oder?"

	para "Er besucht uns"
	line "regelmäßig am"
	cont "Wochenende."
	done
	
HotelReceptionistText4:
    text "Wenn es stimmt,"
    line "dass die M.S.AQUA"
    para "außer Betrieb ist,"
    line "könnte das die"
    para "Reisepläne einiger"
    line "zukünftiger Gäste"
    cont "stören…"
	done

RyukyuHotel_MapEvents:
	db 0, 0 ; filler

	db 10 ; warp events
	warp_event 14,  9, RYUKYU_CITY, 12
	warp_event 15,  9, RYUKYU_CITY, 13
	warp_event 13,  9, RYUKYU_CITY, 12
	warp_event 16,  9, RYUKYU_CITY, 13
	warp_event 12,  9, RYUKYU_CITY, 12
	warp_event 17,  9, RYUKYU_CITY, 13
	warp_event  0,  6, RYUKYU_RESTAURANT, 3
	warp_event  0,  7, RYUKYU_RESTAURANT, 4
	warp_event 26,  0, RYUKYU_ELEVATOR, 1
	warp_event 29,  0, RYUKYU_HOTEL_2F, 2

	
	db 0 ; coord events

	db 1 ; bg events
	bg_event 23,  4, BGEVENT_ITEM, RyukyuHotelHiddenMaxPotion

	db 9 ; object events
	object_event  6,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RyukyuHotelReceptionist, -1
	object_event 29,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RyukyuHotelClerk, EVENT_HOTEL_UPSTAIRS_IS_BLOCKED
	object_event 26,  0, SPRITE_PLACEHOLDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RyukyuHotelElevatorNeedsPass, EVENT_HOTEL_UPSTAIRS_IS_BLOCKED
	object_event 28,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RyukyuHotelClerk2, EVENT_HOTEL_UPSTAIRS_IS_NOT_BLOCKED
	object_event 14,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RyukyuHotelYoungster, -1
	object_event 24,  7, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, RyukyuHotelBugCatcher, -1
	object_event 25,  7, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, RyukyuHotelTeacher, -1
	object_event 21,  1, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, RyukyuHotelLass, -1
	object_event 18,  6, SPRITE_JANINE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RyukyuHotelJanine, -1
