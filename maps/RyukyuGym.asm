	object_const_def ; object_event constants
	const RYUKYU_GYM_LASS
	const RYUKYU_GYM_YOUNGSTER
	const RYUKYU_GYM_POKEFAN_M
	const RYUKYU_GYM_GYM_GUY


RyukyuGym_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .RyukyuGymTypeChange
	
.RyukyuGymTypeChange:
	checkevent EVENT_GOT_PALSSIO_FROM_OAK
	iftrue .GrassGym
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .FireGym
	jump .doneGym
.GrassGym:
	changeblock  3, 1, $3F ; grass
	changeblock  5, 1, $7D ; grass
	changeblock  3, 3, $3F ; grass
	changeblock  5, 3, $3F ; grass
	changeblock  3, 5, $3F ; grass
	changeblock  5, 5, $7D ; grass
	changeblock  3, 7, $3F ; grass
	changeblock  5, 7, $3F ; grass
	changeblock  3, 9, $3F ; grass
	changeblock  5, 9, $7D ; grass
	changeblock  3, 11, $3F ; grass
	changeblock  5, 11, $3F ; grass
	changeblock  3, 13, $3F ; grass
	changeblock  5, 13, $7D ; grass
	changeblock  3, 15, $3F ; grass
	changeblock  5, 15, $3F ; grass
	changeblock  3, 17, $3F ; grass
	changeblock  5, 17, $7D ; grass
	changeblock  13, 1, $7D ; grass
	changeblock  15, 1, $3F ; grass
	changeblock  13, 3, $3F ; grass
	changeblock  15, 3, $3F ; grass
	changeblock  13, 5, $7D ; grass
	changeblock  15, 5, $3F ; grass
	changeblock  13, 7, $3F ; grass
	changeblock  15, 7, $3F ; grass
	changeblock  13, 9, $7D ; grass
	changeblock  15, 9, $3F ; grass
	changeblock  13, 11, $3F ; grass
	changeblock  15, 11, $3F ; grass
	changeblock  13, 13, $7D ; grass
	changeblock  15, 13, $3F ; grass
	changeblock  13, 15, $3F ; grass
	changeblock  15, 15, $3F ; grass
	changeblock  13, 17, $7D ; grass
	changeblock  15, 17, $3F ; grass
	return
	
.FireGym:
	changeblock  3, 1, $3B ; fire
	changeblock  5, 1, $59 ; fire
	changeblock  3, 3, $3B ; fire
	changeblock  5, 3, $3B ; fire
	changeblock  3, 5, $3B ; fire
	changeblock  5, 5, $59 ; fire
	changeblock  3, 7, $3B ; fire
	changeblock  5, 7, $3B ; fire
	changeblock  3, 9, $3B ; fire
	changeblock  5, 9, $59 ; fire
	changeblock  3, 11, $3B ; fire
	changeblock  5, 11, $3B ; fire
	changeblock  3, 13, $3B ; fire
	changeblock  5, 13, $59 ; fire
	changeblock  3, 15, $3B ; fire
	changeblock  5, 15, $3B ; fire
	changeblock  3, 17, $3B ; fire
	changeblock  5, 17, $59 ; fire
	changeblock  13, 1, $59 ; fire
	changeblock  15, 1, $3B ; fire
	changeblock  13, 3, $3B ; fire
	changeblock  15, 3, $3B ; fire
	changeblock  13, 5, $59 ; fire
	changeblock  15, 5, $3B ; fire
	changeblock  13, 7, $3B ; fire
	changeblock  15, 7, $3B ; fire
	changeblock  13, 9, $59 ; fire
	changeblock  15, 9, $3B ; fire
	changeblock  13, 11, $3B ; fire
	changeblock  15, 11, $3B ; fire
	changeblock  13, 13, $59 ; fire
	changeblock  15, 13, $3B ; fire
	changeblock  13, 15, $3B ; fire
	changeblock  15, 15, $3B ; fire
	changeblock  13, 17, $59 ; fire
	changeblock  15, 17, $3B ; fire
	return
	
.doneGym
	return
	

	
RyukyuGymPokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .GotChikoritaGiveCubburn
	checkevent EVENT_GOT_PALSSIO_FROM_OAK
	iftrue .GotCruiseGiveChikorita
	checkevent EVENT_DEFEATED_FAKE_GYM_LEADER
	iftrue .AfterBattleFakeGymWater
	writetext PokefanMBeforeTextWater
	waitbutton
	closetext
	winlosstext PokefanMWinTextFake, PokefanMLossTextFake
	loadtrainer POKEFANM, TREVOR
	startbattle
	reloadmapafterbattle
	setevent EVENT_DEFEATED_FAKE_GYM_LEADER
	opentext
.AfterBattleFakeGymWater
	checkevent EVENT_GOT_EGG_FROM_FAKE_GYM
	iftrue .AlreadyGotEgg2Water
	writetext HaveStarter2Egg
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullStarter2
	giveegg PALSSIO, 5
	stringtotext .eggname2, MEM_BUFFER_1
	scall .GetStarter2Egg
	setevent EVENT_GOT_EGG_FROM_FAKE_GYM
.AlreadyGotEgg2Water
	writetext TakeGoodCareOfStarter2
	waitbutton
	closetext
	end
	
.GotChikoritaGiveCubburn
	checkevent EVENT_DEFEATED_FAKE_GYM_LEADER
	iftrue .AfterBattleFakeGymFire
	writetext PokefanMBeforeTextFire
	waitbutton
	closetext
	winlosstext PokefanMWinTextFake, PokefanMLossTextFake
	loadtrainer HIKER, BAILEY
	startbattle
	reloadmapafterbattle
	setevent EVENT_DEFEATED_FAKE_GYM_LEADER
	opentext
.AfterBattleFakeGymFire
	checkevent EVENT_GOT_EGG_FROM_FAKE_GYM
	iftrue .AlreadyGotEgg2Fire
	writetext HaveStarter2Egg
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullStarter2
	giveegg CUBBURN, 5
	stringtotext .eggname2, MEM_BUFFER_1
	scall .GetStarter2Egg
	setevent EVENT_GOT_EGG_FROM_FAKE_GYM
.AlreadyGotEgg2Fire
	writetext TakeGoodCareOfStarter2
	waitbutton
	closetext
	end
	
.GotCruiseGiveChikorita
	checkevent EVENT_DEFEATED_FAKE_GYM_LEADER
	iftrue .AfterBattleFakeGymGrass
	writetext PokefanMBeforeTextGrass
	waitbutton
	closetext
	winlosstext PokefanMWinTextFake, PokefanMLossTextFake
	loadtrainer POKEFANM, CARTER
	startbattle
	reloadmapafterbattle
	setevent EVENT_DEFEATED_FAKE_GYM_LEADER
	opentext
.AfterBattleFakeGymGrass
	checkevent EVENT_GOT_EGG_FROM_FAKE_GYM
	iftrue .AlreadyGotEgg2Grass
	writetext HaveStarter2Egg
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullStarter2
	giveegg CHIKORITA, 5
	stringtotext .eggname2, MEM_BUFFER_1
	scall .GetStarter2Egg
	setevent EVENT_GOT_EGG_FROM_FAKE_GYM
.AlreadyGotEgg2Grass
	writetext TakeGoodCareOfStarter2
	waitbutton
	closetext
	end
	
.PartyFullStarter2
	writetext NoRoomForStarter2
	waitbutton
	closetext
	end
	
.GetStarter2Egg:
	jumpstd ReceiveTogepiEggScript
	end
	
.eggname2
	db "EI@"
	
Trainer1Scene:
	playmusic MUSIC_BEAUTY_ENCOUNTER
	showemote EMOTE_SHOCK, RYUKYU_GYM_LASS, 30
	turnobject PLAYER, LEFT
	opentext
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .Trainer1GotChikoritaUseFire
	checkevent EVENT_GOT_PALSSIO_FROM_OAK
	iftrue .Trainer1GotCruiseUseGrass
	writetext LassTextBeforeWater
	waitbutton
	closetext
	winlosstext LassWinTextWater, LassLossTextWater
	loadtrainer LASS, LINDA
	startbattle
	reloadmapafterbattle
	setscene SCENE_RYUKYU_GYM_TRAINER_2
	end
	
.Trainer1GotChikoritaUseFire
	writetext LassTextBeforeFire
	waitbutton
	closetext
	winlosstext LassWinTextFire, LassLossTextFire
	loadtrainer LASS, ALICE
	startbattle
	reloadmapafterbattle
	setscene SCENE_RYUKYU_GYM_TRAINER_2
	end
	
.Trainer1GotCruiseUseGrass
	writetext LassTextBeforeGrass
	waitbutton
	closetext
	winlosstext LassWinTextGrass, LassLossTextGrass
	loadtrainer PICNICKER, TANYA
	startbattle
	reloadmapafterbattle
	setscene SCENE_RYUKYU_GYM_TRAINER_2
	end
	
Trainer2Scene:
	playmusic MUSIC_YOUNGSTER_ENCOUNTER
	showemote EMOTE_SHOCK, RYUKYU_GYM_YOUNGSTER, 30
	opentext
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .Trainer2GotChikoritaUseFire
	checkevent EVENT_GOT_PALSSIO_FROM_OAK
	iftrue .Trainer2GotCruiseUseGrass
	writetext YoungsterTextBeforeWater
	waitbutton
	closetext
	winlosstext YoungsterWinTextWater, YoungsterLossTextWater
	loadtrainer SCHOOLBOY, KIPP
	startbattle
	reloadmapafterbattle
	setscene SCENE_RYUKYU_GYM_NOTHING
	end

.Trainer2GotChikoritaUseFire
	writetext YoungsterTextBeforeFire
	waitbutton
	closetext
	winlosstext YoungsterWinTextFire, YoungsterLossTextFire
	loadtrainer YOUNGSTER, JASON
	startbattle
	reloadmapafterbattle
	setscene SCENE_RYUKYU_GYM_NOTHING
	end

.Trainer2GotCruiseUseGrass
	writetext YoungsterTextBeforeGrass
	waitbutton
	closetext
	winlosstext YoungsterWinTextGrass, YoungsterLossTextGrass
	loadtrainer YOUNGSTER, OWEN
	startbattle
	reloadmapafterbattle
	setscene SCENE_RYUKYU_GYM_NOTHING
	end
	
RyukyuGymYoungsterScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .Trainer2AfterFire
	checkevent EVENT_GOT_PALSSIO_FROM_OAK
	iftrue .Trainer2AfterGrass
	writetext Trainer2AfterWaterText
	waitbutton
	closetext
	end
.Trainer2AfterFire
	writetext Trainer2AfterFireText
	waitbutton
	closetext
	end
.Trainer2AfterGrass
	writetext Trainer2AfterGrassText
	waitbutton
	closetext
	end
	
RyukyuGymLassScript:
	jumptextfaceplayer RyukyuGymLassText
	
RyukyuGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_DEFEATED_FAKE_GYM_LEADER
	iftrue .GymGuyFakeGymAfter
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .GymGuyFire
	checkevent EVENT_GOT_PALSSIO_FROM_OAK
	iftrue .GymGuyGrass
	writetext GymGuyWaterText
	waitbutton
	closetext
	end
.GymGuyFire
	writetext GymGuyFireText
	waitbutton
	closetext
	end
.GymGuyGrass
	writetext GymGuyGrassText
	waitbutton
	closetext
	end
.GymGuyFakeGymAfter
	writetext GymGuyFakeGymAfterText
	waitbutton
	closetext
	end

GymGuyFakeGymAfterText:
	text "Es macht immer"
	line "Spaß, in einer"
	cont "ARENA zu kämpfen."

	para "Auch wenn man"
	line "keinen ORDEN"
	cont "bekommt."
	done
	
GymGuyFireText:
	text "Was ist das?"

	para "Eine #MON-"
	line "ARENA?"

	para "Naja, nicht ganz."

	para "LUDWIG wollte"
	line "schon immer"
	cont "ARENLEITER sein."

	para "Offiziell einer zu"
	line "werden ist aber"
	cont "schwer und dauert"
	cont "lange."

	para "Bis er wirklich"
	line "einer ist, Spielen"
    cont "wir einfach ARENA."

	para "Ach ja, er setzt"
	line "Feuer-#MON"
	cont "ein."

	para "Du weißt sicher,"
	line "was du tun musst,"
	cont "um zu gewinnen."
	done
	
GymGuyWaterText:
	text "Was ist das?"

	para "Eine #MON-"
	line "ARENA?"

	para "Naja, nicht ganz."
	para "REINHOLD wollte"
	line "schon immer"
	cont "ARENLEITER sein."

	para "Offiziell einer zu"
	line "werden ist aber"
	cont "schwer und dauert"
	cont "lange."

	para "Bis er wirklich"
	line "einer ist, Spielen"
    cont "wir einfach ARENA."

	para "Ach ja, er setzt"
	line "Wasser-#MON"
	cont "ein."

	para "Du weißt sicher,"
	line "was du tun musst,"
	cont "um zu gewinnen."
	done
	
GymGuyGrassText:
	text "Was ist das?"

	para "Eine #MON-"
	line "ARENA?"

	para "Naja, nicht ganz."
	para "ERNST wollte"
	line "schon immer"
	cont "ARENLEITER sein."

	para "Offiziell einer zu"
	line "werden ist aber"
	cont "schwer und dauert"
	cont "lange."

	para "Bis er wirklich"
	line "einer ist, Spielen"
    cont "wir einfach ARENA."

	para "Ach ja, er setzt"
	line "Pflanzen-#MON"
	cont "ein."

	para "Du weißt sicher,"
	line "was du tun musst,"
	cont "um zu gewinnen."
	done
	
RyukyuGymLassText:
	text "Ist das nicht"
	line "richtig cool?"

	para "Fast wie in einer"
	line "echten ARENA!"
	done
	
Trainer2AfterFireText:
    text "LUDWIG wollte"
    line "schon immer ein"
    cont "ARENALEITER sein."

    para "Die Zulassung zu"
    line "bekommen, ist aber"
    cont "sehr schwer."
	done
	
Trainer2AfterGrassText:
    text "ERNST wollte"
    line "schon immer ein"
    cont "ARENALEITER sein."

    para "Die Zulassung zu"
    line "bekommen, ist aber"
    cont "sehr schwer."
	done
	
Trainer2AfterWaterText:
    text "REINHOLD wollte"
    line "schon immer ein"
    cont "ARENALEITER sein."

    para "Die Zulassung zu"
    line "bekommen, ist aber"
    cont "sehr schwer."
	done

TakeGoodCareOfStarter2:
TakeGoodCareOfStarter2:
	text "Kümmere dich gut"
	line "um das #MON!"

	para "Es ist eine"
	line "meiner liebsten"
	cont "Arten!"
	done
	
HaveStarter2Egg:
	text "Wow! Das war ein"
	line "klasse Kampf!"

	para "Ich fühlte mich"
	line "wie ein echter"
	para "ARENLEITER, auch"
	line "wenn ich verloren"
    cont "habe."

	para "Einen ORDEN kann"
	line "ich dir nicht"
	para "geben, aber ich"
	line "habe ein EI."

	para "Es ist von einem"
	line "seltenen #MON"
	cont "meines Lieblings-"
	cont "typs!"

	para "Hier, nimm es!"
	done
	
NoRoomForStarter2:
	text "Oh, warte!"

	para "Du musst erst"
	line "Platz schaffen!"
	done
	
	
PokefanMBeforeTextWater:
	text "Hey!"

	para "Willkommen in"
	line "meiner ARENA!"

	para "…Naja, es ist"
	line "keine offizielle."

	para "Aber eines Tages"
	line "werde ich ein"
	cont "ARENLEITER!"

	para "Bis dahin spiele"
	line "ich die Rolle."

	para "Es gibt nichts,"
	line "was ich mehr"
	para "liebe, als einen"
	line "guten Kampf!"

	para "Wasser-#MON"
	line "sind meine"
	cont "Favoriten!"

	para "Die durchnässen"
	line "dich komplett!"

	para "Bist du bereit?"
	done

PokefanMLossTextFake:
	text "Ich bin echt"
	line "gut darin!"
	done
	
PokefanMWinTextFake:
	text "Hahaha! Das hat"
	line "echt Spaß gemacht!"
	done

	
PokefanMBeforeTextGrass:
	text "Hey!"

	para "Willkommen in"
	line "meiner ARENA!"

	para "…Naja, es ist"
	line "keine offizielle."

	para "Aber eines Tages"
	line "werde ich ein"
	cont "ARENLEITER!"

	para "Bis dahin spiele"
	line "ich die Rolle."

	para "Es gibt nichts,"
	line "was ich mehr"
	para "liebe, als einen"
	line "guten Kampf!"

    para "Pflanzen-#MON"
    line "sind meine"
    cont "Favoriten!"

    para "Ihre Ranken und"
    line "Blätter hauen dich"
    cont "kurz und klein!"

    para "Bist du bereit?"
	done


	
PokefanMBeforeTextFire:
	text "Hey!"

	para "Willkommen in"
	line "meiner ARENA!"

	para "…Naja, es ist"
	line "keine offizielle."

	para "Aber eines Tages"
	line "werde ich ein"
	cont "ARENLEITER!"

	para "Bis dahin spiele"
	line "ich die Rolle."

	para "Es gibt nichts,"
	line "was ich mehr"
	para "liebe, als einen"
	line "guten Kampf!"

    para "Feuer-#MON"
    line "sind meine"
    cont "Favoriten!"

    para "Die brennen dich"
    line "nieder, wenn du"
    cont "dich mit ihnen"
    cont "anlegst!"

    para "Bist du bereit?"
	done
	
YoungsterTextBeforeWater:
    text "Warst du schon mal"
    line "schwimmen?"

    para "Meine #MON"
    line "waren schon."
	done
	
YoungsterLossTextWater:
	text "Wuhuu!"
	done
	
YoungsterWinTextWater:
    text "Sieht so aus, als"
    line "künntest du über"
    cont "Wasser bleiben!"
	done

YoungsterTextBeforeFire:
	text "Packst du die"
	line "Hitze?"
	done
	
YoungsterLossTextFire:
	text "Wuhuu!"
	done
	
YoungsterWinTextFire:
    text "Da wurde ich wohl"
    line "verbrannt!"
	done

YoungsterTextBeforeGrass:
    text "Stolper nicht über"
    line "die Ranken von"
    cont "meinen #MON!"
	done
	
YoungsterLossTextGrass:
	text "Wuhuu!"
	done
	
YoungsterWinTextGrass:
	text "Ich bin selber"
	line "gestolpert!"
	done
	
LassTextBeforeGrass:
	text "Ist es hier nicht"
	line "wunderschön?"

	para "Ich habe Snacks"
	line "für ein Picknick"
	cont "mitgebracht!"
	done
	
LassLossTextGrass:
	text "Wuhuu!"
	
LassWinTextGrass:
	text "Zumindest ist die"
	line "Luft noch süß."
	done
	
LassTextBeforeWater:
	text "Vorsicht, der"
	line "Boden ist glatt!"
	done
	
LassLossTextWater:
	text "Wuhuu!"
	
LassWinTextWater:
	text "Ich bin"
	line "ausgerutscht!"
	done
	
LassTextBeforeFire:
    text "In so einem heißen"
    line "Raum, gibt es doch"
    para "nichts Besseres,"
    line "als einen heißen"
    cont "Kampf!"
	done
	
LassLossTextFire:
	text "Wuhuu!"
	
LassWinTextFire:
	text "Zu heiß!"
	done
	
RyukyuGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 17, RYUKYU_CITY, 9
	warp_event  9, 17, RYUKYU_CITY, 10


	db 2 ; coord events
	coord_event  8, 11, SCENE_DEFAULT, Trainer1Scene
	coord_event  7,  7, SCENE_RYUKYU_GYM_TRAINER_2, Trainer2Scene

	db 0 ; bg events

	db 4 ; object events
	object_event  7, 11, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, RyukyuGymLassScript, -1
	object_event  7,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RyukyuGymYoungsterScript, -1
	object_event  9,  0, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, RyukyuGymPokefanMScript, -1
	object_event 10, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RyukyuGymGuyScript, -1
