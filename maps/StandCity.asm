	object_const_def ; object_event constants
	const STANDCITY_ROCKER
	const STANDCITY_POKEFAN_M
	const STANDCITY_TWIN
	const STANDCITY_TEACHER
	const STANDCITY_FRUIT_TREE
	const STANDCITY_MONSTER1
	const STANDCITY_MONSTER2
	const STANDCITY_MONSTER3
	const STANDCITY_BIRD
	const STANDCITY_FAIRY
	const STANDCITY_BLOCKROCKET1
	const STANDCITY_IMPOSTOR
	const STANDCITY_HQBLOCKROCKET
	const STANDCITY_NATIONALBLOCKROCKET

StandCity_MapScripts:
	db 2 ; scene scripts
	scene_script .SceneStandCityNothing ; SCENE_DEFAULT
	scene_script .SceneStandCityImposter ;

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_TILES, .StandCityBlockFence

.SceneStandCityNothing
	end

.SceneStandCityImposter
	end


.FlyPoint:
	setflag ENGINE_FLYPOINT_STAND
	return
	
.StandCityBlockFence:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .Done20
	changeblock  29, 35, $4C ; rock
	changeblock  31, 35, $39 ; rock
.Done20:
	return
	
ImposterIntro1:
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 5
	jump ImposterSceneScript
	end
	
ImposterIntro2:
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 5
	applymovement PLAYER, ImposterSceneMove1
	jump ImposterSceneScript
	end
	
ImposterSceneScript:
	moveobject STANDCITY_TEACHER, 27, 23
	moveobject STANDCITY_TWIN, 29, 23
	moveobject STANDCITY_ROCKER, 28, 24
	moveobject STANDCITY_POKEFAN_M, 27, 25
	appear STANDCITY_POKEFAN_M
	appear STANDCITY_ROCKER
	appear STANDCITY_TWIN
	applymovement PLAYER, ImposterSceneMove2
	turnobject STANDCITY_POKEFAN_M, RIGHT
	applymovement PLAYER, ImposterSceneMove2_5
	turnobject STANDCITY_TEACHER, LEFT
	applymovement PLAYER, ImposterSceneMove2_7
	showemote EMOTE_SHOCK, STANDCITY_TWIN, 25
	turnobject STANDCITY_TEACHER, UP
	pause 3
	turnobject STANDCITY_ROCKER, UP
	pause 3
	turnobject STANDCITY_POKEFAN_M, UP
	pause 30
	opentext
	writetext ImposterText1
	waitbutton
	closetext
	moveobject STANDCITY_IMPOSTOR, 29, 19
	appear STANDCITY_IMPOSTOR
	applymovement STANDCITY_IMPOSTOR, ImposterWalksDown
	pause 10
	opentext
	writetext ImposterText2
	waitbutton
	closetext
	pause 3
	showemote EMOTE_SHOCK, STANDCITY_ROCKER, 5
	pause 3
	showemote EMOTE_SHOCK, STANDCITY_TWIN, 5
	pause 3
	showemote EMOTE_SHOCK, STANDCITY_TEACHER, 5
	pause 3
	showemote EMOTE_SHOCK, STANDCITY_POKEFAN_M, 5
	pause 15
	opentext
	writetext ImposterText3
	waitbutton
	closetext
	pause 10
	applymovement STANDCITY_IMPOSTOR, ImposterWalksUp
	disappear STANDCITY_IMPOSTOR
	setevent EVENT_IMPOSTER_OAK_HAS_SPOKEN
	setscene SCENE_DEFAULT
	playmusic MUSIC_KANTO_REGION
	end


StandCityRocker:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .RockerRocketsGone
	checkevent EVENT_IMPOSTER_OAK_HAS_SPOKEN
	iftrue .RockerAfterImposter
	writetext StandCityRockerText
	waitbutton
	closetext
	end
	
.RockerRocketsGone
	writetext StandCityRockerAllGoodText
	waitbutton
	closetext
	end
	
.RockerAfterImposter
	writetext StandCityRockerImposterText
	waitbutton
	closetext
	end

StandCityPokefanM:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .PokefanRocketsGone
	checkevent EVENT_IMPOSTER_OAK_HAS_SPOKEN
	iftrue .PokefanAfterImposter
	writetext StandCityPokefanMText
	waitbutton
	closetext
	end
	
.PokefanRocketsGone
	writetext StandCityPokefanAllGoodText
	waitbutton
	closetext
	end
	
.PokefanAfterImposter
	writetext StandCityPokefanImposterText
	waitbutton
	closetext
	end


StandCityTwin:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .TwinRocketsGone
	checkevent EVENT_IMPOSTER_OAK_HAS_SPOKEN
	iftrue .TwinAfterImposter
	writetext StandCityTwinText
	waitbutton
	closetext
	end
	
.TwinRocketsGone
	writetext StandCityTwinAllGoodText
	waitbutton
	closetext
	end
	
.TwinAfterImposter
	writetext StandCityTwinImposterText
	waitbutton
	closetext
	end
	
StandCityTeacher:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .TeacherRocketsGone
	checkevent EVENT_IMPOSTER_OAK_HAS_SPOKEN
	iftrue .TeacherAfterImposter
	writetext StandCityTeacherText
	waitbutton
	closetext
	end
	
.TeacherRocketsGone
	writetext StandCityTeacherAllGoodText
	waitbutton
	closetext
	end
	
.TeacherAfterImposter
	writetext StandCityTeacherImposterText
	waitbutton
	closetext
	end
	
StandCityBlockRocket1:
	faceplayer
	opentext
	checkevent EVENT_ROCKETS_IN_ROCKET_BASE
	iftrue .BlockRocket1AfterBase
	checkevent EVENT_IMPOSTER_OAK_HAS_SPOKEN
	iftrue .BlockRocket1AfterImposter
	writetext BlockRocket1BeforeText
	waitbutton
	closetext
	end
	
.BlockRocket1AfterBase
	writetext BlockRocket1AfterBaseText
	waitbutton
	closetext
	end

.BlockRocket1AfterImposter
	writetext BlockRocket1AfterText
	waitbutton
	closetext
	end
	
StandCityBlockRocket2:
	faceplayer
	opentext
	checkevent EVENT_ROCKETS_IN_ROCKET_BASE
	iftrue .BlockRocket2AfterBase
	checkevent EVENT_IMPOSTER_OAK_HAS_SPOKEN
	iftrue .BlockRocket2AfterImposter
	writetext BlockRocket2BeforeText
	waitbutton
	closetext
	end
	
.BlockRocket2AfterBase
	writetext BlockRocket2AfterBaseText
	waitbutton
	closetext
	end

	
.BlockRocket2AfterImposter
	writetext BlockRocket2AfterText
	waitbutton
	closetext
	end
	
StandCityBlockRocket3:
	faceplayer
	opentext
	checkevent EVENT_ROCKETS_IN_ROCKET_BASE
	iftrue .BlockRocket3AfterBase
	checkevent EVENT_IMPOSTER_OAK_HAS_SPOKEN
	iftrue .BlockRocket3AfterImposter
	writetext BlockRocket3BeforeText
	waitbutton
	closetext
	end
	
.BlockRocket3AfterBase
	writetext BlockRocket3AfterBaseText
	waitbutton
	closetext
	end

	
.BlockRocket3AfterImposter
	writetext BlockRocket3AfterText
	waitbutton
	closetext
	end
	
StandCityBlockRocket4:
	faceplayer
	opentext
	checkevent EVENT_ROCKETS_IN_ROCKET_BASE
	iftrue .BlockRocket4AfterBase
	checkevent EVENT_IMPOSTER_OAK_HAS_SPOKEN
	iftrue .BlockRocket4AfterImposter
	writetext BlockRocket4BeforeText
	waitbutton
	closetext
	end
	
.BlockRocket4AfterBase
	writetext BlockRocket4AfterBaseText
	waitbutton
	closetext
	end

	
.BlockRocket4AfterImposter
	writetext BlockRocket4AfterText
	waitbutton
	closetext
	end
	

StandCitySign:
	jumptext StandCitySignText

StandCityGymSign:
	jumptext StandCityGymSignText

ZooMedicalSign:
	jumptext ZooMedicalSignText

StandZooKangaskhanSign:
	jumptext StandZooKangaskhanSignText

StandZooClefairySign:
	jumptext StandZooClefairySignText
	
StandZooAmpharosSign:
	jumptext StandZooAmpharosSignText
	
StandZooSkarmorySign:
	jumptext StandZooSkarmorySignText
	
StandZooGolduckSign:
	jumptext StandZooGolduckSignText

StandZooOfficeSign:
	jumptext StandZooOfficeSignText

StandCityPokecenterSign:
	jumpstd PokecenterSignScript

StandCityMartSign:
	jumpstd MartSignScript

StandCityFruitTree:
	fruittree FRUITTREE_TREE_STAND_CITY
	
StandCityHQBlockRocket:
	jumptextfaceplayer StandCityHQBlockRocketText
	
StandCityNationalBlockRocket:
	faceplayer
	opentext
	checkevent EVENT_ROCKETS_IN_ROCKET_BASE
	iftrue .NatioanlBlockRocketAfterBase
	writetext StandCityNationalBlockRocketText
	waitbutton
	closetext
	end

.NatioanlBlockRocketAfterBase
	writetext StandCityNationalBlockRocketAfterBaseText
	waitbutton
	closetext
	end

ImposterSceneMove1:
	step LEFT
	step_end
	
ImposterSceneMove2:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end
	
ImposterSceneMove2_5:
	step UP
	step UP
	step_end
	
ImposterSceneMove2_7:
	step UP
	step UP
	step UP
	step UP
	step_end
	
ImposterWalksDown:
	step DOWN
	step DOWN
	step_end
	
ImposterWalksUp:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step_end
	
StandCityNationalBlockRocketAfterBaseText:
    text "Ich fühle mich"
    line "immer von allen"
    cont "ausgeschlossen…"

    para "Niemand sagt mir,"
    line "was hier vor sich"
    cont "geht…"
	done
	
BlockRocket4AfterBaseText:
    text "Alle anderen"
    line "sind weg?"

    para "Du hast nichts"
    line "damit zu tun,"
    cont "oder?"
	done

BlockRocket3AfterBaseText:
    text "Angeblich sind"
    line "jetzt alle drüben"
    cont "in PORT ABANISHI."

    para "Aber was hat das"
    line "zu bedeuten?"

    para "Was ist denn mit"
    line "unserer Basis"
    cont "passiert?"
	done
	
BlockRocket2AfterBaseText:
    text "Ist das wahr?"

    para "Ich hörte, die"
    line "Basis wäre leer."

    para "Warum sind wir"
    line "dann noch hier?"
	done
	
BlockRocket1AfterBaseText:
    text "Ist die Basis"
    line "wirklich leer?"

    para "Wo sind denn"
    line "dann alle hin?"
	done
	
StandCityHQBlockRocketText:
    text "Wir alle hassen"
    line "es, den Eingang"
    para "zu diesem Gebäude"
    line "zu bewachen."

    para "Meine Schicht ist"
    line "aber fast vorbei."

    para "Ich hoffe, meine"
    line "Ablösung taucht"
    para "dieses Mal auch"
    line "wirklich auf…"
	done
	
StandCityNationalBlockRocketText:
    text "Niemand darf jetzt"
    line "den NATIONALPARK"
    cont "betreten!"

    para "Nicht solange"
    line "die #MON krank"
    cont "werden."

    para "Mir liegt ihre"
    line "Gesundheit am"
    para "Herzen, verstehst"
    line "du?"
	done
	
BlockRocket1BeforeText:
    text "Südlich von hier"
    line "gibt es nichts!"

    para "Du solltest"
    line "einfach in der"
    cont "Stadt bleiben!"

    para "Du willst doch"
    line "nicht unseren"
    para "berühmten Gast-"
    line "redner verpassen!"
	done

BlockRocket1AfterText:
    text "Hey, Knirps!"

    para "War das nicht eine"
    line "tolle Rede vom"
    para "allerechten"
    line "PROF. EICH?"
	done
	
BlockRocket2BeforeText:
	text "Du willst die"
	line "Stadt nicht"
	cont "verlassen."

	para "Wir haben einen"
	line "ganz besonderen"
	para "Gast, der bald"
	line "hier sein wird!"
	done
	
BlockRocket2AfterText:
    text "Unsere Forschung"
    line "wird der ganzen"
    cont "Welt zugutekommen!"
	done
	
BlockRocket3BeforeText:
	text "Südlich von hier"
	line "ist nichts!"

	para "Du solltest besser"
	line "in der Stadt"
	cont "bleiben!"
	done
	
BlockRocket3AfterText:
	text "Die Leute lieben"
	line "PROF.EICH!"
	done
	
BlockRocket4BeforeText:
    text "Bald ist es an der"
    line "Zeit, der Welt"
    para "unseren Plan zu"
    line "enthüllen!"
	done
	
BlockRocket4AfterText:
	text "Wir tun großartige"
	line "Dinge, hast du es"
	cont "nicht gehört?"
	done
	
ImposterText1:
	text "Bürger von"
	line "SENDESTIA CITY!"
	done
	
ImposterText2:
	text "Ich bin es, der"
	line "weltberühmte"
	cont "PROF. EICH!"

	para "Ich habe tolle"
	line "Neuigkeiten zu"
	para "einem Durchbruch"
	line "in der #MON-"
	cont "Forschung!"

	para "Ich habe mich mit"
	line "TEAM ROCKET"
	para "zusammengetan, um"
    line "euch diese neue"
    para "Technologie zu"
    cont "bringen!"
	done
	
ImposterText3:
    text "Macht euch"
    line "keine Sorgen!"

    para "TEAM ROCKET"
    line "leistet großartige"
    para "Arbeit bei der"
    line "Entwicklung eines"
    para "Hochleistungs-"
    line "Radiosignals, mit"
    para "dessen Hilfe man"
    line "die Gedanken von"
    para "#MON lesen"
    line "können wird!"

    para "Und dieses Signal"
    line "wird genau hier in"
    para "SENDESTIA CITY"
    line "entwickelt!"

    para "Eine mögliche"
    line "Nebenwirkung dieses"
    para "Signals könnte sein,"
    para "dass #MON, die"
    line "ihm ausgesetzt"
    para "werden, sich etwas"
    line "unwohl fühlen…"

    para "…"

    para "Aber ignoriert"
    line "das einfach!"

    para "Es wird ihnen"
    line "wieder besser"
    cont "gehen!"

    para "Die Ergebnisse"
    line "dieser Forschung,"
    para "werden unser"
    line "Verständnis von"
    para "#MON in nie"
    line "dagewesener Weise"
    cont "erweitern!"

    para "Da könnt ihr mir"
    line "vertrauen, denn"
    para "wie ihr sehen"
    line "könnt, bin ich"
    cont "PROF. EICH!"

    para "Das war alles!"
	done

StandCityRockerText:
    text "Die #MON aus"
    line "dem ZOO fühlen"
    cont "sich nicht gut."

    para "Die Verantwort-"
    line "lichen vom ZOO"
    para "kümmern sich um"
    line "sie, in ihrer"
    cont "#MON-Klink."
	done
	
StandCityRockerAllGoodText:
	text "Das war gar nicht"
	line "der echte"
	cont "PROF. EICH?

	para "Total verrückt!"

	para "Ich bin froh, dass"
	line "es den #MON"
	cont "jetzt besser geht."
	done
	
StandCityRockerImposterText:
	text "TEAM ROCKET ist"
	line "schuld daran, dass"
	para "es den #MON"
	line "schlecht geht?"

	para "Aber PROF. EICH"
	line "sagt, sie werden"
	para "wieder gesund und"
	line "das alles sei Teil"
	para "seiner wichtigen"
	line "Forschung…"

	para "Ich vertraue ihm."
	done

StandCityPokefanMText:
	text "Schade, dass die"
	line "#MON nicht"
	cont "draußen sind."

	para "Aber es ist wich-"
	line "tiger, dass sie"
	cont "gesund werden."
	done
	
StandCityPokefanImposterText:
	text "PROF. EICH ist"
	line "schuld daran,"
	para "dass es den"
	line "#MON so"
	cont "schlecht geht?"

	para "Er muss gute"
	line "Gründe haben…"
	done
	
StandCityPokefanAllGoodText:
    text "Ich bin so froh,"
    line "dass es allen"
    para "#MON wieder gut"
    line "geht!"
	done

StandCityTwinText:
	text "Der ZOO von"
	line "SENDESTIA CITY"
	cont "hat geschlossen…"

	para "Das ist schade,"
	line "denn er ist"
	para "die größte"
	line "Attraktion hier."

	para "Ich hoffe, den"
	line "#MON geht es"
	cont "gut."
	done
	
StandCityTwinImposterText:
	text "TEAM ROCKET ist"
	line "zurück?"

	para "Und das zusammen"
	line "mit PROF. EICH?"

	para "Das simmt doch"
	line "etwas nicht…"
	done
	
StandCityTwinAllGoodText:
	text "Juhu! Der ZOO hat"
	line "wieder geöffnet!"
	done

StandCityTeacherText:
	text "Was machen all die"
	line "Leute von TEAM"
	cont "ROCKET hier?"

	para "Das kann nichts"
	line "Gutes heißen!"
	done
	
StandCityTeacherImposterText:
    text "Irgendwas kam mir"
    line "komisch vor, an"
    cont "PROF. EICH…"
	done

StandCityTeacherAllGoodText:
	text "Zum Glück ist"
	line "alles wieder"
	cont "normal."
	done

StandCitySignText:
	text "SENDESTIA CITY"

	para "Eine Utopie für"
	line "Mensch und #MON"
	done

StandCityGymSignText:
	text "#MON-ARENA von"
	line "SENDESTIA CITY"
	cont "LEITUNG: RABAN"

	para "Der Junge, der"
	line "im Dunkeln"
	cont "aufblüht"
	done


ZooMedicalSignText:
	text "SENDESTIA CITY ZOO"
	line "#MON-Klinikum"
	done

StandZooKangaskhanSignText:
	text "#MON:"
	line "KANGAMA"

	para "Um das Junge, das"
	line "es in seinem Beu-"
	para "tel trägt, nicht"
	line "zu zerquetschen,"
	para "schläft es immer"
	line "nur im Stehen."
	done

StandZooClefairySignText:
	text "#MON:"
	line "PIEPI"

	para "Es wird nur selten"
	line "gesehen, doch in"
	para "Vollmondnächten"
	line "kann man es aus"
	para "irgendeinem Grund"
	line "öfter finden."
	done
	
StandZooAmpharosSignText:
	text "#MON:"
	line "AMPHAROS"

	para "Wenn es dunkel"
	line "wird, kann man das"
	para "Licht an seinem"
	line "Schwanz bis weit"
	para "draußen auf dem"
	line "Meer sehen."
	done
	
StandZooSkarmorySignText:
	text "#MON:"
	line "PANZAERON"

	para "Die Federn, die"
	line "es verliert, sind"
	cont "extrem scharf."

	para "Angeblich wurden"
	line "sie früher sogar"
	para "als Schwerter"
	line "verwendet."
	done
	
StandZooGolduckSignText:
	text "#MON:"
	line "ENTORON"

	para "Es schwimmt"
	line "anmutig durch"
	para "ruhige, langsam"
	line "fließende Flüsse"
	para "und Seen, in denen"
	line "es sich besonders"
	cont "wohlfühlt."
	done

StandZooOfficeSignText:
	text "STAND CITY ZOO"
	line "Hauptbüro"
	done

StandCity_MapEvents:
	db 0, 0 ; filler

	db 13 ; warp events
	warp_event 35, 26, STAND_MART, 1
	warp_event 16, 21, STAND_CITY_ZOO_OFFICE, 1
	warp_event 34, 31, STAND_GYM, 1
	warp_event 26, 29, BILLS_BROTHERS_HOUSE, 1
	warp_event 33, 20, STAND_POKECENTER_1F, 1
	warp_event 17, 31, STAND_CITY_ROCKET_HOUSE, 1
	warp_event  1,  0, SAFARI_ZONE_STAND_GATE_BETA, 3 ; inaccessible
	warp_event 30, 13, ROUTE_112_STAND_GATE, 3
	warp_event 31, 13, ROUTE_112_STAND_GATE, 4
	warp_event  6, 17, STAND_CITY_NATIONAL_PARK_GATE, 4
	warp_event  0,  0, MERIDIAN_PATH_RYUKYU_GATE, 2
	warp_event 35, 31, STAND_GYM, 2
	warp_event 24, 17, STAND_POKE, 1


	db 2 ; coord events
	coord_event  34, 32, SCENE_STAND_CITY_IMPOSTOR, ImposterIntro1
	coord_event  35, 32, SCENE_STAND_CITY_IMPOSTOR, ImposterIntro2

	db 11 ; bg events
	bg_event 36, 20, BGEVENT_READ, StandCitySign
	bg_event 32, 35, BGEVENT_READ, StandCityGymSign
	bg_event 24, 20, BGEVENT_READ, ZooMedicalSign
	bg_event  8,  8, BGEVENT_READ, StandZooKangaskhanSign
	bg_event 18, 21, BGEVENT_READ, StandZooOfficeSign
	bg_event 34, 20, BGEVENT_READ, StandCityPokecenterSign
	bg_event 36, 26, BGEVENT_READ, StandCityMartSign
	bg_event 14,  8, BGEVENT_READ, StandZooClefairySign
	bg_event 20, 10, BGEVENT_READ, StandZooAmpharosSign
	bg_event 16, 16, BGEVENT_READ, StandZooSkarmorySign
	bg_event 10, 20, BGEVENT_READ, StandZooGolduckSign

	db 14 ; object events
	object_event 28, 21, SPRITE_ROCKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, StandCityRocker, -1
	object_event 14, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, StandCityPokefanM, -1
	object_event 14, 17, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, StandCityTwin, -1
	object_event 28, 30, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, StandCityTeacher, -1
	object_event 26, 11, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, StandCityFruitTree, -1
	object_event 20,  8, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_STAND_CITY_ZOO_MONS
	object_event  7, 21, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_STAND_CITY_ZOO_MONS
	object_event  7,  6, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_STAND_CITY_ZOO_MONS
	object_event 15, 14, SPRITE_BIRD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_STAND_CITY_ZOO_MONS
	object_event 12,  6, SPRITE_FAIRY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_STAND_CITY_ZOO_MONS
	object_event 28, 34, SPRITE_STAND_ROCKET, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, StandCityBlockRocket1, EVENT_CLEARED_RADIO_TOWER
	object_event -5, -5, SPRITE_STAND_CITY_IMPOSTOR, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 17, 32, SPRITE_STAND_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, StandCityHQBlockRocket, EVENT_BEAT_OKERA
	object_event  6, 18, SPRITE_STAND_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, StandCityNationalBlockRocket, EVENT_CLEARED_RADIO_TOWER

