	object_const_def ; object_event constants
	const BILLSBROTHERSHOUSE_YOUNGSTER

BillsBrothersHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BillsBrothersHouseYoungsterScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .BillsBrotherRocketsGone
	writetext BillsBrothersHouseYoungsterText
	waitbutton
	closetext
	end
	
.BillsBrotherRocketsGone
	writetext BillsBrothersHouseYoungsterAllGoodText
	waitbutton
	closetext
	end
	

BillsBrothersHouseYoungsterText:
    text "Das Haus nebenan"
    line "ist ziemlich"
    cont "verdächtig."

    para "Dort kommen und"
    line "gehen ständig"
    para "Mitglieder von"
    line "TEAM ROCKET ein"
    cont "und aus."
	done

BillsBrothersHouseYoungsterAllGoodText:
    text "SENDESTIA CITY ist"
    line "kein Ort für"
    cont "Verbrechen."

    para "Endlich ist TEAM"
    line "ROCKET weg!"
	done

BillsBrothersHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, STAND_CITY, 4
	warp_event  5,  7, STAND_CITY, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillsBrothersHouseYoungsterScript, -1
