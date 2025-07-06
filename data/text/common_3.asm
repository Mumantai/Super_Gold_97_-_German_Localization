_SlotsStartText::
	text "Start!"
	done

_SlotsNotEnoughCoinsText::
	text "Nicht genügend"
	line "Münzen."
	prompt

_SlotsRanOutOfCoinsText::
	text "Mist… Ich habe"
	line "keine Münzen mehr…"
	done

_SlotsPlayAgainText::
	text "Noch einmal?"
	done

_SlotsLinedUpText::
	text "Bingo!"
	line "@"
	text_ram wStringBuffer2
	text " Münzen"
	cont "gewonnen!"
	done

_SlotsDarnText::
	text "Mist!"
	done

_GearTodayText::
	text_today
	text_end

_GearEllipseText::
	text "<……>"
	done

_GearOutOfServiceText::
	text "Du bist außerhalb"
	line "des Service-"
	cont "gebiets."
	prompt

_PokegearAskWhoCallText::
	text "Wen möchtest du"
	line "anrufen?"
	done

_PokegearPressButtonText::
	text "Drücke B-KNOPF,"
	line "um abzubrechen."
	done

_PokegearAskDeleteText::
	text "Die gespeicherte"
	line "Nummer löschen?"
	done

_PhoneWrongNumberText::
	text "Äh? Ich habe mich"
	line "verwählt!"
	done

_PhoneClickText::
	text "Klick!"
	done

_PhoneEllipseText::
	text "<……>"
	done

_PhoneOutOfAreaText::
	text "Die Nummer ist"
	line "außerhalb des"
	cont "Funknetzes."
	done

_PhoneJustTalkToThemText::
	text "Du musst diesen"
	line "Gesprächspartner"
	cont "zu Fuß aufsuchen!"
	done

_PhoneThankYouText::
	text "Danke!"
	done

_SpaceSpaceColonText:: ; unreferenced
	text "  :"
	done

_PasswordAskResetText::
	text "Passwort O.K."
	line "Wähle Fortfahren"
	cont "& verwirf die"
	cont "Einstellungen."
	prompt

_PasswordWrongText::
	text "Passwort falsch!"
	prompt

_PasswordAskResetClockText::
	text "Uhr neu stellen?"
	done

_PasswordAskEnterText::
	text "Gib das Passwort"
	line "ein."
	done

_ClearAllSaveDataText::
	text "Spielstand"
	line "löschen?"
	done

_LearnedMoveText::
	text_ram wMonOrItemNameBuffer
	text " erlernt"
	line "@"
	text_ram wStringBuffer2
	text "!@"
	sound_dex_fanfare_50_79
	text_promptbutton
	text_end

	text_end ; unreferenced

_MoveAskForgetText::
	text "Welche Attacke"
	next "soll vergessen"
	cont "werden?"
	done

_StopLearningMoveText::
	text_ram wStringBuffer2
	text_start
	line "nicht erlernen?"
	done

_DidNotLearnMoveText::
	text_ram wMonOrItemNameBuffer
	text_start
	line "hat @"
	text_ram wStringBuffer2
	text_start
	cont "nicht erlernt."
	prompt

_AskForgetMoveText::
	text_ram wMonOrItemNameBuffer
	text " "
	line "versucht,"
	cont "@"
	text_ram wStringBuffer2
	text " zu"
	cont "erlernen!"

	para "Aber @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "kann nicht mehr"
	cont "als vier Attacken"
	cont "erlernen."

	para "Soll eine andere"
	line "Attacke zugunsten"
	cont "von @"
	text_ram wStringBuffer2
	text_start
	cont "vergessen werden?"
	done

Text_MoveForgetCount::
	text "1, 2 und…@"
	text_pause
	text_end

	text_end ; unreferenced

_MoveForgotText::
	text "Schwupp!@"
	text_pause
	text_start

	para "@"
	text_ram wMonOrItemNameBuffer
	text " hat"
	line "@"
	text_ram wStringBuffer1
	text_start

	para "vergessen!"

	para "Und…"
	prompt

_MoveCantForgetHMText::
	text "VM-Attacken"
	line "können nicht"
	cont "gelöscht werden!"
	prompt

_CardFlipPlayWithThreeCoinsText::
	text "Drei Münzen set-"
	line "zen?"
	done

_CardFlipNotEnoughCoinsText::
	text "Nicht genügend"
	cont "Münzen…"
	prompt

_CardFlipChooseACardText::
	text "Zieh eine Karte."
	done

_CardFlipPlaceYourBetText::
	text "Worauf setzen?"
	done

_CardFlipPlayAgainText::
	text "Noch einmal?"
	done

_CardFlipShuffledText::
	text "Die Karten"
	line "wurden gemischt."
	prompt

_CardFlipYeahText::
	text "Yoh!"
	done

_CardFlipDarnText::
	text "Mist…"
	done

_BallDodgedText::
	text "Es weicht dem"
	line "BALL aus!"

	para "Dieses #MON"
	line "lässt sich nicht"
	cont "fangen!"
	prompt

_BallMissedText::
	text "Du hast das"
	line "#MON verfehlt!"
	prompt

_BallBrokeFreeText::
	text "Mist! Das #MON"
	line "hat sich befreit!"
	prompt

_BallAppearedCaughtText::
	text "Fast hätte es"
	line "geklappt!"
	prompt

_BallAlmostHadItText::
	text "Mist!"
	line "Das war knapp!"
	prompt

_BallSoCloseText::
	text "Verflixt! Es"
	line "hätte beinahe"
	cont "geklappt!"
	prompt

Text_BallCaught::
	text "Toll! @"
	text_ram wEnemyMonNick
	text_start
	line "wurde gefangen!@"
	sound_caught_mon
	text_end

	text_end ; unreferenced

_WaitButtonText::
	text_promptbutton
	text_end

	text_end ; unreferenced

_BallSentToPCText::
	text_ram wMonOrItemNameBuffer
	text_start
	line "wurde auf BILLs PC"
	cont "übertragen."
	prompt

_NewDexDataText::
	text "Für @"
	text_ram wEnemyMonNick
	text_start
	line "wird ein neuer"
	cont "Eintrag im"
	cont "#DEX angelegt.@"
	sound_slot_machine_start
	text_promptbutton
	text_end

	text_end ; unreferenced

_AskGiveNicknameText::
	text "Möchtest du"
	line "@"
	text_ram wStringBuffer1
	text " einen"
	cont "Spitznamen geben?"
	done

_ItemStatRoseText::
	text_ram wStringBuffer2
	text " von"
	line "@"
	text_ram wStringBuffer1
	text_start

	para "nimmt zu."
	prompt

_ItemCantUseOnMonText::
	text "Dieses #MON"
	line "kann das nicht"
	cont "einsetzen."
	prompt

_RepelUsedEarlierIsStillInEffectText::
	text "SCHUTZ wirkt"
	line "noch immer."
	prompt

_PlayedFluteText::
	text "Die #FLÖTE"
	line "wurde gespielt."

	para "Das ist ein"
	line "flotter Rhythmus!"
	prompt

_FluteWakeUpText::
	text "Alle schlafenden"
	line "#MON sind"
	cont "aufgewacht."
	prompt

Text_PlayedPokeFlute::
	text "<PLAYER> spielte"
	line "die #FLÖTE.@"
	text_promptbutton
	text_end

	text_end ; unreferenced

_CoinCaseCountText::
	text "Münzen:"
	line "@"
	text_decimal wCoins, 2, 4
	text_end

	text_end ; unreferenced

_RaiseThePPOfWhichMoveText::
	text "Für welche"
	line "Attacke sollen"
	cont "die AP aufgefüllt"
	cont "werden?"
	done

_RestoreThePPOfWhichMoveText::
	text "Für welche"
	line "Attacke sollen"
	cont "die AP erneuert"
	cont "werden?"
	done

_PPIsMaxedOutText::
	text_ram wStringBuffer2
	text "s AP"
	line "wurden komplett"
	cont "aufgefüllt."
	prompt

_PPsIncreasedText::
	text_ram wStringBuffer2
	text "s AP"
	line "wurden aufgefüllt."
	prompt

_PPRestoredText::
	text "AP aufgefüllt."
	prompt

_SentTrophyHomeText::
	text "Hier ist eine"
	line "Trophäe!@"
	sound_dex_fanfare_50_79
	text_start

	para "@"
	text_ram wPlayerName
	text " hat"
	line "die Trophäe nach"
	cont "Hause gesandt."
	prompt

_ItemLooksBitterText::
	text "Das ist bitter…"
	prompt

_ItemCantUseOnEggText::
	text "Ein EI kann das"
	line "nicht benutzen."
	prompt

_ItemOakWarningText::
	text "EICH: <PLAYER>!"
	line "Es ist nicht"
	cont "an der Zeit,"
	cont "dies zu benutzen!"
	prompt

_ItemBelongsToSomeoneElseText::
	text "Das gehört nicht"
	line "dir!"
	prompt

_ItemWontHaveEffectText::
	text "Das hätte keinen"
	line "Effekt."
	prompt

_BallBlockedText::
	text "Der Trainer hat"
	line "den BALL"
	cont "abgeblockt!"
	prompt

_BallDontBeAThiefText::
	text "Sei kein Dieb!"
	prompt

_NoCyclingText::
	text "Rad fahren ist"
	line "hier nicht"
	cont "gestattet."
	prompt

_ItemCantGetOnText::
	text_ram wStringBuffer1
	text_start
	line "kann nicht be-"
	cont "stiegen werden."
	prompt

_BallBoxFullText::
	text "Die #MON-BOX"
	line "ist voll. Das"
	cont "kannst du jetzt"
	cont "nicht benutzen."
	prompt

_ItemUsedText::
	text "<PLAYER> setzt"
	line "@"
	text_ram wStringBuffer2
	text " ein."
	done

_ItemGotOnText::
	text "<PLAYER> stieg auf@"
	text_low
	text_ram wStringBuffer2
	text "."
	prompt

_ItemGotOffText::
	text "<PLAYER> stieg von@"
	text_low
	text_ram wStringBuffer2
	text " ab."
	prompt

_KnowsMoveText::
	text_ram wStringBuffer1
	text " kennt"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_MoveKnowsOneText::
	text "Dieses #MON"
	line "kann nur eine"
	cont "Attacke."
	done

_AskDeleteMoveText::
	text "Soll @"
	text_ram wStringBuffer1
	text_start
	line "vergessen werden?"
	done

_DeleterForgotMoveText::
	text "Dein #MON hat"
	line "die Attacke"
	cont "vergessen."
	done

_DeleterEggText::
	text "Ein EI verfügt"
	line "über keine"
	cont "Attacken!"
	done

_DeleterNoComeAgainText::
	text "Nein? Besuche mich"
	line "wieder."
	done

_DeleterAskWhichMoveText::
	text "Welche Attacke"
	line "soll vergessen"
	cont "werden?"
	prompt

_DeleterIntroText::
	text "Ähm… Oh, ja, ich"
	line "bin der ATTACKEN-"
	cont "VERLERNER."

	para "Ich verfüge über"
	line "die Fähigkeit,"
	cont "#MON ihre"
	cont "Attacken vergessen"
	cont "zu lassen."

	para "Soll ein #MON "
	line "eine Attacke"
	cont "vergessen?"
	done

_DeleterAskWhichMonText::
	text "Welches #MON?"
	prompt

_DSTIsThatOKText::
	text " SZ,"
	line "in Ordnung?"
	done

_TimeAskOkayText::
	text ","
	line "in Ordnung?"
	done

_TimesetAskDSTText::
	text "Möchtest du auf"
	line "Sommerzeit um-"
	cont "stellen?"
	done

_TimesetDSTText::
	text "Ich stelle die Uhr"
	line "eine Stunde vor."
	prompt

_TimesetAskNotDSTText::
	text "Ist die Sommer-"
	line "zeit vorüber?"
	done

_TimesetNotDSTText::
	text "Ich stelle die Uhr"
	line "eine Stunde zu-"
	cont "rück."
	prompt

_TimesetAskAdjustDSTText::
	text "Möchtest du die"
	line "Uhrzeit der"

	para "Sommerzeit an-"
	line "passen?"
	done

_MomLostGearBookletText::
	text "Ich habe die An-"
	line "leitung für den"
	cont "#COM verloren."

	para "Komm später noch"
	line "mal wieder."
	prompt
