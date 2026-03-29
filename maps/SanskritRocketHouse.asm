	object_const_def ; object_event constants
	const SANSKRITROCKETHOUSE_KEY_GUY
	const SANSKRITROCKETHOUSE_BIRD
	const SANSKRITROCKETHOUSE_ROCKET_1
	const SANSKRITROCKETHOUSE_ROCKET_2
	const SANSKRITROCKETHOUSE_ROCKET_3
	const SANSKRITROCKETHOUSE_ITEM

SanskritRocketHouse_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .RemoveKeyIfAlreadyHave

.RemoveKeyIfAlreadyHave:
	checkevent EVENT_USED_BASEMENT_KEY
	iftrue .RemoveThatKey
	return
	
.RemoveThatKey
	disappear SANSKRITROCKETHOUSE_ITEM
	disappear SANSKRITROCKETHOUSE_KEY_GUY
	return


SanskritRocketHouseKeyGuyScript:
	faceplayer
	opentext
	checkevent EVENT_ROCKET_KEY_DIALOGUE
	iftrue .GiveKey
	writetext SanskritRocketHouseKeyGuyText
	waitbutton
	closetext
	end

.GiveKey:
	checkevent EVENT_TALKED_TO_ROCKET_WITH_KEY
	iftrue .AlreadyGotKey
	writetext SanskritRocketHouseKeyGuyTextKeyTime
	waitbutton
	closetext
	winlosstext RocketKey_WinText, RocketKey_LossText
	loadtrainer GRUNTM, GRUNTM_23
	startbattle
	reloadmapafterbattle
	jump .returnfrombattlerocketkey
	
	
.returnfrombattlerocketkey
	opentext
	writetext RocketKey_AfterText
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_ROCKET_WITH_KEY
	setevent EVENT_KEY_GUY_IS_GONE
	appear SANSKRITROCKETHOUSE_ITEM
	clearevent EVENT_SANSKRIT_ROCKET_HOUSE_KEY_ITEM
	checkcode VAR_FACING
	ifequal LEFT, .walk_down_around_player
	applymovement SANSKRITROCKETHOUSE_KEY_GUY, KeyGuyRunsAwayInShame
	disappear SANSKRITROCKETHOUSE_KEY_GUY
	end
	
.walk_down_around_player
	applymovement SANSKRITROCKETHOUSE_KEY_GUY, KeyGuyRunsAwayInShame2
	disappear SANSKRITROCKETHOUSE_KEY_GUY
	end

.AlreadyGotKey:; this is unused now
	writetext RocketKey_Afterwards
	waitbutton
	closetext
	end

SanskritRocketHouseBirdScript:
	faceplayer
	opentext
	writetext SanskritRocketHouseBirdText
	cry MURKROW
	waitbutton
	closetext
	end

SanskritRocketHouseRocket1Script:
	faceplayer
	opentext
	checkevent EVENT_ROCKET_KEY_DIALOGUE
	iftrue .SN1KeyScript
	writetext SanskritRocketHouseRocket1Text
	waitbutton
	closetext
	end

.SN1KeyScript:
	writetext SanskritRocketHouseRocket1TextKey
	waitbutton
	closetext
	end

SanskritRocketHouseRocket2Script:
	faceplayer
	opentext
	checkevent EVENT_ROCKET_KEY_DIALOGUE
	iftrue .GMKeyScript
	writetext SanskritRocketHouseRocket2Text
	waitbutton
	closetext
	end

.GMKeyScript:
	writetext SanskritRocketHouseRocket2TextKey
	waitbutton
	closetext
	end


SanskritRocketHouseRocket3Script:
	faceplayer
	opentext
	checkevent EVENT_ROCKET_KEY_DIALOGUE
	iftrue .SN2KeyScript
	writetext SanskritRocketHouseRocket3Text
	waitbutton
	closetext
	end

.SN2KeyScript:
	writetext SanskritRocketHouseRocket3TextKey
	waitbutton
	closetext
	end


SanskritRocketHousePoster:
	jumptext SanskritRocketHousePosterText

SanskritRocketHouseTelevisionSign:
	jumptext SanskritRocketHouseTelevisionSignText

SanskritRocketHouseReferenceLibrary:
; unreferenced
	jumptext SanskritRocketHouseReferenceLibraryText
	
KeyGuyRunsAwayInShame:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step DOWN
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end
	
KeyGuyRunsAwayInShame2:
	big_step DOWN
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end
	
SanskritRocketHouseShipKeyItem:
	itemball BASEMENT_KEY

SanskritRocketHouseKeyGuyText:
	text "Ha!"

	para "Nachschub kommt"
	line "bei den KAZANAMI"
	cont "DOCKS rasch an!"

	para "Fast alles ist"
	line "bereit für die"
	cont "nächste Phase"
	cont "unseres Plans!"

	para "Das Team in"
	line "SENDESTIA CITY"
	cont "wird über unsere"
	cont "Arbeit hier sicher"
	cont "beeindruckt sein!"
	done

SanskritRocketHouseBirdText:
	text "KRAMURX: KRAWW!"
	done

SanskritRocketHouseRocket1Text:
	text "SPIELHALLEN sind"
	line "stets sichere"
	cont "Geldquellen!"

	para "Merk dir das!"
	done
	
SanskritRocketHouseRocket1TextKey:
	text "Hm? Ein Schlüssel?"

	para "Nee, den hab ich"
	line "nicht."

	para "Aber wozu willst"
	line "du ihn überhaupt?"

	para "Stell dich TEAM"
	line "ROCKET nicht in"
	cont "den Weg!"
	done

SanskritRocketHouseRocket2Text:
	text "Ein Kind funkt"
	line "uns immer wieder"
	cont "dazwischen."

	para "Erst das AQUARIUM,"
	line "dann der FLEGMON-"
	cont "BRUNNEN…"

	para "Aber egal!"

	para "Das sind nur klei-"
	line "ne Rückschläge!"

	para "HA!"
	done

SanskritRocketHouseRocket2TextKey:
	text "Welcher Schlüssel?"
	line "Ich hab keinen."
	cont "Schlüssel."

	para "Hey!"

	para "Du bist doch nicht"
	line "das Kind, das uns"
	cont "ständig die Pläne"
	cont "durchkreuzt?!"

	para "Hör auf damit,"
	line "wenn dir dein"
	cont "Leben lieb ist!"
	done


SanskritRocketHouseRocket3Text:
	text "Nicht mehr lange,"
	line "dann wird die Welt"
	cont "endlich Zeuge von"
	cont "TEAM ROCKETs"
	cont "wahrer Stärke!"
	done

SanskritRocketHouseRocket3TextKey:
	text "Nee, ich hab"
	line "keinen Schlüssel."

	para "Der KÄPT'N"
	line "traut mir so was"
	cont "nicht an."
	done

SanskritRocketHouseRocket3Text_GotExpnCard:
	text "Hey du!"

	para "Ich bin der super"
	line "MUSIKDIREKTOR!"

	para "Ich bin für die"
	line "wunderschönen"
	cont "Meldoien im Radio"
	cont "verantwortlich."

	para "Sei kein"
	line "Miesepeter."

	para "Hol dir Musik"
	line "aus dem Äther!"
	done

SanskritRocketHousePosterText:
	text "Alle #MON leben"
	line "nur für den Ruhm"
	cont "von TEAM ROCKET!"
	done

SanskritRocketHouseTelevisionSignText:
	text "Es läuft eine"
	line "Wiederholung…"
	done

SanskritRocketHouseReferenceLibraryText:
	text "Wow! Ein Regal"
	line "voller CDs und"
	cont "Videos über"
	cont "#MON!"

	para "Das ist wohl die"
	line "Präsenzbibliothek"
	cont "von TEAM ROCKET."
	done
	
SanskritRocketHouseKeyGuyTextKeyTime:
	text "Ein SCHIFFÖFFNER?"

	para "Vielleicht habe"
	line "ich so einen."

	para "Warum fragst du?"
	done

RocketKey_WinText:
	text "Was!?"
	done
	
RocketKey_LossText:
	text "Ha!"
	done
	
RocketKey_AfterText:
    text "Oh nein, der"
    line "KÄPT'N wird mich"
    cont "dafür einen Kopf"
    cont "kürzer machen!"
	done

RocketKey_AfterText2:
	text "Hau schon ab!"
	done
	
RocketKey_Afterwards:
	text "Sprich mich"
	line "nicht an!"
	done

SanskritRocketHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 16,  7, SANSKRIT_TOWN, 5
	warp_event 17,  7, SANSKRIT_TOWN, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event 16,  2, BGEVENT_READ, SanskritRocketHousePoster
	bg_event  6,  1, BGEVENT_READ, SanskritRocketHouseTelevisionSign

	db 6 ; object events
	object_event  9,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, SanskritRocketHouseKeyGuyScript, EVENT_KEY_GUY_IS_GONE
	object_event 17,  4, SPRITE_BIRD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SanskritRocketHouseBirdScript, EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	object_event 11,  2, SPRITE_ROCKET, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, SanskritRocketHouseRocket1Script, EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	object_event 19,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, SanskritRocketHouseRocket2Script, EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	object_event 15,  4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, SanskritRocketHouseRocket3Script, EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	object_event  9,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SanskritRocketHouseShipKeyItem, EVENT_SANSKRIT_ROCKET_HOUSE_KEY_ITEM
