	object_const_def ; object_event constants
	const KOBANHOUSE_1_CLAIR

KobanHouse1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KobanHouse1ClairScript:
	faceplayer
	opentext
	checkevent EVENT_GETTING_DRATINI
	iftrue .AfterDratiniGift
	checkitem MACHINE_PART
	iffalse .NoOrbYet
	checkevent EVENT_GOT_DRATINI
	iffalse .GiveDratiniClair
.AfterDratiniGift
	writetext DragonsAreGreatText
	waitbutton
	closetext
	end
	
.NoOrbYet
	writetext GoGetTheOrbText
	waitbutton
	closetext
	end
	
.GiveDratiniClair
	writetext ClairTakeThisDratiniText
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullClair
	writetext ClairPlayerReceivedDratiniText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke DRATINI, 15
	special GiveDratini
	setevent EVENT_GOT_DRATINI
	setevent EVENT_GETTING_DRATINI
	takeitem MACHINE_PART
	writetext ClairSymbolicDragonText
	waitbutton
	closetext
	end	
	
.PartyFullClair:
	writetext KantoRestaurantPartyFullTextClair
	waitbutton
	closetext
	end
	
ClairPlayerReceivedDratiniText:
	text "<PLAYER> erhält"
	line "DRATINI!"
	done
	
ClairSymbolicDragonText:
    text "Drachen-#MON"
    line "sind schwer zu"
    para "erziehen, aber"
    line "ihre Anmut und"
    para "Stärke sind die"
    line "Anstrengung wert."

    para "Ich glaube, du"
    line "kannst dieses"
    para "DRATINI richtig"
    line "aufziehen."
	done
	
KantoRestaurantPartyFullTextClair:
	text "Hm? Dein #MON-"
	line "Team ist voll."
	done
	
ClairTakeThisDratiniText:
    text "Ah, der"
    line "DRACHEN ORB!"

    para "Du hast also die"
    line "Macht von Drachen-"
    cont "#MON erfahren!"

    para "Ich möchte dich"
    line "mit einem spezi-"
    cont "#MON belohnen,"
    para "das es verdient,"
    line "von einem würdigen"
    para "Trainer aufgezogen"
    line "zu werden!"
	done
	
GoGetTheOrbText:
    text "Beschaffe den"
    line "DRACHEN ORB von"
    para "einem Trainer in"
    line "der Höhle und"
    cont "bring ihn zu mir."
	done
	
DragonsAreGreatText:
    text "Ein Drachen-"
    line "Trainer zu sein,"
    para "erfordert mehr"
    line "Hingabe als bei"
    para "den meisten"
    line "anderen Typen."

    para "Es ist viel mehr"
    line "eine Lebensweise."
	done

KobanHouse1ClairText:
	text "yo sup"
	done

KobanHouse1_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KOBAN_ISLAND, 1
	warp_event  5,  7, KOBAN_ISLAND, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  7, 4, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KobanHouse1ClairScript, EVENT_CLAIR_INSIDE_HOUSE
