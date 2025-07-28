	object_const_def ; object_event constants
	const PAGOTAPOKECENTER1F_NURSE
	const PAGOTAPOKECENTER1F_GAMEBOY_KID
	const PAGOTAPOKECENTER1F_GENTLEMAN
	const PAGOTAPOKECENTER1F_YOUNGSTER
	const PAGOTAPOKECENTER1F_SCIENTIST

PagotaPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PagotaPokecenterNurse:
	jumpstd PokecenterNurseScript

PagotaPokecenter1F_Oak2sAideScript:
	faceplayer
	opentext
	checkevent EVENT_REFUSED_TO_TAKE_EGG_FROM_OAKS_AIDE
	iftrue .SecondTimeAsking
	writetext UnknownText_0x69555
.AskTakeEgg:
	yesorno
	iffalse .RefusedEgg
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	special GiveOddEgg
	stringtotext .eggname, MEM_BUFFER_1
	scall .AideGivesEgg
	setevent EVENT_GOT_TOGEPI_EGG_FROM_OAKS_AIDE
	clearevent EVENT_OAK2S_AIDE_IN_LAB
	clearevent EVENT_TOGEPI_HATCHED
	writetext UnknownText_0x695c5
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal UP, .AideWalksAroundPlayer
	turnobject PLAYER, DOWN
	applymovement PAGOTAPOKECENTER1F_SCIENTIST, MovementData_AideWalksStraightOutOfPokecenter
	playsound SFX_EXIT_BUILDING
	disappear PAGOTAPOKECENTER1F_SCIENTIST
	waitsfx
	clearevent EVENT_MET_BILL
	end

.AideWalksAroundPlayer:
	applymovement PAGOTAPOKECENTER1F_SCIENTIST, MovementData_AideWalksLeftToExitPokecenter
	turnobject PLAYER, DOWN
	applymovement PAGOTAPOKECENTER1F_SCIENTIST, MovementData_AideFinishesLeavingPokecenter
	playsound SFX_EXIT_BUILDING
	disappear PAGOTAPOKECENTER1F_SCIENTIST
	clearevent EVENT_MET_BILL
	waitsfx
	end

.eggname
	db "EI@"

.AideGivesEgg:
	jumpstd ReceiveTogepiEggScript
	end

.PartyFull:
	writetext UnknownText_0x69693
	waitbutton
	closetext
	end

.RefusedEgg:
	writetext UnknownText_0x696f2
	waitbutton
	closetext
	setevent EVENT_REFUSED_TO_TAKE_EGG_FROM_OAKS_AIDE
	end

.SecondTimeAsking:
	writetext UnknownText_0x69712
	jump .AskTakeEgg

PagotaPokecenter1FGameboyKidScript:
	jumptextfaceplayer PagotaPokecenter1FGameboyKidText

PagotaPokecenter1FGentlemanScript:
	jumptextfaceplayer PagotaPokecenter1FGentlemanText

PagotaPokecenter1FYoungsterScript:
	jumptextfaceplayer PagotaPokecenter1FYoungsterText

MovementData_AideWalksStraightOutOfPokecenter:
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step DOWN
	step_end

MovementData_AideWalksLeftToExitPokecenter:
	step LEFT
	step DOWN
	step_end

MovementData_AideFinishesLeavingPokecenter:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step DOWN
	step_end

UnknownText_0x69555:
	text "<PLAYER>, lange"
	line "nicht gesehen."

	para "PROF. EICH hat"
	line "mich gebeten, nach"
	cont "dir zu suchen."

	para "Er hat noch eine"
	line "Bitte an dich."

	para "Nimm bitte das"
	line "#MON-EI!"

	para "Es würde unserer"
	line "Forschung helfen,"
	para "mehr darüber zu"
	line "erfahren, wie"
	para "Baby-#MON mit"
	line "anderen #MON"
	cont "interagieren und"
	para "wie sich das auf"
	line "ihr Wachstum"
    cont "auswirkt."

    para "Also könntest du"
    line "dieses Ei bitte"
    cont "mitnehmen?"
	done

UnknownText_0x695c5:
    text "Was in dem Ei ist?"

    para "Nun, das soll eine"
    line "Überraschung sein!"

    para "Ich bin mir aber"
    line "sicher, dass es"
    para "dein Team gut"
    line "ergänzen wird!"

    para "Betrachte es als"
    line "Geschenk!"

    para "Hast du schon"
    line "gehört, dass BILL"
    cont "in der Stadt ist?"

    para "Falls du es nicht"
    line "weißt, BILL hat"
    para "das #MON-PC-"
    line "LAGERUNGS-SYSTEM"
    cont "erfunden!"

    para "Er ist unter uns"
    line "Forschern sehr"
    cont "angesehen."

    para "Du solltest ihn"
    line "besuchen, wenn du"
    cont "Zeit hast."

    para "So, ich bin dann"
    line "mal weg!"

    para "Bis bald!"
	done

UnknownText_0x69693:
	text "Oh, du hast keinen"
	line "Platz mehr für ein"
	cont "weiteres #MON."

	para "Ich warte hier,"
	line "bis du Platz für"
	cont "das EI geschaffen"
	cont "hast."
	done

UnknownText_0x696f2:
	text "A-Aber… PROF."
	line "EICH hat nach dir"
	cont "gefragt…"
	done

UnknownText_0x69712:
	text "<PLAYER>, nimmst du"
    line "das EI?"
	done

UnknownText_0x6972d:
	text "Ich denke, es wäre"
	line "wunderbar, wenn"

	para "ich mit meinen"
	line "Freunden, die weit"

	para "entfernt wohnen,"
	line "via Link-Kabel"
	cont "kämpfen könnte."
	done

UnknownText_0x69791:
	text "Ich habe gerade"
	line "über größere"
	para "Distanz mit einem"
	line "Freund aus"
	para "MINAMIDIA CITY"
	line "gekämpft."

	para "Mit dem MOBILEN"
	line "ADAPTER kannst du"
	para "dich mit weit ent-"
	line "fernten Freunden"
	cont "verbinden."
	done

PagotaPokecenter1FGameboyKidText:
	text "Ein Kerl namens"
	line "BILL hat das"

	para "#MON-PC-LAGE-"
	line "RUNGS-SYSTEM"

	para "erfunden."
	done

PagotaPokecenter1FGentlemanText:
	text "Es war vor etwa"
	line "einem Jahr."

	para "TEAM ROCKET hatte"
	line "etwas Übles mit"
	cont "den #MON vor."

	para "Aber die Gerech-"
	line "tigkeit hat ge-"
	cont "siegt! Ein junger"
	cont "Trainer hat sie"
	cont "zerschlagen."
	done

PagotaPokecenter1FYoungsterText:
	text "#MON sind"
	line "schlau. Sie gehor-"
	cont "chen nur Trainern,"
	cont "vor denen sie auch"
	cont "Respekt haben."

	para "Hat der Trainer"
	line "nicht genug ORDEN,"

	para "machen sie, was"
	line "sie wollen."
	done

PagotaPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, PAGOTA_CITY, 5
	warp_event  6,  7, PAGOTA_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PagotaPokecenterNurse, -1
	object_event  11,  4, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PagotaPokecenter1FGameboyKidScript, -1
	object_event  1,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PagotaPokecenter1FGentlemanScript, -1
	object_event  8,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, PagotaPokecenter1FYoungsterScript, -1
	object_event  4,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PagotaPokecenter1F_Oak2sAideScript, EVENT_OAK2S_AIDE_IN_PAGOTA_POKEMON_CENTER
