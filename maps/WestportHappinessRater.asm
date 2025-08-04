	object_const_def ; object_event constants
	const WESTPORTHAPPINESSRATER_TEACHER
	const WESTPORTHAPPINESSRATER_POKEFAN_M
	const WESTPORTHAPPINESSRATER_TWIN
	

WestportHappinessRater_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WestportHappinessRaterTeacherScript:
	faceplayer
	opentext
	special GetFirstPokemonHappiness
	writetext WestportHappinessRaterTeacherText
	buttonsound
	ifgreater 250 - 1, .LovesYouALot
	ifgreater 200 - 1, .ReallyTrustsYou
	ifgreater 150 - 1, .SortOfHappy
	ifgreater 100 - 1, .QuiteCute
	ifgreater  50 - 1, .NotUsedToYou
	jump .LooksMean

.LovesYouALot:
	writetext WestportHappinessRatingText_LovesYouALot
	waitbutton
	closetext
	end

.ReallyTrustsYou:
	writetext WestportHappinessRatingText_ReallyTrustsYou
	waitbutton
	closetext
	end

.SortOfHappy:
	writetext WestportHappinessRatingText_SortOfHappy
	waitbutton
	closetext
	end

.QuiteCute:
	writetext WestportHappinessRatingText_QuiteCute
	waitbutton
	closetext
	end

.NotUsedToYou:
	writetext WestportHappinessRatingText_NotUsedToYou
	waitbutton
	closetext
	end

.LooksMean:
	writetext WestportHappinessRatingText_LooksMean
	waitbutton
	closetext
	end

WestportHappinessRaterPokefanMScript:
	jumptextfaceplayer WestportHappinessRaterPokefanMText

WestportHappinessRaterTwinScript:
	jumptextfaceplayer WestportHappinessRaterTwinText

HappinessRatersHouseBookshelf:
	jumpstd DifficultBookshelfScript

HappinessRatersHouseRadio:
	jumpstd Radio2Script

WestportHappinessRaterTeacherText:
	text "Behandelst du"
	line "deine #MON gut,"

	para "werden sie dich"
	line "regelrecht lieben."

	para "Oh! Lass mich dein"
	line "@"
	text_ram wStringBuffer3
	text " sehen…"
	done

WestportHappinessRatingText_LovesYouALot:
	text "Es sieht sehr"
	line "glücklich aus! Es"
	cont "muss dich sehr"
	cont "gern haben."
	done

WestportHappinessRatingText_ReallyTrustsYou:
	text "Ich habe den Ein-"
	line "druck, dass es dir"
	cont "wirklich vertraut."
	done

WestportHappinessRatingText_SortOfHappy:
	text "Es verhält sich"
	line "dir gegenüber sehr"
	cont "freundlich. Es"
	cont "muss glücklich"
	cont "sein."
	done

WestportHappinessRatingText_QuiteCute:
	text "Es ist sehr süß."
	done

WestportHappinessRatingText_NotUsedToYou:
	text "Du solltest es"
	line "besser behandeln."
	cont "Es hat sich noch"
	cont "nicht an dich ge-"
	cont "wöhnt."
	done

WestportHappinessRatingText_LooksMean:
	text "Es scheint dich"
	line "gar nicht zu mö-"
	cont "gen. Es sieht ge-"
	cont "mein aus."
	done

WestportHappinessRaterPokefanMText:
	text "Ständig verliere"
	line "ich in Kämpfen und"

	para "meine #MON"
	line "werden immer be-"
	cont "siegt…"

	para "Das mag der Grund"
	line "sein, warum mich"
	cont "meine #MON"
	cont "nicht mögen…"
	done

WestportHappinessRaterTwinText:
	text "Wenn ich meinem"
	line "#MON ein Item"
	cont "gebe, dann freut"
	cont "es sich!"
	done

WestportHappinessRater_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, WESTPORT_CITY, 2
	warp_event  5,  7, WESTPORT_CITY, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event  4,  1, BGEVENT_READ, HappinessRatersHouseRadio

	db 3 ; object events
	object_event  4,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, WestportHappinessRaterTeacherScript, -1
	object_event  7,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportHappinessRaterPokefanMScript, -1
	object_event  2,  5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WestportHappinessRaterTwinScript, -1
