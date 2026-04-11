	object_const_def ; object_event constants
	const ROUTE114_YOUNGSTER1
	const ROUTE114_LASS1
	const ROUTE114_YOUNGSTER2
	const ROUTE114_LASS2
	const ROUTE114_POKEFAN_M1
	const ROUTE114_POKEFAN_M2
	const ROUTE114_COOLTRAINER

Route114_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerCamperDean:
	trainer CAMPER, DEAN, EVENT_BEAT_CAMPER_DEAN, CamperDeanSeenText, CamperDeanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperDeanAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerHeidi:
	trainer PICNICKER, HEIDI, EVENT_BEAT_PICNICKER_HEIDI, PicnickerHeidiSeenText, PicnickerHeidiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerHeidiAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperSid:
	trainer CAMPER, SID, EVENT_BEAT_CAMPER_SID, CamperSidSeenText, CamperSidBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperSidAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerEdna:
	trainer PICNICKER, EDNA, EVENT_BEAT_PICNICKER_EDNA, PicnickerEdnaSeenText, PicnickerEdnaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerEdnaAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerTim:
	trainer HIKER, TIM, EVENT_BEAT_HIKER_TIM, HikerTimSeenText, HikerTimBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerTimAfterBattleText
	waitbutton
	closetext
	end

TrainerSportsmanJacob:
	trainer SPORTSMAN, JACOB, EVENT_BEAT_SPORTSMAN_JACOB, SportsmanJacobSeenText, SportsmanJacobBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SportsmanJacobAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerSidney:
	trainer HIKER, SIDNEY, EVENT_BEAT_HIKER_SIDNEY, HikerSidneySeenText, HikerSidneyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerSidneyAfterBattleText
	waitbutton
	closetext
	end

Route114Sign:
	jumptext Route114SignText

Route114HiddenEther:
	hiddenitem ETHER, EVENT_ROUTE_114_HIDDEN_ETHER
	
SportsmanJacobSeenText:
    text "Ich mache eine"
    line "Pause vom Joggen."
	done
	
SportsmanJacobBeatenText:
    text "Das habe ich so"
    line "nicht erwartet."
	done
	
SportsmanJacobAfterBattleText:
    text "Mit seinen #MON"
    line "zu joggen, ist ein"
    cont "super Training."
	done

CamperDeanSeenText:
    text "Warst du schon mal"
    line "in der KANTO-"
    cont "REGION?"
	done

CamperDeanBeatenText:
    text "Woah! Gefährlich."
	done

CamperDeanAfterBattleText:
    text "Ich gehe lieber im"
    line "JAADEWALD zelten."
	done

PicnickerHeidiSeenText:
	text "Warst du schon"
	line "beim Picknicken?"

	para "Das macht großen"
	line "Spaß!"
	done

PicnickerHeidiBeatenText:
	text "Ohhhh!"
	done

PicnickerHeidiAfterBattleText:
	text "Wir backen viele"
	line "gute Sachen, die"

	para "wir mit allen"
	line "teilen. Sie"
	cont "schmecken lecker!"
	done

CamperSidSeenText:
	text "Hey, du Lump!"
	line "Wirf deinen Müll"
	cont "nicht hier hin!"
	done

CamperSidBeatenText:
	text "Ich wollte nur"
	line "klarstellen, dass…"
	done

CamperSidAfterBattleText:
	text "Entschuldige!"
	line "Ich habe mich"
	cont "geirrt."
	done

PicnickerEdnaSeenText:
	text "Die Leute sollten"
	line "ihren Müll nicht"
	cont "hier liegen"
	cont "lassen."
	done

PicnickerEdnaBeatenText:
	text "Ohh… Ich habe"
	line "verloren…"
	done

PicnickerEdnaAfterBattleText:
	text "Energiesparen ist"
	line "wichtig, aber die"

	para "Natur ist noch"
	line "viel wichtiger."
	done

HikerTimSeenText:
	text "Wenn sie kommt,"
	line "kommt sie vom"
	cont "KOROKANIABERG…"
	done

HikerTimBeatenText:
	text "Ich war zu sehr"
	line "mit Singen"
	cont "beschäftigt…"
	done

HikerTimAfterBattleText:
	text "Bei Kämpfen spielt"
	line "Konzentration eine"
	cont "wichtige Rolle."
	done

HikerSidneySeenText:
	text "Ich verrate dir"
	line "ein Geheimnis."

	para "Aber zuerst müssen"
	line "wir kämpfen!"
	done

HikerSidneyBeatenText:
	text "Oh, Mist!"
	line "Ich habe verloren…"
	done

HikerSidneyAfterBattleText:
    text "Das mit dem"
    line "Geheimnis war nur"
    cont "ein Scherz."

    para "Ich weiß nichts"
    line "Interessantes."
	done

Route114SignText:
	text "ROUTE 114"

	para "SENDESTIA CITY -"
	line "KANTO-REGION"
	done

Route114_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 28,  5, ROUTE_113_ROUTE_114_GATE, 3
	warp_event 29,  5, ROUTE_113_ROUTE_114_GATE, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  4, 10, BGEVENT_READ, Route114Sign
	bg_event 35, 15, BGEVENT_ITEM, Route114HiddenEther

	db 7 ; object events
	object_event 18, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCamperDean, -1
	object_event 28, 10, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPicnickerHeidi, -1
	object_event 10,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_TRAINER, 4, TrainerCamperSid, -1
	object_event  8, 13, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerEdna, -1
	object_event 14, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerHikerTim, -1
	object_event 21,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerHikerSidney, -1
	object_event 31,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerSportsmanJacob, -1
