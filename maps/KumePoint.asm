	object_const_def ; object_event constants
	const URASOETRAIL_FISHER1
	const URASOETRAIL_FISHER2

KumePoint_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerFisherKyle:
	trainer FISHER, KYLE, EVENT_BEAT_FISHER_KYLE, FisherKyleSeenText, FisherKyleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherKyleAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherMartin:
	trainer FISHER, MARTIN, EVENT_BEAT_FISHER_MARTIN, FisherMartinSeenText, FisherMartinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherMartinAfterBattleText
	waitbutton
	closetext
	end
	
	
FisherMartinSeenText:
	text "Geduld ist das"
	line "Zauberwort. Das"
	cont "gilt fürs Angeln"
	cont "und für #MON."
	done

FisherMartinBeatenText:
	text "Guaah!"
	done

FisherMartinAfterBattleText:
	text "Ich bin zu unge-"
	line "duldig für das"
	cont "Angeln…"
	done

FisherKyleSeenText:
    text "Das hier, ist der"
    line "beste Angelplatz,"
    cont "versprochen!"
	done

FisherKyleBeatenText:
	text "Hast du schon hier"
	line "geangelt?"
	done

FisherKyleAfterBattleText:
    text "Auf der anderen"
    line "Seite der STRAẞE,"
    para "gibt es jede Menge"
    line "ANGLER, die ihre"
    para "Seite für den"
    line "besten Angelplatz"
    cont "halten."

    para "Aber die irren"
    line "sich alle!"

    para "Ich weiß, dass"
    line "diese Seite hier"
    cont "besser ist."
	done

KumePoint_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 10, 11, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerFisherMartin, -1
	object_event  6, 11, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerFisherKyle, -1
