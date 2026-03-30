	object_const_def ; object_event constants
	const ROUTE104_LASS
	const ROUTE104_FRUIT_TREE
	const ROUTE104_GARDENER
	const ROUTE104_SUPER_NERD
	const ROUTE104_POKEFAN_M
	const ROUTE104_FIREBREATHER
	const ROUTE104_CAMPER
	const ROUTE104_TEACHER
	const ROUTE104_OFFICER
	const ROUTE104_TUSCANY
	const ROUTE104_ITEMBALL

Route104_MapScripts:
	db 2 ; scene scripts
	scene_script .SceneRoute104Gardener ; SCENE_DEFAULT
	scene_script .SceneRoute104Nothing ;

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Tuscany


.SceneRoute104Gardener
	end

.SceneRoute104Nothing
	end

.Tuscany:
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .DoesTuscanyAppear

.TuscanyDisappears:
	disappear ROUTE104_TUSCANY
	return

.DoesTuscanyAppear:
	checkcode VAR_WEEKDAY
	ifnotequal TUESDAY, .TuscanyDisappears
	appear ROUTE104_TUSCANY
	return
	
GardenerStopsYou:
	jump Route104GardenerScript
	end

GardenerStopsYou2:
	jump Route104GardenerScript
	end

Route104GardenerScript:
	showemote EMOTE_SHOCK, ROUTE104_GARDENER, 15
	opentext
	writetext DontStepFlowers
	waitbutton
	closetext
	applymovement PLAYER, Movement_1LEFT
	end
	
Route104GardenerWateringScript:
	opentext
	writetext LaDiDa
	waitbutton
	closetext
	end
	
Route104LassScript:
	jumptextfaceplayer Route104LassText

Route104TeacherScript:
	jumptextfaceplayer Route104TeacherText


Route104Sign:
	jumptext Route104SignText
	
Route104SignActual:
	jumptext Route104SignActualText

Route104FruitTree:
	fruittree FRUITTREE_TREE_ROUTE_104
	
Movement_1LEFT:
	step LEFT
	step_end

TrainerSupernerdSam:
	trainer SUPER_NERD, SAM, EVENT_BEAT_SUPER_NERD_SAM, SupernerdSamSeenText, SupernerdSamBeatenText, 0, .Script
	
.Script:
	endifjustbattled
	opentext
	writetext SupernerdSamAfterBattleText
	waitbutton
	closetext
	end
	

TrainerHikerDaniel:
	trainer HIKER, DANIEL, EVENT_BEAT_HIKER_DANIEL, HikerDanielSeenText, HikerDanielBeatenText, 0, .Script
	
.Script:
	endifjustbattled
	opentext
	writetext HikerDanielAfterBattleText
	waitbutton
	closetext
	end


TrainerFirebreatherBurt:
	trainer FIREBREATHER, BURT, EVENT_BEAT_FIREBREATHER_BURT, FirebreatherBurtSeenText, FirebreatherBurtBeatenText, 0, .Script
	
.Script:
	endifjustbattled
	opentext
	writetext FirebreatherBurtAfterBattleText
	waitbutton
	closetext
	end


TrainerCamperElliot:
	trainer CAMPER, ELLIOT, EVENT_BEAT_CAMPER_ELLIOT, CamperElliotSeenText, CamperElliotBeatenText, 0, .Script
	
.Script:
	endifjustbattled
	opentext
	writetext CamperElliotAfterBattleText
	waitbutton
	closetext
	end

TrainerOfficerDirk:
	faceplayer
	opentext
	checktime NITE
	iffalse .NotNight
	checkevent EVENT_BEAT_OFFICER_DIRK
	iftrue .AfterBattle
	playmusic MUSIC_OFFICER_ENCOUNTER
	writetext OfficerDirkSeenText
	waitbutton
	closetext
	winlosstext OfficerDirkBeatenText, 0
	loadtrainer OFFICER, DIRK
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OFFICER_DIRK
	closetext
	end

.AfterBattle:
	writetext OfficerDirkAfterBattleText
	waitbutton
	closetext
	end

.NotNight:
	writetext OfficerDirkPrettyToughText
	waitbutton
	closetext
	end

TuscanyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_PINK_BOW_FROM_TUSCANY
	iftrue TuscanyTuesdayScript
	checkcode VAR_WEEKDAY
	ifnotequal TUESDAY, TuscanyNotTuesdayScript
	checkevent EVENT_MET_TUSCANY_OF_TUESDAY
	iftrue .MetTuscany
	writetext MeetTuscanyText
	buttonsound
	setevent EVENT_MET_TUSCANY_OF_TUESDAY
.MetTuscany:
	writetext TuscanyGivesGiftText
	buttonsound
	verbosegiveitem PINK_BOW
	iffalse TuscanyDoneScript
	setevent EVENT_GOT_PINK_BOW_FROM_TUSCANY
	writetext TuscanyGaveGiftText
	waitbutton
	closetext
	end

TuscanyTuesdayScript:
	writetext TuscanyTuesdayText
	waitbutton
TuscanyDoneScript:
	closetext
	end

TuscanyNotTuesdayScript:
	writetext TuscanyNotTuesdayText
	waitbutton
	closetext
	end
	
Route104TMEndure:
	itemball TM_ENDURE


Route104LassText:
	text "Hechel, keuch…"

	para "Bis hierhin war"
	line "es schon ein"
	cont "weiter Weg."

	para "Doch bis GENEOS"
	line "CITY ist es noch"
	cont "ein gutes Stück."

	para "Der JADEWALD"
	line "ist ein Labyrinth."

	para "Da muss ich mich"
	line "gut vorbereiten."
	done

Route104TeacherText:
    text "Ich bin verwirrt."

    para "Ich bin hier ge-"
    line "landet, als ich"
    para "von den Stufen"
    line "gesprungen bin."

    para "Aber ich finde den"
    line "Weg zurück nach"
    cont "TOTOMONIA nicht."

    para "Es muss doch einen"
    line "Rückweg geben…"
	done

DontStepFlowers:
	text "Hey!"

	para "Nicht da lang!"

	para "Ich arbeite hart,"
	line "damit mein Garten"
	para "in dieser Dürre"
	line "schön aussieht!"

	para "Trampel nicht auf"
	line "meinen Blumen rum!"
	done

LaDiDa:
	text "La-Di-Da!"

	para "Oh, wie ich es"
	line "liebe meinen"
	cont "Garten zu pflegen!"
	done


SupernerdSamSeenText:
	text "Sammelst du"
	line "seltene #MON?"
	done

SupernerdSamBeatenText:
	text "Ey!"
	done

SupernerdSamAfterBattleText:
    text "Ich sammle"
    line "seltene #MON."

    para "Oder zumindest"
    line "würde ich gerne."
	done
	
HikerDanielSeenText:
    text "Ich mache mich für"
    line "eine sehr lange"
    cont "Wanderung bereit."

    para "Mal sehen, ob ich"
    line "vorbereitet bin!"
	done

HikerDanielBeatenText:
	text "Fußkrämpfe!"
	done

HikerDanielAfterBattleText:
    text "Sieht so aus, als"
    line "müsste ich mich"
    para "besser auf die"
    line "Reise einstellen."
	done

FirebreatherBurtSeenText:
    text "Packst du die"
    line "Hitze, die ich"
    cont "dir gleich gebe?"
	done

FirebreatherBurtBeatenText:
	text "Aua, heiß!"
	done

FirebreatherBurtAfterBattleText:
	text "Diese ROUTE ist"
	line "zu heiß!"
	done


CamperElliotSeenText:
    text "Ich bin auf dem"
    line "Weg im WALD zu"
    cont "zelten!"
	done

CamperElliotBeatenText:
	text "Ich bin platt!"
	done

CamperElliotAfterBattleText:
    text "Hier ist es"
    line "ziemlich trocken."

    para "Aber im WALD ist"
    line "es nicht mehr so"
    cont "schlimm."
	done
	

OfficerDirkSeenText:
	text "Bei Nacht lauern"
	line "Gefahren!"
	done

OfficerDirkBeatenText:
	text "Schwupps!"
	done

OfficerDirkAfterBattleText:
	text "Du weißt, dass"
	line "die Nacht auf"
	cont "ihre Weise"
	cont "schön sein kann."

	para "Aber übertreibe"
	line "es nicht, O.K.?"
	done

OfficerDirkPrettyToughText:
	text "Deine #MON"
	line "sehen ziemlich"
	cont "stark aus."

	para "Du wärst über-"
	line "all sicher."
	done

Route104SignText:
	text "Haus von GEOFFREY"
	line "dem Gärtner"
	done
	
Route104SignActualText:
	text "ROUTE 104"
	para "TOTOMONIA -"
	line "GENEOS CITY"
	done
	

MeetTuscanyText:
	text "DIETLINDE: Ich"
	line "glaube, wir"

	para "begegnen uns zum"
	line "ersten Mal!"

	para "Darf ich mich"
	line "vorstellen? Ich"

	para "bin DIETLINDE"
	line "von Dienstag."
	done

TuscanyGivesGiftText:
	text "Da wir uns zum"
	line "ersten Mal sehen,"

	para "schenke ich dir"
	line "ein ROSA BAND."
	done

TuscanyGaveGiftText:
	text "DIETLINDE: Findest"
	line "du nicht auch,"
	cont "dass es sehr"
	cont "schön ist?"

	para "Attacken der"
	line "Elementklasse"
	cont "Normal, werden"
	cont "dadurch stärker."

	para "Ich bin sicher,"
	line "du kannst es"
	cont "gebrauchen."
	done

TuscanyTuesdayText:
	text "DIETLINDE: Bist"
	line "du MONJA meiner"
	cont "älteren Schwester"
	cont "schon begegnet?"

	para "Oder meinem"
	line "kleinen Bruder"
	cont "MITKO?"

	para "Ich bin das zweite"
	line "von sieben"
	cont "Kindern."
	done

TuscanyNotTuesdayText:
	text "DIETLINDE: Heute"
	line "ist nicht Diens-"
	cont "tag. Das ist"
	cont "schade…"
	done

Route104_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 55,  7, ROUTE_104_GEOFFS_HOUSE, 1

	db 2 ; coord events
	coord_event 52, 12, SCENE_DEFAULT, GardenerStopsYou
	coord_event 52, 13, SCENE_DEFAULT, GardenerStopsYou2

	db 2 ; bg events
	bg_event 56,  8, BGEVENT_READ, Route104Sign
	bg_event  6,  8, BGEVENT_READ, Route104SignActual

	db 11 ; object events
	object_event 88,  7, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route104LassScript, -1
	object_event 61,  7, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route104FruitTree, -1
	object_event 52, 11, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route104GardenerWateringScript, EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	object_event 59,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerSupernerdSam, -1
	object_event 12, 12, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_TRAINER, 2, TrainerHikerDaniel, -1
	object_event 82, 13, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerFirebreatherBurt, -1
	object_event 45,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCamperElliot, -1
	object_event 24, 13, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route104TeacherScript, -1
	object_event 76, 10, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TrainerOfficerDirk, -1
	object_event 48,  5, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TuscanyScript, EVENT_ROUTE_101_TUSCANY_OF_TUESDAY
	object_event 68,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route104TMEndure, EVENT_BURNED_TOWER_B1F_TM_ENDURE

