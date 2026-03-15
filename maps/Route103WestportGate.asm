	object_const_def ; object_event constants
	const ROUTE103WESTPORTGATE_OFFICER
	const ROUTE103WESTPORTGATE_POKEFAN_F
	const ROUTE103WESTPORTGATE_FISHER

Route103WestportGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RandyScript:
	faceplayer
	opentext
	writetext UnknownText_0x69ddd
	waitbutton
	closetext
	end
	
GiftSpearowMail:
	db FLOWER_MAIL
	db   "DUNKELHÖHLE führt"
	next "zu anderer Route@"

GiftSpearowName:
	db "HABSI@"

GiftSpearowOTName:
	db "HARALD@"

	db 0 ; filler

Route103WestportGatePokefanFScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_WHITNEY
	iftrue .FoughtBellignan
	writetext Route103WestportGatePokefanFText
	waitbutton
	closetext
	end

.FoughtBellignan
	writetext Route103WestportGatePokefanFText_FoughtBellignan
	waitbutton
	closetext
	end

Route103WestportGateFisherScript:
	jumptextfaceplayer Route103WestportGateFisherText

UnknownText_0x69ddd:
    text "PORT ABANISHI"
    line "langweilt mich."

    para "Alle lieben die"
    line "Stadt, aber ich"
    cont "würde lieber an"
    cont "einem ruhigeren"
    cont "Ort wohnen."
	done

UnknownText_0x69e48:
	text "Das würdest du"
	line "tun? Super!"
	cont "Vielen Dank!"

	para "Mein Freund ist"
	line "ein Flegel!"
	cont "Er schläft die"
	cont "ganze Zeit."

	para "Du wirst ihn"
	line "sofort erkennen!"
	done

UnknownText_0x69eb8:
	text "<PLAYER> hat ein"
	line "#MON, das einen"

	para "BRIEF trägt,"
	line "erhalten."
	done

UnknownText_0x69ed6:
	text "Du darfst ihn le-"
	line "sen, aber verliere"
	cont "ihn nicht!"
	cont "ROUTE 31!"

	para "Stimmt! Ein"
	line "merkwürdiger"
	cont "Baum hat die"
	cont "Straße blockiert."

	para "Ich frage mich,"
	line "ob die Straße"
	cont "jetzt frei ist."
	done

UnknownText_0x69f56:
	text "Du kannst kein"
	line "weiteres #MON"
	cont "mehr tragen…"
	done

UnknownText_0x69f74:
	text "Oh… Dann"
	line "geht das in"
	cont "Ordnung…"
	done

UnknownText_0x69f8b:
	text "Ich danke dir!"
	line "Du hast die"
	cont "Lieferung für mich"
	cont "erledigt!"

	para "Ich habe hier"
	line "etwas für dich"
	cont "wegen der Un-"
	cont "annehmlichkeiten!"
	done

UnknownText_0x69fd9:
	text "Mein Freund hat"
	line "geschlafen, nicht"
	cont "wahr? Na, was"
	cont "habe ich dir"
	cont "gesagt?"
	done

Route103WestportGatePokefanFText:
    text "Der Boden nördlich"
    line "von hier droht"
    cont "einzubrechen, da"
    cont "es dort fast keine"
    cont "Vegetation gibt."

    para "Ein paar Felsen"
    line "sind herunterge-"
    cont "kommen und haben"
    cont "den Weg blockiert."

    para "Da kommst du im"
    line "Moment glaube ich"
    cont "nicht durch."
	done

Route103WestportGatePokefanFText_FoughtBellignan:
    text "Der Pfad da hinten"
    line "wurde geräumt."

    para "Das ist gut, viele"
    line "Reisende warten"
    cont "darauf, endlich"
    cont "TOTOMONIA besuchen"
    cont "zu können."
	done

Route103WestportGateFisherText:
	text "Ich frage mich,"
	line "wie viele Arten"
	cont "von #MON es"
	cont "wohl geben mag."

	para "Vor einem Jahr"
	line "hat PROF. EICH"
	cont "verlautbart, dass"
	cont "es 150 verschie-"
	cont "dene Arten geben"
	cont "soll."
	done

Route103WestportGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_103, 1
	warp_event  5,  0, ROUTE_103, 2
	warp_event  4,  7, WESTPORT_CITY, 7
	warp_event  5,  7, WESTPORT_CITY, 10

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, Route103WestportGatePokefanFScript, -1
	object_event  6,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RandyScript, -1
	object_event  3,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route103WestportGateFisherScript, -1
