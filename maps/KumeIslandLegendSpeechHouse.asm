	object_const_def ; object_event constants
	const KUMEISLANDLEGENDSPEECHHOUSE_LADY

KumeIslandLegendSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KumeIslandLegendSpeechHouseLadyScript:
	faceplayer
	opentext
	writetext KumeIslandLegendSpeechHouseLadyText1
	yesorno
	iffalse .TellLegend
	writetext KumeIslandLegendSpeechHouseLadyText2
	waitbutton
	closetext
	end
	
.TellLegend
	writetext KumeIslandLegendSpeechHouseLadyText3
	waitbutton
	closetext
	end
	
KumeIslandLegendSpeechHouseLadyText1:
	text "Hast du schon von"
	line "unseren örtlichen"
	cont "Legenden gehört?"
	done
	
KumeIslandLegendSpeechHouseLadyText2:
	text "Ach so, dann muss"
	line "ich sie nicht"
	cont "wiederholen."
	done

KumeIslandLegendSpeechHouseLadyText3:
	text "Erlaube mir, sie"
	line "mit dir zu teilen…"

	para "Laut den Sagen,"
	line "die seit vielen"
	para "Generationen"
	line "weitergegeben"
	para "werden, wachen"
	line "drei mythische"
	para "Vogel-#MON des"
	line "Feuers, des Eises"
	cont "und des Donners"
	cont "über die INSELN."

	para "Die drei arbeiten"
	line "im Einklang, um"
	para "das empfindliche"
	line "Gleichgewicht der"
	cont "Natur intakt zu"
	cont "halten."

	para "Man sagt, dass sie"
	line "in der JOULEHÖHLE,"
	para "auf dem RUẞGIPFEL"
	line "und direkt hinter"
	para "uns, in den Tiefen"
	line "der GEFRIERGROTTE,"
	cont "ruhen."

	para "Niemand, den ich"
	line "kenne, hat sie"
	cont "je gesehen."

	para "Die Legende sagt,"
	line "sie zeigen sich"
	para "nur jemandem,"
	line "der etwas mit"
	para "sich trägt, das"
	line "die Essenz von"
	cont "allen dreien"
	cont "vereint…"

	para "Ich frage mich,"
	line "was das wohl sein"
	para "könnte…"
	done
	
	

KumeIslandLegendSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KUME_CITY, 4
	warp_event  5,  7, KUME_CITY, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  4,  4, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KumeIslandLegendSpeechHouseLadyScript, -1
