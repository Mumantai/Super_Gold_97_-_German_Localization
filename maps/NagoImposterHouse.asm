	object_const_def ; object_event constants
	const NAGOIMPOSTORHOUSE_FISHING_GURU
	const NAGOIMPOSTORHOUSE_DIGLETT
	const NAGOIMPOSTORHOUSE_ITEM_BALL

NagoImposterHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

NagoImposterHouseImposterScript:
	jumptextfaceplayer NagoImposterHouseImposterText

NagoDiglett:
	opentext
	writetext NagoDiglettText
	cry DIGLETT
	waitbutton
	closetext
	end
	
NagoImposterHouseAmuletCoin:; in case you miss it on the ship base
	itemball AMULET_COIN

NagoImposterHouseImposterText:
    text "BETRÜGER EICH: Oh."

    para "Du bist es."

    para "…"

    para "Ich bin nicht"
    line "hier, um zu"
    para "kämpfen oder Teil"
    line "eines bösen Plans"
    cont "zu sein."

    para "Es war falsch von"
    line "mir, mit TEAM"
    cont "ROCKET zusammen"
    cont "zu arbeiten."

    para "Vielleicht war ich"
    line "geblendet von der"
    para "Macht, die man mir"
    line "versprochen hat."

    para "Aber TEAM ROCKET"
    line "ist kein Team."

    para "Ich habe ihnen"
    line "nichts bedeutet"
    para "und sobald sie"
    line "niemanden mehr"
    para "brauchten, der die"
    line "Öffentlichkeit"
    cont "täuscht, haben sie"
    para "mich ohne Umwege"
    line "rausgeschmissen."

    para "Ich sehe sie als"
    line "das, was sie sind"
    para "und ich versuche,"
    line "diesen Teil meines"
    para "Lebens hinter mir"
    line "zulassen."

    para "Du musst mir nicht"
    line "vergeben, aber so"
    para "so stehen die"
    line "Dinge bei mir."
	done


NagoDiglettText:
	text "DIGDA: Dig dig."
	done

NagoImposterHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, NAGO_VILLAGE, 2
	warp_event  5,  7, NAGO_VILLAGE, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  7,  4, SPRITE_SURGE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, NagoImposterHouseImposterScript, EVENT_TELEPORT_GUY
	object_event  3,  5, SPRITE_DIGLETT, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, NagoDiglett, EVENT_TELEPORT_GUY
	object_event  0,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NagoImposterHouseAmuletCoin, EVENT_GOT_TEAM_ROCKET_AMULET_COIN
