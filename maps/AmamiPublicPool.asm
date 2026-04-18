	object_const_def ; object_event constants
	const AMAMI_PUBLIC_POOL_SQUIRTLE_GIRL
	const AMAMI_PUBLIC_POOL_SWIMMER_GUY
	const AMAMI_PUBLIC_POOL_SWIMMER_GIRL
	const AMAMI_PUBLIC_POOL_GRANNY
	const AMAMI_PUBLIC_POOL_BUG_CATCHER
	const AMAMI_PUBLIC_POOL_LASS

AmamiPublicPool_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AmamiPublicPoolSwimmerSquirtle:
	faceplayer
	opentext
	checkevent EVENT_GOT_SQUIRTLE_FROM_POOL
	iftrue .AlreadyGotSquirtle
	writetext ILoveSquirtleText
	yesorno
	iffalse .DontTakeSquirtle
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullSquirtle
	writetext ReceiveSquirtleText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke SQUIRTLE, 5
	writetext GiveSquirtleText
	waitbutton
	closetext
	setevent EVENT_GOT_SQUIRTLE_FROM_POOL
	end
	
.AlreadyGotSquirtle
	writetext AlreadyGotSquirtleText
	waitbutton
	closetext
	end
	
.DontTakeSquirtle
	writetext NoSquirtleText
	waitbutton
	closetext
	end
	
.PartyFullSquirtle
	writetext PartyFullSquirtleText
	waitbutton
	closetext
	end
	
AmamiPublicPoolSwimmerGuyScript:
	jumptextfaceplayer AmamiPublicPoolSwimmerGuyText
	
AmamiPublicPoolSwimmerGirlScript:
	jumptextfaceplayer AmamiPublicPoolSwimmerGirlText
	
AmamiPublicPoolGrannyScript:
	jumptextfaceplayer AmamiPublicPoolGrannyText
	
AmamiPublicPoolBugCatcherScript:
	jumptextfaceplayer AmamiPublicPoolBugCatcherText

AmamiPublicPoolLassScript:
	jumptextfaceplayer AmamiPublicPoolLassText
	
AmamiPublicPoolLassText:
	text "Es ist besser,"
	line "schwächere #MON"
	para "in einem kontrol-"
	line "lierten Umfeld,"
	para "wie etwas einem"
	line "Hallenbad, zu"
	para "trainieren, als im"
	line "offenen Meer."
	done
	
AmamiPublicPoolBugCatcherText:
	text "Ich will schwimmen"
	line "gehen!"
	done
	
AmamiPublicPoolGrannyText:
	text "Ich kann nicht"
	line "mehr so gut"
	cont "schwimmen."

	para "Aber meine #MON"
	line "lieben das Wasser,"
	para "also bringe ich"
	line "sie oft hierher."
	done
	
AmamiPublicPoolSwimmerGirlText:
    text "Wasser-#MON"
    line "lieben es, im"
    cont "Wasser zu sein!"

    para "Ist doch logisch,"
    line "oder?"
	done
	
AmamiPublicPoolSwimmerGuyText:
    text "Schwimmen ist eine"
    line "tolle Übung für"
    para "Menschen, sowie"
    line "für #MON!"
	done
	
ReceiveSquirtleText:
	text "<PLAYER> erhält"
	line "SCHIGGY."
	done
	
AlreadyGotSquirtleText:
	text "Ich komme fast"
	line "jeden Tag hierher,"
	para "um mit meinem"
	line "SCHIGGY zu"
	cont "schwimmen!"
	done
	
PartyFullSquirtleText:
	text "Du trägst zu viele"
	line "#MON mit dir!"
	done
	
NoSquirtleText:
	text "Bist du sicher?"

	para "Das sind so"
	line "tolle #MON!"
	done
	
	
ILoveSquirtleText:
    text "SCHIGGY sind tolle"
    line "Schwimmer!"

    para "Warst du schon mal"
    line "mit einem SCHIGGY"
    cont "schwimmen?"

    para "Du solltest es mal"
    line "ausprobieren!"

    para "Sie sind auch"
    line "tolle #MON zum"
    cont "Trainieren!"  ; etvl. ändern

    para "Ich habe ein"
    line "junges SCHIGGY,"
    para "das einen guten"
    line "Trainer braucht."

    para "Hier, du solltest"
    line "ein SCHIGGY"
    cont "aufziehen!"
	done
	
GiveSquirtleText:
	text "Hilf ihm, groß und"
	line "stark zu werden!"
	done
	
AmamiPublicPool_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  6, 17, AMAMI_TOWN, 5
	warp_event  7, 17, AMAMI_TOWN, 6

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event  5,  6, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AmamiPublicPoolSwimmerSquirtle, -1
	object_event  9,  9, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AmamiPublicPoolSwimmerGuyScript, -1
	object_event  11, 10, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, AmamiPublicPoolSwimmerGirlScript, -1
	object_event  7, 13, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AmamiPublicPoolGrannyScript, -1
	object_event  3, 14, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AmamiPublicPoolBugCatcherScript, -1
	object_event 18,  5, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, AmamiPublicPoolLassScript, -1
