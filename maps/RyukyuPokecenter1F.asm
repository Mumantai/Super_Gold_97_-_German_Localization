	object_const_def ; object_event constants
	const RYUKYUPOKECENTER1F_NURSE
	const RYUKYUPOKECENTER1F_TEACHER
	const RYUKYUPOKECENTER1F_FISHER
	const RYUKYUPOKECENTER1F_YOUNGSTER

RyukyuPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RyukyuPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

RyukyuPokecenter1FTeacherScript:
	jumptextfaceplayer RyukyuPokecenter1FTeacherText

RyukyuPokecenter1FFisherScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_FUEL_LINE
	iftrue .SolvedSWIslandsPowerCrisis
	writetext RyukyuPokecenter1FFisherText
	waitbutton
	closetext
	end

.SolvedSWIslandsPowerCrisis:
	writetext RyukyuPokecenter1FFisherReturnedMachinePartText
	waitbutton
	closetext
	end

RyukyuPokecenter1FYoungsterScript:
	jumptextfaceplayer RyukyuPokecenter1FYoungsterText

RyukyuPokecenter1FTeacherText:
	text "Wie sehen die"
	line "#MON-CENTER auf"
	cont "dem Festland aus?"

	para "…Oh, aha. Sie"
	line "unterscheiden sich"
	para "kaum von denen"
	line "hier."

	para "Ich kann also ans"
	line "Festland, ohne"
	cont "mich zu sorgen!"
	done

RyukyuPokecenter1FFisherText:
    text "Ich kam gerade aus"
    line "AMAMIA hierher."

    para "Ich hörte, dass"
    line "irgendwas mit der"
    cont "M.S.AQUA los ist?"
	done

RyukyuPokecenter1FFisherReturnedMachinePartText:
    text "Das SCHNELLBOOT"
    line "kann wohl wieder"
    para "normal in AMAMIA"
    line "abfahren."
	done

RyukyuPokecenter1FYoungsterText:
    text "Diese Stadt ist"
    line "ein sehenswürdiger"
    cont "Ort für Touristen."
	done

RyukyuPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, RYUKYU_CITY, 2
	warp_event  6,  7, RYUKYU_CITY, 2
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, RyukyuPokecenter1FNurseScript, -1
	object_event  9,  2, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RyukyuPokecenter1FTeacherScript, -1
	object_event 10,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, RyukyuPokecenter1FFisherScript, -1
	object_event  3,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RyukyuPokecenter1FYoungsterScript, -1
