	object_const_def ; object_event constants
	const ALLOYSAILORHOOHHOUSE_ELDER
;	const ALLOYSAILORHOOHHOUSE_RHYDON

AlloySailorHoOhHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AlloySailorHoOhHouseElderScript:
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .AfterEverythingHoOh
	faceplayer
	opentext
	writetext AlloySailorHoOhHouseElderIntroText
	buttonsound
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .NoEvilLeft
	writetext AlloySailorHoOhHouseElderEvilText
	waitbutton
	closetext
	end
	
.NoEvilLeft
	checkevent EVENT_GOT_5F_SAGE_BLESSING
	iffalse .NotBlessed
	writetext AlloySailorHoOhHouseElderText2
	yesorno
	iffalse AlloyElderNoStory
	writetext AlloyElderStoryText
	waitbutton
	closetext
	pause 20
	applymovement ALLOYSAILORHOOHHOUSE_ELDER, DummyMovementElder
	playsound SFX_MEGA_PUNCH
	waitsfx
	pause 20
	opentext
	writetext HoOhCryText
	cry HO_OH
	pause 15
	closetext
	pause 10
	showemote EMOTE_SHOCK, ALLOYSAILORHOOHHOUSE_ELDER, 20
	opentext
	writetext AlloyElderStoryText2
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal UP, .ElderWalkAroundPlayer
	applymovement ALLOYSAILORHOOHHOUSE_ELDER, ElderWalksOutMovement
	jump ElderWalksOutFinalScene
	end

.ElderWalkAroundPlayer
	applymovement ALLOYSAILORHOOHHOUSE_ELDER, ElderWalksAroundPlayerMovement
	jump ElderWalksOutFinalScene
	end

	
.NotBlessed
	writetext AlloySailorHoOhHouseElderNotBlessedText
	waitbutton
	closetext
	end
	
.AfterEverythingHoOh
	faceplayer
	opentext
	writetext SometimesYouLiveLongEnough
	waitbutton
	closetext
	end
	

ElderWalksOutFinalScene:
	playsound SFX_EXIT_BUILDING
	disappear ALLOYSAILORHOOHHOUSE_ELDER
	setevent EVENT_ALLOY_CAPTAIN_AT_HOME
	setevent EVENT_HO_OH_EVENT_STARTED
	clearevent EVENT_KURT_AND_CAPTAIN_AT_FIVE_FLOOR_TOWER
	setmapscene PAGOTA_CITY, SCENE_KURTS_HOUSE_LOCKED
	setmapscene FIVE_FLOOR_TOWER_5F, SCENE_HO_OH_EVENT
	end
	
AlloyElderNoStory:
	writetext AlloySailorHoOhHouseElderAnotherTime
	waitbutton
	closetext
	end
	
DummyMovementElder:
	step_end
	
ElderWalksAroundPlayerMovement:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
ElderWalksOutMovement:
	step DOWN
	step DOWN
	step LEFT
	step DOWN
	step DOWN
	step_end
	
HoOhCryText:
	text "HO-OH: Shaooh!"
	done
	
SometimesYouLiveLongEnough:
    text "Manchmal lebt man"
    line "lang genug, um"
    para "Dinge zu erleben,"
    line "die man immer für"
    cont "unmöglich hielt."

    para "Ich hatte eine"
    line "Begegnung mit dem"
    cont "legendären Vogel."

    para "Ein wahrhaft magi-"
    line "sches Erlebnis."

    para "…"

    para "Weißt du was? Du"
    line "solltest NIHON"
    para "nach den legen-"
    line "dären Bestien"
    cont "absuchen."

    para "Wenn HO-OH zurück-"
    line "gekehrt ist, ist"
    cont "alles möglich."
	done
	
AlloyElderStoryText:
    text "Hör gut zu…"

	para "Vor vielen Jahren"
	line "wurde NIHON von"
	para "einem edlen Vogel"
	line "bewacht, dessen"
	para "Schwingen heiß wie"
	line "Feuer brannten."

	para "Dieser Vogel"
	line "nistete einst auf"
	para "der Spitze des"
	line "5-EBENEN-TURMs in"
	cont "PAGETIA CITY."

    para "Dort ruhte er"
    line "viele Jahre lang."

	para "Manche sagen, es"
	line "nistete dort gar"
	cont "Jahrhunderte."

	para "Doch der Vogel"
	line "wurde unruhig und"
	para "eines verhängnis-"
	line "vollen Tages brach"
	para "er auf und verließ"
	line "die Spitze des"
	cont "Turmes."

	para "Als er flog, fiel"
	line "Asche aus seinem"
	cont "Gefieder."

	para "Aus dieser Asche"
	line "erhoben sich drei"
	para "Bestien, die NIHON"
	line "bewachen sollten,"
	para "solange der Vogel"
	line "fort war."

	para "Die Bestien"
	line "verstreuten sich"
	para "und seither hat"
	line "niemand sie je"
	cont "wieder gesehen."

	para "Doch man weiß,"
	line "dass sie noch"
	para "immer in NIHON"
	line "verweilen und es"
	para "im Verborgenen"
	line "bewachen."

	para "Eines Tages,"
	line "so heißt es,"
	para "kehrt der Vogel"
	line "zurück."
	done
	
AlloyElderStoryText2:
	text "Könnte es sein!?"

	para "Ist der schicksal-"
	line "hafte Tag endlich"
	cont "gekommen?"
	done
	
AlloySailorHoOhHouseElderAnotherTime:
	text "Dann ein andermal."
	done

AlloySailorHoOhHouseElderText2:
	text "Möchtest du die"
	line "Geschichte des"
	cont "Vogels hören?"
	done
	
AlloySailorHoOhHouseElderIntroText:
    text "Ich hoffe, eines"
    line "Tages das Ende der"
    para "Legende persönlich"
    line "erleben zu können."
	done

AlloySailorHoOhHouseElderEvilText:
    text "Ich spüre eine"
    line "böse Präsenz über"
    cont "NIHON schweben."

    para "Der Vogel kehrt"
    line "sicher nicht"
    para "zurück, bis sie"
    line "vertrieben wurde."
	done
	
AlloySailorHoOhHouseElderNotBlessedText:
    text "Die Zeit ist schon"
    line "bald gekommen,"
    para "doch ich spüre"
    line "nicht, dass du die"
    para "Art Trainer bist,"
    line "der sich der Vogel"
    cont "zeigen würde."
	done

AlloySailorHoOhHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, ALLOY_CITY, 9
	warp_event  5,  7, ALLOY_CITY, 9

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  6,  3, SPRITE_CAPTAIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AlloySailorHoOhHouseElderScript, EVENT_ALLOY_CAPTAIN_AT_HOME
