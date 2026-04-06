	object_const_def ; object_event constants
	const SAFARIOFFICE_SUPERNERD
	const SAFARIOFFICE_ROCKER
	const SAFARIOFFICE_POKEFAN_M

StandCityZooOffice_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	

SafariOfficeSuperNerdScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .SafariOfficeSuperNerdRocketsGone
	writetext SafariOfficeSuperNerdText
	waitbutton
	closetext
	end
	
.SafariOfficeSuperNerdRocketsGone
	writetext SafariOfficeSuperNerdText2
	waitbutton
	closetext
	end
	
SafariOfficeRockerScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .SafariOfficeRockerRocketsGone
	writetext SafariOfficeRockerText
	waitbutton
	closetext
	end
	
.SafariOfficeRockerRocketsGone
	writetext SafariOfficeRockerText2
	waitbutton
	closetext
	end
	
SafariOfficePokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .SafariOfficePokefanMRocketsGone
	writetext SafariOfficePokefanMText
	waitbutton
	closetext
	end
	
.SafariOfficePokefanMRocketsGone
	writetext SafariOfficePokefanMText2
	waitbutton
	closetext
	end

SafariOfficeSuperNerdText:
    text "Hallo. Dies ist"
    line "das Büro des ZOOs"
    para "von SENDESTIA"
    line "CITY."

    para "Wir sind sehr"
    line "beschäftigt damit,"
    para "zu erforschen,"
    line "warum unsere"
    para "#MON plötzlich"
    line "erkrankt sind."

    para "Der ZOO bleibt bis"
    line "auf Weiteres"
    cont "geschlossen."
	done
	
SafariOfficeSuperNerdText2:
    text "Willkommen im Büro"
    line "des SENDESTIA CITY"
    cont "ZOOs!"

    para "Wir arbeiten hart"
    line "daran, die Daten"
    para "zu untersuchen,"
    line "die wir von"
    para "unseren #MON"
    line "sammeln, um mehr"
    para "über sie zu"
    line "erfahren."
	done
	
SafariOfficeRockerText:
    text "Es scheint, als"
    line "hätten die #MON"
    cont "Kopfschmerzen…"

    para "Das ist das erste"
    line "Symptom."
	done

SafariOfficeRockerText2:
    text "Wir bringen die"
    line "#MON regelmäßig"
    para "rüber in den"
    line "NATIONALPARK,"
    para "damit sie etwas"
    line "Zeit außerhalb der"
    para "Gehege verbringen"
    line "können."
	done
	
SafariOfficePokefanMText:
    text "So etwas habe ich"
    line "noch nie gesehen…"
	done

SafariOfficePokefanMText2:
    text "Die Forschung aus"
    line "diesem ZOO hat zu"
    para "vielen Durch-"
    line "brüchen in der"
    para "Ernährung von"
    line "#MON geführt."
	done

StandCityZooOffice_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, STAND_CITY, 2
	warp_event  3,  7, STAND_CITY, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariOfficeSuperNerdScript, -1
	object_event 14,  4, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariOfficeRockerScript, -1
	object_event 10,  7, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariOfficePokefanMScript, -1

