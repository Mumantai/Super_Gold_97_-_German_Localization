	object_const_def ; object_event constants
	const STANDCITYROCKETHOUSE_ROCKET
	const STANDCITYROCKETHOUSE_OKERA
	const STANDCITYROCKETHOUSE_SILVER

StandCityRocketHouse_MapScripts:
	db 3 ; scene scripts
	scene_script .SceneStandCityRocketHouseRocketSpots ; SCENE_DEFAULT
	scene_script .SceneStandCityRocketHouseNothing ;
	scene_script .SceneStandCityRocketHouseBaseUncovered ;

	db 1 ; callbacks	
	callback MAPCALLBACK_TILES, .CheckStairsUncovered


.CheckStairsUncovered:
	checkevent EVENT_HIDDEN_STAIRCASE_IN_STAND_BASE
	iffalse .NoStairsYet
	changeblock 19, 7, $2a 
	return

.NoStairsYet:
	return

.SceneStandCityRocketHouseRocketSpots
	end

.SceneStandCityRocketHouseNothing
	end
	
.SceneStandCityRocketHouseBaseUncovered
	end
SilverFindsStairsLeft:
	opentext
	writetext SilverShowsUpInBase
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 20
	turnobject PLAYER, DOWN
	pause 5
	moveobject STANDCITYROCKETHOUSE_OKERA, 13, 5
	appear STANDCITYROCKETHOUSE_OKERA
	applymovement STANDCITYROCKETHOUSE_OKERA, SilverWalksToHiddenStairsMovementPart2
	opentext
	writetext SilverTellsYouAboutHiddenStairs
	waitbutton
	closetext
	applymovement STANDCITYROCKETHOUSE_OKERA, SilverWalksToHiddenStairsMovement2Part2
	applymovement PLAYER, SilverWalksToHiddenStairsMovement2Part2
	jump SilverFindsStairsMain
	end
	
SilverFindsStairsDown:
	opentext
	writetext SilverShowsUpInBase
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 20
	pause 5
	moveobject STANDCITYROCKETHOUSE_OKERA, 14, 5
	appear STANDCITYROCKETHOUSE_OKERA
	applymovement STANDCITYROCKETHOUSE_OKERA, SilverWalksToHiddenStairsMovement
	opentext
	writetext SilverTellsYouAboutHiddenStairs
	waitbutton
	closetext
	applymovement STANDCITYROCKETHOUSE_OKERA, SilverWalksToHiddenStairsMovement2
	applymovement PLAYER, SilverWalksToHiddenStairsMovement2
	jump SilverFindsStairsMain
	end
	
SilverFindsStairsMain:
	opentext
	writetext SilverTellsYouAboutHiddenStairs2
	waitbutton
	closetext
	playsound SFX_STRENGTH
	earthquake 80
	waitsfx
	playsound SFX_ENTER_DOOR
	changeblock 19, 7, $2a ; stairs
	reloadmappart
	pause 15
	turnobject STANDCITYROCKETHOUSE_OKERA, UP
	opentext
	writetext SilverLetsGoDownThere
	waitbutton
	closetext
	pause 15
	opentext
	writetext SilverActuallyShowsUpNow1
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 20
	turnobject PLAYER, LEFT
	turnobject STANDCITYROCKETHOUSE_OKERA, LEFT
	pause 10
	moveobject STANDCITYROCKETHOUSE_SILVER, 14, 5
	appear STANDCITYROCKETHOUSE_SILVER
	applymovement STANDCITYROCKETHOUSE_SILVER, SilverActuallyShowsUpMovement
	opentext
	writetext SilverActuallyShowsUpNow2
	waitbutton
	closetext
	pause 10
	opentext
	writetext SilverActuallyShowsUpNow3
	waitbutton
	closetext
	pause 10
	opentext
	writetext SilverActuallyShowsUpNow4
	waitbutton
	closetext
	applymovement STANDCITYROCKETHOUSE_SILVER, SilverRunsIntoStairsMovement
	playsound SFX_EXIT_BUILDING
	disappear STANDCITYROCKETHOUSE_SILVER
	waitsfx
	pause 10
	turnobject PLAYER, DOWN
	turnobject STANDCITYROCKETHOUSE_OKERA, UP
	opentext
	writetext SilverActuallyShowsUpNow5
	waitbutton
	closetext
	applymovement STANDCITYROCKETHOUSE_OKERA, OkeraGoesToZoo
	disappear STANDCITYROCKETHOUSE_OKERA
	setscene SCENE_STAND_CITY_ROCKET_HOUSE_NOTHING
	setevent EVENT_HIDDEN_STAIRCASE_IN_STAND_BASE
	setevent EVENT_OKERA_NOT_IN_GYM
	end
	
RocketSpotsTop1:
	turnobject STANDCITYROCKETHOUSE_ROCKET, UP
	playmusic MUSIC_ROCKET_ENCOUNTER
	showemote EMOTE_SHOCK, STANDCITYROCKETHOUSE_ROCKET, 30
	applymovement STANDCITYROCKETHOUSE_ROCKET, ShockedRocket2Steps 
	turnobject PLAYER, DOWN
	opentext
	writetext RocketShockedText
	waitbutton
	closetext
	winlosstext ShockedRocketWinText, ShockedRocketLossText
	loadtrainer GRUNTM, GRUNTM_5
	startbattle
	reloadmapafterbattle
	turnobject STANDCITYROCKETHOUSE_ROCKET, UP
	setscene SCENE_STAND_CITY_ROCKET_HOUSE_NOTHING
	end
RocketSpotsTop2:
	turnobject STANDCITYROCKETHOUSE_ROCKET, UP
	playmusic MUSIC_ROCKET_ENCOUNTER
	showemote EMOTE_SHOCK, STANDCITYROCKETHOUSE_ROCKET, 30
	applymovement STANDCITYROCKETHOUSE_ROCKET, ShockedRocket1Step 
	turnobject PLAYER, DOWN
	opentext
	writetext RocketShockedText
	waitbutton
	closetext
	winlosstext ShockedRocketWinText, ShockedRocketLossText
	loadtrainer GRUNTM, GRUNTM_5
	startbattle
	reloadmapafterbattle
	turnobject STANDCITYROCKETHOUSE_ROCKET, UP
	setscene SCENE_STAND_CITY_ROCKET_HOUSE_NOTHING
	end
RocketSpotsTop3:
	turnobject STANDCITYROCKETHOUSE_ROCKET, UP
	playmusic MUSIC_ROCKET_ENCOUNTER
	showemote EMOTE_SHOCK, STANDCITYROCKETHOUSE_ROCKET, 30
	turnobject PLAYER, DOWN
	opentext
	writetext RocketShockedText
	waitbutton
	closetext
	winlosstext ShockedRocketWinText, ShockedRocketLossText
	loadtrainer GRUNTM, GRUNTM_5
	startbattle
	reloadmapafterbattle
	turnobject STANDCITYROCKETHOUSE_ROCKET, UP
	setscene SCENE_STAND_CITY_ROCKET_HOUSE_NOTHING
	end
RocketSpotsBottom1:
	turnobject STANDCITYROCKETHOUSE_ROCKET, DOWN
	playmusic MUSIC_ROCKET_ENCOUNTER
	showemote EMOTE_SHOCK, STANDCITYROCKETHOUSE_ROCKET, 30
	turnobject PLAYER, UP
	opentext
	writetext RocketShockedText
	waitbutton
	closetext
	winlosstext ShockedRocketWinText, ShockedRocketLossText
	loadtrainer GRUNTM, GRUNTM_5
	startbattle
	reloadmapafterbattle
	turnobject STANDCITYROCKETHOUSE_ROCKET, DOWN
	setscene SCENE_STAND_CITY_ROCKET_HOUSE_NOTHING
	end
RocketSpotsBottom2:
	turnobject STANDCITYROCKETHOUSE_ROCKET, DOWN
	playmusic MUSIC_ROCKET_ENCOUNTER
	showemote EMOTE_SHOCK, STANDCITYROCKETHOUSE_ROCKET, 30
	applymovement STANDCITYROCKETHOUSE_ROCKET, ShockedRocket1StepDown
	turnobject PLAYER, UP
	opentext
	writetext RocketShockedText
	waitbutton
	closetext
	winlosstext ShockedRocketWinText, ShockedRocketLossText
	loadtrainer GRUNTM, GRUNTM_5
	startbattle
	reloadmapafterbattle
	turnobject STANDCITYROCKETHOUSE_ROCKET, DOWN
	setscene SCENE_STAND_CITY_ROCKET_HOUSE_NOTHING
	end
RocketSpotsBottom3:
	turnobject STANDCITYROCKETHOUSE_ROCKET, DOWN
	playmusic MUSIC_ROCKET_ENCOUNTER
	showemote EMOTE_SHOCK, STANDCITYROCKETHOUSE_ROCKET, 30
	applymovement STANDCITYROCKETHOUSE_ROCKET, ShockedRocket2StepsDown
	turnobject PLAYER, UP
	opentext
	writetext RocketShockedText
	waitbutton
	closetext
	winlosstext ShockedRocketWinText, ShockedRocketLossText
;	loadtrainer SABRINA, SABRINA1,
	loadtrainer GRUNTM, GRUNTM_5
	startbattle
	reloadmapafterbattle
	turnobject STANDCITYROCKETHOUSE_ROCKET, DOWN
	setscene SCENE_STAND_CITY_ROCKET_HOUSE_NOTHING
	end
	
StandCityRocketHouse1FPoster:
	jumptext StandCityRocketHouse1FPosterText

StandCityRocketHouse1FTV:
	jumptext StandCityRocketHouse1FTVText

WardensGranddaughter:
	jumptextfaceplayer WardensGranddaughterText1
	
OkeraGoesToZoo:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end
	
SilverWalksToHiddenStairsMovement2Part2:
	step DOWN
	step DOWN
	step RIGHT
	step DOWN
	step DOWN
	step_end
	
StairsTimeOneStepDown:
	step DOWN
	step_end
	
SilverWalksToHiddenStairsMovementPart2:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step_end

SilverWalksToHiddenStairsMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end
	
SilverWalksToHiddenStairsMovement2:
	step DOWN
	step DOWN
	step DOWN
	step_end

ShockedRocket1StepDown:
	step DOWN
	step_end
	
ShockedRocket2StepsDown:
	step DOWN
	step DOWN
	step_end

ShockedRocket2Steps:
	step UP
	step UP
	step_end
	
ShockedRocket1Step:
	step UP
	step_end
	
SilverActuallyShowsUpMovement:
	step RIGHT
	step_end
	
SilverRunsIntoStairsMovement:	
	big_step DOWN
	big_step DOWN
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end
	
SilverActuallyShowsUpNow1:
    text "Wartet auf mich!"
	done
	
SilverActuallyShowsUpNow2:
    text "<RIVAL>: Ich bin"
    line "auch stark!"

    para "Es ist Zeit, dass"
    line "ich TEAM ROCKET"
    para "zeige, wer hier"
    line "der Boss ist!"
	done
	
SilverActuallyShowsUpNow3:
    text "RABAN: Äh, klar."

    para "Je mehr, desto"
    line "besser, schätze"
    cont "ich."
	done
	
SilverActuallyShowsUpNow4:
    text "<RIVAL>: O.K.!"

    para "Los geht's,"
    line "<PLAYER>!"
	done
	
SilverActuallyShowsUpNow5:
    text "Du solltest ihm"
    line "besser folgen,"
    para "bevor er sich"
    line "irgendwelchen"
    cont "Ärger einhandelt."

    para "Ich werde ver-"
    line "suchen den kranken"
    para "#MON drüben im"
    line" ZOO zu helfen."
	done
	
StandCityRocketHouse1FTVText:
	text "Er ist nicht"
	line "eingeschaltet…"
	done
	
StandCityRocketHouse1FPosterText:
	text "Alle #MON sind"
	line "für TEAM ROCKETs"
	cont "Profit da!"
	done
	
SilverLetsGoDownThere:
    text "Wie geht es deinen"
    line "#MON?"

    para "Meinen geht es"
    line "nicht so gut."

    para "Ich glaube, was"
    line "immer TEAM ROCKET"
    para "anstellt, macht"
    line "die #MON krank!"

    para "…"

    para "Zeig mir, dass ich"
    line "nicht grundlos"
    para "gegen dich verloren"
    line "habe!"

    para "Geh da runter und"
    line "schmeiß diese"
    para "Typen aus meiner"
    line "Stadt!"
	done
	
SilverTellsYouAboutHiddenStairs2:
    text "Genau hier!"

    para "TEAM ROCKET ver-"
    line "steckt sich dort"
    cont "unten!"
	done
	
SilverShowsUpInBase:
    text "RABAN: <PLAYER>!"

    para "Warte, geh nicht!"
	done
	
SilverTellsYouAboutHiddenStairs:
    text "Ich weiß nicht,"
    line "was diese Rüpel"
    para "von TEAM ROCKET"
    line "hier in meiner"
    para "Stadt vorhaben,"
    line "aber es ist sicher"
    cont "nichts Gutes!"

    para "Ich habe gehört,"
    line "wie einer von"
    para "ihnen über einen"
    line "versteckten Keller"
    para "in diesem Gebäude"
    line "gesprochen hat."
	done
	
ShockedRocketWinText:
	text "Argh!"
	done

ShockedRocketLossText:
	text "Argh?"
	done

RocketShockedText:
    text "Und wer bist du?"

    para "Ich hoffe, du hast"
    line "nicht gedacht, du"
    cont "könntest an mir"
    line "vorbeischleichen!"

    para "Niemand schleicht"
    line "sich einfach an"
    cont "mir vorbei!"
	done
	
WardensGranddaughterText1:
    text "Du kannst viel-"
    line "leicht nicht an"
    para "mir vorbeischlei-"
    line "chen, aber mit so"
    para "starken #MON,"
    line "kannst du einfach"
    cont "durchlaufen…"
	done



StandCityRocketHouse_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  6,  7, STAND_CITY, 6
	warp_event  7,  7, STAND_CITY, 6
	warp_event 19,  7, TEAM_ROCKET_BASE_B1F, 1
	warp_event 19,  1, STAND_CITY_ROCKET_HOUSE_2F, 1

	db 8 ; coord events
	coord_event 15,  1, SCENE_DEFAULT, RocketSpotsTop1
	coord_event 15,  2, SCENE_DEFAULT, RocketSpotsTop2
	coord_event 15,  3, SCENE_DEFAULT, RocketSpotsTop3
	coord_event 15,  5, SCENE_DEFAULT, RocketSpotsBottom1
	coord_event 15,  6, SCENE_DEFAULT, RocketSpotsBottom2
	coord_event 15,  7, SCENE_DEFAULT, RocketSpotsBottom3
	coord_event 18,  1, SCENE_STAND_CITY_ROCKET_HOUSE_BASE_UNCOVERED, SilverFindsStairsLeft
	coord_event 19,  2, SCENE_STAND_CITY_ROCKET_HOUSE_BASE_UNCOVERED, SilverFindsStairsDown

	db 2 ; bg events
	bg_event  6,  0, BGEVENT_READ, StandCityRocketHouse1FPoster
	bg_event 12,  1, BGEVENT_READ, StandCityRocketHouse1FTV

	db 3 ; object events
	object_event 15,  4, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, WardensGranddaughter, EVENT_ROCKETS_IN_STAND_CITY
	object_event -5, -5, SPRITE_CHUCK, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event -5, -5, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
