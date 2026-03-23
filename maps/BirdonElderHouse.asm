	object_const_def ; object_event constants
	const BIRDONELDERHOUSE_POKEFAN_M

BirdonElderHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BirdonElderHousePokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_103_SLOWPOKE_SALESMAN
	iftrue .GiveSurf
	writetext ElderSlowpokeProblem
	waitbutton
	closetext
	end
	

.GiveSurf
	checkevent EVENT_GOT_HM03_SURF
	iftrue .GotSurf
	writetext ElderTakeThisSurfText
	yesorno
	iffalse .Refused
	verbosegiveitem HM_SURF
	setevent EVENT_GOT_HM03_SURF
	writetext ElderSurfDescriptionText
	waitbutton
	closetext
	end

.NoRoom:
	writetext ElderNoSurf
	waitbutton
	closetext
	end

.Refused:
	writetext ElderNoSurf
	waitbutton
	closetext
	end

.GotSurf:
	writetext ElderStandardText
	waitbutton
	closetext
	end

BirdonElderHouseBookshelf:
	jumpstd PictureBookshelfScript

ElderSlowpokeProblem:
	text "In meinen Knochen"
	line "spüre ich Ärger im"
	cont "BRUNNEN unter"
	cont "der Stadt."

	para "Es war stets meine"
	line "Aufgabe, dass die"
	para "FLEGMON sicher"
	line "bleiben."

	para "Ich weiß nicht, ob"
	line "ich noch die Kraft"
	cont "habe, sie zu"
	cont "beschützen."

	para "Ich hoffe, es geht"
	line "ihnen gut…"
	done

ElderTakeThisSurfText:
	text "Ah!"

	para "Danke, dass du"
	line "vorbeischaust!"

	para "Ich bin dir sehr"
	line "dankbar."

	para "Und die FLEGMON"
	line "sind es sicher"
	cont "auch!"

	para "Hier, lass mich"
	line "dir etwas für"
	cont "deine Mühen geben."
	done
	
ElderNoSurf:
	text "Bist du sicher?"
	line "Du kanst das"
	cont "bestimmt brauchen."
	done
	
ElderSurfDescriptionText:
	text "Diese VM erlaubt"
	line "dir deinen #MON"
	cont "eine Attacke bei-"
	cont "zubringen, mit der"
	cont "man jedes Gewässer"
	cont "überqueren kann."

	para "Hier gibt es zwar"
	line "kaum Wasser, aber"
	cont "woanders ist sie"
	cont "bestimmt nützlich."
	done
	
ElderStandardText:
	text "Die FLEGMON im"
	line "BRUNNEN verdienen"
	cont "unseren Schutz."
	done


BirdonElderHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, BIRDON_TOWN, 4
	warp_event  4,  7, BIRDON_TOWN, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event  1,  1, BGEVENT_READ, BirdonElderHouseBookshelf

	db 1 ; object events
	object_event  2,  3, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BirdonElderHousePokefanMScript, -1
