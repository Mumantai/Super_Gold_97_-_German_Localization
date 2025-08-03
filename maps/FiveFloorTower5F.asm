	object_const_def ; object_event constants
	const TINTOWER5F_SAGE1
	const TINTOWER5F_KURT
	const TINTOWER5F_CAPTAIN

FiveFloorTower5F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .AddStairs

.AddStairs:
	checkevent EVENT_HO_OH_EVENT_STARTED
	iffalse .DoneStairs
	changeblock   0,  5, $3A ; ladder
.DoneStairs:
	return

FiveFloorTower5FSageScript:
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .AfterHoOh
	checkevent EVENT_HO_OH_EVENT_STARTED
	iftrue .DuringHoOh
	setevent EVENT_GOT_5F_SAGE_BLESSING
	faceplayer
	opentext
	writetext Text_5FSageYup
	waitbutton
	closetext
	end
	
.AfterHoOh
	faceplayer
	opentext
	writetext Text_5FSageAfterHoOh
	waitbutton
	closetext
	end
	
.DuringHoOh
	faceplayer
	opentext
	writetext Text_5FSageDuringHoOh
	waitbutton
	closetext
	end
	
HoOhEventSceneUp:
	applymovement PLAYER, PlayerWalksToHoOhGroup1
	jump HoOhEventMainScene
	end
	
HoOhEventSceneLeft:
	applymovement PLAYER, PlayerWalksToHoOhGroup2
	jump HoOhEventMainScene
	end
	
HoOhEventMainScene:
	showemote EMOTE_SHOCK, TINTOWER5F_KURT, 15
	opentext
	writetext KurtKnewIt
	waitbutton
	closetext
	showemote EMOTE_SHOCK, TINTOWER5F_CAPTAIN, 15
	opentext
	writetext CaptainCantBelieve
	waitbutton
	closetext
	applymovement TINTOWER5F_SAGE1, SageOneStepDown
	opentext
	writetext SageTellsYouToSeeBird
	waitbutton
	closetext
	setscene SCENE_DEFAULT
	end
	
SageOneStepDown:
	step DOWN
	step_end
	
PlayerWalksToHoOhGroup2:
	step LEFT
	step LEFT
	turn_head UP
	step_end
	
PlayerWalksToHoOhGroup1:
	step LEFT
	step LEFT
	step DOWN
	step LEFT
	turn_head UP
	step_end
	
KurtKnewIt:
    text "KURT: Ich wusste,"
    line "ich hatte Recht,"
    para "als ich etwas an"
    line "dir gespürt habe."
	done
	
CaptainCantBelieve:
    text "Ich kann es nicht"
    line "fassen!"

    para "Die Rückkehr des"
    line "Vogels!"

    para "Es geschieht!"
	done
	
SageTellsYouToSeeBird:
    text "<PLAYER>."

    para "HO-OH nistet über"
    line "unseren Köpfen."

    para "Es ist tatsächlich"
    line "zurückgekehrt."

    para "Wie es die Legende"
    line "voraussagt."

    para "Ich spüre, dass es"
    line "dich treffen will."

    para "Es hat entschieden,"
    line "dass deine Taten"
    line "dich als würdig"
    para "erweisen, um ihm"
    line "gegenüberzutreten."

    para "Nun begib dich"
    line "auf das Dach."
	done
	
Text_5FSageDuringHoOh:
	text "Der Vogel wartet."
	done

Text_5FSageAfterHoOh:
    text "Eine Begegnung"
    line "mit dem Vogel gilt"
    cont "als legendär."
	done
	
Text_5FSageNope:
    text "Du hast die Spitze"
    line "dieses Turms"
    cont "erreicht."

    para "Aber du hast nicht"
    line "alle seiner Bot-"
    cont "schaften gehört."

    para "Bitte stelle"
    line "sicher, dass du"
    para "alle Schilder auf"
    line "jeder Ebene"
    cont "gelesen hast."

    para "Jedes lehrt eine"
    line "wertvolle Lektion."
	done
	
Text_5FSageYup:
    text "Willkommen auf"
    line "der Spitze des"
    cont "5-EBENEN-TURMs."

    para "Dies ist ein ge-"
    line "weihter Ort, der"
    para "nur von denen"
    line "besucht werden"
    cont "sollte, die ihm"
    para "den angemessenen"
    line "Respekt erweisen."

    para "Ich verstehe, dass"
    line "KURT dich gebeten"
    para "hat, seine Ebenen"
    line "zu erklimmen."

    para "Ich hoffe, du"
    line "konntest lernen,"
    para "wie man #MON"
    line "den richtigen"
    para "Respekt entgegen-"
    line "bringt."

    para "Kehre jetzt zu"
    line "KURT zurück. Du"
    cont "hast meinen Segen."
	done

FiveFloorTower5FSign:
	setevent EVENT_READ_5F5F_SIGN
	jumptext FiveFloorTower5FSignText

	
FiveFloorTower5FSignText:
    text "Eine Statue von"
    line "ABRA."

    para "ABRA sind sehr"
    line "schreckhaft und"
    para "fliehen schnell,"
    line "wenn man ihnen in"
    para "freier Wildbahn"
    line "begegnet."

    para "Ehre und respek-"
    line "tiere alle #MON"
    para "in ihrem natür-"
    line "lichen Lebensraum."
	done
	
FiveFloorTower5FIncense:
	jumptext FiveFloorTower5FIncenseText

FiveFloorTower5FIncenseText:
	text "Was ist das?"

	para "Oh, das ist ein"
	line "Räucherstäbchen!"
	done

FiveFloorTower5F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5,  5, FIVE_FLOOR_TOWER_4F, 2
	warp_event  0,  5, FIVE_FLOOR_TOWER_ROOF, 1

	db 2 ; coord events
	coord_event  5,  4, SCENE_HO_OH_EVENT, HoOhEventSceneUp
	coord_event  4,  5, SCENE_HO_OH_EVENT, HoOhEventSceneLeft

	db 2 ; bg events
	bg_event 4, 1, BGEVENT_READ, FiveFloorTower5FSign
	bg_event 3, 0, BGEVENT_READ, FiveFloorTower5FIncense


	db 3 ; object events
	object_event  2,  3, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FiveFloorTower5FSageScript, -1
	object_event  1,  3, SPRITE_KURT, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FiveFloorTower5FSageScript, EVENT_KURT_AND_CAPTAIN_AT_FIVE_FLOOR_TOWER
	object_event  3,  3, SPRITE_CAPTAIN, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FiveFloorTower5FSageScript, EVENT_KURT_AND_CAPTAIN_AT_FIVE_FLOOR_TOWER
