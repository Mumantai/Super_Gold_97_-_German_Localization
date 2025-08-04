	object_const_def ; object_event constants
	const WESTPORTBIKESHOP_CLERK

WestportBikeShop_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

.UnreferencedDummyScene:
	end

WestportBikeShopClerkScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BICYCLE
	iftrue .GotBicycle
	writetext WestportBikeShopClerkIntroText
	yesorno
	iffalse .Refused
	writetext WestportBikeShopClerkAgreedText
	buttonsound
	waitsfx
	giveitem BICYCLE
	writetext BorrowedABicycleText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setflag ENGINE_BIKE_SHOP_CALL_ENABLED
	setevent EVENT_GOT_BICYCLE
.GotBicycle:
	writetext WestportBikeShopClerkFirstRateBikesText
	waitbutton
	closetext
	end

.Refused:
	writetext WestportBikeShopClerkRefusedText
	waitbutton
	closetext
	end

WestportBikeShopJustReleasedCompactBike:
; unused
	jumptext WestportBikeShopJustReleasedCompactBikeText

WestportBikeShopBicycle:
	jumptext WestportBikeShopBicycleText

WestportBikeShopClerkIntroText:
	text "…Seufz… Ich bin"
	line "hierher gezogen,"

	para "aber ich kann mei-"
	line "ne FAHRRÄDER nicht"

	para "verkaufen. Warum"
	line "nur?"

	para "Würdest du ein"
	line "FAHRRAD fahren und"
	cont "so Werbung machen?"
	done

WestportBikeShopClerkAgreedText:
	text "Ja? Großartig!"

	para "Gib mir bitte"
	line "Namen und Nummer."

	para "Dann leihe ich dir"
	line "ein FAHRRAD."
	done

BorrowedABicycleText:
	text "<PLAYER> leiht sich"
	line "ein FAHRRAD aus."
	done

WestportBikeShopClerkFirstRateBikesText:
	text "Meine FAHRRÄDER"
	line "sind erste Klasse!"

	para "Du kannst sie"
	line "überall fahren."
	done

WestportBikeShopClerkRefusedText:
	text "…Seufz… Oh, für"
	line "die Güte der"
	cont "Menschen…"
	done

WestportBikeShopJustReleasedCompactBikeText:
	text "Brandneu!"

	para "Erste Klasse Kom-"
	line "pakt-FAHRRÄDER!"
	done

WestportBikeShopBicycleText:
	text "Ein nagelneues"
	line "FAHRRAD!"
	done

WestportBikeShop_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, WESTPORT_UNDERGROUND, 2
	warp_event  3,  7, WESTPORT_UNDERGROUND, 2

	db 0 ; coord events

	db 9 ; bg events
	bg_event  1,  2, BGEVENT_READ, WestportBikeShopBicycle
	bg_event  0,  3, BGEVENT_READ, WestportBikeShopBicycle
	bg_event  1,  3, BGEVENT_READ, WestportBikeShopBicycle
	bg_event  0,  5, BGEVENT_READ, WestportBikeShopBicycle
	bg_event  1,  5, BGEVENT_READ, WestportBikeShopBicycle
	bg_event  0,  6, BGEVENT_READ, WestportBikeShopBicycle
	bg_event  1,  6, BGEVENT_READ, WestportBikeShopBicycle
	bg_event  6,  6, BGEVENT_READ, WestportBikeShopBicycle
	bg_event  7,  6, BGEVENT_READ, WestportBikeShopBicycle

	db 1 ; object events
	object_event  7,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, WestportBikeShopClerkScript, -1
