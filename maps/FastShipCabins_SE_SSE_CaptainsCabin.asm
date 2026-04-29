	object_const_def ; object_event constants
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_CAPTAIN
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_POKEFAN_M1
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN3
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN4
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_SUPER_NERD1
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_POKEFAN_M2
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_POKEFAN_F
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_SUPER_NERD2

FastShipCabins_SE_SSE_CaptainsCabin_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

.UnreferencedDummyScene:
	end

SSAquaCaptain:
	faceplayer
	opentext
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue .LaterTrip
	checkevent EVENT_CAPTAIN_TOLD_YOU_ABOUT_BROKEN_SHIP
	iffalse .FirstCaptainTalk
	writetext SSAquaCaptainExhaustingText
	waitbutton
	closetext
	end
	
.FirstCaptainTalk
	writetext SSAquaCaptainShipIsBrokenText
	waitbutton
	closetext
;	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_CAPTAIN, DOWN
;	pause 20
;	playsound SFX_ELEVATOR_END
;	pause 30
;	opentext
;	writetext SSAquaHasArrivedAmamiText
;	waitbutton
;	setevent EVENT_FAST_SHIP_HAS_ARRIVED
	setevent EVENT_FAST_SHIP_FOUND_GIRL
	setevent EVENT_CAPTAIN_TOLD_YOU_ABOUT_BROKEN_SHIP
;	closetext
	end
	

.LaterTrip:
	checkevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
	iffalse .GiveMetalCoatCaptain
	writetext SSAquaCaptainHowDoYouLikeText
	waitbutton
	closetext
	end
	
.GiveMetalCoatCaptain
	writetext SSAquaCaptainThankYouText
	waitbutton
	verbosegiveitem METAL_COAT
	iffalse SSCaptain_NoRoom
	setevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
	writetext SSAquaCaptainHowDoYouLikeText
	waitbutton
	closetext
	end
	
SSCaptain_NoRoom:
	writetext SSCaptain_NoRoomText
	waitbutton
	closetext
	end
	
;.NoRoom:
;	closetext
;	waitsfx
;	playsound SFX_ELEVATOR_END
;	pause 30
;	opentext
;	writetext SSAquaHasArrivedAmamiText
;	waitbutton
;	setevent EVENT_FAST_SHIP_HAS_ARRIVED
;	setevent EVENT_FAST_SHIP_FOUND_GIRL
;	closetext
;	end

TrainerPokefanmColin:
	trainer POKEFANM, COLIN, EVENT_BEAT_POKEFANM_COLIN, PokefanmColinSeenText, PokefanmColinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmColinAfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsMegandpeg1:
	trainer TWINS, MEGANDPEG1, EVENT_BEAT_TWINS_MEG_AND_PEG, TwinsMegandpeg1SeenText, TwinsMegandpeg1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsMegandpeg1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsMegandpeg2:
	trainer TWINS, MEGANDPEG2, EVENT_BEAT_TWINS_MEG_AND_PEG, TwinsMegandpeg2SeenText, TwinsMegandpeg2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsMegandpeg2AfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicRodney:
	trainer PSYCHIC_T, RODNEY, EVENT_BEAT_PSYCHIC_RODNEY, PsychicRodneySeenText, PsychicRodneyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicRodneyAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmJeremy:
	trainer POKEFANM, JEREMY, EVENT_BEAT_POKEFANM_JEREMY, PokefanmJeremySeenText, PokefanmJeremyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmJeremyAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanfGeorgia:
	trainer POKEFANF, GEORGIA, EVENT_BEAT_POKEFANF_GEORGIA, PokefanfGeorgiaSeenText, PokefanfGeorgiaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanfGeorgiaAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdShawn:
	trainer SUPER_NERD, SHAWN, EVENT_BEAT_SUPER_NERD_SHAWN, SupernerdShawnSeenText, SupernerdShawnBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdShawnAfterBattleText
	waitbutton
	closetext
	end

FastShipCaptainsCabinTrashcan:
	jumpstd TrashCanScript

MovementData_0x76004:
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

MovementData_0x7600c:
	step UP
	step UP
	turn_head LEFT
	step_end

MovementData_0x76010:
	step DOWN
	step_end
	
SSCaptain_NoRoomText:
	text "Du hast keinen"
	line "Platz für mein"
	cont "Geschenk!"
	done
	
SSAquaCaptainThankYouText:
	text "Ah, du bist es!"

	para "Das Kind, das"
	line "uns geholfen hat,"
	cont "das Schiff zu"
	cont "reparieren!"

	para "Danke dir"
	line "vielmals!"

	para "Als Zeichen meiner"
	line "Dankbarkeit,"
	cont "möchte ich dir das"
	cont "hier geben"
	done

SSAquaCaptainShipIsBrokenText:
    text "Oje."

    para "Wir haben hier ein"
    line "ernstes Problem."

    para "Das Unwetter hat"
    line "die BENZINLEITUNG"
    cont "beschädigt."

    para "Unsere Reserven"
    line "reichen gerade so"
    cont "bis nach AMAMIA."

    para "Aber wir können"
    line "nicht zurück-"
    cont "fahren bis das"
    cont "repariert ist!"

    para "Es ist vielleicht"
    line "viel verlangt,"
    para "aber könntest du"
    line "uns aushelfen?"

    para "In KUMIA CITY gibt"
    line "es jemanden, der"
    cont "Schiffe repariert."

    para "Er hat das Teil,"
    line "das wir brauchen."

    para "Könntest du es für"
    line "uns besorgen, wenn"
    cont "wir anlegen?"

    para "Bis das repariert"
    line "ist, können wir"
    para "nicht zurück zum"
    line "Festland fahren!"
	done

SSAquaCaptainExhaustingText:
	text "Möchtest du uns"
	line "nicht aushelfen?"
	done

SSAquaCaptainHowDoYouLikeText:
	text "Hat dir die Fahrt"
	line "mit der M.S. AQUA"
	cont "gefallen?"

	para "Sie gleitet"
	line "regelrecht über"
	cont "die Wellen."
	done

PokefanmColinSeenText:
	text "Hey, Winzling!"
	line "Möchtest du gegen"
	cont "mich antreten?"
	done

PokefanmColinBeatenText:
	text "Du bist stark!"
	done

PokefanmColinAfterBattleText:
	text "Du reist ganz"
	line "alleine?"

	para "Ist deine Mutter"
	line "nicht besorgt?"
	done

TwinsMegandpeg1SeenText:
	text "Du denkst, ich"
	line "bin noch ein Baby?"
	cont "Das ist gemein!"
	done

TwinsMegandpeg1BeatenText:
	text "Oh! Wir haben"
	line "verloren!"
	done

TwinsMegandpeg1AfterBattleText:
	text "“Baby” ist kein"
	line "schöner Name"
	cont "für Mädchen!"
	done

TwinsMegandpeg2SeenText:
	text "Ich bin kein Baby!"

	para "So etwas sagt man"
	line "nicht zu einer"
	cont "Dame!"
	done

TwinsMegandpeg2BeatenText:
	text "Oh! Wir haben"
	line "verloren!"
	done

TwinsMegandpeg2AfterBattleText:
	text "Manchmal sind"
	line "Kinder schlauer"
	cont "als Erwachsene!"
	done

PsychicRodneySeenText:
	text "Ssh! Mein Gehirn"
	line "empfängt Radio-"
	cont "wellen!"
	done

PsychicRodneyBeatenText:
	text "…Ich kann etwas"
	line "hören!"
	done

PsychicRodneyAfterBattleText:
	text "Ich verstehe! Man"
	line "kann den Radio-"
	cont "sender aus NIHON"
	cont "auf dem SCHNELL-"
	cont "BOOT hören."
	done

PokefanmJeremySeenText:
	text "Was denkst du?"
	line "Meine #MON sind"
	cont "doch schön, oder?"
	done

PokefanmJeremyBeatenText:
	text "Oh, nein! Meine"
	line "schönen #MON!"
	done

PokefanmJeremyAfterBattleText:
	text "Ich muss in den"
	line "#MON-SALON, um"
	cont "sie zurechtmachen"
	cont "zu lassen!"
	done

PokefanfGeorgiaSeenText:
	text "Ich gehe ins"
	line "EINKAUFSZENTRUM"
	cont "und…"
	done

PokefanfGeorgiaBeatenText:
	text "Was wollte ich"
	line "tun?"
	done

PokefanfGeorgiaAfterBattleText:
	text "Oh, ja! Ich muss"
	line "meine #MON von"
	cont "der PENSION"
	cont "abholen!"
	done

SupernerdShawnSeenText:
	text "Was für #-"
	line "BÄLLE hast du"
	cont "dabei?"
	done

SupernerdShawnBeatenText:
	text "Warte! Halt!"
	line "Nicht! Bitte!"
	done

SupernerdShawnAfterBattleText:
	text "Der BALL, den du"
	line "einsetzt, muss zu"
	cont "der Situation"
	cont "passen."
	done

SSAquaHasArrivedAmamiText:
	text "Die M.S. AQUA legt"
	line "in AMAMIA an."
	done

FastShipCabins_SE_SSE_CaptainsCabin_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  2,  7, FAST_SHIP_1F, 8
	warp_event  3,  7, FAST_SHIP_1F, 8
	warp_event  2, 19, FAST_SHIP_1F, 9
	warp_event  3, 19, FAST_SHIP_1F, 9
	warp_event  4, 33, FAST_SHIP_1F, 10
	warp_event  5, 33, FAST_SHIP_1F, 10

	db 0 ; coord events

	db 1 ; bg events
	bg_event  6, 25, BGEVENT_READ, FastShipCaptainsCabinTrashcan

	db 8 ; object events
	object_event  5, 25, SPRITE_CAPTAIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SSAquaCaptain, -1
	object_event  5,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 5, TrainerPokefanmColin, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  2,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 1, TrainerTwinsMegandpeg1, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  3,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 1, TrainerTwinsMegandpeg2, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  5,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerPsychicRodney, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 3, TrainerPokefanmJeremy, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  5,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 1, TrainerPokefanfGeorgia, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  1, 15, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerSupernerdShawn, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
