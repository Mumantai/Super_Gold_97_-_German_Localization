	object_const_def ; object_event constants
	const TEKNOSGYM_WHITNEY
	const TEKNOSGYM_LASS1
	const TEKNOSGYM_LASS2
	const TEKNOSGYM_BUENA1
	const TEKNOSGYM_GYM_GUY

TeknosGym_MapScripts:
	db 0 ; scene scripts
	
	db 0 ; callbacks


TeknosGymWhitneyScript:
	faceplayer
	checkevent EVENT_REMATCH_AVAILABLE_WHITNEY
	iftrue RematchScriptWhitney
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue PostRematchScriptWhitney
	opentext
	checkevent EVENT_BEAT_WHITNEY
	iftrue .FightDone
	writetext WhitneyBeforeText
	waitbutton
	closetext
	winlosstext WhitneyShouldntBeSoSeriousText, 0
	loadtrainer WHITNEY, WHITNEY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_WHITNEY
	setevent EVENT_BEAT_LASS_CARRIE
	setevent EVENT_BEAT_LASS_BRIDGET
	setevent EVENT_BEAT_BEAUTY_SAMANTHA
	specialphonecall SPECIALCALL_ROBBED
	setmapscene OAK_LAB_FRONT_ROOM, SCENE_DEFAULT
	setevent EVENT_BLUE_OAK_LAB_FRONT_ROOM_2
	opentext
	writetext PlayerReceivedPlainBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_PLAINBADGE
	checkcode VAR_BADGES
	scall TeknosGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM45_ATTRACT
	iftrue .GotAttract
	writetext Whitney_BadgeSpeech
	buttonsound
	verbosegiveitem TM_ATTRACT
	iffalse .NoRoomForAttract
	setevent EVENT_GOT_TM45_ATTRACT
	writetext WhitneyAttractText
	waitbutton
	closetext
	end

.GotAttract:
	writetext Whitney_GoodLuck
	waitbutton
.NoRoomForAttract
	closetext
	end
	
RematchScriptWhitney:
	opentext
	writetext WhitneyRematchText
	waitbutton
	closetext
	winlosstext WhitneyRematchWinText, 0
	loadtrainer WHITNEY, WHITNEY2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_REMATCH_AVAILABLE_WHITNEY
	opentext
	writetext WhitneyAfterRematchText
	waitbutton
	closetext
	end

PostRematchScriptWhitney:
	opentext
	writetext WhitneyAfterRematchText
	waitbutton
	closetext
	end

WhitneyRematchText:
    text "Bist du den ganzen"
    line "Weg hierher"
    cont "zurück gekommen,"
    cont "um mich zu sehen?"

    para "Oder bist du für"
    line "einen weiteren"
    cont "Kampf hier?"

    para "Wie auch immer,"
    line "du kannst beides"
    cont "haben!"
	done

WhitneyRematchWinText:
	text "Waaaaah! Du bist"
	line "immer noch gemein!"
	done

WhitneyAfterRematchText:
    text "Ich habe gehört,"
    line "TEAM ROCKET sei"
    cont "dank dir endgültig"
    cont "weg vom Fenster!"
	
    para "Das freut mich!"

    para "Ich habe seit dem"
    line "Vorfall beim"
    cont "AQUARIUM keinen"
    cont "ihrer Rüpel mehr"
    cont "gesehen."
	done


TeknosGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .WestportRockets
	end

.WestportRockets:
	jumpstd WestportRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerLassCarrie:
	trainer LASS, CARRIE, EVENT_BEAT_LASS_CARRIE, LassCarrieSeenText, LassCarrieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassCarrieAfterBattleText
	waitbutton
	closetext
	end



TrainerLassBridget:
	trainer LASS, BRIDGET, EVENT_BEAT_LASS_BRIDGET, LassBridgetSeenText, LassBridgetBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassBridgetAfterBattleText
	waitbutton
	closetext
	end



TrainerBeautySamantha:
	trainer BEAUTY, SAMANTHA, EVENT_BEAT_BEAUTY_SAMANTHA, BeautySamanthaSeenText, BeautySamanthaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautySamanthaAfterBattleText
	waitbutton
	closetext
	end



TeknosGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_WHITNEY_BACK_IN_TEKNOS_GYM
	iftrue .whitneynothere
	checkevent EVENT_BEAT_WHITNEY
	iftrue .TeknosGymGuyWinScript
	writetext TeknosGymGuyText
	waitbutton
	closetext
	end
	
.whitneynothere
	writetext TeknosGymGuyTextNotHere
	waitbutton
	closetext
	end
	
.TeknosGymGuyWinScript:
	writetext TeknosGymGuyWinText
	waitbutton
	closetext
	end

TeknosGymStatue:
;	setmapscene OAK_LAB_FRONT_ROOM, SCENE_DEFAULT
;	specialphonecall SPECIALCALL_ROBBED
	checkflag ENGINE_PLAINBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	trainertotext WHITNEY, WHITNEY1, MEM_BUFFER_1
	jumpstd GymStatue2Script

BridgetWalksUpMovement:
	step LEFT
	turn_head UP
	step_end

BridgetWalksAwayMovement:
	step RIGHT
	turn_head LEFT
	step_end

Whitney_GoodLuck:
    text "Viel Glück bei"
    line "der #MON LIGA!"

    para "Lass dich nicht"
    line "von deinen Träumen"
    cont "abbringen!"
	done

WhitneyBeforeText:
    text "Hi! Ich bin"
    line "BIANKA!"

    para "Ich weiß genau,"
    line "wer du bist,"
    cont "<PLAYER>!"

    para "Du hast dir in"
    line "der Stadt einen"
    cont "Namen gemacht!"

    para "Normalerweise"
    line "helfe ich, wenn"
    cont "hier etwas schief"
    cont "läuft, aber du"
    cont "hast in der MINE"
    cont "und im AQUARIUM"
    cont "gezeigt, was du"
    cont "drauf hast!"

    para "Dafür bin ich dir"
    line "sehr dankbar!"

    para "Aber du bist für"
    line "einen Kampf hier"
    cont "und den sollst du"
    cont "auch bekommen!"
	done

WhitneyShouldntBeSoSeriousText:
	text "Ha!"

	para "Ich sehe, du bist"
	line "im Kämpfen auch"
	cont "verdammt gut!"
	done



PlayerReceivedPlainBadgeText:
	text "<PLAYER> erhält"
	line "BASISORDEN."
	done

Whitney_BadgeSpeech:
    text "Der BASISORDEN"
    line "erhöht die INIT"
    cont "deiner #MON."

	para "Oh, das hier"
	line "kannst du auch"
	cont "haben!"
	done

WhitneyAttractText:
	text "Es ist ANZIEHUNG!"
	line "Es bringt den"

	para "Charme eines"
	line "#MON voll zur"
	cont "Geltung."

	para "Passt das nicht"
	line "perfekt zu einem"
	cont "süßen Ding wie"
	cont "mir?"
	done


LassCarrieSeenText:
	text "Lass dich nicht"
	line "von dem netten"
	cont "Äußeren meiner"
	cont "#MON täuschen."

	para "Sie können dich"
	line "platt machen."
	done

LassCarrieBeatenText:
	text "Verflixt… Ich"
	line "dachte, du wärest"
	cont "schwach…"
	done

LassCarrieAfterBattleText:
	text "Denken meine #-"
	line "MON, dass ich"
	cont "niedlich bin?"
	done

LassBridgetSeenText:
	text "Ich mag niedliche"
	line "#MON lieber"
	cont "als starke."

	para "Aber ich habe"
	line "starke und nied-"
	cont "liche #MON!"
	done

LassBridgetBeatenText:
	text "Oh, nein, nein!"
	done

LassBridgetAfterBattleText:
	text "Ich trainiere, um"
	line "BIANKA zu besie-"
	cont "gen… aber es ist"
	cont "hoffnungslos."

	para "Wenn ich verliere,"
	line "werde ich einfach"
	cont "härter trainieren!"
	done

BridgetWhitneyCriesText:
	text "Oh nein. Du hast"
	line "BIANKA zum Weinen"
	cont "gebracht."

	para "Keine Sorge. Sie"
	line "beruhigt sich bald"
	cont "wieder. Sie weint"
	cont "immer, wenn sie"
	cont "verloren hat."
	done


BeautySamanthaSeenText:
	text "Schlag ordentlich"
	line "zu, sonst werde"
	cont "ich es tun!"
	done

BeautySamanthaBeatenText:
	text "Nein! Oh, MAUZI,"
	line "es tut mir Leid!"
	done

BeautySamanthaAfterBattleText:
	text "Ich habe MAUZI die"
	line "unterschiedlich-"
	cont "sten Attacken bei-"
	cont "gebracht…"
	done
	
TeknosGymGuyTextNotHere:
	text "Yo! CHAMP in spe!"

	para "BIANKA ist dafür"
	line "bekannt, dass sie"
	cont "bei Problemen in"
	cont "der Stadt immer"
	cont "aushilift."

	para "Was ich damit"
	line "sagen will, ist,"
	cont "sie ist nicht da!"

	para "Irgendetwas muss"
    line "in der Stadt vor"
    cont "sich gehen."
	done

TeknosGymGuyText:
	text "Yo! CHAMP in spe!"

	para "In dieser PKMN-"
	line "ARENA warten Trai-"
	cont "ner mit #MON"
	cont "des Typs Normal"
	cont "auf dich. Ich rate"
	cont "dir, Kampf-#MON"
	cont "einzusetzen."
	done

TeknosGymGuyWinText:
	text "Du hast gewonnen?"
	line "Toll! Ich war da-"
	cont "mit beschäftigt,"
	cont "die hübschen Damen"
	cont "hier zu bewundern."
	done

TeknosGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2, 17, TEKNOS_CITY, 7
	warp_event  3, 17, TEKNOS_CITY, 13

	db 0 ; coord events

	db 2 ; bg events
	bg_event 10, 14, BGEVENT_READ, TeknosGymStatue
	bg_event  4, 15, BGEVENT_READ, TeknosGymStatue

	db 5 ; object events
	object_event 16, 13, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, TeknosGymWhitneyScript, EVENT_WHITNEY_BACK_IN_TEKNOS_GYM
	object_event  4,  8, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerLassCarrie, -1
	object_event 11,  2, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerLassBridget, -1
	object_event 17,  7, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 4, TrainerBeautySamantha, -1
	object_event  5, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TeknosGymGuyScript, -1
