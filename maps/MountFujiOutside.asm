	object_const_def ; object_event constants
	const MOUNTMOONSQUARE_POKEFAN_M
	const MOUNTMOONSQUARE_SPORTSMAN
	const MOUNTMOONSQUARE_LASS

MountFujiOutside_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


TrainerHikerBenjamin:
	trainer HIKER, BENJAMIN, EVENT_BEAT_HIKER_BENJAMIN, HikerBenjaminSeenText, HikerBenjaminBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerBenjaminAfterBattleText
	waitbutton
	closetext
	end
	
TrainerSportsmanArthur:
	trainer SPORTSMAN, ARTHUR, EVENT_BEAT_SPORTSMAN_ARTHUR, SportsmanArthurSeenText, SportsmanArthurBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SportsmanArthurAfterBattleText
	waitbutton
	closetext
	end

HealerLassScript:
	faceplayer
	opentext
	checkevent EVENT_SPOKE_WITH_LASS_WHO_HEALS
	iftrue .LassHealSequence
	writetext LassIntroText
	setevent EVENT_SPOKE_WITH_LASS_WHO_HEALS
	waitbutton
	jump .LassHealSequence
	end

.LassHealSequence
	writetext LassAsksToHeal
	yesorno
	iftrue .LassHealTime
	writetext NoHealThisTime
	waitbutton
	closetext
	end
	
.LassHealTime
	writetext LassHealTimeText
	waitbutton
	closetext
	special FadeOutPalettes
	playmusic MUSIC_HEAL
	pause 60
	special HealParty
	special FadeInPalettes
	special RestartMapMusic
	opentext
	writetext LassHealTimeText2
	waitbutton
	closetext
	end
	
LassIntroText:
	text "Wir sind schon"
	line "ziemlich weit oben"
	cont "auf dem Berg."

	para "Hm? Ja, ich bin"
	line "Trainerin, aber"
	cont "ich mache eine"
	cont "Verschnaufpause."

	para "Ich habe genug"
	line "Medizin dabei."

	para "Wenn deine #MON"
	line "Erholung brauchen,"
	para "sag Bescheid, dann"
	line "helfe ich dir."
	done
	
LassAsksToHeal:
	text "Wie sieht's aus?"

	para "Soll ich deine"
	line "#MON heilen?"
	done
	
NoHealThisTime:
	text "Na gut."

	para "Ich bleibe noch"
	line "eine Weile hier."

	para "Komm ruhig vorbei,"
	line "wenn du Hilfe"
	cont "brauchst."
	done
	
LassHealTimeText:
	text "Gut, dann zeig"
	line "mir kurz deine"
	cont "#MON…"
	done
	
LassHealTimeText2:
	text "Fertig!"

	para "Dein Team ist"
	line "wieder topfit!"
	done

SportsmanArthurSeenText:
    text "Ich glaube, ich"
    line "kann bis an die"
    cont "Spitze joggen."
	done

SportsmanArthurBeatenText:
	text "Außer Puste!"
	done

SportsmanArthurAfterBattleText:
	text "Ich bin halt kein"
	line "WANDERER."
	done

HikerBenjaminSeenText:
	text "Ach, ist das"
	line "schön, im Freien"
	cont "zu sein! Ich fühle"
	cont "mich so frei!"
	done

HikerBenjaminBeatenText:
	text "Hahaha!"
	done

HikerBenjaminAfterBattleText:
    text "Es dauert lange,"
    line "bis man den Gipfel"
    cont "erreicht."

    para "An die frische"
    line "Luft zu gehen, tut"
    cont "aber richtig gut!"
	done

MountFujiOutside_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event 11, 15, MT_FUJI_INTERIOR_LOWER, 2
	warp_event  5, 13, MT_FUJI_INTERIOR_LOWER, 3
	warp_event 15, 11, MT_FUJI_INTERIOR_LOWER, 4
	warp_event 11,  9, MT_FUJI_INTERIOR_LOWER, 5
	warp_event  1,  7, MT_FUJI_INTERIOR_LOWER, 6
	warp_event 17,  5, MT_FUJI_INTERIOR_UPPER, 1
	warp_event 11,  3, MT_FUJI_INTERIOR_UPPER, 2
	warp_event  7,  1, MT_FUJI_INTERIOR_UPPER, 3

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  3, 14, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerBenjamin, -1
	object_event  3,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerSportsmanArthur, -1
	object_event  7,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 1, HealerLassScript, -1
