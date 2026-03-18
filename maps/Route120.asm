	object_const_def ; object_event constants
	const ROUTE120_FRUIT_TREE
	const ROUTE120_YOUNGSTER
	const ROUTE120_SCHOOLBOY
	const ROUTE120_LASS
	const ROUTE120_GRAMPS
	const ROUTE120_ITEMBALL

Route120_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
	
TrainerYoungsterJoey:
	trainer YOUNGSTER, JOEY1, EVENT_BEAT_YOUNGSTER_JOEY, YoungsterJoey1SeenText, YoungsterJoey1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_JOEY_READY_FOR_REMATCH
	iftrue .Rematch
	checkcellnum PHONE_YOUNGSTER_JOEY
	iftrue .NumberAccepted
	checkevent EVENT_JOEY_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext YoungsterJoey1AfterText
	promptbutton
	setevent EVENT_JOEY_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .RequestNumber

.AskAgain:
	scall .AskNumber2
.RequestNumber:
	askforphonenumber PHONE_YOUNGSTER_JOEY
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, YOUNGSTER, JOEY1
	scall .RegisteredNumber
	sjump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext YoungsterJoey1BeatenText, 0
	checkflag ENGINE_FLYPOINT_KANTO
	iftrue .LoadFight2
	checkflag ENGINE_FLYPOINT_ALLOY
	iftrue .LoadFight1
	loadtrainer YOUNGSTER, JOEY1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_JOEY_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer YOUNGSTER, JOEY2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_JOEY_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer YOUNGSTER, JOEY3
	startbattle
	reloadmapafterbattle
	clearevent EVENT_JOEY_READY_FOR_REMATCH
	end

.AskNumber1:
	jumpstd AskNumber1MScript
	end

.AskNumber2:
	jumpstd AskNumber2MScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberMScript
	end

.NumberAccepted:
	jumpstd NumberAcceptedMScript
	end

.NumberDeclined:
	jumpstd NumberDeclinedMScript
	end

.PhoneFull:
	jumpstd PhoneFullMScript
	end

.RematchStd:
	jumpstd RematchMScript
	end
	

TrainerSchoolboyDudley:
	trainer SCHOOLBOY, DUDLEY, EVENT_BEAT_SCHOOLBOY_DUDLEY, SchoolboyDudleySeenText, SchoolboyDudleyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyDudleyAfterBattleText
	waitbutton
	closetext
	end

TrainerLassConnie:
	trainer LASS, CONNIE1, EVENT_BEAT_LASS_CONNIE, LassConnie1SeenText, LassConnie1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassConnie1AfterBattleText
	waitbutton
	closetext
	end
	
Route120GrampsScript:
	faceplayer
	opentext
	writetext Route120GrampsText
	waitbutton
	closetext
	end

Route120BoulderMineSign:
	jumptext Route120BoulderMineSignText

Route120FruitTree:
	fruittree FRUITTREE_TREE_ROUTE_120
	
Route120SuperRepel:
	itemball SUPER_REPEL
	
Route120GrampsText:
	text "Oh, gut! Du"
	line "bist hier!"

	para "Bitte hilf mir"
	line "doch."

	para "Meine Enkelin"
	line "könnte da drin"
	cont "gefangen sein!"
	done
	

LassConnie1SeenText:
	text "Ich weiß nicht,"
	line "warum ich mit"
	cont "FLAVIO oder JULIAN"
	cont "abhänge."

	para "Du bist sicher"
	line "viel cooler als"
	cont "die beiden!"
	done

LassConnie1BeatenText:
	text "Aaah! Meine"
	line "#MON!"
	done

LassConnie1AfterBattleText:
	text "Na ja, verloren,"
	line "aber der Kampf"
	cont "war lustiger als"
	cont "alles, was die"
	cont "zwei so anstellen."
	done

	
SchoolboyDudleySeenText:
	text "This route is"
	line "where all of my"
	para "friends meet after"
	line "school!"
	done

SchoolboyDudleyBeatenText:
	text "Wooh! Das war gut."
	done

SchoolboyDudleyAfterBattleText:
	text "Ich hab mein"
	line "Bestes gegeben."

	para "Ich bereue nichts."
	done
	
YoungsterJoey1SeenText:
	text "Es macht Spaß,"
	line "in der MINE zu"
	cont "spielen."

	para "Aber verrate es"
	line "bitte nicht"
	cont "unseren Eltern!"
	done

YoungsterJoey1BeatenText:
	text "Mist! Verloren!"
	line "Verdammich!"
	done

YoungsterJoey1AfterText:
	text "Brauche ich mehr"
	line "#MON, um besser"
	cont "zu kämpfen?"

	para "Nein! Ich bleibe"
	line "bei diesem hier,"
	cont "komme was wolle!"
	done


YoungsterJoeyText_GiveHPUpAfterBattle:
	text "Wieder verloren…"
	line "Mann, bist du"
	cont "stark!"

	para "Ach ja, fast hätte"
	line "ich vergessen, dir"
	cont "das hier zu geben."

	para "Benutze es, um"
	line "noch stärker zu"
	cont "werden, okay?"

	para "Ich werde auch"
	line "stärker werden."
	done

Route120BoulderMineSignText:
	text "GERÖLLMINE"

	para "Gefährliches"
	line "Abbaugebiet!"

	para "Betreten ohne"
	line "#MON zum Schutz"
	cont "verboten."
	done

Route120_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  9,  5, BOULDER_MINE_1F, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 10,  6, BGEVENT_READ, Route120BoulderMineSign

	db 6 ; object events
	object_event 42,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route120FruitTree, -1
	object_event 12, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 4, TrainerYoungsterJoey, -1
	object_event 24,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_TRAINER, 4, TrainerSchoolboyDudley, -1
	object_event 12,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLassConnie, -1
	object_event  8,  7, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route120GrampsScript, EVENT_GRAMPS_AT_MINE
	object_event 21, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route120SuperRepel, EVENT_PICKED_UP_ROUTE_120_SUPER_REPEL


