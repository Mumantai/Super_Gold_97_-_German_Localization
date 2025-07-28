	object_const_def ; object_event constants
	const BILLSFAMILYSHOUSE_BILL
	const BILLSFAMILYSHOUSE_POKEFAN_F
	const BILLSFAMILYSHOUSE_TWIN

BillsFamilysHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BillScript:
	faceplayer
	opentext
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .GiveCut
	writetext BillGoGetBadge
	waitbutton
	closetext
	end

.GiveCut
	checkevent EVENT_GOT_HM01_CUT
	iftrue .GotCut
	writetext BillTakeThisCutText
	yesorno
	iffalse .Refused
	verbosegiveitem HM_CUT
	setevent EVENT_GOT_HM01_CUT
	writetext BillImCountingOnYouText
	waitbutton
	closetext
	end

.NoRoom:
	writetext BillPartyFullText
	waitbutton
	closetext
	end

.Refused:
	writetext BillNoEeveeText
	waitbutton
	closetext
	end

.GotCut:
	writetext BillPopWontWorkText
	waitbutton
	closetext
	end

BillsMomScript:
	faceplayer
	opentext
	checkevent EVENT_MET_BILL
	iffalse .HaventMetBill
	writetext BillsPopText
	waitbutton
	closetext
	end

.HaventMetBill:
	writetext BillsMomText
	waitbutton
	closetext
	end

BillsSisterScript:
	faceplayer
	opentext
	checkcellnum PHONE_BILL
	iftrue .GotBillsNumber
	writetext BillsSisterUsefulNumberText
	askforphonenumber PHONE_BILL
	ifequal PHONE_CONTACTS_FULL, .NoRoom
	ifequal PHONE_CONTACT_REFUSED, .Refused
	waitsfx
	addcellnum PHONE_BILL
	writetext RecordedBillsNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	buttonsound
.GotBillsNumber:
	writetext BillsSisterStorageSystemText
	waitbutton
	closetext
	end

.Refused:
	writetext BillsSisterRefusedNumberText
	waitbutton
	closetext
	end

.NoRoom:
	writetext BillsSisterPhoneFullText
	buttonsound
	jump .Refused

EarlsMuseumBookshelf1:
	jumpstd PictureBookshelfScript
	
EarlsMuseumBookshelf2:
	jumpstd MagazineBookshelfScript

EarlsMuseumRadio:
	jumpstd Radio2Script
	
BillGoGetBadge:
    text "Hm! Du solltest"
    line "diesen Text nicht"
    cont "sehen können!"

    para "Hier ist etwas"
    line "schief gelaufen!"
    done

BillTakeThisCutText:
    text "BILL: Hallo!"
    line "Erlaube mir, mich"
    cont "vorzustellen!"

    para "Ich bin BILL! Ich"
    line "habe das PC-"
    para "#MON-LAGERUNGS-"
    line "SYSTEM erfunden!"

    para "Ich hoffe, du fin-"
    line "dest es nützlich."

    para "Wenn du vorhast,"
    line "zu reisen, habe"
    para "ich noch etwas,"
    line "das du vielleicht"
    cont "nützlich findest."

    para "Bitte nimm dies."
	done

BillImCountingOnYouText:
    text "Mit ZERSCHNEIDER"
    line "können deine #-"
    para "MON kleine Bäume"
    line "fällen!"

    para "Er wird dir sicher"
    line "weiterhelfen!"

    para "Und denk daran,"
    line "dass du VMs so oft"
    para "benutzen kannst,"
    line "wie du willst!"

    para "Viel Glück auf"
    line "deinen Reisen!"

    para "Ich bin hier, wenn"
    line "es etwas gibt."
	done

ReceivedEeveeText:
	text "<PLAYER> erhält"
	line "EVOLI!"
	done

BillEeveeMayEvolveText:
	text "BILL: PROF. EICH2"
	line "sagt, EVOLI kann"

	para "sich in neue, un-"
	line "bekannte Arten"
	cont "entwickeln."
	done

BillPartyFullText:
	text "Moment! Du hast"
	line "keinen Platz mehr"
	cont "in deinem Team."
	done

BillNoEeveeText:
	text "Oh… Aber du wirst"
	line "das irgendwann"
	cont "brauchen…"
	done

BillPopWontWorkText:
	text "BILL: Hi, <PLAYER>!"
	line "Ich hoffe, deine"
	para "Reise verläuft"
	line "gut!"
	done

BillsPopText:
	text "Oh, du sammelst"
	line "#MON? Mein Sohn"
	cont "BILL ist ein"
	cont "Experte."
	done

BillsMomText:
	text "Mein Mann war als"
	line "#MANIAC "

	para "bekannt. BILL"
	line "muss nach seinem"
	cont "Vater kommen."
	done

BillsSisterUsefulNumberText:
	text "Bist du ein"
	line "Trainer?"

	para "Ich habe eine"
	line "nützliche Telefon-"
	cont "nummer für dich."
	done

RecordedBillsNumberText:
	text "<PLAYER> speichert"
	line "BILLs Nummer."
	done

BillsSisterRefusedNumberText:
	text "Mein Bruder hat"
	line "das PC-#MON-"
	cont "LAGERUNGS-SYSTEM"
	cont "erfunden."

	para "Ich wollte dir ge-"
	line "rade BILLs Nummer"
	cont "geben…"
	done

BillsSisterPhoneFullText:
	text "Du kannst keine"
	line "Nummern mehr spei-"
	cont "chern."
	done

BillsSisterStorageSystemText:
	text "Mein großer Bruder"
	line "BILL hat das PC-"
	cont "#MON-LAGERUNGS-"
	cont "SYSTEM erfunden."
	done

BillsFamilysHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, PAGOTA_CITY, 15
	warp_event  4,  7, PAGOTA_CITY, 15

	db 0 ; coord events

	db 3 ; bg events
	bg_event  2,  1, BGEVENT_READ, EarlsMuseumBookshelf2
	bg_event  3,  1, BGEVENT_READ, EarlsMuseumBookshelf1
	bg_event  6,  1, BGEVENT_READ, EarlsMuseumRadio

	db 3 ; object events
	object_event  5,  4, SPRITE_BILL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillScript, EVENT_MET_BILL
	object_event  2,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillsMomScript, -1
	object_event  7,  4, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BillsSisterScript, -1
