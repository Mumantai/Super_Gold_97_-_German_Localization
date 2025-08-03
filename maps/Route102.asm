	object_const_def ; object_event constants
	const ROUTE102_YOUNGSTER1
	const ROUTE102_YOUNGSTER2
	const ROUTE102_LASS1
	const ROUTE102_FRUIT_TREE
	const ROUTE102_ARTHUR
	const ROUTE102_SILVER
	const ROUTE102_YOUNGSTER3
	const ROUTE102_YOUNGSTER4


Route102_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE102_NOTHING
	scene_script .DummyScene1 ; SCENE_ROUTE102_SILVER

	db 3 ; callbacks
	callback MAPCALLBACK_OBJECTS, .ArthurCallback
	callback MAPCALLBACK_NEWMAP, .CheckMomCall
	callback MAPCALLBACK_TILES, .Route102TreeCut

.CheckMomCall:
	checkevent EVENT_TALKED_TO_MOM_AFTER_GETTING_POKEDEX
	iffalse .DoMomCall
	return

.DoMomCall:
	specialphonecall SPECIALCALL_WORRIED
	return

.DummyScene0:
	end

.DummyScene1:
	end

.ArthurCallback:
	checkcode VAR_WEEKDAY
	ifequal THURSDAY, .ArthurAppears
	disappear ROUTE102_ARTHUR
	return

.ArthurAppears:
	appear ROUTE102_ARTHUR
	return


.Route102TreeCut:
	checkevent EVENT_ROUTE_102_TREE_CUT
	iffalse .R102TreeThere
	changeblock  33, 7, $6D ; notree
	return
	
.R102TreeThere
	return



TrainerSchoolboyAlan1:
	trainer SCHOOLBOY, ALAN1, EVENT_BEAT_SCHOOLBOY_ALAN, SchoolboyAlan1SeenText, SchoolboyAlan1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_ALAN_READY_FOR_REMATCH
	iftrue .ChooseRematch
	checkcellnum PHONE_SCHOOLBOY_ALAN
	iftrue .NumberAccepted
	checkevent EVENT_ALAN_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgainForPhoneNumber
	writetext SchoolboyAlanBooksText
	promptbutton
	setevent EVENT_ALAN_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .ContinueAskForPhoneNumber

.AskAgainForPhoneNumber:
	scall .AskNumber2
.ContinueAskForPhoneNumber:
	askforphonenumber PHONE_SCHOOLBOY_ALAN
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, SCHOOLBOY, ALAN1
	scall .RegisteredNumber
	sjump .NumberAccepted

.ChooseRematch:
	scall .Rematch
	winlosstext SchoolboyAlan1BeatenText, 0
	checkflag ENGINE_FLYPOINT_AMAMI
	iftrue .LoadFight2
	checkflag ENGINE_FLYPOINT_STAND
	iftrue .LoadFight1
	loadtrainer SCHOOLBOY, ALAN1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_ALAN_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer SCHOOLBOY, ALAN2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_ALAN_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer SCHOOLBOY, ALAN3
	startbattle
	reloadmapafterbattle
	clearevent EVENT_ALAN_READY_FOR_REMATCH
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

.Rematch:
	jumpstd RematchMScript
	end

TrainerYoungsterSamuel:
	trainer YOUNGSTER, SAMUEL, EVENT_BEAT_YOUNGSTER_SAMUEL, YoungsterSamuelSeenText, YoungsterSamuelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterSamuelAfterText
	waitbutton
	closetext
	end

TrainerYoungsterIan:
	trainer YOUNGSTER, IAN, EVENT_BEAT_YOUNGSTER_IAN, YoungsterIanSeenText, YoungsterIanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterIanAfterText
	waitbutton
	closetext
	end


Route102LassScript:
	faceplayer
	opentext
	writetext Route102LassText
	waitbutton
	closetext
	end



TrainerPsychicMark:
	trainer PSYCHIC_T, MARK, EVENT_BEAT_PSYCHIC_MARK, PsychicMarkSeenText, PsychicMarkBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicMarkAfterBattleText
	waitbutton
	closetext
	end

ArthurScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HARD_STONE_FROM_ARTHUR
	iftrue .AlreadyGotStone
	checkcode VAR_WEEKDAY
	ifnotequal THURSDAY, ArthurNotThursdayScript
	checkevent EVENT_MET_ARTHUR_OF_THURSDAY
	iftrue .MetArthur
	writetext MeetArthurText
	buttonsound
	setevent EVENT_MET_ARTHUR_OF_THURSDAY
.MetArthur:
	writetext ArthurGivesGiftText
	buttonsound
	verbosegiveitem HARD_STONE
	iffalse .BagFull
	setevent EVENT_GOT_HARD_STONE_FROM_ARTHUR
	writetext ArthurGaveGiftText
	waitbutton
	closetext
	end

.AlreadyGotStone:
	writetext ArthurThursdayText
	waitbutton
.BagFull:
	closetext
	end

ArthurNotThursdayScript:
	writetext ArthurNotThursdayText
	waitbutton
	closetext
	end

Route102SilverScript:
	applymovement PLAYER, Movement_36DownOne
	playsound SFX_EXIT_BUILDING
	moveobject ROUTE102_SILVER, 6, 5
	appear ROUTE102_SILVER
	applymovement ROUTE102_SILVER, Movement_36SilverDownOne
	special FadeOutMusic
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext Route102RivalBeforeText
	waitbutton
	closetext
	checkevent EVENT_GOT_PALSSIO_FROM_OAK
	iftrue .Cruise
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .Chikorita
	winlosstext Route102SilverWinText, Route102SilverLossText
	loadtrainer RIVAL1, RIVAL1_2_PALSSIO
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.Cruise:
	winlosstext Route102SilverWinText, Route102SilverLossText
	loadtrainer RIVAL1, RIVAL1_2_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.Chikorita:
	winlosstext Route102SilverWinText, Route102SilverLossText
	loadtrainer RIVAL1, RIVAL1_2_CUBBURN
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.AfterBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext Route102RivalAfterText
	waitbutton
	closetext
	applymovement ROUTE102_SILVER, Route102RivalBattleExitMovement
	playsound SFX_ENTER_DOOR
	disappear ROUTE102_SILVER
	setscene SCENE_ROUTE102_NOTHING
	waitsfx
	playmapmusic
	end

Route102SilverTalkScript:
	end

Route102Sign:
	jumptext Route102SignText

SanskritRuinsNorthSign:
	jumptext SanskritRuinsNorthSignText

Route102TrainerTips1:
	jumptext Route102TrainerTips1Text

Route102TrainerTips2:
	jumptext Route102TrainerTips2Text
	
Route102GameHouse:
	jumptext Route102GameHouseText

Route102FruitTree:
	fruittree FRUITTREE_TREE_ROUTE_102

BellignanShakeMovement:
	tree_shake ; shake
	step_end

WeirdTreeMovement_Flee:
	fast_jump_step UP
	fast_jump_step UP
	step_end
	
Movement_36DownOne:
	step DOWN
	turn_head UP
	step_end
	
Movement_36SilverDownOne:
	step DOWN
	step_end

FloriaMovement1:
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

FloriaMovement2:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

Route102TreeCut:
	setevent EVENT_ROUTE_102_TREE_CUT
	setscene SCENE_ROUTE102_SILVER
	end
	
Route102RivalBattleExitMovement:
	step UP
	step_end
	
Route102SilverWinText:
    text "Wow! Du hast ja"
    line "hart gearbeitet"
    para "und deine #MON"
    line "gut trainiert!"
	done
	
Route102SilverLossText:
	text "Mein Team ist"
	line "das beste!"
	done
	
Route102RivalBeforeText:
	text "<PLAYER>!"

	para "Du musst dir PORT"
	line "ABANISHI ansehen!"

	para "Es gibt dort ein"
	line "riesiges KAUFHAUS"
	para "und einen RADIO-"
	line "TURM und…"

	para "Oh, ja!"

	text "Ich habe angefang-"
	line "en, die ARENA-"
	cont "ORDEN zu sammeln!"

	para "Ich habe gehört,"
	line "du auch, <PLAYER>!"

	para "Das wird meine"
	line "Gelegenheit, der"
	para "Welt zu zeigen,"
	line "dass mein Team das"
	cont "stärkste ist!"

	para "Ich habe auch ein"
	line "paar neue #MON"
	cont "gefangen!"

	para "Du auch? Dann lass"
	line "uns kämpfen, um zu"
	para "sehen, wessen"
	line "besser sind!"
	done
	
Route102RivalAfterText:
    text "Puh! Es war schön,"
    line "dich wieder zu"
    cont "treffen, <PLAYER>!"

    para "Ich gehe zurück"
    line "in die Stadt!"

    para "Wir sehen uns!"
	done


Route102LassText:
	text "Ein Baum versperrt"
	line "den Weg nach"
	cont "PORT ABANISHI."

	para "Wenn du durch"
	line "möchtest, kann"
	para "ein #MON den"
	line "Baum vielleicht"
	cont "ZERSCHNEIDEN."
	done

PsychicMarkSeenText:
	text "Ich werde jetzt"
	line "deine Gedanken"
	cont "lesen!"
	done

PsychicMarkBeatenText:
	text "Ich habe mich wohl"
	line "bei dir verlesen!"
	done

PsychicMarkAfterBattleText:
	text "Ich wäre wirklich"
	line "stark, wenn ich "

	para "wüsste, was mein"
	line "Gegner denkt."
	done

SchoolboyAlan1SeenText:
	text "Dank meiner"
	line "Studien bin ich"
	cont "für jedes #MON"
	cont "bereit!"
	done

SchoolboyAlan1BeatenText:
	text "Ups! Ein Fehler"
	line "in der Berechnung?"
	done

SchoolboyAlanBooksText:
	text "Mist! Ich lerne"
	line "auch fünf Stunden"
	cont "am Tag."

	para "Es gibt vieles,"
	line "das du nicht aus"
	cont "Büchern lernen"
	cont "kannst."
	done

MeetArthurText:
	text "DONATUS: Wer bist"
	line "du?"

	para "Ich bin DONATUS"
	line "von Donnerstag."
	done

ArthurGivesGiftText:
	text "Hier bitte. Das"
	line "kannst du haben."
	done

ArthurGaveGiftText:
	text "DONATUS: Ein"
	line "#MON, das"
	para "Gestein-Attacken"
	line "benutzt, sollte"
	cont "dies mit sich"
	cont "tragen."

	para "Es verstärkt"
	line "Gestein-Attacken."
	done

ArthurThursdayText:
	text "DONATUS: Ich bin"
	line "DONATUS von"
	para "Donnerstag. Ich"
	line "bin der zweite"
	para "Sohn von"
	line "sieben Kindern."
	done

ArthurNotThursdayText:
	text "DONATUS: Heute ist"
	line "nicht Donnerstag."
	cont "Wie bedauerlich!"
	done

Route102SignText:
	text "ROUTE 102"
	para "PAGETIA CITY -"
	line "PORT ABANISHI"
	done

SanskritRuinsNorthSignText:
	text "ALPH-RUINEN"
	line "NORDEINGANG"
	done

Route102TrainerTips1Text:
	text "TIPPS für TRAINER"

	para "Der Status der"
	line "#MON ist unter-"
	para "schiedlich, sogar"
	line "innerhalb der-"
	cont "selben Spezies."

	para "Zu Beginn ist er"
	line "vielleicht noch"
	cont "ähnlich."

	para "Doch die Unter-"
	line "schiede werden "
	para "deutlicher, wenn"
	line "die #MON"
	cont "heranwachsen."
	done

Route102TrainerTips2Text:
	text "TIPPS für TRAINER"

	para "Setze den"
	line "SCHAUFLER ein, um"
	para "an den Eingang"
	line "eines Ortes"
	cont "zurückzugelangen."

	para "Das ist sehr nütz-"
	line "lich beim Erkunden"
	para "von Höhlen und an-"
	line "deren Umgebungen."
	done
	
Route102GameHouseText:
	text "Mach eine Pause!"

	para "SPIELHÜTTE"
	done
	


YoungsterSamuelSeenText:
	text "Hier trainiere"
	line "ich!"
	done

YoungsterSamuelBeatenText:
	text "Besiegt von einem"
	line "Passanten!"
	done

YoungsterSamuelAfterText:
	text "Ich werde noch"
	line "härter trainieren."

	para "Ich möchte doch"
	line "ein ARENALEITER"
	cont "werden."
	done

YoungsterIanSeenText:
	text "Ich bin der"
	line "#MON-Experte"
	cont "in meiner Klasse."
	done

YoungsterIanBeatenText:
	text "Nein! Es gibt noch"
	line "bessere Trainer…"
	done

YoungsterIanAfterText:
	text "Ich muss mich wohl"
	line "mehr anstregen."
	done
	
WateredWeirdTreeScript::
	end


Route102_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  6,  5, ROUTE_102_WEST_GATE, 4
	warp_event 15,  4, ROUTE_102_GAME_HOUSE, 1

	db 2 ; coord events
	coord_event  6,  6, SCENE_ROUTE102_SILVER, Route102SilverScript
	coord_event 33,  6, SCENE_DEFAULT, Route102TreeCut

	db 4 ; bg events
	bg_event 22, 10, BGEVENT_READ, Route102TrainerTips2
	bg_event 50, 10, BGEVENT_READ, Route102Sign
	bg_event 32, 10, BGEVENT_READ, Route102TrainerTips1
	bg_event 14,  5, BGEVENT_READ, Route102GameHouse

	db 8 ; object events
	object_event  6, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 3, TrainerPsychicMark, -1
	object_event 29,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 5, TrainerSchoolboyAlan1, -1
	object_event 50,  7, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route102LassScript, -1
	object_event 38,  4, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route102FruitTree, -1
	object_event 40,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ArthurScript, EVENT_ROUTE_102_ARTHUR_OF_THURSDAY
	object_event  1,  1, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route102SilverTalkScript, EVENT_ROUTE_102_SILVER
	object_event 12, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 3, TrainerYoungsterSamuel, -1
	object_event 20,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerYoungsterIan, -1
