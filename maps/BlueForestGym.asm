	object_const_def ; object_event constants
	const SANSKRITGYM_PRYCE
	const SANSKRITGYM_BUENA1
	const SANSKRITGYM_BUENA2
	const SANSKRITGYM_ROCKER2
	const SANSKRITGYM_ROCKER3
	const SANSKRITGYM_GYM_GUY

BlueForestGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BlueForestGymPryceScript:
	faceplayer
	checkevent EVENT_REMATCH_AVAILABLE_PRYCE
	iftrue RematchScriptPryce
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue PostRematchScriptPryce
	opentext
	checkevent EVENT_BEAT_PRYCE
	iftrue .FightDone
	writetext PryceText_Intro
	waitbutton
	closetext
	winlosstext PryceText_Impressed, 0
	loadtrainer PRYCE, PRYCE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_PRYCE
	opentext
	writetext Text_ReceivedGlacierBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_GLACIERBADGE
	checkcode VAR_BADGES
	scall BlueForestGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM16_ICY_WIND
	iftrue PryceScript_Defeat
	setevent EVENT_BEAT_SKIER_ROXANNE
	setevent EVENT_BEAT_BOARDER_BRAD
	setevent EVENT_BEAT_BOARDER_DOUGLAS
	setevent EVENT_BEAT_SKIER_CLARISSA
	setevent EVENT_ROUTE_112_SNOW_STORM; for workers south of town
	setevent EVENT_STAND_CITY_ZOO_MONS; makes normal pokes in zoo disappear
	writetext PryceText_GlacierBadgeSpeech
	buttonsound
	verbosegiveitem TM_ICY_WIND
	iffalse BlueForestGym_NoRoomForIcyWind
	setevent EVENT_GOT_TM16_ICY_WIND
	writetext PryceText_IcyWindSpeech
	waitbutton
	closetext
	end
	
RematchScriptPryce:
	opentext
	writetext PryceRematchText
	waitbutton
	closetext
	winlosstext PryceRematchWinText, 0
	loadtrainer PRYCE, PRYCE2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_REMATCH_AVAILABLE_PRYCE
	opentext
	writetext PryceAfterRematchText
	waitbutton
	closetext
	end

PostRematchScriptPryce:
	opentext
	writetext PryceAfterRematchText
	waitbutton
	closetext
	end

PryceScript_Defeat:
	writetext PryceText_CherishYourPokemon
	waitbutton
BlueForestGym_NoRoomForIcyWind:
	closetext
	end


BlueForestGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .WestportRockets
	end

.WestportRockets:
	jumpstd WestportRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerSkierRoxanne:
	trainer SKIER, ROXANNE, EVENT_BEAT_SKIER_ROXANNE, SkierRoxanneSeenText, SkierRoxanneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SkierRoxanneAfterBattleText
	waitbutton
	closetext
	end

TrainerSkierClarissa:
	trainer SKIER, CLARISSA, EVENT_BEAT_SKIER_CLARISSA, SkierClarissaSeenText, SkierClarissaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SkierClarissaAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderBrad:
	trainer BOARDER, BRAD, EVENT_BEAT_BOARDER_BRAD, BoarderBradSeenText, BoarderBradBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderBradAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderDouglas:
	trainer BOARDER, DOUGLAS, EVENT_BEAT_BOARDER_DOUGLAS, BoarderDouglasSeenText, BoarderDouglasBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderDouglasAfterBattleText
	waitbutton
	closetext
	end

BlueForestGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_PRYCE_IN_GYM
	iftrue .PryceNotAround
	checkevent EVENT_BEAT_PRYCE
	iftrue .BlueForestGymGuyWinScript
	writetext BlueForestGymGuyText
	waitbutton
	closetext
	end
	
.PryceNotAround:
	writetext BlueForestGymGuyNotAroundText
	waitbutton
	closetext
	end

.BlueForestGymGuyWinScript:
	writetext BlueForestGymGuyWinText
	waitbutton
	closetext
	end

BlueForestGymStatue:
	checkflag ENGINE_GLACIERBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	trainertotext PRYCE, PRYCE1, MEM_BUFFER_1
	jumpstd GymStatue2Script
	

PryceRematchText:
    text "Du bist also"
    line "zurück von der"
    cont "LIGA."

	para "Nur weil du den"
	line "Gipfel erreicht"
	para "hast, heißt das"
	line "nicht, dass dich"
	para "die eisigen Winde"
	line "des Berges nicht"
	cont "länger treffen!"

	para "Lass mich dir das"
	line "ganze Aresnal"
	para "meiner gesammelten"
	line "Erfahrung demons-"
	cont "trieren!"
	done

PryceRematchWinText:
	text "Vielleicht hat die"
	line "Jugend doch etwas"
	cont "zu bieten…"
	done

PryceAfterRematchText:
	text "Ich bin von deinem"
	line "Können beein-"
	cont "druckt."

	para "Mit deinem starken"
	line "Willen, wirst du"
	para "alle Widrigkeiten"
	line "in deinem Leben"
	cont "überstehen."
	done

BlueForestGymGuyNotAroundText:
    text "Hey, Kleiner!"

    para "ALBERT ist ein"
    line "eiskalter Kämpfer!"

    para "Aber er hat ein"
    line "Herz aus Gold."

    para "Er kümmert sich um"
    line "seine #MON und"
    cont "um seine Familie."

    para "Er verbringt seine"
    line "Tage mit seinem"
    para "strengen Training"
    line "in der TIEFWASSER"
    cont "PASSAGE."

    para "Was ich damit"
    line "sagen will, ist,"
    para "dass er nicht oft"
    line "hier ist."

    para "Es könnte eine"
    line "Weile dauern, bis"
    cont "er zurückkehrt."

    para "Wenn du gegen ihn"
    line "kämpfen willst,"
    para "wäre es vielleicht"
    line "gut, wenn du ihn"
    cont "suchen gehst."
	done

PryceText_Intro:
	text "Wie schön, dich"
	line "wiederzusehen."

	para "#MON machen in"
	line "ihrem Leben viele"

	para "Erfahrungen. Genau"
	line "wie Menschen."

	para "Auch ich habe in"
	line "meinem Leben viel"
	cont "gesehen und er-"
	cont "litten."

	para "Da ich der Ältere"
	line "bin, lass mich dir"
	cont "zeigen, was ich"
	cont "meine."

	para "Ich war schon mit"
	line "#MON zusammen,"

	para "bevor du geboren"
	line "wurdest."

	para "Ich verliere nicht"
	line "gerne."

	para "Ich, NORBERT, der"
	line "Wintertrainer,"

	para "werde meine Macht"
	line "demonstrieren!"
	done


PryceText_Impressed:
	text "Ich bin von deinem"
	line "Können beein-"
	cont "druckt."

	para "Mit deinem starken"
	line "Willen, wirst du"

	para "alle Widrigkeiten"
	line "in deinem Leben"
	cont "überstehen."

	para "Du bist dieses"
	line "ORDENS würdig!"
	done

Text_ReceivedGlacierBadge:
	text "<PLAYER> erhält"
	line "EISORDEN."
	done

PryceText_GlacierBadgeSpeech:
	text "Dieser ORDEN hebt"
	line "den SPEZ-Wert dei-"
	cont "ner #MON."

	para "Außerdem können"
	line "deine #MON"
	cont "WHIRLPOOL einset-"
	cont "zen, um echte"
	cont "Strudel zu"
	cont "überwinden."

	para "Und dies… dies ist"
	line "ein Geschenk von"
	cont "mir!"
	done

PryceText_IcyWindSpeech:
	text "Diese TM enthält"
	line "EISSTURM."

	para "Sie verursacht"
	line "Schaden und ver-"
	cont "ringert die Ge-"
	cont "schwindigkeit."

	para "Sie stellt die"
	line "Härte des Winters"
	cont "dar."
	done

PryceText_CherishYourPokemon:
	text "Wenn Eis und"
	line "Schnee geschmolzen"
	cont "sind, kehrt der"
	cont "Frühling wieder."

	para "Du und deine"
	line "#MON werden"
	para "noch viele Jahre"
	line "zusammen sein."

	para "Genießt eure ge-"
	line "meinsame Zeit!"
	done

BoarderBradSeenText:
	text "Diese PKMN-ARENA"
	line "hat einen rutschi-"
	cont "gen Boden. Das ist"
	cont "doch lustig, oder?"

	para "Aber wir sind"
	line "nicht hier, um zu"
	cont "spielen!"
	done

BoarderBradBeatenText:
	text "Siehst du jetzt,"
	line "wie ernst wir es"
	cont "meinen?"
	done

BoarderBradAfterBattleText:
	text "Diese PKMN-ARENA"
	line "ist toll. Ich"
	cont "liebe es, mit mei-"
	cont "nen #MON hier"
	cont "zu snowboarden!"
	done

BoarderDouglasSeenText:
BoarderDouglasSeenText:
	text "Ich kenne ALBERTs"
	line "Geheimnis."
	done

BoarderDouglasBeatenText:
	text "O.K. Ich verrate"
	line "dir ALBERTs Ge-"
	cont "heimnis."
	done

BoarderDouglasAfterBattleText:
	text "Das Geheimnis von"
	line "ALBERTs Kraft…"

	para "Er trainiert unter"
	line "den harten Beding-"
	para "ungen der TIEF-"
	cont "WASSER-PASSAGE."
	done

SkierRoxanneSeenText:
	text "Um zu ALBERT, un-"
	line "serem ARENALEITER,"

	para "zu gelangen, musst"
	line "du denken, bevor"
	cont "du loslegst."
	done

SkierRoxanneBeatenText:
	text "Beim Skifahren"
	line "würde ich nie ge-"
	cont "gen dich verlie-"
	cont "ren."
	done

SkierRoxanneAfterBattleText:
	text "Wenn du nicht ge-"
	line "nau rutschst,"

	para "kommst du in die-"
	line "ser PKMN-ARENA"
	cont "nicht weit."
	done

SkierClarissaSeenText:
	text "Sieh dir meinen"
	line "Parallelschwung"
	cont "an!"
	done

SkierClarissaBeatenText:
	text "Nein! Jetzt bin"
	line "ich weggerutscht!"
	done

SkierClarissaAfterBattleText:
	text "Ich hätte mit mei-"
	line "nen Ski-Künsten"
	cont "nicht so angeben"
	cont "sollen…"
	done

BlueForestGymGuyText:
	text "ALBERT ist ein"
	line "Veteran, der seine"

	para "#MON schon"
	line "seit fast 50 Jah-"
	cont "ren trainiert."

	para "Angeblich friert"
	line "er seine Gegner"

	para "gerne mit Eis-"
	line "Attacken ein."

	para "Das heißt, du"
	line "solltest ihn mit"

	para "deinem brennenden"
	line "Ehrgeiz schmelzen!"
	done

BlueForestGymGuyWinText:
	text "ALBERT ist nicht"
	line "übel, aber du"
	cont "bist noch besser!"

	para "Das war ein heißer"
	line "Kampf, der die"

	para "Kluft zwischen den"
	line "Generationen über-"
	cont "wunden hat."
	done

BlueForestGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, BLUE_FOREST, 1
	warp_event  5, 17, BLUE_FOREST, 11

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 15, BGEVENT_READ, BlueForestGymStatue
	bg_event  6, 15, BGEVENT_READ, BlueForestGymStatue

	db 6 ; object events
	object_event  3,  2, SPRITE_PRYCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlueForestGymPryceScript, EVENT_PRYCE_IN_GYM
	object_event  9, 10, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 1, TrainerSkierRoxanne, -1
	object_event  0, 17, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 1, TrainerSkierClarissa, -1
	object_event  5,  7, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerBoarderBrad, -1
	object_event  0,  2, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderDouglas, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlueForestGymGuyScript, -1
