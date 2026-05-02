ROUTE109FARMHOUSE_MILK_PRICE EQU 500

	object_const_def ; object_event constants
	const DAITOHOUSE_FARMER
	const DAITOHOUSE_WIFE


DaitoRanchHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DaitoRanchero_DairyFarmer:
	faceplayer
	opentext
	checkevent EVENT_HEALED_MOOMOO
	iftrue DaitoRancheroScript_SellMilk
	writetext DaitoRancheroText_SickCow
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_FARMER_ABOUT_MOOMOO
	end

DaitoRancheroScript_SellMilk:
	checkevent EVENT_GOT_OLD_AMBER_FROM_FARMER
	iffalse .GetOldAmberFromFarmer
	checkitem MOOMOO_MILK
	iftrue DaitoRancheroScript_Milking
	writetext DaitoRancheroText_BuyMilk
	special PlaceMoneyTopRight
	yesorno
	iffalse DaitoRancheroScript_NoSale
	checkmoney YOUR_MONEY, 500
	ifequal HAVE_LESS, DaitoRancheroScript_NoMoney
	giveitem MOOMOO_MILK
	iffalse DaitoRancheroScript_NoRoom
	takemoney YOUR_MONEY, 500
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	writetext DaitoRancheroText_GotMilk
	buttonsound
	itemnotify
	closetext
	end
	
.GetOldAmberFromFarmer
	writetext HeyYouHealedMooMoo
	waitbutton
	verbosegiveitem OLD_AMBER
	writetext HeyYouHealedMooMoo2
	waitbutton
	closetext
	setevent EVENT_GOT_OLD_AMBER_FROM_FARMER
	end

DaitoRancheroScript_NoMoney:
	writetext DaitoRancheroText_NoMoney
	waitbutton
	closetext
	end

DaitoRancheroScript_NoRoom:
	writetext DaitoRancheroText_NoRoom
	waitbutton
	closetext
	end

DaitoRancheroScript_NoSale:
	writetext DaitoRancheroText_NoSale
	waitbutton
	closetext
	end

DaitoRancheroScript_Milking:
	writetext DaitoRancheroText_Milking
	waitbutton
	closetext
	end
	
HeyYouHealedMooMoo:
    text "Ach, hallo!"

    para "Ich bin dir echt"
    line "dankbar, dass du"
    para "meiner MUHMUH"
    line "geholfen hast."

    para "Ich schule dir"
    line "was, Jungchen."

    para "Hier, das habe ich"
    line "gefunden, als wir"
    para "das Land für den"
    line "Bau dieser RANCH"
    cont "freigeräumt haben."

    para "Nimm es!"
	done
	
HeyYouHealedMooMoo2:
    text "Und wenn du jemals"
    line "etwas KUHMUH-MILCH"
    para "brauchst, sag mir"
    line "einfach Bescheid."
	done


DaitoRancheroText_SickCow:
	text "Mein MILTANK gibt"
	line "keine Milch"
	cont "mehr."

	para "Diese FARM ist"
	line "berühmt für die"
	cont "Milch, die hier"
	cont "produziert wird."

	para "Fast jeder trinkt"
	line "sie gern."

	para "Es würde mir viel"
	line "Milch geben, wenn"
	para "ich es mit vielen"
	line "ÄPFELN füttern"
	cont "würde."

	para "Glaube ich"
	line "zumindest."
	done

DaitoRancheroText_BuyMilk:
	text "Wie findest du"
	line "die MILCH von"
	cont "meinem MILTANK?"

	para "Sie ist mein gan-"
	line "zer Stolz."

	para "Gib sie einem"
	line "#MON, um dessen"
	cont "KP aufzufrischen!"

	para "Ich gebe sie dir"
	line "für nur ¥500."
	done

DaitoRancheroText_GotMilk:
	text "Bitte sehr!"
	line "Trink aus und"
	cont "genieße es!"
	done

DaitoRancheroText_NoMoney:
	text "Tut mir Leid, mein"
	line "Kind. Wenn du kein"
	cont "Geld hast, kann"
	cont "ich dir nichts"
	cont "verkaufen!"
	done

DaitoRancheroText_NoRoom:
	text "Ich schätze,"
	line "dein BEUTEL ist"
	cont "voll."
	done

DaitoRancheroText_NoSale:
	text "Du hast kein"
	line "Interesse? Komm"
	cont "aber wieder, hörst"
	cont "du?"
	done

DaitoRancheroText_Milking:
	text "Dann melke ich"
	line "mal weiter."
	done

DaitoHouseWifeScript:
	faceplayer
	opentext
	writetext DaitoRanchHouseRestAWhileText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
	opentext
	writetext DaitoRanchHouseKeepAtItText
	waitbutton
	closetext
	end
	
DaitoRanchHouseRestAWhileText:
	text "Deine #MON"
	line "sehen müde aus."

	para "Gönne ihnen eine"
	line "kleine Pause."
	done

DaitoRanchHouseKeepAtItText:
	text "Hier!"

	para "Deine #MON"
	line "sehen gut aus!"

	para "Mach weiter so!"
	done


DaitoRanchHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, DAITO_RANCH, 1
	warp_event  5,  7, DAITO_RANCH, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  4,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DaitoRanchero_DairyFarmer, -1
	object_event  7,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, DaitoHouseWifeScript, -1
