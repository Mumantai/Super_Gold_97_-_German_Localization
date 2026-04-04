	object_const_def ; object_event constants
;	const ROUTE108_STANDING_YOUNGSTER1
;	const ROUTE108_LASS
	const ROUTE108_STANDING_YOUNGSTER2
;	const ROUTE108_SAILOR
	const ROUTE108_FRUIT_TREE
	const ROUTE108_BUENA2

Route108_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBirdKeeperToby:
	trainer BIRD_KEEPER, TOBY, EVENT_BEAT_BIRD_KEEPER_TOBY, BirdKeeperTobySeenText, BirdKeeperTobyBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext BirdKeeperTobyAfterBattleText
	waitbutton
	closetext
	end

;TrainerSailorHarry:
;	trainer SAILOR, HARRY, EVENT_BEAT_SAILOR_HARRY, SailorHarrySeenText, SailorHarryBeatenText, 0, .Script

;.Script
;	endifjustbattled
;	opentext
;	writetext SailorHarryAfterBattleText
;	waitbutton
;	closetext
;	end


TrainerBeautyOlivia:
	trainer BEAUTY, OLIVIA, EVENT_BEAT_BEAUTY_OLIVIA, BeautyOliviaSeenText, BeautyOliviaBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext BeautyOliviaAfterBattleText
	waitbutton
	closetext
	end

Route108Sign:
	jumptext Route108SignText

Route108TrainerTips:
	jumptext Route108TrainerTipsText

Route108FruitTree:
	fruittree FRUITTREE_TREE_ROUTE_108

BirdKeeperTobySeenText:
	text "Fliege hoch in die"
	line "Luft, mein"
	cont "herrliches"
	cont "Vogel-#MON!"
	done

BirdKeeperTobyBeatenText:
	text "Ich fühle mich,"
	line "als würde ich mich"
	cont "selbst in die"
	cont "Lüfte erheben."
	done

BirdKeeperTobyAfterBattleText:
	text "Ich habe vor,"
	line "in GENEOS CITY"
	para "im KAMPF-DOJO zu"
	line "trainieren."

	para "FLUG-#MON sind"
	line "stark gegen"
	cont "KAMPF-#MON."

	para "…Ist das ein"
    line "unfairer Vorteil?"
	done


UnknownText_0x1a200e:
	text "Ich habe so viele"
	line "Prüfungen, dass"

	para "ich nicht viel"
	line "Zeit für #MON"
	cont "habe."

	para "Wenn ich also mal"
	line "Zeit zum Spielen"
	cont "habe, dann konzen-"
	cont "triere ich mich."
	done

LassDana1SeenText:
	text "Du scheinst dich"
	line "mit #MON"
	cont "auszukennen."

	para "Gibst du mir bitte"
	line "einige Ratschläge?"
	done

LassDana1BeatenText:
	text "Ich verstehe. So"
	line "kämpfst du also."
	done

UnknownText_0x1a20ec:
	text "Ich kenne etwas"
	line "sehr Bekömmliches!"

	para "KUHMUH-MILCH ist"
	line "ein nahrhaftes"
	cont "Getränk für #-"
	cont "MON!"

	para "Du kannst sie in"
	line "SENDESTIA CITY"
	cont "kaufen."
	done

SailorHarrySeenText:
	text "Ich war im Aus-"
	line "land. Deswegen"

	para "kenne ich alle"
	line "#MON-Arten!"
	done

SailorHarryBeatenText:
	text "Deine Fähigkeiten"
	line "sind Spitzen-"
	cont "klasse!"
	done

SailorHarryAfterBattleText:
	text "Alle Menschen auf"
	line "der ganzen Welt"

	para "leben glücklich"
	line "zusammen mit den"
	cont "#MON."
	done

BeautyOliviaSeenText:
	text "Meine #MON und"
	line "ich sind wunder-"
	cont "schön, nicht wahr?"
	done

BeautyOliviaBeatenText:
    text "Ich hale meine"
    line "#MON stets"
    cont "top gepflegt."
	done

BeautyOliviaAfterBattleText:
	text "Warst du schon mal"
	line "mit deinen #MON"
	para "beim Coiffeur in"
	line "PORT ABANISHI?"
	done

Route108SignText:
	text "ROUTE 108"

	para "GENEOS CITY     -"
	line "KATAOMORIA CITY"
	done

Route108TrainerTipsText:
	text "TIPPS für TRAINER"
	line "Wenn sich ein"

	para "#MON weiter-"
	line "entwickelt, kannst"

	para "du diesen Prozess"
	line "aufhalten."

	para "Drücke während"
	line "der Entwicklung"
	cont "den B-Knopf."

	para "So wird das #-"
	line "MON erschreckt und"
	cont "es bricht die"
	cont "Entwicklung ab."
	done

Route108_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  0, ROUTE_109_ROUTE_110_GATE, 1
	warp_event  1,  0, ROUTE_109_ROUTE_110_GATE, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  6,  4, BGEVENT_READ, Route108Sign
	bg_event 18,  4, BGEVENT_READ, Route108TrainerTips

	db 3 ; object events
;	object_event 19,  6, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyChad1, -1
;	object_event  8,  7, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLassDana1, -1
	object_event  7, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBirdKeeperToby, -1
;	object_event 24,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSailorHarry, -1
	object_event 28,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route108FruitTree, -1
	object_event 18, 11, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerBeautyOlivia, -1
