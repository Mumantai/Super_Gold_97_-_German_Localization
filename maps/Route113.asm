	object_const_def ; object_event constants
	const ROUTE113_YOUNGSTER3
	const ROUTE113_OFFICER
	const ROUTE113_POKEFAN_M
	const ROUTE113_POKE_BALL
	const ROUTE113_OFFICER2
	const ROUTE113_TREE

Route113_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FixSpriteWTF
	
.FixSpriteWTF
	variablesprite SPRITE_STAND_CITY_IMPOSTOR, SPRITE_OFFICER
	return

TrainerCamperTodd1:
	trainer CAMPER, TODD1, EVENT_BEAT_CAMPER_TODD, CamperTodd1SeenText, CamperTodd1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperTodd1AfterText
	waitbutton
	closetext
	end

SoldierGeraldScript:
	trainer SOLDIER, GERALD, EVENT_BEAT_SOLDIER_GERALD, SoldierGeraldSeenText, SoldierGeraldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SoldierGeraldAfterText
	waitbutton
	closetext
	end

Route113Tree:
	fruittree FRUITTREE_TREE_ROUTE_113


OfficerKeithScript:
	faceplayer
	opentext
	checktime NITE
	iffalse .NoFight
	checkevent EVENT_BEAT_OFFICER_KEITH
	iftrue .AfterScript
	playmusic MUSIC_OFFICER_ENCOUNTER
	writetext OfficerKeithSeenText
	waitbutton
	closetext
	winlosstext OfficerKeithWinText, 0
	loadtrainer OFFICER, KEITH
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OFFICER_KEITH
	closetext
	end

.AfterScript:
	writetext OfficerKeithAfterText
	waitbutton
	closetext
	end

.NoFight:
	writetext OfficerKeithDaytimeText
	waitbutton
	closetext
	end

TrainerPokefanmBrandon:
	trainer POKEFANM, BRANDON, EVENT_BEAT_POKEFANM_BRANDON, PokefanmBrandonSeenText, PokefanmBrandonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmBrandonAfterText
	waitbutton
	closetext
	end



Route113JadeForestSign:
; unused
	jumptext Route113JadeForestSignText

Route113Sign:
	jumptext Route113SignText

Route113TrainerTips:
	jumptext Route113TrainerTipsText


Route113Nugget:
	itemball NUGGET

Route113HiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_ROUTE_113_HIDDEN_RARE_CANDY

Route113HiddenSuperPotion:
	hiddenitem SUPER_POTION, EVENT_ROUTE_113_HIDDEN_SUPER_POTION


CamperTodd1SeenText:
	text "Ich weiß, dass ich"
	line "#MON gut"
	cont "aufziehen kann."

	para "Möchtest du dich"
	line "davon überzeugen?"
	done

CamperTodd1BeatenText:
	text "Habe ich falsch"
	line "trainiert?"
	done

CamperTodd1AfterText:
	text "Vielleicht sollte"
	line "ich ein spezielles"
	cont "Training machen…"
	done

OfficerKeithSeenText:
    text "Wer ist da?"
    line "Du gehörst nicht"
    para "zu TEAM ROCKET,"
    line "oder?"
	done

OfficerKeithWinText:
	text "Du bist ein"
	line "starker,"
	cont "junger Gegner."
	done

OfficerKeithAfterText:
    text "Ja, heute scheint"
    line "alles in Ordnung"
    para "zu sein. Wir"
    line "hatten kürzlich"
    para "einige Probleme"
    line "mit TEAM ROCKET,"
    para "aber die sind"
    line "anscheinend weg."
	done

OfficerKeithDaytimeText:
	text "Ich bin auf der"
	line "Suche nach ver-"
	cont "dächtigen"
	cont "Individuen."
	done

PokefanmBrandonSeenText:
    text "Ich glaube, ich"
    line "könnte eines Tages"
    para "stark genug sein,"
    line "um es mit der LIGA"
    cont "aufzunehmen."
	done

PokefanmBrandonBeatenText:
	text "Warum muss es auf"
	line "diese Weise enden?"
	done

PokefanmBrandonAfterText:
    text "Ich glaube, ich"
    line "habe nicht genug"
    para "Motivation, um es"
    line "durchzuziehen, die"
    para "LIGA wirklich"
    line "herauszufordern."
	done


Route113JadeForestSignText:
; unused
	text "JADEWALD"
	line "DURCH DAS TOR"
	done

Route113SignText:
	text "ROUTE 113"

	para "SENDESTIA CITY -"
	line "KANTO-REGION"
	done

Route113TrainerTipsText:
	text "TIPPS für TRAINER"
	line "Bäume mit BEEREN"

	para "tragen jeden Tag"
	line "neue BEEREN."

	para "Merke dir, welche"
	line "BEEREN an den"
	cont "Bäumen wachsen."
	done
	
SoldierGeraldSeenText:
    text "Stillgestanden!"

    para "Du forderst mich"
    line "zum Kampf heraus!"

    para "Das ist ein"
    line "Befehl!"
	done	
	
SoldierGeraldBeatenText:
	text "Abtreten!"
	done
	
SoldierGeraldAfterText:
    text "Ein guter Kampf,"
    line "hebt immer die"
    cont "Stimmung!"
	done



Route113_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 48, ROUTE_113_ROUTE_114_GATE, 1
	warp_event  9, 48, ROUTE_113_ROUTE_114_GATE, 2


	db 0 ; coord events

	db 4 ; bg events
	bg_event 13,  5, BGEVENT_READ, Route113Sign
	bg_event  9, 31, BGEVENT_READ, Route113TrainerTips
	bg_event  2, 39, BGEVENT_ITEM, Route113HiddenRareCandy
	bg_event 14, 18, BGEVENT_ITEM, Route113HiddenSuperPotion

	db 6 ; object events
	object_event 13, 22, SPRITE_STAND_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperTodd1, -1
	object_event  6,  6, SPRITE_STAND_CITY_IMPOSTOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OfficerKeithScript, -1
	object_event 14, 47, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 3, TrainerPokefanmBrandon, -1
	object_event 19, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route113Nugget, EVENT_ROUTE_113_NUGGET
	object_event 17, 44, SPRITE_STAND_CITY_IMPOSTOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, SoldierGeraldScript, -1
	object_event 12, 13, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route113Tree, -1
