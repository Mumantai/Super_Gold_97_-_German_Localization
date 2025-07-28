	object_const_def ; object_event constants
	const PAGOTAGYM_FALKNER
	const PAGOTAGYM_YOUNGSTER1
	const PAGOTAGYM_YOUNGSTER2
	const PAGOTAGYM_GYM_GUY

PagotaGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PagotaGymFalknerScript:
	faceplayer
	checkevent EVENT_REMATCH_AVAILABLE_FALKNER
	iftrue RematchScriptFalkner
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue PostRematchScriptFalkner
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftrue .FightDone
	writetext FalknerIntroText
	waitbutton
	closetext
	winlosstext FalknerWinLossText, 0
	loadtrainer FALKNER, FALKNER1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_FALKNER
	opentext
	writetext ReceivedZephyrBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_ZEPHYRBADGE
	checkcode VAR_BADGES
	scall PagotaGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM31_MUD_SLAP
	iftrue .SpeechAfterTM
	setevent EVENT_BEAT_BIRD_KEEPER_ROD
	setevent EVENT_BEAT_BIRD_KEEPER_ABE
	setevent EVENT_SHOWED_PICHU_TO_BILLS_GRANDPA
	setevent EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
	clearevent EVENT_ROUTE_102_SILVER
	specialphonecall SPECIALCALL_ASSISTANT
	writetext FalknerZephyrBadgeText
	buttonsound
	verbosegiveitem TM_MUD_SLAP
	iffalse .NoRoomForMudSlap
	setevent EVENT_GOT_TM31_MUD_SLAP
	writetext FalknerTMMudSlapText
	waitbutton
	closetext
	end
	

.SpeechAfterTM:
	writetext FalknerFightDoneText
	waitbutton
.NoRoomForMudSlap:
	closetext
	end
	
RematchScriptFalkner:
	opentext
	writetext FalknerRematchText
	waitbutton
	closetext
	winlosstext FalknerRematchWinText, 0
	loadtrainer FALKNER, FALKNER2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_REMATCH_AVAILABLE_FALKNER
	opentext
	writetext FalknerAfterRematchText
	waitbutton
	closetext
	end

PostRematchScriptFalkner:
	opentext
	writetext FalknerAfterRematchText
	waitbutton
	closetext
	end

FalknerRematchText:
    text "Ich hab' gehört,"
    line "du hast die TOP"
    cont "VIER besiegt."

    para "Glückwunsch!"

    para "Ich habe hier"
    line "in der PAGETIA"
    para "ARENA auch viel"
    line "trainiert."

    para "Mal sehen, ob du"
    line "mich immer noch"
    cont "besiegen kannst!"
	done

FalknerRematchWinText:
	text "Kein Wunder, dass"
	line "du der CHAMP bist!"
	done

FalknerAfterRematchText:
    text "Ich bin froh, dein"
    line "erster Schritt zu"
    para "wahrer Größe"
    line "gewesen zu sein!"

    para "Mach weiter so!"
	done



PagotaGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .WestportRockets
	end

.WestportRockets:
	jumpstd WestportRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerBirdKeeperRod:
	trainer BIRD_KEEPER, ROD, EVENT_BEAT_BIRD_KEEPER_ROD, BirdKeeperRodSeenText, BirdKeeperRodBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperRodAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperAbe:
	trainer BIRD_KEEPER, ABE, EVENT_BEAT_BIRD_KEEPER_ABE, BirdKeeperAbeSeenText, BirdKeeperAbeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperAbeAfterBattleText
	waitbutton
	closetext
	end


PagotaGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_PAGOTA_GYM_FALKNER
	iftrue .nothere
	checkevent EVENT_BEAT_FALKNER
	iftrue .PagotaGymGuyWinScript
	writetext PagotaGymGuyText
	waitbutton
	closetext
	end
	
.nothere
	writetext PagotaGymGuyTextNotHere
	waitbutton
	closetext
	end
	
.PagotaGymGuyWinScript:
	writetext PagotaGymGuyWinText
	waitbutton
	closetext
	end

PagotaGymStatue:
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	trainertotext FALKNER, FALKNER1, MEM_BUFFER_1
	jumpstd GymStatue2Script

FalknerIntroText:
    text "Ich wusste, dass"
    line "du hier aufkreuzen"
    cont "würdest!"

    para "Es ist immer schön,"
    line "zu sehen, wie ein"
    para "neuer Trainer die"
    line "#MON-LIGA"
    cont "herausfordert."

    para "Aber bist du auch"
    line "bereit, mich zu"
    cont "besiegen?"

	para "Ich werde dich die"
	line "wahre Kraft der"
	para "Flug-#MON"
	line "spüren lassen!"
	done

FalknerWinLossText:
	text "…Verflixt! Das"
	line "waren die gelieb-"
	para "ten Flug-#MON"
    line "meines Vaters…"

	para "Also gut."
	line "Nimm dies!"

	para "Es ist der offi-"
	line "zielle FLÜGELORDEN"
	cont "der #MON"
	cont "LIGA."
	done

ReceivedZephyrBadgeText:
	text "<PLAYER> erhält den"
	line "FLÜGELORDEN."
	done

FalknerZephyrBadgeText:
	text "Der FLÜGELORDEN"
	line "stärkt den ANGR-"
	cont "Wert deiner #-"
	cont "MON."

	para "Außerdem können"
	line "deine #MON"

	para "jederzeit den"
	line "ZERSCHNEIDER"
	cont "einsetzen."

	para "Hier - ich habe"
	line "noch etwas für"
	cont "dich."
	done

FalknerTMMudSlapText:
	text "Benutzt ein #-"
	line "MON eine TM, er-"
	cont "lernt es sofort"
	cont "eine neue Attacke."

	para "Überlege dir den"
	line "Einsatz gut - eine"
	cont "TM kann nur einmal"
	cont "eingesetzt werden."

	para "TM31 enthält"
	line "LEHMSCHELLE."

	para "Sie fügt dem Geg-"
	line "ner Schaden zu und"

	para "reduziert gleich-"
	line "zeitig seine Ge-"
	cont "nauigkeit."

	para "Mit anderen Wor-"
	line "ten: Sie ist"
	cont "sowohl defensiv"
	cont "als auch offensiv."
	done

FalknerFightDoneText:
	text "In so mancher"
	line "Stadt warten noch"
	cont "ARENEN auf dich."

	para "Du solltest dein"
	line "Können in diesen"
	cont "ARENEN beweisen."

	para "Ich werde noch"
	line "härter trainieren,"

	para "um der größte Vo-"
	line "gel-Experte aller"
	cont "Zeiten zu werden!"
	done

BirdKeeperRodSeenText:
	text "Das Motto lautet:"
	line "Courage!"

	para "Sie alle hier üben"
	line "Tag und Nacht,"

	para "um Vogel-Meister-"
	line "Trainer zu werden."

	para "Komm schon!"
	done

BirdKeeperRodBeatenText:
	text "Gaaah!"
	done

BirdKeeperRodAfterBattleText:
	text "FALKs Fähigkeiten"
	line "sind unübertreff-"
	cont "lich!"

	para "Du solltest dich"
	line "nicht überschät-"
	cont "zen, nur weil du"
	cont "mich geschlagen"
	cont "hast!"
	done

BirdKeeperAbeSeenText:
	text "Lass mich heraus-"
	line "finden, ob du gut"
	cont "genug bist, um ge-"
	cont "gen FALK anzutre-"
	cont "ten!"
	done

BirdKeeperAbeBeatenText:
	text "Das kann nicht"
	line "wahr sein!"
	done

BirdKeeperAbeAfterBattleText:
	text "Das ist peinlich!"
	line "Von einem Anfänger"
	cont "besiegt…"
	done

PagotaGymGuyText:
	text "Hey! Zwar bin ich"
	line "kein Trainer, aber"
	cont "ich kann dir gute"
	cont "Tipps geben!"

	para "Glaube mir!"
	line "Wenn du es tust,"

	para "kann dein Traum"
	line "von der Meister-"
	cont "schaft in Erfül-"
	cont "lung gehen."

	para "Du glaubst mir?"
	line "Dann pass auf!"

	para "Typ Pflanze ist"
	line "schwach gegen Typ"

	para "Flug. Das solltest"
	line "du dir merken."
	done

PagotaGymGuyTextNotHere:
    text "Hey! Bist du hier,"
    line "um FALK heraus-"
    cont "zufordern?"

    para "Ich sage es nur"
    line "ungern, aber er"
    cont "ist nicht hier!"

    para "FALK ist gerade"
    line "unterwegs."

    para "Du solltest ihn"
    line "in der Stadt"
    cont "suchen."

    para "Er kann nicht weit"
    line "gekommen sein."
	done

PagotaGymGuyWinText:
	text "Netter Kampf! Mach"
	line "weiter so und bald"

	para "schon wirst du der"
	line "CHAMP sein!"
	done

PagotaGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3, 15, PAGOTA_CITY, 2
	warp_event  4, 15, PAGOTA_CITY, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  2, 13, BGEVENT_READ, PagotaGymStatue
	bg_event  5, 13, BGEVENT_READ, PagotaGymStatue

	db 4 ; object events
	object_event  4,  4, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PagotaGymFalknerScript, EVENT_PAGOTA_GYM_FALKNER
	object_event  7,  0, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperRod, -1
	object_event  0,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperAbe, -1
	object_event  6, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PagotaGymGuyScript, -1
