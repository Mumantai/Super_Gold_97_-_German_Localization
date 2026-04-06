	object_const_def ; object_event constants
	const STANDPOKECENTER1F_NURSE
	const STANDPOKECENTER1F_COOLTRAINER_M
	const STANDPOKECENTER1F_COOLTRAINER_F
	const STANDPOKECENTER1F_JANINE_IMPERSONATOR

StandPokecenter1F_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

StandPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

StandPokecenter1FCooltrainerMScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .StandPokecenter1FCooltrainerMRocketsGone
	writetext StandPokecenter1FCooltrainerMText
	waitbutton
	closetext
	end
	
.StandPokecenter1FCooltrainerMRocketsGone
	writetext StandPokecenter1FCooltrainerMText2
	waitbutton
	closetext
	end

StandPokecenter1FCooltrainerFScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .StandPokecenter1FCooltrainerFRocketsGone
	writetext StandPokecenter1FCooltrainerFText
	waitbutton
	closetext
	end
	
.StandPokecenter1FCooltrainerFRocketsGone
	writetext StandPokecenter1FCooltrainerFText2
	waitbutton
	closetext
	end

StandPokecenter1FJanineImpersonatorScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .StandPokecenter1FJanineImpersonatorRocketsGone
	writetext StandPokecenter1FJanineImpersonatorText1
	waitbutton
	closetext
	end
	
.StandPokecenter1FJanineImpersonatorRocketsGone
	writetext StandPokecenter1FJanineImpersonatorText2
	waitbutton
	closetext
	end

StandPokecenter1FCooltrainerMText:
    text "Ich habe Angst,"
    line "dass meine #MON"
    cont "krank werden."
	done
	
StandPokecenter1FCooltrainerMText2:
    text "Die Mitarbeiter"
    line "vom SENDESTIA CITY"
    para "ZOO arbeiten hart,"
    line "damit es den"
    cont "#MON gut geht."
	done

StandPokecenter1FCooltrainerFText:
    text "Was ist gerade nur"
    line "los in dieser"
    cont "Stadt?"

    para "Normalerweise ist"
    line "hier doch alles so"
    cont "friedlich."
	done
	
StandPokecenter1FCooltrainerFText2:
    text "Du hast aber viele"
    line "ARENA-ORDEN!"

    para "Hast du schon die"
    line "#MON LIGA"
    cont "herausgefordert?"

    para "Eines Tages möchte"
    line "ich selbst den"
    para "KOROKANIABERG"
    line "besteigen."
	done

StandPokecenter1FJanineImpersonatorText1:
    text "Ich bin nach"
    line "SENDESTIA CITY"
    para "gereist, um den"
    line "NATIONALPARK und"
    para "all die #MON"
    line "zu sehen."

    para "Ich bin schon"
    line "etwas wütend, dass"
    para "ich jetzt nichts"
    line "davon machen kann…"
	done

StandPokecenter1FJanineImpersonatorText2:
    text "SENDESTIA CITY hat"
    line "so viele tolle"
    cont "Dinge zu sehen!"
	done

StandPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, STAND_CITY, 5
	warp_event  6,  7, STAND_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, StandPokecenter1FNurseScript, -1
	object_event  2,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, StandPokecenter1FCooltrainerMScript, -1
	object_event 13,  6, SPRITE_JANINE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, StandPokecenter1FCooltrainerFScript, -1
	object_event 10,  1, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, StandPokecenter1FJanineImpersonatorScript, -1
