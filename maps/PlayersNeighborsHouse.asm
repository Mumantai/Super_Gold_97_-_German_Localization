	object_const_def ; object_event constants
	const PLAYERSNEIGHBORSHOUSE_COOLTRAINER_F

PlayersNeighborsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PlayersNeighborsDaughterScript:
	jumptextfaceplayer PlayersNeighborsDaughterText

PlayersNeighborsHouseBookshelfScript:
	jumpstd MagazineBookshelfScript

PlayersNeighborsHouseRadioScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue .NormalRadio
	checkevent EVENT_LISTENED_TO_INITIAL_RADIO
	iftrue .AbbreviatedRadio
	playmusic MUSIC_POKEMON_TALK
	opentext
	writetext PlayerNeighborRadioText1
	pause 45
	writetext PlayerNeighborRadioText2
	pause 45
	writetext PlayerNeighborRadioText3
	pause 45
	musicfadeout MUSIC_SILENT_TOWN, 16
	writetext PlayerNeighborRadioText4
	pause 45
	closetext
	setevent EVENT_LISTENED_TO_INITIAL_RADIO
	end
.NormalRadio:
	jumpstd Radio1Script
.AbbreviatedRadio:
	opentext
	writetext PlayerNeighborRadioText4
	pause 45
	closetext
	end

PlayersNeighborsDaughterText:
	text "PIKACHU ist ein"
	line "entwickeltes"
	cont "#MON."

	para "PROF. EICH2s"
	line "Entdeckungen"
	cont "sind wirklich"
	cont "erstaunlich."

	para "Er ist berühmt für"
	line "seine Forschungen"
	cont "auf dem Gebiet der"
	cont "#MON-Evolution."

	para "…Seufz…"

	para "Ich wünschte, ich"
	line "wäre ein Forscher"
	cont "wie er…"
	done

PlayerNeighborRadioText1:
	text "PROF. EICHs #-"
	line "MON-TALK! Schalten"
	cont "Sie auch das"
	cont "nächste Mal wieder"
	cont "ein!"
	done

PlayerNeighborRadioText2:
	text "#MON-PROGRAMM!"
	done

PlayerNeighborRadioText3:
	text "Hier ist DJ"
	line "MARGIT, Ihr Co-"
	cont "Moderator!"
	done

PlayerNeighborRadioText4:
	text "#MON!"
	line "#MON-PROGRAMM…"
	done

PlayersNeighborsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, SILENT_TOWN, 3
	warp_event  3,  7, SILENT_TOWN, 3

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, PlayersNeighborsHouseBookshelfScript
	bg_event  1,  1, BGEVENT_READ, PlayersNeighborsHouseBookshelfScript
	bg_event  7,  1, BGEVENT_READ, PlayersNeighborsHouseRadioScript

	db 1 ; object events
	object_event  2,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, PlayersNeighborsDaughterScript, -1
