	object_const_def ; object_event constants
	const PAGOTAPOKEMONACADEMY_TEACHER
	const PAGOTAPOKEMONACADEMY_YOUNGSTER
	const PAGOTAPOKEMONACADEMY_YOUNGSTER1
	const PAGOTAPOKEMONACADEMY_GAMEBOY_KID1
	const PAGOTAPOKEMONACADEMY_GAMEBOY_KID2
	const PAGOTAPOKEMONACADEMY_YOUNGSTER2
	const PAGOTAPOKEMONACADEMY_POKEDEX

PagotaPokemonAcademy_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AcademyTeacher:
	faceplayer
	opentext
	writetext AcademyTeacherIntroText
	yesorno
	iffalse .Part1
	writetext AcademyTeacherTeachHowToWinText
	yesorno
	iffalse .Done
.Part1:
	writetext AcademyTeacherTeachMoreText
	yesorno
	iffalse .Done
	writetext AcademyTeacherTeachHowToRaiseWellText
	waitbutton
	closetext
	end

.Done:
	writetext AcademyTeacherNoMoreToTeachText
	waitbutton
	closetext
	end

PagotaPokemonAcademyYoungster1Script:
	jumptextfaceplayer PagotaPokemonAcademyYoungster1Text

PagotaPokemonAcademyGameboyKid1Script:
	faceplayer
	opentext
	writetext PagotaPokemonAcademyGameboyKid1Text
	waitbutton
	closetext
	turnobject PAGOTAPOKEMONACADEMY_GAMEBOY_KID1, DOWN
	end

PagotaPokemonAcademyGameboyKid2Script:
	faceplayer
	opentext
	writetext PagotaPokemonAcademyGameboyKid2Text
	waitbutton
	closetext
	turnobject PAGOTAPOKEMONACADEMY_GAMEBOY_KID2, DOWN
	end

PagotaPokemonAcademyYoungster2Script:
	jumptextfaceplayer PagotaPokemonAcademyYoungster2Text

AcademyBlackboard:
	opentext
	writetext AcademyBlackboardText
.Loop:
	loadmenu .BlackboardMenuHeader
	_2dmenu
	closewindow
	ifequal 1, .Poison
	ifequal 2, .Paralysis
	ifequal 3, .Sleep
	ifequal 4, .Burn
	ifequal 5, .Freeze
	closetext
	end

.Poison:
	writetext AcademyPoisonText
	waitbutton
	jump .Loop

.Paralysis:
	writetext AcademyParalysisText
	waitbutton
	jump .Loop

.Sleep:
	writetext AcademySleepText
	waitbutton
	jump .Loop

.Burn:
	writetext AcademyBurnText
	waitbutton
	jump .Loop

.Freeze:
	writetext AcademyFreezeText
	waitbutton
	jump .Loop

.BlackboardMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 11, 8
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	dn 3, 2 ; rows, columns
	db 5 ; spacing
	dba .Text
	dbw BANK(AcademyBlackboard), 0

.Text:
	db "GIF@"
	db "PAR@"
	db "SLF@"
	db "BRT@"
	db "GFR@"
	db "ZUR.@"

AcademyNotebook:
	opentext
	writetext AcademyNotebookText
	yesorno
	iffalse .Done
	writetext AcademyNotebookText1
	yesorno
	iffalse .Done
	writetext AcademyNotebookText2
	yesorno
	iffalse .Done
	writetext AcademyNotebookText3
	waitbutton
.Done:
	closetext
	end

AcademyBookshelf:
	jumpstd DifficultBookshelfScript

AcademyTeacherSpinMovement:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end
	
AcademyGBChecker:
	faceplayer
	opentext
	writetext GBText1
	waitbutton
	special GameboyCheck
	ifnotequal GBCHECK_CGB, .NotGBCCheck
	writetext GBText2
	waitbutton
	closetext
	end
	
.NotGBCCheck
	special GameboyCheck
	ifnotequal GBCHECK_SGB, .NotSGBCheck
	writetext GBText4
	waitbutton
	closetext
	end

.NotSGBCheck
	writetext GBText3
	waitbutton
	closetext
	end

GBText1:
    text "Ich habe gelesen,"
    line "dass, wenn du auf"
    para "dem Game Boy Color"
    line "spielst, es eine"
    para "Einstellung gibt,"
    line "die du im OPTION-"
    para "Menü ändern"
    line "kannst, um die"
    para "Farben im Spiel"
    line "zu verändern."
	done
	
GBText2:
    text "Sieht so aus, als"
    line "ob du einen Game"
    cont "Boy Color benutzt!"

    para "Versuche die"
    line "Einstellung mal!"
	done
	
GBText3:
    text "Sieht so aus, als"
    line "ob du einen Game"
    cont "Boy benutzt!"

    para "Da gibt es keine"
    line "Farben!"
	done

GBText4:
    text "Sieht so aus, als"
    line "ob du einen Super"
    cont "Game Boy benutzt!"

    para "Wow! Ich bin im"
    line "Fernsehen!"
	done

AcademyTeacherIntroText:
	text "Hallo!"

	para "Willkommen in der"
	line "Trainerschule von"
	cont "PAGETIA CITY."
	
	para "Willst du lernen,"
	line "wie Kämpfe funk-"
	cont "tionieren?"
	done

AcademyTeacherTeachHowToWinText:
	text "Im Kampf wird das"
	line "erste #MON auf"
	cont "der Liste begin-"
	cont "nen!"

	para "Ändere die Auf-"
	line "stellung in der"
	cont "Liste, um dich den"
	cont "Gegebenheiten an-"
	cont "zupassen!"

	para "Möchtest du noch"
	line "mehr hören?"
	done

AcademyTeacherTeachMoreText:
	text "Du möchtest also"
	line "wissen, wie man"
	cont "#MON richtig"
	cont "trainiert?"
	done

AcademyTeacherTeachHowToRaiseWellText:
	para "Selbst, wenn ein"
	line "#MON nur kurz"
	para "an einem Kampf"
	line "teilnimmt, erhält"
	cont "es einige EP."

	para "Platziere schwache"
	line "#MON an der"
	para "Spitze der Liste."
	line "Tausche sie dann"
	para "im Kampf gegen ein"
	line "anderes #MON."

	para "So können auch"
	line "schwache #MON"
	cont "stark werden!"
	done

AcademyTeacherNoMoreToTeachText:
	text "Du musst schon ein"
	line "Experte in Sachen"
	cont "#MON sein!"
	done

PagotaPokemonAcademyYoungster1Text:
	text "Ich mache mir No-"
	line "tizen über die"
	cont "Ausführungen."

	para "Besser, ich"
	line "schreibe auch"
	cont "alles von der Ta-"
	cont "fel ab."
	done

PagotaPokemonAcademyGameboyKid1Text:
	text "Ich tauschte mein"
	line "bestes #MON"
	cont "mit diesem Kerl."
	done

PagotaPokemonAcademyGameboyKid2Text:
	text "Ein #MON, das"
	line "du durch Tausch"
	cont "erhalten hast,"
	cont "wird schneller"
	cont "wachsen."

	para "Aber wenn du nicht"
	line "im Besitz des pas-"
	cont "senden ORDENs"

	para "bist, gehorchen"
	line "sie dir vielleicht"
	cont "nicht."
	done

PagotaPokemonAcademyYoungster2Text:
	text "Ein #MON, das"
	line "eine BEERE hält,"
	cont "wird sich im Kampf"
	cont "selbst heilen."

	para "Noch viele andere"
	line "Items können von"
	cont "#MON gehalten"
	cont "werden…"

	para "Es ist nicht ein-"
	line "fach, sich all"
	cont "diese Notizen zu"
	cont "machen…"
	done

AcademyBlackboardText:
	text "Auf der Tafel wer-"
	line "den die Statusver-"
	cont "änderungen von"

	para "#MON während"
	line "eines Kampfes er-"
	cont "klärt."
	done

AcademyBlackboardText2:
; unused
	text "Über welches Thema"
	line "willst du lesen?"
	done

AcademyPoisonText:
	text "Wird ein #MON"
	line "vergiftet, ver-"
	cont "liert es ständig"
	cont "KP."

	para "Die Vergiftung"
	line "dauert auch nach"

	para "dem Kampf noch an"
	line "und es verliert"
	cont "weiterhin KP."

	para "Um es zu heilen,"
	line "musst du GEGENGIFT"
	cont "einsetzen."
	done

AcademyParalysisText:
	text "Paralyse reduziert"
	line "die Geschwindig-"
	cont "keit und verhin-"
	cont "dert eventuell"
	cont "jede Bewegung."

	para "Sie dauert nach"
	line "dem Kampf noch an,"
	cont "also setze einen"
	cont "PARAHEILER ein."
	done

AcademySleepText:
	text "Schläft ein #-"
	line "MON, kann es nicht"
	cont "angreifen."

	para "Es wacht auch nach"
	line "dem Kampf nicht"
	cont "auf."

	para "Wecke es mit Hilfe"
	line "von AUFWECKER"
	cont "wieder auf."
	done

AcademyBurnText:
	text "Eine Verbrennung"
	line "lässt die KP ste-"
	cont "tig sinken und re-"
	cont "duziert die An-"
	cont "griffskraft."

	para "Die Verbrennung"
	line "bleibt nach dem"
	cont "Kampf bestehen."

	para "Verwende einen"
	line "FEUERHEILER zur"
	cont "Heilung."
	done

AcademyFreezeText:
	text "Ist dein #MON"
	line "eingefroren, ist"

	para "es zu keiner"
	line "Handlung fähig."

	para "Dieser Zustand"
	line "hält auch nach dem"

	para "Kampf an."
	line "Um es aufzutauen,"

	para "verwende einen"
	line "EISHEILER."
	done

AcademyNotebookText:
	text "Es ist das Notiz-"
	line "buch dieses Kin-"
	cont "des…"

	para "Fange #MON"
	line "mit #BÄLLEN."

	para "Bis zu sechs kön-"
	line "nen sich gleich-"
	cont "zeitig im Team be-"
	cont "finden."

	para "Weiterlesen?"
	done

AcademyNotebookText1:
	text "Bevor man den"
	line "#BALL wirft,"
	cont "muss das Ziel ge-"
	cont "schwächt werden."

	para "Ein vergiftetes"
	line "oder verbranntes"
	cont "#MON kann"
	cont "leichter gefangen"
	cont "werden."

	para "Weiterlesen?"
	done

AcademyNotebookText2:
	text "Manche Attacken"
	line "verwirren dein"
	cont "#MON."

	para "Ein verwirrtes"
	line "#MON kann sich"
	cont "auch selbst ver-"
	cont "letzen."

	para "Nach einem Kampf"
	line "endet auch die"
	cont "Verwirrung."

	para "Weiterlesen?"
	done

AcademyNotebookText3:
	text "Leute, die #-"
	line "MON fangen und in"

	para "Kämpfen einsetzen,"
	line "nennt man #-"
	cont "MON-Trainer."

	para "Man erwartet von"
	line "ihnen, dass sie"

	para "ARENEN besuchen"
	line "und gegen andere"
	cont "Trainer antreten."

	para "Die nächste Seite"
	line "ist… leer!"

	para "Junge: E-he-he…"

	para "Mehr habe ich"
	line "nicht aufgeschrie-"
	cont "ben…"
	done

AcademyStickerMachineText:
	text "Mit dieser Maschi-"
	line "ne kann man"

	para "Sticker drucken!"
	done

PagotaPokemonAcademy_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3, 15, PAGOTA_CITY, 6
	warp_event  4, 15, PAGOTA_CITY, 6

	db 0 ; coord events

	db 4 ; bg events
	bg_event  0,  1, BGEVENT_READ, AcademyBookshelf
	bg_event  1,  1, BGEVENT_READ, AcademyBookshelf
	bg_event  3,  0, BGEVENT_READ, AcademyBlackboard
	bg_event  4,  0, BGEVENT_READ, AcademyBlackboard

	db 7 ; object events
	object_event  4,  2, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, AcademyTeacher, -1
	object_event  0,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AcademyGBChecker, -1
	object_event  2,  5, SPRITE_JANINE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PagotaPokemonAcademyYoungster1Script, -1
	object_event  3, 11, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PagotaPokemonAcademyGameboyKid1Script, -1
	object_event  4, 11, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, PagotaPokemonAcademyGameboyKid2Script, -1
	object_event  4,  7, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PagotaPokemonAcademyYoungster2Script, -1
	object_event  2,  4, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AcademyNotebook, -1
