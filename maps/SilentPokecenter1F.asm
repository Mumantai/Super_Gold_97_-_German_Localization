	object_const_def ; object_event constants
	const SILENTPOKECENTER1F_NURSE
	const SILENTPOKECENTER1F_COOLTRAINER_M
	const SILENTPOKECENTER1F_COOLTRAINER_F
	const SILENTPOKECENTER1F_BUG_CATCHER

SilentPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SilentPokecenter1FNurseScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iffalse .NoPokemonScript
	jumpstd PokecenterNurseScript
	
.NoPokemonScript
	opentext
	writetext NoPokemonText
	waitbutton
	closetext
	end

SilentPokecenter1FCooltrainerMScript:
	checkevent EVENT_MET_BILL
	iftrue Script_TimeCapsuleClosed2
	faceplayer
	opentext
	writetext SilentPokecenter1FCooltrainerMText
	waitbutton
	closetext
	end

Script_TimeCapsuleClosed2:
	faceplayer
	opentext
	writetext SilentPokecenter1FCooltrainerMText2
	waitbutton
	closetext
	end

SilentPokecenter1FCooltrainerFScript:
	jumptextfaceplayer SilentPokecenter1FCooltrainerFText

SilentPokecenter1FBugCatcherScript:
	jumptextfaceplayer SilentPokecenter1FBugCatcherText
	
SilentPokecenterMonScript:
	faceplayer
	opentext
	writetext SilentPokecenterMonText
	cry HOUNDOOM
	waitbutton
	closetext
	end
	
NoPokemonText:
	text "Hallo!"

	para "Du brauchst ein"
	line "#MON, um das"
	para "#MON-CENTER zu"
	line "benutzen."
	done
	
SilentPokecenterMonText:
	text "HUNDEMON:"
	line "GRUFFF!"
	done
	
SilentPokecenter1FCooltrainerMText:
	text "Es ist wahr!"

	para "Die ZEITKAPSEL"
	line "im Obergeschoss"
	para "ermöglicht es"
	line "der Vergangenheit"
	cont "zu tauschen!"
	done

SilentPokecenter1FCooltrainerMText2:
    text "Ich habe gehört,"
    line "dass die Maschine,"
    para "die sie gerade"
    line "aufbauen, wirklich"
    cont "unglaublich ist!"

    para "Angeblich kann man"
    line "damit #MON"
    para "durch die Zeit"
    line "tauschen!"

    para "Ich frage mich,"
    line "ob das stimmt?"
	done

SilentPokecenter1FCooltrainerFText:
	text "Dieser PC steht"
	line "jedem Trainer kos-"
	cont "tenfrei zur Verfü-"
	cont "gung."

	para "Wie aufmerksam"
	line "von ihnen!"
	done


SilentPokecenter1FBugCatcherText:
	text "Das ist HUNDEMON!"

	para "Es ist ein #MON"
	line "eines komplett"
	cont "neuen Typs."
	done

SilentPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, SILENT_TOWN, 3
	warp_event  6,  7, SILENT_TOWN, 3
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SilentPokecenter1FNurseScript, -1
	object_event  3,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, SilentPokecenter1FCooltrainerMScript, -1
	object_event  12, 7, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilentPokecenter1FCooltrainerFScript, -1
	object_event  9,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SilentPokecenter1FBugCatcherScript, -1
	object_event  10, 1, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, SilentPokecenterMonScript, -1
