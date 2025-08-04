	object_const_def ; object_event constants
	const WESTPORTGYM_BUGSY
	const WESTPORTGYM_BUG_CATCHER1
	const WESTPORTGYM_BUG_CATCHER2
	const WESTPORTGYM_BUG_CATCHER3
	const WESTPORTGYM_TWIN1
	const WESTPORTGYM_TWIN2
	const WESTPORTGYM_GYM_GUY

WestportGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WestportGymBugsyScript:
	faceplayer
	checkevent EVENT_REMATCH_AVAILABLE_BUGSY
	iftrue RematchScriptBugsy
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue PostRematchScriptBugsy
	opentext
	checkevent EVENT_BEAT_BUGSY
	iftrue .FightDone
	writetext BugsyText_INeverLose
	waitbutton
	closetext
	winlosstext BugsyText_ResearchIncomplete, 0
	loadtrainer BUGSY, BUGSY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BUGSY
	opentext
	writetext Text_ReceivedHiveBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_HIVEBADGE
	checkcode VAR_BADGES
	scall WestportGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM49_FURY_CUTTER
	iftrue .GotFuryCutter
	setevent EVENT_BEAT_TWINS_AMY_AND_MAY
	setevent EVENT_BEAT_BUG_CATCHER_BENNY
	setevent EVENT_BEAT_BUG_CATCHER_AL
	setevent EVENT_BEAT_BUG_CATCHER_JOSH
	setevent EVENT_GRAMPS_AT_MINE
	setevent EVENT_GRAMPS_IS_AT_GRAMPS_HOUSE
	setevent EVENT_GIRL_IS_IN_MINE
	setevent EVENT_BOULDER_MINE_WHITNEY
	setevent EVENT_WHITNEY_BACK_IN_TEKNOS_GYM
	clearevent EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	writetext BugsyText_HiveBadgeSpeech
	buttonsound
	verbosegiveitem TM_FURY_CUTTER
	iffalse .NoRoomForFuryCutter
	setevent EVENT_GOT_TM49_FURY_CUTTER
	writetext BugsyText_FuryCutterSpeech
	waitbutton
	closetext
	end

.GotFuryCutter:
	writetext BugsyText_BugMonsAreDeep
	waitbutton
.NoRoomForFuryCutter:
	closetext
	end
	
RematchScriptBugsy:
	opentext
	writetext BugsyRematchText
	waitbutton
	closetext
	winlosstext BugsyRematchWinText, 0
	loadtrainer BUGSY, BUGSY2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_REMATCH_AVAILABLE_BUGSY
	opentext
	writetext BugsyAfterRematchText
	waitbutton
	closetext
	end

PostRematchScriptBugsy:
	opentext
	writetext BugsyAfterRematchText
	waitbutton
	closetext
	end

BugsyRematchText:
    text "Ich habe meine"
    line "Forschungen zu"
    para "Käfer-#MON"
    line "fortgesetzt!"

    para "Erlaube mir, dir"
    line "die Früchte meiner"
    para "Arbeit zu zeigen!"
	done

BugsyRematchWinText:
	text "Unglaublich!"

	para "Ich habe noch"
	line "viel zu lernen!"
	done

BugsyAfterRematchText:
    text "CHAMP, hm?"

    para "Das macht dich"
    line "dann wohl zu einem"
    para "Experten für alle"
    line "#MON-Typen!"

    para "Ich denke, ich"
    line "werde mich weiter"
    para "auf Käfer-#MON"
    line "spezialisieren."

    para "Es gibt so viel"
    line "über jeden Typ"
    cont "#MON zu lernen!"
	done


WestportGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .WestportRockets
	end

.WestportRockets:
	jumpstd WestportRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerTwinsAmyandmay1:
	trainer TWINS, AMYANDMAY1, EVENT_BEAT_TWINS_AMY_AND_MAY, TwinsAmyandmay1SeenText, TwinsAmyandmay1BeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext TwinsAmyandmay1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsAmyandmay2:
	trainer TWINS, AMYANDMAY2, EVENT_BEAT_TWINS_AMY_AND_MAY, TwinsAmyandmay2SeenText, TwinsAmyandmay2BeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext TwinsAmyandmay2AfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherBenny:
	trainer BUG_CATCHER, BUG_CATCHER_BENNY, EVENT_BEAT_BUG_CATCHER_BENNY, BugCatcherBennySeenText, BugCatcherBennyBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherBennyAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherAl:
	trainer BUG_CATCHER, AL, EVENT_BEAT_BUG_CATCHER_AL, BugCatcherAlSeenText, BugCatcherAlBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherAlAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherJosh:
	trainer BUG_CATCHER, JOSH, EVENT_BEAT_BUG_CATCHER_JOSH, BugCatcherJoshSeenText, BugCatcherJoshBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherJoshAfterBattleText
	waitbutton
	closetext
	end

WestportGymGuyScript:
	faceplayer
	checkevent EVENT_BEAT_BUGSY
	iftrue .WestportGymGuyWinScript
	opentext
	writetext WestportGymGuyText
	waitbutton
	closetext
	end

.WestportGymGuyWinScript:
	opentext
	writetext WestportGymGuyWinText
	waitbutton
	closetext
	end

WestportGymStatue:
	checkflag ENGINE_HIVEBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	trainertotext BUGSY, BUGSY1, MEM_BUFFER_1
	jumpstd GymStatue2Script

BugsyText_INeverLose:
	text "Ich bin KAI!"
	line "Ich verliere nie,"
	para "wenn es um Käfer-"
	line "#MON geht."

	para "Meine Forschungen"
	line "machen mich zu ei-"
	cont "ner Autorität auf"
	cont "diesem Gebiet!"

	para "Lass mich demonst-"
	line "rieren, was ich"
	cont "gelernt habe!"
	done

BugsyText_ResearchIncomplete:
	text "Erstaunlich!"
	line "Du bist ein wahrer"
	cont "#MON-Experte!"

	para "Meine Forschungen"
	line "sind noch nicht"
	cont "abgeschlossen."

	para "O.K., du gewinnst."
	line "Nimm diesen ORDEN."
	done

Text_ReceivedHiveBadge:
	text "<PLAYER> erhält"
	line "INSEKTORDEN."
	done

BugsyText_HiveBadgeSpeech:
	text "Kennst du die Vor-"
	line "züge des INSEKT-"
	cont "ORDENs?"

	para "Durch ihn gehor-"
	line "chen dir #MON"
	cont "bis zu Level 30."

	para "Deine #MON"
	line "können STÄRKE nun"
	cont "auch außerhalb des"
	cont "Kampfes anwenden."

	para "Bitte nimm auch"
	line "dies!"
	done

BugsyText_FuryCutterSpeech:
	text "TM49 enthält"
	line "ZORNKLINGE."

	para "Wird das Ziel ge-"
	line "troffen, gewinnt"
	cont "die Attacke jede"
	cont "Runde an Stärke."

	para "Je länger der"
	line "Kampf dauert, des-"
	cont "to besser wird der"
	cont "Angriff."

	para "Ist das nicht"
	line "toll? Ich selbst"
	cont "habe diese Ent-"
	cont "deckung gemacht!"
	done

BugsyText_BugMonsAreDeep:
	text "Käfer-#MON"
	line "sind ein weites"
	para "Gebiet. Es gibt"
	line "noch viele Geheim-"
	cont "nisse zu er-"
	cont "gründen."

	para "Studiere deine"
	line "Lieblinge gründ-"
	cont "lich!"
	done

BugCatcherBennySeenText:
	text "Käfer-#MON"
	line "entwickeln sich"
	para "sehr früh. Das"
	line "heißt, dass sie"
	para "auch schnell stär-"
	line "ker werden."
	done

BugCatcherBennyBeatenText:
	text "Entwicklung allein"
	line "ist nicht genug!"
	done

BugCatcherBennyAfterBattleText:
	text "#MON werden"
	line "stärker, wenn sie"
	cont "sich entwickeln."
	cont "Wirklich!"
	done

BugCatcherAlSeenText:
	text "Käfer-#MON"
	line "sind cool und"
	para "tough! Ich beweise"
	line "es dir!"
	done

BugCatcherAlBeatenText:
	text "Du hast bewiesen,"
	line "wie tough du bist…"
	done

BugCatcherAlAfterBattleText:
	text "Sie sind so cool,"
	line "aber die meisten"
	para "Mädchen mögen kei-"
	line "ne Käfer-#MON."

	para "Ich weiß nicht,"
	line "wieso…"
	done

BugCatcherJoshSeenText:
    text "#MON werden"
    line "schnell stärker!"

    para "Willst du es"
    line "sehen?"
	done

BugCatcherJoshBeatenText:
	text "Urrgggh!"
	done

BugCatcherJoshAfterBattleText:
	text "Vielleicht sollte"
	line "ich sie ein wenig"
	cont "besser trainieren…"
	done

TwinsAmyandmay1SeenText:
	text "EVA: Hi! Forderst"
	line "du den LEITER"
	cont "heraus? Unmöglich!"
	done

TwinsAmyandmay1BeatenText:
	text "EVA & UTE: Oh, um"
	line "Himmels Willen!"
	done

TwinsAmyandmay1AfterBattleText:
	text "EVA: Du bist"
	line "wirklich stark!"
	done

TwinsAmyandmay2SeenText:
	text "UTE: Du möchtest"
	line "zum LEITER? Erst"
	cont "sind wir dran!"
	done

TwinsAmyandmay2BeatenText:
	text "EVA & UTE: Oh, um"
	line "Himmels Willen!"
	done

TwinsAmyandmay2AfterBattleText:
	text "UTE: Unsere Käfer-"
	line "#MON haben ver-"
	cont "loren! Was für ei-"
	cont "ne Schande!"
	done

WestportGymGuyText:
	text "Yo, Herausfor-"
	line "derer!"

	para "KAI ist zwar jung,"
	line "aber sein Wissen"

	para "über Käfer-#-"
	line "MON ist unüber-"
	cont "trefflich."

	para "Ohne meine Tipps"
	line "wird der Kampf für"
	cont "dich sehr hart."

	para "Mal sehen… Käfer-"
	line "#MON mögen kein"
	cont "Feuer."

	para "Auch Flug-Attacken"
	line "sind sehr effek-"
	cont "tiv."
	done

WestportGymGuyWinText:
	text "Gut gemacht! Das"
	line "war ein Muster-"
	cont "kampf zweier ta-"
	cont "lentierter, junger"
	cont "Trainer."

	para "Mit Leuten wie dir"
	line "sieht die Zukunft"
	cont "der #MON rosig"
	cont "aus!"
	done

WestportGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 15, WESTPORT_CITY, 1
	warp_event  5, 15, WESTPORT_CITY, 12

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 13, BGEVENT_READ, WestportGymStatue
	bg_event  6, 13, BGEVENT_READ, WestportGymStatue

	db 7 ; object events
	object_event  5,  7, SPRITE_BUGSY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WestportGymBugsyScript, -1
	object_event  5,  3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerBugCatcherBenny, -1
	object_event  8,  6, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherAl, -1
	object_event  1,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherJosh, -1
	object_event  4, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 1, TrainerTwinsAmyandmay1, -1
	object_event  5, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 1, TrainerTwinsAmyandmay2, -1
	object_event  7, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, WestportGymGuyScript, -1
