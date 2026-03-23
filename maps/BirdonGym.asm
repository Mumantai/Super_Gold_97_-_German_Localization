	object_const_def ; object_event constants
	const BIRDONGYM_MORTY
	const BIRDONGYM_GYM_GUY
	const BIRDONGYM_GRANNY1
	const BIRDONGYM_GRANNY2
	const BIRDONGYM_GRAMPS

BirdonGym_MapScripts:
	db 2 ; scene scripts
	scene_script .ForcedToLeave ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.ForcedToLeave:
	end


.DummyScene:
	end
	


TrainerMediumDoris:
	trainer MEDIUM, DORIS, EVENT_BEAT_MEDIUM_DORIS, MediumDorisSeenText, MediumDorisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumDorisAfterBattleText
	waitbutton
	closetext
	end
	
TrainerSageYurei:
	trainer SAGE, YUREI, EVENT_BEAT_SAGE_YUREI, SageYureiSeenText, SageYureiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageYureiAfterBattleText
	waitbutton
	closetext
	end


TrainerMediumRebecca:
	trainer MEDIUM, REBECCA, EVENT_BEAT_MEDIUM_REBECCA, MediumRebeccaSeenText, MediumRebeccaBeatenText, 0, .Script
	

.Script:
	endifjustbattled
	opentext
	writetext MediumRebeccaAfterBattleText
	waitbutton
	closetext
	end

BirdonGymMortyScript:
	faceplayer
	checkevent EVENT_REMATCH_AVAILABLE_MORTY
	iftrue RematchScriptMorty
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue PostRematchScriptMorty
	
	opentext
	checkevent EVENT_BEAT_MORTY
	iftrue .FightDone
	writetext MortyIntroText
	waitbutton
	closetext
	winlosstext MortyWinLossText, 0
	loadtrainer MORTY, MORTY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MORTY
	setevent EVENT_BEAT_MEDIUM_REBECCA
	opentext
	writetext Text_ReceivedFogBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_FOGBADGE
	checkcode VAR_BADGES
	scall BirdonGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM30_SHADOW_BALL
	iftrue .GotShadowBall
	setevent EVENT_BEAT_MEDIUM_DORIS
	setevent EVENT_BEAT_MEDIUM_REBECCA
	setevent EVENT_BEAT_SAGE_YUREI
	writetext MortyText_FogBadgeSpeech
	buttonsound
	verbosegiveitem TM_SHADOW_BALL
	iffalse .NoRoomForShadowBall
	setevent EVENT_GOT_TM30_SHADOW_BALL
	writetext MortyText_ShadowBallSpeech
	waitbutton
	closetext
	end

.GotShadowBall:
	writetext MortyFightDoneText
	waitbutton
.NoRoomForShadowBall:
	closetext
	end
	
RematchScriptMorty:
	opentext
	writetext MortyRematchText
	waitbutton
	closetext
	winlosstext MortyRematchWinText, 0
	loadtrainer MORTY, MORTY2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_REMATCH_AVAILABLE_MORTY
	opentext
	writetext MortyAfterRematchText
	waitbutton
	closetext
	end

PostRematchScriptMorty:
	opentext
	writetext MortyAfterRematchText
	waitbutton
	closetext
	end

MortyRematchText:
    text "Sehe ich ein"
    line "Gespenst, oder"
    cont "bist du in meine"
    cont "ARENA zurück-"
    line "gekehrt?"

    para "Wenn dem so ist,"
    line "dann gewähre mir"
    cont "bitte einen Kampf"
    cont "gegen dich, damit"
    cont "ich mein Training"
    cont "vorantreiben kann!"
	done

MortyRematchWinText:
	text "Tadellos…"
	done

MortyAfterRematchText:
    text "Dieser legendäre"
    line "regenbogenfarbene"
    cont "Vogel… bist du ihm"
    cont "auf deinen Reisen"
    cont "jemals begegnet?"

    para "Ich glaube, wenn"
    line "er sich jemals"
    cont "jemandem zeigen"
    cont "würde, dann dir."
	done



BirdonGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .WestportRockets
	end

.WestportRockets:
	jumpstd WestportRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript







BirdonGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MORTY
	iftrue .BirdonGymGuyWinScript
	writetext BirdonGymGuyText
	waitbutton
	closetext
	end

.BirdonGymGuyWinScript:
	writetext BirdonGymGuyWinText
	waitbutton
	closetext
	end

BirdonGymStatue:
	checkflag ENGINE_FOGBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	trainertotext MORTY, MORTY1, MEM_BUFFER_1
	jumpstd GymStatue2Script

BirdonGymPlayerStepUpMovement:
	step UP
	step_end

BirdonGymPlayerSlowStepDownMovement:
	fix_facing
	slow_step DOWN
	remove_fixed_facing
	step_end

BirdonGymGrampsSlowStepDownMovement:
	slow_step DOWN
	step_end

MortyIntroText:
	text "Gut, dass du ge-"
	line "kommen bist."

	para "Hier in TOTOMONIA"
	line "werden #MON"
	cont "verehrt."

	para "Man sagt, dass ein"
	line "regenbogenfarbenes"
	cont "#MON einem"
	cont "wahrlich starken"
	cont "Trainer erscheinen"
	cont "wird."

	para "nur wahrlich star-"
	line "ken Trainern er-"
	cont "scheinen werden."

	para "Ich glaube an die-"
	line "se Legende. Daher"

	para "habe ich mein gan-"
	line "zes Leben lang im"

	para "Geheimen trai-"
	line "niert."

	para "Als Resultat kann"
	line "ich nun Dinge"

	para "sehen, die andere"
	line "nicht sehen kön-"
	cont "nen."

	para "Noch ein wenig…"

	para "Mit ein wenig Mehr"
	line "könnte ich eine"

	para "Zukunft sehen, in"
	line "der ich das legen-"
	cont "däre regenbogen-"
	cont "farbene #MON"
	cont "treffe."

	para "Du könntest mir"
	line "dabei helfen!"
	done

MortyWinLossText:
	text "Ich bin noch nicht"
	line "gut genug…"

	para "Dieser ORDEN soll"
	line "dir gehören."
	done

Text_ReceivedFogBadge:
	text "<PLAYER> erhält"
	line "PHANTOMORDEN."
	done

MortyText_FogBadgeSpeech:
	text "Durch den PHANTOM-"
	line "ORDEN gehorchen"
	cont "dir #MON bis zu"
	cont "LV 50."

	para "Außerdem können"
	line "#MON, die SUR-"
	cont "FER beherrschen,"
	cont "diesen auch außer-"
	cont "halb eines Kampfes"
	cont "einsetzen."

	para "Bitte nimm auch"
	line "dies an."
	done

MortyText_ShadowBallSpeech:
	text "Das ist SPUKBALL."
	line "Er verursacht"
	cont "Schaden und ver-"
	cont "ringert die SPE-"
	cont "ZIAL-VERT."

	para "Setze ihn ein,"
	line "wenn er dir ge-"
	cont "fällt."
	done

MortyFightDoneText:
	text "Ich verstehe…"

	para "Deine Reise hat"
	line "dich an die ent-"
	cont "legensten Orte ge-"
	cont "führt."

	para "Du hast viel mehr"
	line "gesehen als ich."

	para "Dafür beneide ich"
	line "dich…"
	done


MediumRebeccaSeenText:
	text "Die Kraft all"
	line "derer, die du"
	cont "besiegt hast,"
	cont "offenbart sich"
	cont "mir!"
	done

MediumRebeccaBeatenText:
	text "Stark…"
	line "Viel zu stark…"
	done

MediumRebeccaAfterBattleText:
	text "Woher kommt deine"
	line "Kraft?"
	done

BirdonGymGuyText:
    text "Die ARENA hier,"
    line "ist voller Löcher,"
    cont "die einen direkt"
    cont "zurück zum Eingang"
    cont "schicken."

    para "Über einige von"
    line "ihnen, kann man"
    cont "aber laufen, um"
    cont "voranzukommen."

    para "Pass auf, wo du"
    line "hintrittst!"
	done

BirdonGymGuyWinText:
	text "Wow, <PLAYER>."
	line "Du warst großar-"
	cont "tig!"

	para "Vor lauter Angst"
	line "habe ich mich in"
	cont "die Ecke gekauert!"
	done

SageYureiSeenText:
    text "Kannst du mir be-"
    line "weisen, dass du"
    cont "am Leben bist?"
	done
	
SageYureiBeatenText:
	text "Verstehe…"
	done
	
SageYureiAfterBattleText:
    text "Kannst du mir be-"
    line "beweisen, ob ich"
    cont "überhaupt lebe?"
	done

MediumDorisSeenText:
	text "Hehehehe…"
	line "Ich habe es"
	cont "deutlich vor mir."

	para "Ich kann in deine"
	line "Seele blicken!"
	done

MediumDorisBeatenText:
	text "Obwohl ich in dir"
	line "lesen kann, habe"
	cont "ich verloren…"
	done

MediumDorisAfterBattleText:
	text "Mist! Ich habe"
	line "vergessen, dass"
	cont "ich meine Nieder-"
	cont "lage gegen dich"
	cont "voraussah."
	done

BirdonGym_MapEvents:
	db 0, 0 ; filler

	db 33 ; warp events
	warp_event  2,  9, BIRDON_TOWN, 5
	warp_event  3,  9, BIRDON_TOWN, 9
	warp_event  2,  7, BIRDON_GYM, 4
	warp_event  1,  0, BIRDON_GYM, 3
	warp_event  2,  0, BIRDON_GYM, 3
	warp_event  3,  0, BIRDON_GYM, 3
	warp_event  9,  9, BIRDON_GYM, 3
	warp_event 13,  0, BIRDON_GYM, 3
	warp_event 17,  4, BIRDON_GYM, 3
	warp_event  0,  0, BIRDON_GYM, 3
	warp_event  4,  0, BIRDON_GYM, 3
	warp_event  5,  0, BIRDON_GYM, 3
	warp_event  7,  0, BIRDON_GYM, 3
	warp_event 12,  0, BIRDON_GYM, 3
	warp_event 14,  0, BIRDON_GYM, 3
	warp_event  8,  0, BIRDON_GYM, 3
	warp_event 16,  4, BIRDON_GYM, 3
	warp_event 10,  0, BIRDON_GYM, 3
	warp_event 15,  0, BIRDON_GYM, 3
	warp_event  6,  4, BIRDON_GYM, 3
	warp_event  6,  5, BIRDON_GYM, 3
	warp_event  7,  8, BIRDON_GYM, 3
	warp_event  6,  8, BIRDON_GYM, 3
	warp_event 18,  0, BIRDON_GYM, 3
	warp_event 17,  0, BIRDON_GYM, 3
	warp_event  2,  4, BIRDON_GYM, 3
	warp_event  3,  4, BIRDON_GYM, 3
	warp_event 19,  0, BIRDON_GYM, 3
	warp_event 16,  0, BIRDON_GYM, 3
	warp_event 17,  6, BIRDON_GYM, 3
	warp_event 17,  7, BIRDON_GYM, 3
	warp_event 12,  8, BIRDON_GYM, 3
	warp_event 13,  8, BIRDON_GYM, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  1,  7, BGEVENT_READ, BirdonGymStatue
	bg_event  4,  7, BGEVENT_READ, BirdonGymStatue

	db 5 ; object events
	object_event 16,  2, SPRITE_MORTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BirdonGymMortyScript, -1
	object_event  0,  7, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BirdonGymGuyScript, -1
	object_event  5,  6, SPRITE_SABRINA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerMediumRebecca, -1
	object_event 11,  5, SPRITE_SABRINA, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerMediumDoris, -1
	object_event  4,  2, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerSageYurei, -1

