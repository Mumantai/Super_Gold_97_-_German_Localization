	object_const_def ; object_event constants
	const N64_HOUSE_SCIENTIST
	const N64_HOUSE_YOUNGSTER
	const N64_HOUSE_ROCKER
	const N64_HOUSE_LASS
	const N64_HOUSE_COOLTRAINER_M

Route102GameHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

N64HouseScientistScript:
	faceplayer
	opentext
	checkevent EVENT_GO_LOOK_FOR_PEOPLE_FOR_GAME_HOUSE
	iftrue .AlreadyAskedToSearchN64
	writetext N64HouseScientistText
	buttonsound
	writetext N64HouseScientistText2
	waitbutton
	closetext
	setevent EVENT_GO_LOOK_FOR_PEOPLE_FOR_GAME_HOUSE
	end

.AlreadyAskedToSearchN64
	checkevent EVENT_YOUNGSTER_FROM_BIRDON_IN_GAME_HOUSE
	iffalse .N64OnePersonSoFar
	writetext N64HouseScientistText2
	waitbutton
	closetext
	end
	
.N64OnePersonSoFar
	checkevent EVENT_ROCKER_FROM_KANTO_IN_GAME_HOUSE
	iffalse .N64TwoPeopleNow
	writetext N64HouseScientistText3
	waitbutton
	closetext
	end
	
.N64TwoPeopleNow
	checkevent EVENT_LASS_FROM_KUME_AND_FRIENDS
	iffalse .N643PeopleTimeForStarter3
	writetext N64HouseScientistText4
	waitbutton
	closetext
	end
	
.N643PeopleTimeForStarter3
	checkevent EVENT_GAME_HOUSE_SCIENTIST_GIVES_STARTER
	iftrue .AlreadyGotStarter3
	writetext N64HouseScientistText5
	waitbutton
	checkevent EVENT_GOT_PALSSIO_FROM_OAK
	iftrue .HaveCruiseGiveCubburn
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .HaveChikoritaGiveCruise
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullStarter3
	giveegg CHIKORITA, 5
	stringtotext .eggname3, MEM_BUFFER_1
	scall .GetStarter3Egg
	writetext TakeGoodCareOfStarter3
	waitbutton
	closetext
	setevent EVENT_GAME_HOUSE_SCIENTIST_GIVES_STARTER
	end
	
.HaveChikoritaGiveCruise
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullStarter3
	giveegg PALSSIO, 5
	stringtotext .eggname3, MEM_BUFFER_1
	scall .GetStarter3Egg
	writetext TakeGoodCareOfStarter3
	waitbutton
	closetext
	setevent EVENT_GAME_HOUSE_SCIENTIST_GIVES_STARTER
	end
	
.HaveCruiseGiveCubburn
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullStarter3
	giveegg CUBBURN, 5
	stringtotext .eggname3, MEM_BUFFER_1
	scall .GetStarter3Egg
	writetext TakeGoodCareOfStarter3
	waitbutton
	closetext
	setevent EVENT_GAME_HOUSE_SCIENTIST_GIVES_STARTER
	end
	
.AlreadyGotStarter3
	writetext AlreadyGotStarter3Text
	waitbutton
	closetext
	end
	
.eggname3
	db "EGG@"
	
.GetStarter3Egg:
	jumpstd ReceiveTogepiEggScript
	end
	
.PartyFullStarter3
	writetext NoRoomForStarter3
	waitbutton
	closetext
	end
	
N64HouseRockerScript:
	faceplayer
	opentext
	writetext N64HouseRockerText
	waitbutton
	closetext
	turnobject N64_HOUSE_ROCKER, RIGHT
	end

N64HouseYoungsterScript:
	faceplayer
	opentext
	checkevent EVENT_ROCKER_FROM_KANTO_IN_GAME_HOUSE
	iffalse .RockerTwoPeopleNow
	writetext RockerN64AloneText
	waitbutton
	closetext
	turnobject N64_HOUSE_YOUNGSTER, UP
	end
	
.RockerTwoPeopleNow
	writetext RockerN64TwoPeopleText
	waitbutton
	closetext
	turnobject N64_HOUSE_YOUNGSTER, UP
	end
	
N64HouseLassScript:
	faceplayer
	opentext
	writetext N64HouseLassText
	waitbutton
	closetext
	turnobject N64_HOUSE_LASS, UP
	end
	
N64HouseCooltrainerMScript:
	faceplayer
	opentext
	writetext N64HouseCooltrainerMText
	waitbutton
	closetext
	turnobject N64_HOUSE_COOLTRAINER_M, LEFT
	end
	
N64HouseFisherScript:
	jumptextfaceplayer N64HouseFisherText
	
N64HouseN64Script:
	jumptext N64HouseN64Text
	
N64HouseN64Text:
	text "<PLAYER> spielt"
	line "N64."

	para "Mach besser"
	line "weiter - du hast"
	cont "keine Zeit zu"
	cont "verlieren!"
	done
	
N64HouseFisherText:
    text "Sollte ich ver-"
    line "suchen, das Renn-"
    para "spiel mit diesen"
    line "Leuten zu spielen?"

    para "Ich glaube, ich"
    line "wäre nicht gut"
    cont "darin."
	done
	
N64HouseCooltrainerMText:
    text "Es gibt hier eine"
    line "tolle Auswahl an"
    cont "Sport-Spielen!"
	done
	
N64HouseLassText:
    text "Ich bin nicht gut"
    line "in Sportspielen,"
    para "aber mein Freund"
    line "hier hilft mir,"
    cont "besser zu werden."
	done
	
TakeGoodCareOfStarter3:
    text "Ich weiß, du wirst"
    line "dich gut um das"
    cont "#MON kümmern."
	done
	
NoRoomForStarter3:
    text "Oh, warte! Du hast"
    line "keinen Platz dafür!"
	done
	
AlreadyGotStarter3Text:
    text "Das hier ist der"
    line "coolste Ort für"
    para "Trainer, um sich"
    line "zu treffen und"
    cont "zu spielen!"

    para "Alles dank dir!"
	done
	
N64HouseScientistText5:
    text "Wow, schau die all"
    line "diese Trainer an."

    para "Es ist unglaublich!"

    para "Ich schulde dir"
    line "eine Menge!"

    para "Hier, nimm dieses"
    line "#MON-Ei."

    para "Es ist ein sehr"
    line "seltenes #MON."

    para "Ich bin mir"
    line "sicher, du weißt"
    cont "es zu schätzen."
	done
	
N64HouseRockerText:
	text "Ich werde"
	line "gewinnen!"
	done

RockerN64AloneText:
    text "Das Rennspiel ist"
    line "cool, aber hier"
    para "ist niemand, mit"
    line "dem ich spielen"
    cont "kann!"

    para "Ich bin hier, um"
    line "andere Trainer zu"
    para "treffen, aber ich"
    line "bin bisher allein."
	done
	
RockerN64TwoPeopleText:
    text "Hey, das macht zu"
    line "zweit viel mehr"
    cont "Spaß!"
	done

N64HouseScientistText4:
    text "Wow, zwei Leute!"

    para "Vielleicht kann"
    line "ich meinen Traum"
    para "eines heißen"
    line "Treffpunkts für"
    cont "Trainer erfüllen!"

    para "Schau, ob du noch"
    line "jemanden findest!"

    para "Vielleicht irgend-"
    line "wo, wo Leute sich"
    para "treffen, um sich"
    line "zu unterhalten, es"
    para "aber keine Spiele"
    line "zu spielen gibt…"
	done
	
N64HouseScientistText3:
    text "Hey, jemand ist"
    line "hier aufgetaucht!"

    para "Das ist großartig!"

    para "Hast du ihm von"
    line "diesem Ort hier"
    cont "erzählt?"

    para "Danke dir."

    para "Guck, ob du noch"
    line "jemanden findest!"

    para "Vielleicht irgend-"
    line "wo, wo Leute"
    para "andere Arten von"
    line "Spielen spielen…"
	done
	
N64HouseScientistText2:
    text "Wie sieht's aus?"

    para "Erzähle allen"
    line "Trainern, die"
    para "vielleicht Inte-"
    line "resse haben, von"
    cont "diesem Ort hier."

    para "Vielleicht findest"
    line "du jemanden in ei-"
    para "ner Stadt, in der"
    line "es nicht so viel"
    cont "zu tun gibt…"
	done

N64HouseScientistText:
	text "Hmmm."

	para "Ich habe diese"
	line "Spielhütte als Ort"
	para "für Trainer eröff-"
	line "net, um sich"
	line "zwischen den Kämp-"
	cont "fen auszutauschen."

    para "Aber es findet"
    line "einfach keinen"
    cont "Anklang…"

    para "Hey, wenn du ein"
    line "paar Trainer"
    para "findest, denen ein"
    line "Ort wie dieser"
    para "gefallen könnte,"
    line "bringst du sie"
    cont "dann hierher?"
	done
	
Route102GameHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, ROUTE_102, 2
	warp_event  5,  7, ROUTE_102, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  4,  3, BGEVENT_READ, N64HouseN64Script
	bg_event  0,  3, BGEVENT_READ, N64HouseN64Script


	db 6 ; object events
	object_event 6,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, N64HouseScientistScript, -1
	object_event 4,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, N64HouseYoungsterScript, EVENT_YOUNGSTER_FROM_BIRDON_IN_GAME_HOUSE
	object_event 3,  3, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, N64HouseRockerScript, EVENT_ROCKER_FROM_KANTO_IN_GAME_HOUSE
	object_event 0,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, N64HouseLassScript, EVENT_LASS_FROM_KUME_AND_FRIENDS
	object_event 1,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, N64HouseCooltrainerMScript, EVENT_LASS_FROM_KUME_AND_FRIENDS
	object_event 7,  2, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, N64HouseFisherScript, EVENT_LASS_FROM_KUME_AND_FRIENDS
