	object_const_def ; object_event constants
	const RYUKYU_HOTEL_ROOMS_OAK
	const RYUKYU_HOTEL_ROOMS_SOLDIER
	const RYUKYU_HOTEL_ROOMS_CAMPER
	const RYUKYU_HOTEL_ROOMS_PSYCHIC
	const RYUKYU_HOTEL_ROOMS_COOLTRAINERF
	const RYUKYU_HOTEL_ROOMS_COOLTRAINERF2
	const RYUKYU_HOTEL_ROOMS_COOLTRAINERF3
	const RYUKYU_HOTEL_ROOMS_COOLTRAINERM
	const RYUKYU_HOTEL_ROOMS_LASS

RyukyuHotelRooms_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .CheckDayOfWeekOakBattle
	
.CheckDayOfWeekOakBattle:
	checkcode VAR_WEEKDAY
	ifequal SATURDAY, .ItsWeekendOak
	checkcode VAR_WEEKDAY
	ifequal SUNDAY, .ItsWeekendOak
	disappear RYUKYU_HOTEL_ROOMS_OAK
	return
	
.ItsWeekendOak
	appear RYUKYU_HOTEL_ROOMS_OAK
	return

RyukyuHotelRoomsOakScript:
	checkevent EVENT_BATTLED_OAK
	iftrue .TalkToOakAfterBattle
	faceplayer
	opentext
	writetext RyukyuHotelRoomsOakBefore
	yesorno
	iffalse .NoOakBattleYet
	writetext RyukyuHotelRoomsOakBefore2
	waitbutton
	closetext
	checkevent EVENT_GOT_PALSSIO_FROM_OAK
	iftrue .Cruise
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .Chikorita
	winlosstext RyukyuHotelRoomsOakTextWin, RyukyuHotelRoomsOakTextLoss
	loadtrainer MISTY, OAK_HAS_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.Cruise:
	winlosstext RyukyuHotelRoomsOakTextWin, RyukyuHotelRoomsOakTextLoss
	loadtrainer MISTY, OAK_HAS_CUBBURN
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.Chikorita:
	winlosstext RyukyuHotelRoomsOakTextWin, RyukyuHotelRoomsOakTextLoss
	loadtrainer MISTY, OAK_HAS_PALSSIO
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.FinishBattle:
	opentext
	writetext RyukyuHotelRoomsOakAfter
	waitbutton
	closetext
	setevent EVENT_BATTLED_OAK
	end
	
.NoOakBattleYet
	writetext RyukyuHotelRoomsOakNoBattle
	waitbutton
	closetext
	end
	
.TalkToOakAfterBattle
	faceplayer
	opentext
	writetext RyukyuHotelRoomsOakAfter
	waitbutton
	closetext
	end
	

TrainerSoldierWarnell:
	trainer SOLDIER, WARNELL, EVENT_BEAT_SOLDIER_WARNELL, SoldierWarnellSeenText, SoldierWarnellBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SoldierWarnellAfterBattleText
	waitbutton
	closetext
	end
	

TrainerCamperQuentin:
	trainer CAMPER, QUENTIN, EVENT_BEAT_CAMPER_QUENTIN, CamperQuentinSeenText, CamperQuentinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperQuentinAfterBattleText
	waitbutton
	closetext
	end
	

TrainerPsychicRaphael:
	trainer PSYCHIC_T, RAPHAEL, EVENT_BEAT_PSYCHIC_T_RAPHAEL, PsychicRaphaelSeenText, PsychicRaphaelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicRaphaelAfterBattleText
	waitbutton
	closetext
	end
	

TrainerCooltrainerfAyano:
	trainer COOLTRAINERF, AYANO, EVENT_BEAT_COOLTRAINERF_AYANO, CooltrainerfAyanoSeenText, CooltrainerfAyanoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfAyanoAfterBattleText
	waitbutton
	closetext
	end
	

TrainerCooltrainerfYuka:
	trainer COOLTRAINERF, YUKA, EVENT_BEAT_COOLTRAINERF_YUKA, CooltrainerfYukaSeenText, CooltrainerfYukaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfYukaAfterBattleText
	waitbutton
	closetext
	end
	
TrainerCooltrainerfAyaka:
	trainer COOLTRAINERF, AYAKA, EVENT_BEAT_COOLTRAINERF_AYAKA, CooltrainerfAyakaSeenText, CooltrainerfAyakaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfAyakaAfterBattleText
	waitbutton
	closetext
	end
	
TrainerCooltrainermWozniak:
	trainer COOLTRAINERM, WOZNIAK, EVENT_BEAT_COOLTRAINERM_WOZNIAK, CooltrainermWozniakSeenText, CooltrainermWozniakBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermWozniakAfterBattleText
	waitbutton
	closetext
	end
	

TrainerLassEliza:
	trainer LASS, ELIZA, EVENT_BEAT_LASS_ELIZA, LassElizaSeenText, LassElizaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassElizaAfterBattleText
	waitbutton
	closetext
	end
	
LassElizaSeenText:
	text "Nur weil ich im"
	line "Urlaub bin, heißt"
	para "das nicht, dass"
	line "ich nicht kämpfen"
	cont "möchte!"
	done

LassElizaBeatenText:
	text "War trotzdem ein"
	line "toller Kampf!"
	done

LassElizaAfterBattleText:
	text "Auch wenn ich"
	line "verliere, ist"
	para "jeder Kampf eine"
	line "gute Erfahrung."
	done
	
CooltrainermWozniakSeenText:
	text "Zeit für meinen"
	line "täglichen Sieg!"
	done

CooltrainermWozniakBeatenText:
	text "Das zählt nicht!"
	done

CooltrainermWozniakAfterBattleText:
    text "Ich finde jemand"
    line "anderen, den ich"
    cont "heute besiege."
	done

CooltrainerfAyakaSeenText:
	text "Klar, ich kämpfe"
	line "gegen dich!"
	done

CooltrainerfAyakaBeatenText:
	text "Diesmal habe ich"
	line "verloren!"
	done

CooltrainerfAyakaAfterBattleText:
    text "Ich muss mehr Zeit"
    line "in die Aufzucht"
    para "meiner #MON"
    line "investieren."
	done

CooltrainerfYukaSeenText:
	text "Ein Kampf?"

	para "Den lehne ich nie"
	line "ab!"
	done

CooltrainerfYukaBeatenText:
	text "Nicht gut!"
	done

CooltrainerfYukaAfterBattleText:
	text "Meine #MON und"
	line "ich sollten"
	cont "trainieren."
	done

CooltrainerfAyanoSeenText:
	text "Oh, ein Kampf?"

	para "Darin bin ich"
	line "ziemlich gut."
	done

CooltrainerfAyanoBeatenText:
	text "Nicht gut genug!"
	done

CooltrainerfAyanoAfterBattleText:
	text "Wo trainierst du"
	line "deine #MON?"
	done
	
PsychicRaphaelSeenText:
	text "Ich kann deine"
	line "Gedanken lesen!"
	done

PsychicRaphaelBeatenText:
	text "Ich weiß, warum"
	line "du hier bist!"
	done

PsychicRaphaelAfterBattleText:
	text "Du bist hier,"
	line "weil du Urlaub"
	cont "machst!"
	done

CamperQuentinSeenText:
	text "Zählt ein Hotel"
	line "als Zeltplatz?"
	done

CamperQuentinBeatenText:
	text "Umgehauen!"
	done

CamperQuentinAfterBattleText:
	text "Wenn ich sage, ich"
	line "zelte, dann zelte"
	cont "ich auch!"
	done
	
SoldierWarnellSeenText:
	text "Diese INSEL ist"
	line "mein offizieller"
	cont "Posten!"
	done

SoldierWarnellBeatenText:
	text "Nichts zu melden!"
	done

SoldierWarnellAfterBattleText:
	text "Ich bin wirklich"
	line "hier stationiert,"
	para "ob du's glaubst"
	line "oder nicht."
	done
	
RyukyuHotelRoomsOakBefore2:
	text "Geben wir beide"
	line "unser Bestes!"
	done
	
RyukyuHotelRoomsOakNoBattle:
	text "Kein Problem!"

	para "Dann eben ein"
	line "andermal."
	done
	
RyukyuHotelRoomsOakBefore:
    text "EICH: Oh, <PLAYER>!"

    para "Wie schön, dich"
    line "hier zu sehen!"

    para "Es scheint, als"
    line "hättest du ein"
    para "spannendes und er-"
    line "fülltes Abenteuer"
    cont "mit deinen #MON"
    cont "erlebt!"

    para "Du und <RIVAL>,"
    line "ihr beide habt"
    para "mich wirklich sehr"
    line "inspiriert!"

    para "Ich habe wieder"
    line "angefangen, ein"
    para "paar #MON"
    line "großzuziehen."

    para "Das habe ich schon"
    line "sehr lange nicht"
    cont "mehr gemacht!"

    para "Wenn du möchtest,"
    line "könnten wir doch"
    para "gegeneinander"
    line "kämpfen!"

    para "Ich bin sicher,"
    line "dass es unseren"
    para "#MON gefallen"
    line "würde."

    para "Wie wäre es?"
	done
	
RyukyuHotelRoomsOakTextWin:
	text "Das war richtig"
	line "aufregend!"
	done
	
RyukyuHotelRoomsOakTextLoss:
	text "Ohje!"
	done
	
RyukyuHotelRoomsOakAfter:
    text "EICH: Ich kann dir"
    line "nicht genug für"
    cont "deine Hilfe"
    cont "danken!"

    para "Ich habe völlig"
    line "neue Höhen in"
    para "meiner Forschung"
    line "und Liebe zu"
    cont "#MON erreicht!"
	done

HotelBed:	
	opentext
	writetext HotelBedText1
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	special HealParty
	playmusic MUSIC_HEAL
	pause 60
	special RestartMapMusic
	special FadeInQuickly
	opentext
	writetext HotelBedText2
	waitbutton
	closetext
	end
	
HotelBedText1:
    text "Es ist dein"
    line "Hotelbett."

    para "Zeit sich"
    line "auszuruhen…"
	done
	
HotelBedText2:
	text "Ah, ausgeruht und"
	line "frisch!"
	done


RyukyuHotelRooms_MapEvents:
	db 0, 0 ; filler


	db 16 ; warp events
	warp_event  1,  5, RYUKYU_HOTEL_2F, 4
	warp_event  2,  5, RYUKYU_HOTEL_2F, 4
	warp_event  1, 17, RYUKYU_HOTEL_2F, 5
	warp_event  2, 17, RYUKYU_HOTEL_2F, 5
	
	warp_event 12,  5, RYUKYU_HOTEL_3F, 4
	warp_event 13,  5, RYUKYU_HOTEL_3F, 4
	warp_event 12, 17, RYUKYU_HOTEL_3F, 5
	warp_event 13, 17, RYUKYU_HOTEL_3F, 5
	
	warp_event 24,  7, RYUKYU_HOTEL_4F, 4
	warp_event 25,  7, RYUKYU_HOTEL_4F, 4
	warp_event 24, 17, RYUKYU_HOTEL_4F, 5
	warp_event 25, 17, RYUKYU_HOTEL_4F, 5
	
	warp_event 36,  5, RYUKYU_HOTEL_5F, 3
	warp_event 37,  5, RYUKYU_HOTEL_5F, 3
	warp_event 36, 17, RYUKYU_HOTEL_5F, 4
	warp_event 37, 17, RYUKYU_HOTEL_5F, 4
	db 0 ; coord events

	db 2 ; bg events
	bg_event 39, 12, BGEVENT_READ, HotelBed
	bg_event 39, 13, BGEVENT_READ, HotelBed

	db 9 ; object events
	object_event 35,  1, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, RyukyuHotelRoomsOakScript, EVENT_OAK_HERE_ON_WEEKENDS
	object_event  3,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSoldierWarnell, -1
	object_event 12,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerCamperQuentin, -1
	object_event  0, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicRaphael, -1
	object_event 14, 12, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfAyano, -1
	object_event 10, 15, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfYuka, -1
	object_event 15, 15, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfAyaka, -1
	object_event 25,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermWozniak, -1
	object_event 23, 15, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLassEliza, -1

