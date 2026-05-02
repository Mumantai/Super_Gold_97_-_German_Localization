	object_const_def ; object_event constants
	const DAITOHOUSE_GEOFFREY
	const DAITOHOUSE_GNOTE

GardenerGeoffDaitoHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


GeoffInsideScript:
	faceplayer
	checkevent EVENT_GOT_BERRY_JUICE_FROM_GEOFF
	iftrue gotjuiceoutside
	opentext
	writetext GeoffInsideMeetText
	buttonsound
	verbosegiveitem BERRY_JUICE
	iffalse NoRoomGeoff
	setevent EVENT_GOT_BERRY_JUICE_FROM_GEOFF
gotjuiceoutside:
	opentext
	writetext WantFactText
	yesorno
	iffalse EndConvo
	random 5
	jump GeoffJumptable
EndConvo:
	writetext AhOkText
	waitbutton
NoRoomGeoff:
	closetext
	end
	
GeoffJumptable:
	ifequal 0, papayas
	ifequal 1, coconuts
	ifequal 2, mangoes
	ifequal 3, bananas
	ifequal 4, pineapples
	
papayas:
	writetext PapayaText
	waitbutton
	jump NoRoomGeoff
	
	
WantFactText:
	text "Willst du über"
	line "die tropischen"
	para "Früchte lernen,"
	line "die ich anbaue?"
	done
	
AhOkText:
    text "Ach so, gut."
    line "Vielleicht ein"
    cont "andermal."
	done
	
PapayaText:
    text "Papayas gehören zu"
    line "den Früchten, die"
    para "man am leichtesten"
    line "anbauen kann."

    para "Man muss bloß die"
    line "Samen in den Boden"
    para "werfen und kann"
    line "ihnen beim Wachsen"
    cont "zusehen!"

    para "Die wachsen so"
    line "gut, dass sie fast"
    cont "wie Unkraut sind!"

    para "Die männlichen"
    line "Pflanzen tragen"
    para "keine Früchte, die"
    line "kannst du also"
    cont "einfach fällen."
	done
	
coconuts:
	writetext CoconutText
	waitbutton
	jump NoRoomGeoff
	
CoconutText:
    text "Kokosnüsse stellen"
    line "sich die Meisten"
    para "als braune Kugeln"
    line "mit Haaren vor."

    para "Tatsächlich sehen"
    line "sie erst so aus,"
    para "wenn ihre dicke,"
    line "faserige Schale"
    cont "entfernt wurde."

    para "Am besten entfernt"
    line "man die Schale mit"
    para "dem spitzen Ende"
    line "eines Hammers."

    para "Zuerst schlägt man"
    line "Schlitze hinein"
    para "und hebt sie dann"
    line "stückweise ab!"

    para "Falls du also mal"
    line "mit einem Zimmer-"
    para "mann auf einer"
    line "Insel strandest,"
    para "kannst du diesen"
    line "Trick testen."
	done
	
mangoes:
	writetext MangoText
	waitbutton
	jump NoRoomGeoff
	
MangoText:
    text "Mangos brauchen"
    line "ein paar Monate,"
    para "um am Baum voll"
    line "zu reifen."

    para "Und die Bäume"
    line "selbst brauchen"
    para "Jahre, um groß"
    line "genug zu werden,"
    para "um eine einzige"
    line "Mango zu tragen."

    para "Manchen Kulturen"
    line "essen die Mangos"
    cont "auch unreif."

	para "Sie sind so hart,"
	line "dass man dann kaum"
	para "hineinbeißen kann"
	line "und sie sind sehr"
	cont "sauer."

	para "Ich esse sie aber"
	line "trotzdem so, ich"
	para "bin nämlich sehr"
	line "ungeduldig!"
	done
	
	
bananas:
	writetext BananaText
	waitbutton
	jump NoRoomGeoff
	
BananaText:
    text "Bananen gehören zu"
    line "den bekanntesten"
    cont "Früchten."

    para "Aber wusstest du,"
    line "dass alle Bananen"
    para "im Supermarkt"
    line "genetisch gleich"
    cont "sind?"

    para "Wegen der kommer-"
    line "ziellen Zucht haben"
    para "die Bananen keine"
    line "Samen, also müssen"
    para "sie durch Steck-"
    line "linge vermehrt"
    cont "werden."

    para "Das bedeutet, dass"
    line "alle Pflanzen"
    para "einer Plantage im"
    line "Prinzip identisch"
    cont "sind!"

    para "Das ging einmal"
    line "nach hinten los,"
    para "als eine Krankheit"
    line "eine ganze Sorte"
    para "Bananen ausgerott-"
    line "et hat, und die"
    para "Züchter auf eine"
    line "andere Sorte"
    para "umsteigen mussten,"
    line "die immun dagegen"
    cont "war!"
	done
	
	
	
pineapples:
	writetext PineappleText
	waitbutton
	jump NoRoomGeoff

PineappleText:
    text "Ähnlich wie bei"
    line "Bananen, sind auch"
    para "Ananas genetisch"
    line "identisch, durch"
    para "die Art, wie sie"
    line "vermehrt werden!"

    para "Versuch das mal,"
    line "wenn du irgendwo"
    para "wohnst, wo es warm"
    line "genug ist:"

    para "Schneide die Krone"
    line "deiner Ananas ab"
    para "und pflanze sie"
    line "direkt in den"
    cont "Boden."

    para "Gieß sie und pass"
    line "gut auf sie auf,"
    para "dann wirst du bald"
    line "sehen, wie eine"
    para "neue Ananas an"
    line "ihr wächst!"

    para "Das kannst du"
    line "immer wieder tun"
    para "und so einen"
    para "endlosen Vorrat an"
    line "Ananas bekommen."
	done

GeoffInsideMeetText:
    text "Hey, haben wir uns"
    line "nicht schon mal"
    para "auf ROUTE 104"
    line "getroffen?"

    para "Ich war es satt,"
    line "zu versuchen, im"
    para "Wüstenboden etwas"
    line "anzubauen, also"
    para "bin ich hierher"
    line "gezogen, um auf"
    para "dieser RANCH zu"
    line "arbeiten!"

    para "Da du dir extra"
    line "die Mühe gemacht"
    para "hast, hierher zu"
    line "kommen, gebe ich"
    para "dir ein Getränk"
    line "aus!"
	done


GeoffOutNote:
	jumptext GeoffOutNoteText
	
GeoffOutNoteText:
    text "Bin Besorgungen"
    line "machen. Bin am"
    para "Nachmittag wieder"
    line "zurück."

    para "- GEOFFREY"
	done

GardenerGeoffDaitoHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, DAITO_RANCH, 3
	warp_event  5,  7, DAITO_RANCH, 3

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 7,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN,0, 0, -1, NITE, PAL_NPC_BROWN , OBJECTTYPE_SCRIPT, 0, GeoffInsideScript, -1
	object_event  5,  4, SPRITE_PAPER, 0, 0, 0, -1, MORN, PAL_OW_GRAY, OBJECTTYPE_SCRIPT, 0, GeoffOutNote, -1
