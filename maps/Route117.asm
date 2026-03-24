	object_const_def ; object_event constants
	const ROUTE117_FISHER1
	const ROUTE117_YOUNGSTER1
	const ROUTE117_YOUNGSTER2
	const ROUTE117_SUPERNERD
	const ROUTEU6U_FRUIT_TREE
	const ROUTE117_ITEMBALL_1
	const ROUTE117_ITEMBALL_2
	const ROUTE117_ITEMBALL_3
Route117_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerFirebreatherOtis:
	trainer FIREBREATHER, OTIS, EVENT_BEAT_FIREBREATHER_OTIS, FirebreatherOtisSeenText, FirebreatherOtisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherOtisAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterWarren:
	trainer YOUNGSTER, WARREN, EVENT_BEAT_YOUNGSTER_WARREN, YoungsterWarrenSeenText, YoungsterWarrenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterWarrenAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterJimmy:
	trainer YOUNGSTER, JIMMY, EVENT_BEAT_YOUNGSTER_JIMMY, YoungsterJimmySeenText, YoungsterJimmyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterJimmyAfterBattleText
	waitbutton
	closetext
	end


Route117FruitTree:
	fruittree FRUITTREE_TREE_ROUTE_117
	
Route116DireHit:
	itemball DIRE_HIT


Route116Carbos:
	itemball CARBOS

Route116Elixer:
	itemball ELIXER
	

Route116HiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_ROUTE_116_HIDDEN_MAX_ETHER

Route116HiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_ROUTE_116_HIDDEN_FULL_HEAL

Route116HiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_ROUTE_116_HIDDEN_FULL_RESTORE

Route116HiddenRevive:
	hiddenitem REVIVE, EVENT_ROUTE_116_HIDDEN_REVIVE


TrainerEngineerMarkson:
	trainer ENGINEER, MARKSON, EVENT_BEAT_ENGINEER_MARKSON, EngineerMarksonSeenText, EngineerMarksonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext EngineerMarksonAfterText
	waitbutton
	closetext
	end

FirebreatherOtisSeenText:
	text "Ah! Das Wetter"
	line "ist so schön"
	cont "wie immer."
	done

FirebreatherOtisBeatenText:
	text "Die Sonne scheint,"
	line "dennoch bin ich"
	cont "nass…"
	done

FirebreatherOtisAfterBattleText:
	text "Bei Regen ist"
	line "eine Zündung sehr"
	cont "schwierig…"
	done

YoungsterWarrenSeenText:
	text "Hmmm… Dieser Baum"
	line "ist merkwürdig…"
	done

YoungsterWarrenBeatenText:
	text "Ich wusste es…"
	done

YoungsterWarrenAfterBattleText:
	text "Du hast gleich"
	line "einen starken"
	cont "Eindruck gemacht."

	para "Ich hatte Angst,"
	line "gegen dich zu"
	cont "kämpfen…"

YoungsterJimmySeenText:
	text "Ich bin schnell"
	line "wie der Wind!"
	done

YoungsterJimmyBeatenText:
	text "Hinfortgeweht!"
	done

YoungsterJimmyAfterBattleText:
	text "Ich trage das"
	line "ganze Jahr Shorts."

	para "Das ist meine"
	line "Auffassung von"
	cont "Mode."
	done



EngineerMarksonSeenText:
    text "Hast du meinen"
    line "Schraubenschlüssel"
    cont "gesehen?"
	done

EngineerMarksonBeatenText:
	text "Oh! Da ist er ja!"
	done

EngineerMarksonAfterText:
	text "Das war peinlich…"
	done

Route117_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 11,  5, ENDON_CAVE_1F, 1
	;warp_event 11,  5, BATTLE_TOWER_1F, 1
	warp_event 21,  5, ENDON_CAVE_1F, 2

	db 0 ; coord events

	db 4 ; bg events
	bg_event  5,  4, BGEVENT_ITEM, Route116HiddenMaxEther
	bg_event 31, 12, BGEVENT_ITEM, Route116HiddenFullHeal
	bg_event 35,  8, BGEVENT_ITEM, Route116HiddenFullRestore
	bg_event 15, 13, BGEVENT_ITEM, Route116HiddenRevive

	db 8 ; object events
	object_event 43, 12, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 4, TrainerFirebreatherOtis, -1
	object_event  8, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerYoungsterWarren, -1
	object_event 12, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerYoungsterJimmy, -1
	object_event 47,  9, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerEngineerMarkson, -1
	object_event 29,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route117FruitTree, -1
	object_event 31,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route116DireHit, EVENT_ROUTE_116_DIRE_HIT
	object_event 24,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route116Carbos, EVENT_ROUTE_116_CARBOS
	object_event 16,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route116Elixer, EVENT_ROUTE_116_ELIXER

