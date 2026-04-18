	object_const_def ; object_event constants
	const AMAMITATSUGOPATHGATE_OFFICER


AmamiTatsugoPathGate_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

AmamiTatsugoPathGuardScript:
	jumptextfaceplayer AmamiTatsugoPathGuardWelcomeText


AmamiTatsugoPathGuardWelcomeText:
    text "Geh von hier aus"
    line "nach Osten, um"
    para "nach KIKAITANI"
    line "zu gelangen."

    para "Aber sei bereit,"
    line "der Hitze des"
    para "KESSELs ausgesetzt"
    line "zu sein."
	done


AmamiTatsugoPathGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  7, AMAMI_TOWN, 4
	warp_event  1,  7, AMAMI_TOWN, 4
	warp_event  8,  7, TATSUGO_PATH, 1
	warp_event  9,  7, TATSUGO_PATH, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, AmamiTatsugoPathGuardScript, -1
