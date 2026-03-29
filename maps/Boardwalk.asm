	object_const_def ; object_event constants
	const BOARDWALK_BUG_CATCHER
	const BOARDWALK_SUPER_NERD2
	const BOARDWALK_SUPER_NERD3
	const BOARDWALK_FISHER
	const BOARDWALK_FISHER2
	const BOARDWALK_YOUNGSTER

Boardwalk_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .MoveTutor



.MoveTutor:
	checkitem COIN_CASE
	iffalse .MoveTutorDisappear
	checkcode VAR_WEEKDAY
	ifequal WEDNESDAY, .MoveTutorAppear
	ifequal SATURDAY, .MoveTutorAppear
.MoveTutorDisappear:
	disappear BOARDWALK_FISHER2
	return

.MoveTutorAppear:
	checkflag ENGINE_DAILY_MOVE_TUTOR
	iftrue .MoveTutorDone
	appear BOARDWALK_FISHER2
.MoveTutorDone:
	return
	
TrainerPokemaniacBrent:
	trainer POKEMANIAC, BRENT1, EVENT_BEAT_POKEMANIAC_BRENT, PokemaniacBrentSeenText, PokemaniacBrentBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_BRENT_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_POKEMANIAC_BRENT
	iftrue .NumberAccepted
	checkevent EVENT_BRENT_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext PokemaniacBrentAfterBattleText
	promptbutton
	setevent EVENT_BRENT_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_POKEMANIAC_BRENT
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, POKEMANIAC, BRENT1
	scall .RegisteredNumber
	sjump .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext PokemaniacBrentBeatenText, 0
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight2
	checkflag ENGINE_FLYPOINT_STAND
	iftrue .LoadFight1
	loadtrainer POKEMANIAC, BRENT1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_BRENT_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer POKEMANIAC, BRENT2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_BRENT_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer POKEMANIAC, BRENT3
	startbattle
	reloadmapafterbattle
	clearevent EVENT_BRENT_READY_FOR_REMATCH
	end

.AskNumber1:
	jumpstd AskNumber1MScript
	end

.AskNumber2:
	jumpstd AskNumber2MScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberMScript
	end

.NumberAccepted:
	jumpstd NumberAcceptedMScript
	end

.NumberDeclined:
	jumpstd NumberDeclinedMScript
	end

.PhoneFull:
	jumpstd PhoneFullMScript
	end

.Rematch:
	jumpstd RematchMScript
	end

TrainerCamperSpencer:
	trainer CAMPER, SPENCER, EVENT_BEAT_CAMPER_SPENCER, CamperSpencerSeenText, CamperSpencerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperSpencerAfterBattleText
	waitbutton
	closetext
	end



	
TrainerFledglingHidalgo:
	trainer FLEDGLING, HIDALGO, EVENT_BEAT_FLEDGLING_HIDALGO, FledglingHidalgoSeenText, FledglingHidalgoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FledglingHidalgoAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacRon:
	trainer POKEMANIAC, RON, EVENT_BEAT_POKEMANIAC_RON, PokemaniacRonSeenText, PokemaniacRonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacRonAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherMarvin:
	trainer FISHER, MARVIN, EVENT_BEAT_FISHER_MARVIN, FisherMarvinSeenText, FisherMarvinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherMarvinAfterBattleText
	waitbutton
	closetext
	end


MoveTutorScript:
	faceplayer
	opentext
	writetext ICanTeachYourMonMovesText
	yesorno
	iffalse .Refused
	special DisplayCoinCaseBalance
	writetext ItWIllCostYouText
	yesorno
	iffalse .Refused2
	checkcoins 2000
	ifequal HAVE_LESS, .NotEnoughMoney
	writetext YouWontRegretItText
	loadmenu .MoveMenuHeader
	verticalmenu
	closewindow
	ifequal MOVETUTOR_FLAMETHROWER, .Flamethrower
	ifequal MOVETUTOR_THUNDERBOLT, .Thunderbolt
	ifequal MOVETUTOR_ICE_BEAM, .IceBeam
	jump .Incompatible

.Flamethrower:
	writebyte MOVETUTOR_FLAMETHROWER
	writetext WeirdNotSureText
	special MoveTutor
	ifequal FALSE, .TeachMove
	jump .Incompatible

.Thunderbolt:
	writebyte MOVETUTOR_THUNDERBOLT
	writetext WeirdNotSureText
	special MoveTutor
	ifequal FALSE, .TeachMove
	jump .Incompatible

.IceBeam:
	writebyte MOVETUTOR_ICE_BEAM
	writetext WeirdNotSureText
	special MoveTutor
	ifequal FALSE, .TeachMove
	jump .Incompatible

.MoveMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 15, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "FLAMMENWURF@"
	db "DONNERBLITZ@"
	db "EISSTRAHL@"
	db "ZURÜCK@"

.Refused:
	writetext UnknownText_0x1990b4
	waitbutton
	closetext
	end

.Refused2:
	writetext HmTooBadText
	waitbutton
	closetext
	end

.TeachMove:
	special DisplayCoinCaseBalance; looks like putting this here fixed weird CGB glitch
	writetext IfYouUnderstandText
	buttonsound
	takecoins 2000
	waitsfx
	playsound SFX_TRANSACTION
	special DisplayCoinCaseBalance
	writetext WahahahaFarewellKidText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal RIGHT, .WalkAroundPlayer
	applymovement BOARDWALK_FISHER2, MovementData_0x198a5f
	jump .GoInside

.WalkAroundPlayer:
	applymovement BOARDWALK_FISHER2, MovementData_0x198a63
.GoInside:
	playsound SFX_ENTER_DOOR
	disappear BOARDWALK_FISHER2
	clearevent EVENT_BOARDWALK_GAME_CORNER_MOVE_TUTOR
	setflag ENGINE_DAILY_MOVE_TUTOR
	waitsfx
	end

.Incompatible:
	writetext UnknownText_0x1991a4
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext YouDontHaveEnoughCoinsTutorText
	waitbutton
	closetext
	end

BoardwalkSign1:
	jumptext BoardwalkSign1Text

BoardwalkSign2:
	jumptext BoardwalkSign2Text

BoardwalkTrainerTips:
	jumptext BoardwalkTrainerTipsText

BoardwalkFruitTree:
	fruittree FRUITTREE_TREE_ROUTE_112


MovementData_0x198a5f:
	step LEFT
	step LEFT
	step UP
	step_end

MovementData_0x198a63:
	step DOWN
	step LEFT
	step LEFT
	step UP
	step UP
	step_end


ICanTeachYourMonMovesText:
	text "Wenn du möchtest,"
	line "kann ich deinen"

	para "#MON tolle"
	line "Attacken"
	cont "beibringen."

	para "Soll ich das"
	line "machen?"
	done

ItWIllCostYouText:
	text "Das kostet dich"
	line "2000 Münzen. Okay?"
	done

UnknownText_0x1990b4:
	text "Uah… aber sie sind"
	line "wirklich toll…"
	done

YouWontRegretItText:
	text "Wahahah! Das wirst"
	line "du nicht bereuen!"

	para "Welche Attacke"
	line "erlernen?"
	done

HmTooBadText:
	text "Hm, Mist. Ich muss"
	line "noch Geld von zu"
	cont "Hause holen…"
	done

IfYouUnderstandText:
	text "Wenn du verstehst,"
	line "was an dieser"

	para "Attacke so toll"
	line "ist, dann darfst"

	para "du dich einen"
	line "Trainer nennen."
	done

WahahahaFarewellKidText:
	text "Wahahah! Mach's"
	line "gut, Wicht!"
	done

UnknownText_0x1991a4:
    text "A-aber…"
	done

YouDontHaveEnoughCoinsTutorText:
	text "…Du hast nicht"
	line "genügend Münzen"
	cont "dabei…"
	done

WeirdNotSureText:
	text_start
	done


FledglingHidalgoSeenText:
	text "Can I try battling"
	line "against you?"
	done
	
FledglingHidalgoBeatenText:
	text "This is tough!"
	done
	
FledglingHidalgoAfterBattleText:
	text "I'll work hard to"
	line "keep getting"
	cont "better at this!"
	done
	

PokemaniacBrentSeenText:
	text "Heh! Hast du"
	line "seltene #MON?"
	done

PokemaniacBrentBeatenText:
	text "Meine armen #-"
	line "MON-Lieblinge!"
	done

PokemaniacBrentAfterBattleText:
	text "Ich wäre schon"
	line "froh, wenn ich nur"
	cont "ein einziges"
	cont "seltenes #MON"
	cont "hätte."
	done

PokemaniacRonSeenText:
	text "Stell dir mal vor!"

	para "So ein <RIVAL>"
	line "hat meine #MON"
	cont "besiegt!"

	para "Unverschämtheit!"
	line "Meine #MON"
	cont "sind toll!"

	para "Gegen dich gewinne"
	line "ich bestimmt!"
	done

PokemaniacRonBeatenText:
	text "Mein Team hat sich"
	line "wacker geschlagen!"
	done

PokemaniacRonAfterBattleText:
	text "Für die meisten"
	line "Menschen ist es"

	para "ganz natürlich,"
	line "unterschiedliche"

	para "Arten von #MON"
	line "zu mögen."

	para "Es geht bei"
	line "#MON nicht"

	para "darum, das"
	line "Stärkste von allen"
	cont "zu haben."
	done

FisherMarvinSeenText:
	text "Ich bin gerade"
	line "ziemlich am Boden."

	para "Vielleicht liegt"
	line "das an dem Item,"
	cont "das ich benutze."

	para "Kämpfen wir! Das"
	line "hebt vielleicht"
	cont "meine Laune!"
	done

FisherMarvinBeatenText:
	text "Ich habe verloren,"
	line "aber ich fühle"
	cont "mich trotzdem"
	cont "besser."
	done

FisherMarvinAfterBattleText:
	text "KURTs KÖDERBALL"
	line "eignet sich am"

	para "besten, um #-"
	line "MON, die an der"
	cont "Angel hängen,"
	cont "einzufangen."

	para "Er ist viel"
	line "effektiver als"
	cont "der HYPERBALL."
	done

CamperSpencerSeenText:
	text "Man kann so viel"
	line "unternehmen mit"
	cont "seinen #MON -"
	cont "das macht"
	cont "unheimlich viel"
	cont "Spaß!"
	done

CamperSpencerBeatenText:
	text "Verlieren macht"
	line "überhaupt keinen"
	cont "Spaß…"
	done

CamperSpencerAfterBattleText:
	text "Warst du schonmal"
	line "im JADEWALD?"

	para "Wir wollen dort"
	line "zelten."
	done

PicnickerTiffanySeenText:
	text "Gehst du auch zur"
	line "SPIELHALLE?"

	para "Spielen wir ein"
	line "bisschen!"
	done

PicnickerTiffanyBeatenText:
	text "Ich habe zu lange"
	line "gespielt!"
	done

PicnickerTiffanyWantsPicnicText:
	text "Ich mache ein"
	line "Picknick mit"
	cont "meinen #MON."

	para "Setz dich doch zu"
	line "uns."
	done

PicnickerTiffanyClefairyText:
	text "Ist mein PIEPI"
	line "nicht"
	cont "herzallerliebst?"
	done

BoardwalkSign1Text:
	text "PROMENADE"

	para "GLYPHONTIA -"
	line "GENEOS CITY"
	done

BoardwalkSign2Text:
	text "PROMENADE"
	line "SPIELHALLE"

	para "Dein Quell für"
	line "Spaß!"
	done

BoardwalkTrainerTipsText:
	text "TIPPS für TRAINER"

	para "Alle #MON haben"
	line "Vor- und Nach-"

	para "teile. Das hängt"
	line "ganz davon ab,"
	cont "welchem Element"
	cont "sie angehören."

	para "Sind zwei #MON"
	line "unterschiedlicher"

	para "Elemente, kann"
	line "sogar ein #MON"
	cont "verlieren, das"
	cont "einen höheren"
	cont "Level hat."

	para "Finde heraus,"
	line "welche Elemente"

	para "effektiv oder"
	line "ineffektiv gegen"
	cont "deine #MON"
	cont "sind."
	done

Boardwalk_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event  6, 51, BOARDWALK_TEKNOS_GATE, 1
	warp_event  7, 51, BOARDWALK_TEKNOS_GATE, 2
	warp_event 14,  5, BOARDWALK_GATE, 3
	warp_event 14,  2, BOARDWALK_GATE, 1
	warp_event 15,  2, BOARDWALK_GATE, 2
	warp_event 15,  5, BOARDWALK_GATE, 4
	warp_event 10, 21, BOARDWALK_GAME_CORNER, 1
	warp_event 11, 21, BOARDWALK_GAME_CORNER, 2

	db 0 ; coord events

	db 3 ; bg events
	bg_event 11,  8, BGEVENT_READ, BoardwalkSign1
	bg_event  9, 22, BGEVENT_READ, BoardwalkSign2
	bg_event 13, 38, BGEVENT_READ, BoardwalkTrainerTips

	db 6 ; object events
	object_event 17, 15, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerFledglingHidalgo, -1
	object_event  7, 35, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacBrent, -1
	object_event  8,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacRon, -1
	object_event  2, 16, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerFisherMarvin, -1
	object_event 13, 22, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 4, MoveTutorScript, EVENT_BOARDWALK_MOVE_TUTOR
	object_event  8, 42, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperSpencer, -1
