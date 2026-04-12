	object_const_def ; object_event constants
	const KANTOHOUSE_4_FISHING_GURU

KantoHouse4_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
KantoHouse4FishingGuru:
	faceplayer
	opentext
	checkevent EVENT_KANTO_REGION_ELIXIR_ON_STANDBY
	iftrue .GetReward
	checkevent EVENT_KANTO_REGION_ASKED_FOR_MAGIKARP
	iftrue .AskedForMagikarp
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRocketHideout
	checkevent EVENT_KANTO_REGION_EXPLAINED_WEIRD_MAGIKARP
	iftrue .ExplainedHistory
	writetext MagikarpLengthRaterText_KikaiVillageHistory
	waitbutton
	closetext
	setevent EVENT_KANTO_REGION_EXPLAINED_WEIRD_MAGIKARP
	end

.ExplainedHistory:
	writetext MagikarpLengthRaterText_MenInBlack
	waitbutton
	closetext
	end

.ClearedRocketHideout:
	writetext MagikarpLengthRaterText_WorldsLargestMagikarp
	waitbutton
	closetext
	setevent EVENT_KANTO_REGION_ASKED_FOR_MAGIKARP
	end

.AskedForMagikarp:
	writebyte MAGIKARP
	special FindPartyMonThatSpecies
	iffalse .ClearedRocketHideout
	writetext MagikarpLengthRaterText_YouHaveAMagikarp
	waitbutton
	special CheckMagikarpLength
	ifequal MAGIKARPLENGTH_NOT_MAGIKARP, .NotMagikarp
	ifequal MAGIKARPLENGTH_REFUSED, .Refused
	ifequal MAGIKARPLENGTH_TOO_SHORT, .TooShort
	; MAGIKARPLENGTH_BEAT_RECORD
	jump .GetReward

.GetReward:
	writetext MagikarpLengthRaterText_Memento
	buttonsound
	verbosegiveitem ELIXER
	iffalse .NoRoom
	writetext MagikarpLengthRaterText_Bonus
	waitbutton
	closetext
	clearevent EVENT_KANTO_REGION_ELIXIR_ON_STANDBY
	end

.NoRoom:
	closetext
	setevent EVENT_KANTO_REGION_ELIXIR_ON_STANDBY
	end

.TooShort:
	writetext MagikarpLengthRaterText_TooShort
	waitbutton
	closetext
	end

.NotMagikarp:
	writetext MagikarpLengthRaterText_NotMagikarp
	waitbutton
	closetext
	end

.Refused:
	writetext MagikarpLengthRaterText_Refused
	waitbutton
	closetext
	end

KikaiVillageMagikarpHouseUnusedRecordSign:
; unused
	jumptext KikaiVillageMagikarpHouseUnusedRecordText

MagikarpHouseBookshelf:
	jumpstd DifficultBookshelfScript

MagikarpLengthRaterText_KikaiVillageHistory:
	text "You should never"
	line "see this dialogue."
	para "If you are, you've"
	line "either stumbled"
	para "upon a glitch, or"
	line "you're sequence"
	cont "breaking."
	para "This text only"
	line "displays if you"
	para "talk to this guy"
	line "before beating"
	para "TEAM ROCKET in the"
	line "RADIO TOWER."
	para "And you shouldn't"
	line "be here if you"
	cont "haven't done that."
	para "The developer"
	line "didn't feel like"
	para "changing the"
	line "script for this"
	para "guy since it's not"
	line "really necessary."
	para "So what are you up"
	line "to here?"
	para "You should go back"
	line "and do what you're"
	cont "supposed to do."
	done

MagikarpLengthRaterText_MenInBlack:
	text "Verschwinde,"
	line "Kleiner."
	done

MagikarpLengthRaterText_WorldsLargestMagikarp:
	text "Seit ich ein Kind"
	line "war, liebe ich"
	cont "KARPADOR."

	para "Vielleicht geht"
	line "nun mein Traum in"
	cont "Erfüllung, das"
	cont "größte KARPADOR"
	cont "der Welt zu sehen!"

	para "Hast du eine"
	line "ANGEL? Wenn ja,"
	cont "dann hilf mir"
	cont "bitte!"
	done

MagikarpLengthRaterText_YouHaveAMagikarp:
	text "Ah, du hast ein"
	line "KARPADOR! Lass uns"

	para "sehen, wie groß"
	line "das Kleine ist."
	done

MagikarpLengthRaterText_Memento:
	text "Wow! Das ist ja"
	line "riesig!"

	para "Ich ziehe meinen"
	line "Hut vor dir!"

	para "Nimm das als An-"
	line "denken!"
	done

MagikarpLengthRaterText_Bonus:
	text "Wichtig ist nur"
	line "die Erinnerung."

	para "Sieh es als eine"
	line "Art Bonus!"
	done

MagikarpLengthRaterText_TooShort:
	text "Wow! Das ist ja"
	line "riesig!"

	para "…Zumindest würde"
	line "ich das gerne sa-"
	cont "gen, aber ich habe"

	para "schon größere ge-"
	line "sehen."
	done

MagikarpLengthRaterText_NotMagikarp:
	text "Was? Das ist kein"
	line "KARPADOR!"
	done

MagikarpLengthRaterText_Refused:
	text "Oh… Du hast also"
	line "keines, das es"

	para "wert wäre, mir zu"
	line "zeigen? Vielleicht"
	cont "beim nächsten Mal."
	done

KikaiVillageMagikarpHouseUnusedRecordText:
	text "Aktueller Rekord"

	para "@"
	text_ram wStringBuffer3
	text " von"
	line "@"
	text_ram wStringBuffer4
	text_end

	text_end ; unused


KantoHouse4_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KANTO_REGION, 27
	warp_event  5,  7, KANTO_REGION, 27

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  4,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoHouse4FishingGuru, -1
