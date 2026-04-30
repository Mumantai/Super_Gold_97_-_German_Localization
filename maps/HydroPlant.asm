	object_const_def ; object_event constants
	const HYDROBIKER1
	const HYDROBIKER2
	const HYDROBIKER3
	const HYDROBIKER4
	const HYDROBIKER5
	const HYDROBIKER6
	const HYDROBIKER7
	const HYDROBIKER8
	const HYDROBIKER9
	const HYDROEMPLOYEE1
	const HYDROEMPLOYEE2
	const HYDROEMPLOYEE3
	const HYDROEMPLOYEE4
	const HYDROEMPLOYEE5

HydroPlant_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


TrainerBikerKazu:
	trainer BIKER, KAZU, EVENT_BEAT_BIKER_KAZU, BikerKazuSeenText, BikerKazuBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerKazuAfterBattleText
	waitbutton
	closetext
	end
	

TrainerBikerBenny:
	trainer BIKER, BENNY, EVENT_BEAT_BIKER_BENNY, BikerBennySeenText, BikerBennyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerBennyAfterBattleText
	waitbutton
	closetext
	end
	
TrainerBikerDwayne:
	trainer BIKER, DWAYNE, EVENT_BEAT_BIKER_DWAYNE, BikerDwayneSeenText, BikerDwayneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerDwayneAfterBattleText
	waitbutton
	closetext
	end


TrainerBikerHarris:
	trainer BIKER, HARRIS, EVENT_BEAT_BIKER_HARRIS, BikerHarrisSeenText, BikerHarrisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerHarrisAfterBattleText
	waitbutton
	closetext
	end
	

TrainerBikerZeke:
	trainer BIKER, ZEKE, EVENT_BEAT_BIKER_ZEKE, BikerZekeSeenText, BikerZekeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerZekeAfterBattleText
	waitbutton
	closetext
	end
	

TrainerBikerCharles:
	trainer BIKER, CHARLES, EVENT_BEAT_BIKER_CHARLES, BikerCharlesSeenText, BikerCharlesBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerCharlesAfterBattleText
	waitbutton
	closetext
	end
	

TrainerBikerRiley:
	trainer BIKER, RILEY, EVENT_BEAT_BIKER_RILEY, BikerRileySeenText, BikerRileyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerRileyAfterBattleText
	waitbutton
	closetext
	end


TrainerBikerJoel:
	trainer BIKER, JOEL, EVENT_BEAT_BIKER_JOEL, BikerJoelSeenText, BikerJoelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerJoelAfterBattleText
	waitbutton
	closetext
	end
	

TrainerBikerGlenn:
	trainer BIKER, GLENN, EVENT_BEAT_BIKER_GLENN, BikerGlennSeenText, BikerGlennBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerGlennAfterBattleText
	waitbutton
	closetext
	end
	
HydroPlantLassScript:
	jumptextfaceplayer HydroPlantLassText

HydroPlantGentlemanScript:
	jumptextfaceplayer HydroPlantGentlemanText

HydroPlantGentlenman2Script:
	jumptextfaceplayer HydroPlantGentlenman2Text

HydroPlantRockerScript:
	jumptextfaceplayer HydroPlantRockerText
	

HydroPlantTeacherScript:
	jumptextfaceplayer HydroPlantTeacherText
	
HydroPlantNugget:
	hiddenitem NUGGET, EVENT_HYDRO_PLANT_NUGGET
	
HydroPlantTeacherText:
    text "Oh, hallo!"

    para "Du hast geholfen,"
    line "diese BIKER los-"
    cont "zuwerden, oder?"

    para "Tausend Dank!"
	done

HydroPlantRockerText:
    text "Ich kann es kaum"
    line "erwarten, meinen"
    para "Freunden davon zu"
    line "erzählen, was"
    para "heute auf der Ar-"
    line "beit passiert ist!"
	done
	
HydroPlantGentlenman2Text:
    text "Bei dem ganzen"
    line "Lärm, den diese"
    para "BIKER machten, war"
    line "es unmöglich, zu"
    cont "arbeiten!"
	done
	
HydroPlantGentlemanText:
    text "Nun ja, die Arbeit"
    line "war heute wirklich"
    cont "interessant!"
	done
	
HydroPlantLassText:
    text "Die Energie, die"
    line "dieses KRAFTWERK"
    para "erzeugt, versorgt"
    line "die gesamten"
    cont "SÜDWESTINSELN."
	done

BikerRileySeenText:
    text "Arbeitest du hier?"
	done

BikerRileyBeatenText:
	text "Ich bin gefeuert!"
	done
	
BikerRileyAfterBattleText:
    text "Ich glaube, wir"
    line "haben endlich alle"
    para "Mitarbeiter von"
    line "hier vertrieben!"
	done

BikerCharlesSeenText:
	text "Bist du hier, um"
	line "uns den Spaß zu"
	cont "verderben?"
	done
	
BikerCharlesBeatenText:
	text "Verlieren ist"
	line "so lahm!"
	done
	
BikerCharlesAfterBattleText:
    text "Alles, was wir"
    line "wollen, ist zu"
    cont "fahren!"
	done

BikerHarrisSeenText:
    text "Was unser großer"
    line "Plan hier ist?"

    para "Nichts, wirklich."

    para "Wir haben einfach"
    line "etwas Spaß!"
	done 
	
BikerHarrisBeatenText:
	text "Spaß vorbei!"
	done
	
BikerHarrisAfterBattleText:
    text "Kümmert doch"
    line "keinen, wenn es"
    para "mal für 'ne Weile"
    line "trockener ist,"
    cont "oder?"
	done

BikerDwayneSeenText:
    text "Kennst du ein paar"
    line "gute Orte, um zu"
    cont "fahren?"
	done
BikerDwayneBeatenText:
    text "Ausgebremst!"
	done
	
BikerDwayneAfterBattleText:
    text "Vielleicht gehe"
    line "ich nach II-SHIMA"
    para "und fahre mit den"
    line "anderen herum."
	done

BikerKazuSeenText:
	text "Wir sind NIHONs"
	line "Insel-BIKER!"

	para "Was, du hast noch"
	line "nie von uns"
	cont "gehört?"
	done
	
BikerKazuBeatenText:
	text "Insel-Biker am"
	line "Boden!"
	done
	
BikerKazuAfterBattleText:
    text "Ja, der Name will"
    line "nicht so recht"
    cont "hängenbleiben."

    para "Selbst bei meinen"
    line "Freunden nicht."
	done

BikerBennySeenText:
	text "Kein Platz für"
	line "Langweiler!"
	done
	
BikerBennyBeatenText:
	text "Okay, das war gut."
	done
	
BikerBennyAfterBattleText:
    text "Wer mich besiegt,"
    line "kann einfach kein"
    cont "Langweiler sein."
	done
	
BikerZekeSeenText:
    text "Denkst du, die"
    line "Bullen kommen bald"
    para "und werfen uns"
    line "hier raus?"
	done
	
BikerZekeBeatenText:
	text "Bist du 'n Bulle?"
	done
	
BikerZekeAfterBattleText:
	text "Ich wette, meine"
	line "Mutter wäre sauer"
	para "auf mich, wenn ich"
	line "Ärger mit der"
	cont "Polizei bekäme."
	done
	
BikerJoelSeenText:
    text "Keiner kann uns"
    line "BIKERn sagen, was"
    cont "wir tun und lassen"
    cont "sollen!"
	done
	
BikerJoelBeatenText:
    text "Ich schätze, ich"
    line "kann dich nicht im"
    cont "Kampf besiegen."
	done
	
BikerJoelAfterBattleText:
    text "Pft, na und?"

    para "Ich fahr einfach"
    line "weiter!"
	done

BikerGlennSeenText:
    text "Wo sind die Bullen"
    line "denn hin?"

    para "Haben wie die auch"
    line "verscheucht?"
	done
	
BikerGlennBeatenText:
	text "Du hast keine"
	line "Angst!"
	done
	
BikerGlennAfterBattleText:
    text "Lass sie nicht"
    line "wissen, dass wir"
    cont "hier sind, okay?"
	done
	

HydroPlant_MapEvents:
	db 0, 0 ; filler

	db 28 ; warp events
	warp_event 18, 35, WEATHERED_TRAIL, 1
	warp_event 19, 35, WEATHERED_TRAIL, 2
	warp_event 29,  0, HYDRAULIC_CAVE, 1
	warp_event 30,  0, HYDRAULIC_CAVE, 1
	warp_event  5, 30, HYDRO_PLANT, 6
	warp_event  9, 31, HYDRO_PLANT, 5
	warp_event  9, 28, HYDRO_PLANT, 8
	warp_event 35,  2, HYDRO_PLANT, 7
	warp_event 13, 28, HYDRO_PLANT, 10
	warp_event 37, 11, HYDRO_PLANT, 9
	warp_event 19, 30, HYDRO_PLANT, 12
	warp_event  5, 27, HYDRO_PLANT, 11
	warp_event  3, 26, HYDRO_PLANT, 14
	warp_event  5,  2, HYDRO_PLANT, 13
	warp_event  3, 21, HYDRO_PLANT, 16
	warp_event 37, 29, HYDRO_PLANT, 15
	warp_event 33, 33, HYDRO_PLANT, 18
	warp_event 11, 20, HYDRO_PLANT, 17
	warp_event  3, 15, HYDRO_PLANT, 20
	warp_event 27, 32, HYDRO_PLANT, 19
	warp_event 13,  7, HYDRO_PLANT, 22
	warp_event 29,  8, HYDRO_PLANT, 21
	warp_event 11, 16, HYDRO_PLANT, 24
	warp_event 37, 23, HYDRO_PLANT, 23
	warp_event 15, 14, HYDRO_PLANT, 26
	warp_event  9,  2, HYDRO_PLANT, 25
	warp_event 29,  3, HYDRO_PLANT, 28
	warp_event 15, 35, HYDRO_PLANT, 27
	
	db 0 ; coord events

	db 1 ; bg events
	bg_event 20,  8, BGEVENT_ITEM, HydroPlantNugget

	db 14 ; object events
	object_event 11, 33, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerBikerBenny, EVENT_IEJIMA_TOWN_FIXED
	object_event 30, 16, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 3, TrainerBikerKazu, EVENT_IEJIMA_TOWN_FIXED
	object_event  8,  9, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerBikerDwayne, EVENT_IEJIMA_TOWN_FIXED
	object_event 10, 30, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerBikerHarris, EVENT_IEJIMA_TOWN_FIXED
	object_event 27,  1, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBikerZeke, EVENT_IEJIMA_TOWN_FIXED
	object_event 19, 18, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 3, TrainerBikerCharles, EVENT_IEJIMA_TOWN_FIXED
	object_event 23, 31, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 4, TrainerBikerRiley, EVENT_IEJIMA_TOWN_FIXED
	object_event 36,  3, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_TRAINER, 4, TrainerBikerJoel, EVENT_IEJIMA_TOWN_FIXED
	object_event  7, 20, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 4, TrainerBikerGlenn, EVENT_IEJIMA_TOWN_FIXED
	object_event 10, 12, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, HydroPlantLassScript, EVENT_IEJIMA_TOWN_NOT_FIXED
	object_event  3,  2, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, HydroPlantTeacherScript, EVENT_IEJIMA_TOWN_NOT_FIXED
	object_event 31, 29, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, HydroPlantGentlemanScript, EVENT_IEJIMA_TOWN_NOT_FIXED
	object_event 21, 19, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, HydroPlantRockerScript, EVENT_IEJIMA_TOWN_NOT_FIXED
	object_event 24, 16, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, HydroPlantGentlenman2Script, EVENT_IEJIMA_TOWN_NOT_FIXED
