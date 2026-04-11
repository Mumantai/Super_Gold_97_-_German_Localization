	object_const_def ; object_event constants
	const NATIONALPARK_LASS1
	const NATIONALPARK_POKEFAN_F1
	const NATIONALPARK_TEACHER1
	const NATIONALPARK_YOUNGSTER1
	const NATIONALPARK_YOUNGSTER2
	const NATIONALPARK_TEACHER2
	const NATIONALPARK_PERSIAN
	const NATIONALPARK_POKEFAN_M
	const NATIONALPARK_LASS2
	const NATIONALPARK_POKE_BALL1
	const NATIONALPARK_GAMEBOY_KID
	const NATIONALPARK_POKE_BALL2

NationalPark_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

NationalParkLassScript:
	jumptextfaceplayer NationalParkLassText

NationalParkPokefanFScript:
	jumptextfaceplayer NationalParkPokefanFText

NationalParkTeacher1Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_QUICK_CLAW
	iftrue .GotQuickClaw
	writetext NationalParkTeacher1Text
	buttonsound
	verbosegiveitem QUICK_CLAW
	iffalse .NoRoom
	setevent EVENT_GOT_QUICK_CLAW
.GotQuickClaw:
	writetext NationalParkTeacher1Text_GotQuickClaw
	waitbutton
.NoRoom:
	closetext
	end

NationalParkYoungster1Script:
	jumptextfaceplayer NationalParkYoungster1Text

NationalParkYoungster2Script:
	jumptextfaceplayer NationalParkYoungster2Text

NationalParkTeacher2Script:
	jumptextfaceplayer NationalParkTeacher2Text

NationalParkPersian:
	faceplayer
	opentext
	writetext NationalParkPersianText
	cry PERSIAN
	waitbutton
	closetext
	end

NationalParkGameboyKidScript:
	faceplayer
	opentext
	writetext NationalParkGameboyKidText
	waitbutton
	closetext
	turnobject NATIONALPARK_GAMEBOY_KID, DOWN
	end


TrainerPokefanmWilliam:
	trainer POKEFANM, WILLIAM, EVENT_BEAT_POKEFANM_WILLIAM, PokefanmWilliamSeenText, PokefanmWilliamBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmWilliamAfterBattleText
	waitbutton
	closetext
	end


TrainerLassKrise:
	trainer LASS, KRISE, EVENT_BEAT_LASS_KRISE, LassKriseSeenText, LassKriseBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassKriseAfterBattleText
	waitbutton
	closetext
	end

NationalParkRelaxationSquareSign:
	jumptext NationalParkRelaxationSquareText

NationalParkBattleNoticeSign:
	jumptext NationalParkBattleNoticeText

NationalParkTrainerTipsSign:
	jumptext NationalParkTrainerTipsText

NationalParkParlyzHeal:
	itemball PARLYZ_HEAL

NationalParkTMDig:
	itemball TM_DIG

NationalParkHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_NATIONAL_PARK_HIDDEN_FULL_HEAL

NationalParkLassText:
    text "Wieviele #MON"
    line "gibt es so?"

    para "Es müssen bestimmt"
    line "über 200 sein."
	done

NationalParkPokefanFText:
    text "Meine Tochter ruft"
    line "mich von ihrem"
    cont "#COM aus an."

    para "Das macht mich"
    line "glücklich."
	done

NationalParkTeacher1Text:
	text "Pass bitte auf!"

	para "…Ohh, ich muss"
	line "aufhören, immer"

	para "wie ein Lehrer zu"
	line "denken."

	para "Du musst ein"
	line "#MON-Trainer"
	cont "sein."

	para "Da du so hart"
	line "arbeitest, möchte"

	para "ich dir dies"
	line "überreichen."
	done

NationalParkTeacher1Text_GotQuickClaw:
	text "Gib die FLINKKLAUE"
	line "einem #MON."

	para "Manchmal erhält es"
	line "durch sie die"
	cont "Initiative."
	done

NationalParkYoungster1Text:
	text "Ich spiele mit"
	line "Stickern, die ich"
	cont "aus meinem #DEX"
	cont "gedruckt habe."
	done

NationalParkYoungster2Text:
	text "Falls ich gewinne,"
	line "erhalte ich den"
	cont "ROBBOMB-Sticker"
	cont "meines Gegners."
	done

NationalParkTeacher2Text:
	text "Ich gehe oft"
	line "im PARK spazieren,"

	para "aber ich meide"
	line "das hohe Gras."

	para "Trainer möchten"
	line "immer kämpfen…"
	done

NationalParkPersianText:
	text "SNOBILIKAT: Fauch!"
	done

NationalParkGameboyKidText:
    text "Ich spiele #MON"
    line "ROTE EDITION!"

    para "Wusstest du, dass"
    line "du dich zu vorigen"
    para "Spielen verbinden"
    line "kannst, um mit"
    cont "ihnen zu tauschen?"
	done

SchoolboyJack1SeenText:
	text "Die #MON-Welt"
	line "bietet dir viel."

	para "Es gibt noch viele"
	line "Dinge, über die"
	cont "wir nichts wissen."

	para "Aber ich weiß"
	line "mehr als du!"
	done

SchoolboyJack1BeatenText:
	text "Wa-Wa-Was?"
	done

UnknownText_0x5c4f3:
	text "Man kann noch"
	line "viel lernen."

	para "Zum Beispiel…"

	para "Es gibt 50"
	line "verschiedene TMs."

	para "Getauschte #MON"
	line "erhalten mehr"
	cont "Erfahrungspunkte."
	done

PokefanfBeverly1SeenText:
	text "Meine #MON sind"
	line "entzückend."

	para "Ich will dir"
	line "sagen, wie stolz"
	cont "sie mich machen."
	done

PokefanfBeverly1BeatenText:
	text "Was Stolz angeht,"
	line "kann ich dich"
	cont "schlagen, aber…"
	done

UnknownText_0x5c5bd:
	text "Ich muss zugeben,"
	line "dass deine #MON"
	cont "auch süß sind."
	done

PokefanmWilliamSeenText:
	text "Wir bewundern"
	line "unsere #MON,"
	cont "auch wenn sie uns"
	cont "nicht mögen."

	para "Das macht eben den"
	line "wahren FAN aus."
	done

PokefanmWilliamBeatenText:
	text "Mei-Mein #MON!"
	done

PokefanmWilliamAfterBattleText:
	text "Ich habe zwar den"
	line "Kampf verloren,"

	para "aber meine #MON"
	line "gewinnen den"
	cont "Schönheitspreis."
	done

UnknownText_0x5c68a:
	text "Mein Freund hat"
	line "ein MARILL!"

	para "Ich finde es"
	line "liebenswert."

	para "Ich hätte gerne"
	line "selbst ein MARILL…"
	done

LassKriseSeenText:
	text "Was ist? Warum"
	line "starrst du mich"
	cont "so an?"

	para "Oh, ein Kampf?"
	done

LassKriseBeatenText:
	text "…Hmmm…"
	done

LassKriseAfterBattleText:
	text "Ich dachte, du"
	line "starrst mich an,"
	cont "weil ich süß bin!"
	done

NationalParkRelaxationSquareText:
	text "ERHOLUNGSORT"
	line "NATIONALPARK"
	done

NationalParkBattleNoticeText:
	text "Was steht denn"
	line "hier?"

	para "Kämpfe sind nur"
	line "im Gras gestattet."

	para "NATIONALPARK"
	line "BÜRO DES WÄCHTERs"
	done

NationalParkTrainerTipsText:
	text "TIPPS für TRAINER"

    para "Verschiedene #-"
    line "MON erscheinen zu"
    para "unterschiedlichen"
    line "Tageszeiten."
	done

NationalPark_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 32, 31, STAND_CITY_NATIONAL_PARK_GATE, 1
	warp_event 33, 31, STAND_CITY_NATIONAL_PARK_GATE, 2
	warp_event  6, 53, ROUTE_103_NATIONAL_PARK_GATE, 1
	warp_event  7, 53, ROUTE_103_NATIONAL_PARK_GATE, 2

	db 0 ; coord events

	db 4 ; bg events
	bg_event  8, 48, BGEVENT_READ, NationalParkRelaxationSquareSign
	bg_event 12, 24, BGEVENT_READ, NationalParkBattleNoticeSign
	bg_event 21, 53, BGEVENT_ITEM, NationalParkHiddenFullHeal
	bg_event 34, 38, BGEVENT_READ, NationalParkTrainerTipsSign

	db 12 ; object events
	object_event 14, 33, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NationalParkLassScript, -1
	object_event 16,  1, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkPokefanFScript, -1
	object_event  5, 39, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NationalParkTeacher1Script, -1
	object_event  7, 48, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkYoungster1Script, -1
	object_event  6, 48, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, NationalParkYoungster2Script, -1
	object_event 17, 39, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkTeacher2Script, -1
	object_event  4, 39, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkPersian, -1
	object_event 15,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 2, TrainerPokefanmWilliam, -1
	object_event  9, 10, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerLassKrise, -1
	object_event 36,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NationalParkParlyzHeal, EVENT_NATIONAL_PARK_PARLYZ_HEAL
	object_event 30,  1, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkGameboyKidScript, -1
	object_event 35, 47, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NationalParkTMDig, EVENT_NATIONAL_PARK_TM_DIG
