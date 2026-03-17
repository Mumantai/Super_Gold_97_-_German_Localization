	object_const_def ; object_event constants
	const ROUTE103_YOUNGSTER1
	const ROUTE103_LASS2
	const ROUTE103_YOUNGSTER3
	const ROUTE103_SUPER_NERD
	const ROUTE103_FRUIT_TREE
	const ROUTE103_POKE_BALL
	const ROUTE103_FISHER

Route103_MapScripts:
	db 2 ; scene scripts
	scene_script .Scene35SlowpokeTail ; SCENE_DEFAULT
	scene_script .Scene35Nothing ;

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Route103ClearRocks
	
.Route103ClearRocks:
	checkflag ENGINE_PLAINBADGE
	iftrue .Done
	changeblock  11, 29, $6B ; rock
.Done:
	return

.Scene35SlowpokeTail
	end

.Scene35Nothing
	end
	
	
TrainerJugglerIrwin:
	trainer JUGGLER, IRWIN1, EVENT_BEAT_JUGGLER_IRWIN, JugglerIrwin1SeenText, JugglerIrwin1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_IRWIN_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_JUGGLER_IRWIN
	iftrue Route103NumberAcceptedM
	checkevent EVENT_IRWIN_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext JugglerIrwinAfterBattleText
	promptbutton
	setevent EVENT_IRWIN_ASKED_FOR_PHONE_NUMBER
	scall Route103AskNumber1M
	sjump .AskForNumber

.AskedAlready:
	scall Route103AskNumber2M
.AskForNumber:
	askforphonenumber PHONE_JUGGLER_IRWIN
	ifequal PHONE_CONTACTS_FULL, Route103PhoneFullM
	ifequal PHONE_CONTACT_REFUSED, Route103NumberDeclinedM
	gettrainername STRING_BUFFER_3, JUGGLER, IRWIN1
	scall Route103RegisteredNumberM
	sjump Route103NumberAcceptedM

.WantsBattle:
	scall Route103RematchM
	winlosstext JugglerIrwin1BeatenText, 0
	checkevent EVENT_GOT_FUEL_LINE
	iftrue .LoadFight2
	checkflag ENGINE_FLYPOINT_STAND
	iftrue .LoadFight1
	loadtrainer JUGGLER, IRWIN1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_IRWIN_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer JUGGLER, IRWIN2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_IRWIN_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer JUGGLER, IRWIN3
	startbattle
	reloadmapafterbattle
	clearevent EVENT_IRWIN_READY_FOR_REMATCH
	end

Route103AskNumber1M:
	jumpstd AskNumber1MScript
	end

Route103AskNumber2M:
	jumpstd AskNumber2MScript
	end

Route103RegisteredNumberM:
	jumpstd RegisteredNumberMScript
	end

Route103NumberAcceptedM:
	jumpstd NumberAcceptedMScript
	end

Route103NumberDeclinedM:
	jumpstd NumberDeclinedMScript
	end

Route103PhoneFullM:
	jumpstd PhoneFullMScript
	end

Route103RematchM:
	jumpstd RematchMScript
	end


SlowpokeVendor:
	turnobject PLAYER, UP
	opentext
	writetext Text_MillionDollarSlowpokeTail
	yesorno
	iffalse .scenerefused
	writetext Text_ThoughtKidsWereLoaded
	waitbutton
	closetext
	setscene SCENE_ROUTE_103_NOTHING
	end

.scenerefused
	writetext Text_RefusedToBuySlowpokeTail
	waitbutton
	closetext
	setscene SCENE_ROUTE_103_NOTHING
	end

TrainerBirdKeeperBryan:
	trainer BIRD_KEEPER, BRYAN, EVENT_BEAT_BIRD_KEEPER_BRYAN, BirdKeeperBryanSeenText, BirdKeeperBryanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperBryanAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperIvan:
	trainer CAMPER, IVAN, EVENT_BEAT_CAMPER_IVAN, CamperIvanSeenText, CamperIvanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperIvanAfterBattleText
	waitbutton
	closetext
	end


TrainerPicnickerKim:
	trainer PICNICKER, KIM, EVENT_BEAT_PICNICKER_KIM, PicnickerKimSeenText, PicnickerKimBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerKimAfterBattleText
	waitbutton
	closetext
	end

Route103Sign:
	jumptext Route103SignText

Route103TMRollout:
	itemball TM_ROLLOUT

Route103FruitTree:
	fruittree FRUITTREE_TREE_ROUTE_103
	

SlowpokeTailSalesmanScript:
	faceplayer
	opentext
	writetext Text_MillionDollarSlowpokeTail
	yesorno
	iffalse .refused
	writetext Text_ThoughtKidsWereLoaded
	waitbutton
	closetext
	turnobject ROUTE103_FISHER, DOWN
	setscene SCENE_ROUTE_103_NOTHING
	end

.refused
	writetext Text_RefusedToBuySlowpokeTail
	waitbutton
	closetext
	turnobject ROUTE103_FISHER, DOWN
	setscene SCENE_ROUTE_103_NOTHING
	end
	

Text_MillionDollarSlowpokeTail:
	text "Wie möchtest du"
	line "die schmackhafte,"
	cont "gehaltvolle"
	cont "FLEGMONRUTE"
	cont "zubereitet haben?"

	para "Für dich jetzt nur"
	line "¥1,000,000!"

	para "Möchtest du sie?"
	done

Text_ThoughtKidsWereLoaded:
	text "Ts! Ich dachte,"
	line "die Kinder von"
	cont "heute wären"
	cont "stinkreich…"
	done

Text_RefusedToBuySlowpokeTail:
	text "Du möchtest sie"
	line "nicht? Dann mach"
	cont "dich vom Acker!"
	done

CamperIvanSeenText:
	text "Ich habe aus dem"
	line "Radio #MON-"
	cont "Daten erhalten."

	para "Ich glaube, ich"
	line "bin gut."
	done

CamperIvanBeatenText:
	text "Ich teile aus!"
	done

CamperIvanAfterBattleText:
	text "Die Musik aus dem"
	line "Radio beeinflusst"
	cont "die Stimmung von"
	cont "wilden #MON."
	done

PicnickerKimSeenText:
	text "Gehst du auch"
	line "zur PKMN-ARENA?"
	done

PicnickerKimBeatenText:
	text "Oh, ich habe"
	line "verloren…"
	done

PicnickerKimAfterBattleText:
	text "Die ORDEN"
	line "sind hübsch."
	cont "Deshalb sammle ich"
	cont "sie."
	done

BirdKeeperBryanSeenText:
	text "Welche Art von"
	line "#BALL"
	cont "benutzt du?"
	done

BirdKeeperBryanBeatenText:
	text "Mist! Nicht"
	line "schnell genug!"
	done

BirdKeeperBryanAfterBattleText:
	text "Manche #MON"
	line "rennen sofort weg."

	para "Versuche, sie mit"
	line "KURTs TURBOBALL"
	cont "einzufangen. "

	para "Sobald ich eine"
	line "APRIKOKO WSS"
	cont "finde, bringe ich"
	cont "sie zu KURT."

	para "Er macht dann"
	line "daraus einen maß-"
	cont "gefertigten"
	cont "#BALL."
	done

JugglerIrwin1SeenText:
	text "Siehe meine"
	line "Virtuosität, mit"
	cont "der ich die BÄLLE"
	cont "jongliere!"
	done

JugglerIrwin1BeatenText:
	text "Puh, das war ein"
	line "Ruck!"
	done

JugglerIrwinAfterBattleText:
	text "Ich wollte dich"
	line "mit meinen"

	para "prämierten #MON"
	line "fritzeln."

	para "Aber dein Können"
	line "elektrisierte"
	cont "mich!"
	done

Route103SignText:
	text "ROUTE 103"
	para "PORT ABANISHI -"
	line "TOTOMONIA"
	done

Route103_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 12, 48, ROUTE_103_WESTPORT_GATE, 1
	warp_event 13, 48, ROUTE_103_WESTPORT_GATE, 2

	db 1 ; coord events
	coord_event  8, 14, SCENE_DEFAULT, SlowpokeVendor

	db 1 ; bg events
	bg_event  6, 44, BGEVENT_READ, Route103Sign

	db 7 ; object events
	object_event 11,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperIvan, -1
	object_event  6, 23, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerPicnickerKim, -1
	object_event 10, 44, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperBryan, -1
	object_event  8, 37, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_TRAINER, 3, TrainerJugglerIrwin, -1
	object_event 14, 31, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route103FruitTree, -1
	object_event 15, 30, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route103TMRollout, EVENT_ROUTE_103_TM_ROLLOUT
	object_event  8, 13, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeTailSalesmanScript, EVENT_103_SLOWPOKE_SALESMAN
