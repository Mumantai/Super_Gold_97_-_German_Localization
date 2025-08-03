	object_const_def ; object_event constants
	const EARLMUSEUM_EARL
	const EARLMUSEUM_BIRD
	const EARLMUSEUM_DRAGON
	const EARLMUSEUM_LASS
	const EARLMUSEUM_POKEFAN_M

EarlsMuseum_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .ArtHousePagotaTreeGone
	
.ArtHousePagotaTreeGone
	setevent EVENT_PAGOTA_TREE_CUT
	return

BirdScript:
	opentext
	writetext BirdText
	waitbutton
	closetext
	end

DragonScript:
	opentext
	writetext DragonText
	waitbutton
	closetext
	end

ArtistEarl:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .JustShowedSomething
	checkevent EVENT_GOT_THUNDERSTONE_FROM_BILLS_GRANDPA
	iftrue .GotThunderstone
	checkevent EVENT_MET_BILLS_GRANDPA
	iftrue .MetGrandpa
	writetext ArtistEarlIntroText
	buttonsound
	setevent EVENT_MET_BILLS_GRANDPA
.MetGrandpa:
	checkevent EVENT_SHOWED_ODDISH_TO_BILLS_GRANDPA
	iftrue .ShowedOddish
	checkevent EVENT_SHOWED_LICKITUNG_TO_BILLS_GRANDPA
	iftrue .ShowedLickitung
	writetext ArtistEarlLickitungText
	buttonsound
	writetext ArtistEarlAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal LUXWAN, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_LICKITUNG_TO_BILLS_GRANDPA
	jump .ShowedLickitung

.GotEverstone:
	writetext ArtistEarlOddishText
	buttonsound
	writetext ArtistEarlAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal DRATINI, .WrongPokemon; edit here, change back to dratini
	scall .CorrectPokemon
	clearevent EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
	setevent EVENT_SHOWED_ODDISH_TO_BILLS_GRANDPA
	jump .ShowedOddish


.ShowedOddish:
	scall .ReceiveItem
	verbosegiveitem EXP_SHARE
	iffalse .BagFull
	setevent EVENT_GOT_THUNDERSTONE_FROM_BILLS_GRANDPA
	closetext
	end

.ShowedLickitung:
	checkevent EVENT_GOT_EVERSTONE_FROM_BILLS_GRANDPA
	iftrue .GotEverstone
	scall .ReceiveItem
	verbosegiveitem EVERSTONE
	iffalse .BagFull
	setevent EVENT_GOT_EVERSTONE_FROM_BILLS_GRANDPA
	clearevent EVENT_SHOWED_PICHU_TO_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	closetext
	end

.ExcitedToSee:
	writetext ArtistEarlExcitedToSeeText
	buttonsound
	end

.SaidNo:
	writetext ArtistEarlYouDontHaveItTextText
	waitbutton
	closetext
	end

.CorrectPokemon:
	writetext ArtistEarlShownPokemonText
	buttonsound
	end

.ReceiveItem:
	writetext ArtistEarlTokenOfAppreciationText
	buttonsound
	end

.JustShowedSomething:
	writetext ArtistEarlComeAgainText
	waitbutton
	closetext
	end

.GotThunderstone:
	writetext ArtistEarlShownAllThePokemonText
	waitbutton
	closetext
	end

.WrongPokemon:
	writetext ArtistEarlWrongPokemonText
	waitbutton
	closetext
	end

.BagFull:
	closetext
	end
	
EggStatue:
	jumptext EggStatueText

ArtSign:
	jumptext ArtSignText
	
ArtHouseLassScript:
	jumptextfaceplayer ArtHouseLassText
	
ArtHousePokefanMScript:
	jumptextfaceplayer ArtHousePokefanMText
	
ArtHousePokefanMText:
	text "Die Werke von"
	line "diesem Kerl sind"
	cont "beeindruckend!"
	done
	
ArtHouseLassText:
	text "Weißt du, ich mag"
	line "dieses EI am"
	cont "liebsten."
	done

EggStatueText:
	text "#MON-EI-STATUE"
	line "von EARL"
	done
	
ArtSignText:
	text "EARLs KUNSTGALERIE"

	para "Nur gucken,"
	line "nicht anfassen."
	done

ArtistEarlIntroText:
    text "Ach, verdammt."

    para "Ich bin eine"
    line "Enttäuschung."

    para "Frag nicht, warum!"

    para "Na gut, ich sage"
    line "es dir."

    para "Mein Name ist EARL"
    line "und ich bin ein"
    cont "Künstler."

    para "Oder zumindest"
    line "wäre ich, gerne"
    cont "einer."

    para "Ich fühle mich nie"
    line "inspiriert."

    para "Ich habe diese"
    line "KUNSTGALERIE er-"
    para "öffnet, um meine"
    line "Arbeit mit der"
    para "Welt zu teilen,"
    line "aber die einzige"
    para "Skulptur, die ich"
    line "jemals fertig-"
    para "gestellt habe, ist"
    line "eine Skulptur von"
    cont "einem #MON-EI."

    para "Ich muss etwas"
    line "Beeindruckendes"
    cont "erschaffen!"

    para "Ich arbeite an"
    line "einer Statue vom"
    para "#MON SWALIASK,"
    line "aber sie ist noch"
    cont "nicht ganz fertig."
	done

ArtistEarlAskToSeeMonText:
    text "Falls du dieses"
    line "#MON hast,"
    para "könntest du es mir"
    line "bitte zeigen?"
	done

ArtistEarlExcitedToSeeText:
    text "Du zeigst es mir?"
    line "Das ist großartig!"
	done

ArtistEarlYouDontHaveItTextText:
    text "Oh, du hast keins?"
    line "Das ist schade…"
	done

ArtistEarlShownPokemonText:
    text "Ah, ja! Das ist"
    line "@"
    text_ram wStringBuffer3
    text "!"

    para "Ich fühle mich von"
    line "der Muse geküsst!"
	done

ArtistEarlTokenOfAppreciationText:
    text "Hier, nimm dies"
    line "als Zeichen meiner"
    cont "Dankbarkeit."
	done

ArtistEarlComeAgainText:
    text "Komm doch mal"
    line "wieder vorbei."
	done

ArtistEarlShownAllThePokemonText:
    text "Danke, dass du mir"
    line "diese #MON"
    cont "gezeigt hast!"

    para "Dank deiner Hilfe,"
    line "bin ich meinem"
    para "Traum ein großes"
    line "Stück näher"
    cont "gekommen!"
	done

ArtistEarlWrongPokemonText:
	text "Hm?"
	para "Das ist nicht das"
	line "#MON, an das"
	cont "ich gedacht habe."
	done

ArtistEarlLickitungText:
    text "Ein SWALIASK aus"
    line "der Nähe zu sehen,"
    para "könnte mich dazu"
    line "inspirieren, meine"
    para "Statue endlich zu"
    line "vollenden."
	done
	

ArtistEarlOddishText:
    text "Ich habe meine"
    line "SWALIASK-Statue"
    cont "vollendet!"

    para "Jetzt möchte ich"
    line "eine Statue von"
    para "einem DRATINI"
    line "anfertigen."

    para "Wenn ich nur ein"
    line "echtes DRATINI"
    para "sehen könnte, um"
    line "mich anzuspornen,"
    para "die Statue fertig-"
    line "zustellen."
	done

	
BirdText:
	text "SWALIASK-STATUE"
	line "von EARL"
	done
	
DragonText:
	text "DRATINI-STATUE"
	line "von EARL"
	done

EarlsMuseum_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, PAGOTA_CITY, 13
	warp_event  3,  7, PAGOTA_CITY, 14

	db 0 ; coord events

	db 2 ; bg events
	bg_event 13, 4, BGEVENT_READ, EggStatue
	bg_event 2, 3, BGEVENT_READ, ArtSign

	db 5 ; object events
	object_event  1,  5, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ArtistEarl, -1
	object_event  5,  4, SPRITE_BIRD, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BirdScript, EVENT_SHOWED_PICHU_TO_BILLS_GRANDPA
	object_event  9,  4, SPRITE_EKANS, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DragonScript, EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
	object_event 13,  7, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ArtHouseLassScript, EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
	object_event  5,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, ArtHousePokefanMScript, EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
