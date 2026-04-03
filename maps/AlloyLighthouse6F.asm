	object_const_def ; object_event constants
	const ALLOYLIGHTHOUSE6F_JASMINE
	const ALLOYLIGHTHOUSE6F_MONSTER
	const ALLOYLIGHTHOUSE6F_POKE_BALL

AlloyLighthouse6F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AlloyLighthouseJasmine:
	faceplayer
	opentext
	checkitem SECRETPOTION
	iftrue .BroughtSecretpotion
	checkevent EVENT_GUY_GIVES_MYSTERYBERRY
	iftrue .ExplainedSickness
	writetext JasmineCrownHouse2Text
	promptbutton
	setevent EVENT_GUY_GIVES_MYSTERYBERRY
.ExplainedSickness:
	writetext JasmineGetSomeMedicineText
	waitbutton
	closetext
	end

.BroughtSecretpotion:
	writetext JasmineCureAmphyText
	yesorno
	iffalse .no
	writetext PlayerHandedSecretpotionText
	promptbutton
	takeitem SECRETPOTION
	writetext JasmineDontBeOffendedText
	waitbutton
	closetext
	turnobject ALLOYLIGHTHOUSE6F_JASMINE, RIGHT
	pause 15
	turnobject ALLOYLIGHTHOUSE6F_MONSTER, LEFT
	opentext
	playmusic MUSIC_HEAL
	writetext JasmineAmphyHowAreYouFeelingText
	pause 60
	promptbutton
	closetext
	special RestartMapMusic
	cry AMPHAROS
	special FadeOutPalettes
	pause 10
	special FadeInPalettes
	opentext
	writetext AmphyPaluPaluluText
	waitbutton
	closetext
	turnobject ALLOYLIGHTHOUSE6F_MONSTER, RIGHT
	pause 10
	turnobject ALLOYLIGHTHOUSE6F_MONSTER, LEFT
	pause 10
	turnobject ALLOYLIGHTHOUSE6F_MONSTER, RIGHT
	pause 10
	turnobject ALLOYLIGHTHOUSE6F_MONSTER, LEFT
	pause 10
	faceplayer
	opentext
	writetext JasmineThankYouText
	waitbutton
	closetext
	setevent EVENT_JASMINE_RETURNED_TO_GYM
	clearevent EVENT_ALLOY_GYM_JASMINE
	readvar VAR_FACING
	ifequal DOWN, .FacingDown
	ifequal RIGHT, .FacingRight
	applymovement ALLOYLIGHTHOUSE6F_JASMINE, MovementData_0x112da4
	disappear ALLOYLIGHTHOUSE6F_JASMINE
	end

.FacingDown:
	applymovement ALLOYLIGHTHOUSE6F_JASMINE, MovementData_0x112dac
	disappear ALLOYLIGHTHOUSE6F_JASMINE
	end

.FacingRight:
	applymovement ALLOYLIGHTHOUSE6F_JASMINE, MovementData_0x112db5
	disappear ALLOYLIGHTHOUSE6F_JASMINE
	end

.no:
	writetext JasmineISeeText
	waitbutton
	closetext
	turnobject ALLOYLIGHTHOUSE6F_JASMINE, RIGHT
	pause 15
	turnobject ALLOYLIGHTHOUSE6F_MONSTER, LEFT
	opentext
	writetext JasmineAmphyHangOnText
	waitbutton
	closetext
	end

AlloyLighthouseUnusedDummyScript:
; unused
	end

AlloyLighthouseAmphy:
	faceplayer
	opentext
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iftrue .HealthyNow
	writetext AmphyPalPalooText
	setval AMPHAROS
	special PlaySlowCry
	promptbutton
	writetext AmphyBreathingLaboredText
	waitbutton
	closetext
	end

.HealthyNow:
	writetext AmphyPaluPaluluText
	cry AMPHAROS
	waitbutton
	closetext
	special FadeOutPalettes
	special FadeInPalettes
	special FadeOutPalettes
	special FadeInPalettes
	end

AlloyLighthouse6FSuperPotion:
	itemball SUPER_POTION

MovementData_0x112da4:
	slow_step UP
	slow_step UP
	slow_step RIGHT
	slow_step UP
	slow_step UP
	step_sleep 8
	step_sleep 8
	step_end

MovementData_0x112dac:
	slow_step DOWN
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	slow_step UP
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	step_end

MovementData_0x112db5:
	slow_step UP
	slow_step UP
	slow_step RIGHT
	slow_step UP
	slow_step UP
	slow_step UP
	step_sleep 8
	step_end

JasmineCrownHouse2Text:
	text "JASMIN: …Dieses"
	line "#MON hat"

	para "das Meer immer"
	line "erleuchtet."

	para "…Aber plötzlich"
	line "wurde es krank… Es"
	cont "schnappt nach"
	cont "Luft…"

	para "…Ich weiß, dass"
	line "es eine gut"

	para "sortierte APOTHEKE"
	line "in KAZANAMI CITY"
	cont "gibt…"

	para "Aber dafür musst"
	line "du über das Meer…"

	para "Und ich kann AMPHI"
	line "nicht unbeaufsich-"
	cont "tigt zurücklassen…"
	done

JasmineGetSomeMedicineText:
	text "…Vielleicht"
	line "könntest du die"
	cont "Medizin für mich"
	cont "besorgen? Bitte!"
	done

JasmineCureAmphyText:
	text "JASMIN: …Wird"
	line "diese Arznei AMPHI"
	cont "helfen?"
	done

PlayerHandedSecretpotionText:
	text "<PLAYER> übergibt"
	line "JASMIN den"
	cont "GEHEIMTRANK."
	done

JasmineDontBeOffendedText:
	text "JASMIN: …Hm,"
	line "sei bitte nicht"
	cont "beleidigt…"

	para "…AMPHI nimmt"
	line "die Arznei nur"
	cont "von mir…"
	done

JasmineAmphyHowAreYouFeelingText:
	text "JASMIN: …"

	para "AMPHI, wie geht"
	line "es dir?"
	done

JasmineThankYouText:
	text "JASMIN: …Oh, ich"
	line "bin erleichtert…"

	para "Das ist einfach"
	line "wundervoll…"

	para "Ich danke dir"
	line "vielmals."

	para "…Ich kehre in die"
	line "PKMN-ARENA zurück."
	done

JasmineISeeText:
	text "JASMIN: …Ich ver-"
	line "stehe…"
	done

JasmineAmphyHangOnText:
	text "…AMPHI, halte"
	line "durch!"
	done

AmphyPalPalooText:
	text "AMPHI: …"
	line "…Pa…Paluu…"
	done

AmphyBreathingLaboredText:
	text "Es hat Probleme"
	line "mit der Atmung…"
	done

AmphyPaluPaluluText:
	text "AMPHI: Palu!"
	line "Palulu!"
	done

AlloyLighthouse6F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  9, 15, ALLOY_LIGHTHOUSE_5F, 1
	warp_event 16,  5, ALLOY_LIGHTHOUSE_5F, 6
	warp_event 17,  5, ALLOY_LIGHTHOUSE_5F, 7

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  8,  8, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, AlloyLighthouseJasmine, EVENT_ALLOY_LIGHTHOUSE_JASMINE
	object_event  9,  8, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AlloyLighthouseAmphy, -1
	object_event  3,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, AlloyLighthouse6FSuperPotion, EVENT_GOT_TEAM_ROCKET_AMULET_COIN
