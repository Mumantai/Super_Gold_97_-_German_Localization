_CantSurfText::
	text "SURFER kann hier"
	line "nicht eingesetzt"
	cont "werden."
	prompt

_AlreadySurfingText::
	text "SURFER ist bereits"
	line "eingesetzt."
	prompt

_AskSurfText::
	text "Die See ist ruhig."
	line "Möchtest du SURFER"
	cont "einsetzen?"
	done

_UseWaterfallText::
	text_ram wStringBuffer2
	text " setzt"
	line "KASKADE ein!"
	done

_HugeWaterfallText::
	text "Wow, das ist ein"
	line "großer Wasserfall."
	done

_AskWaterfallText::
	text "Möchtest du"
	line "KASKADE einsetzen?"
	done

_UseDigText::
	text_ram wStringBuffer2
	text " setzt"
	line "SCHAUFLER ein!"
	done

_UseEscapeRopeText::
	text "<PLAYER> setzt"
	line "FLUCHTSEIL ein."
	done

_CantUseDigText::
	text "Das kann hier"
	line "nicht eingesetzt"
	cont "werden."
	done

_TeleportReturnText::
	text "Bringt dich zum"
	line "letzten #MON-"
	cont "CENTER."
	done

_CantUseTeleportText::
	text "Das kann hier"
	line "nicht eingesetzt"
	cont "werden."
	prompt

_AlreadyUsingStrengthText::
	text "Ein #MON setzt"
	line "bereits STÄRKE"
	cont "ein."
	prompt

_UseStrengthText::
	text_ram wStringBuffer2
	text " setzt"
	line "STÄRKE ein!"
	done

_MoveBoulderText::
	text_ram wStringBuffer1
	text " kann"
	line "Felsen bewegen."
	prompt

_AskStrengthText::
	text "Ein #MON könnte"
	line "das vielleicht"
	cont "bewegen."

	para "Möchtest du STÄRKE"
	line "einsetzen?"
	done

_BouldersMoveText::
	text "Du kannst jetzt"
	line "Felsen bewegen!"
	done

_BouldersMayMoveText::
	text "Ein #MON könnte"
	line "das vielleicht"
	cont "bewegen."
	done

_UseWhirlpoolText::
	text_ram wStringBuffer2
	text " setzt"
	line "WHIRLPOOL ein!"
	prompt

_MayPassWhirlpoolText::
	text "Das ist ein"
	line "teuflischer"
	cont "Strudel!"

	para "Ein #MON könnte"
	line "den Strudel"
	cont "durchqueren."
	done

_AskWhirlpoolText::
	text "Ein Strudel ist"
	line "im Weg."

	para "Möchtest du"
	line "WHIRLPOOL"
	cont "einsetzen?"
	done

_UseHeadbuttText::
	text_ram wStringBuffer2
	text " setzt"
	line "KOPFNUSS ein!"
	prompt

_HeadbuttNothingText::
	text "Nein. Nichts…"
	done

_AskHeadbuttText::
	text "Vielleicht steckt"
	line "ein #MON in"
	cont "diesem Baum."

	para "Möchtest du KOPF-"
	line "NUSS einsetzen?"
	done

_UseRockSmashText::
	text_ram wStringBuffer2
	text " setzt"
	line "ZERTRÜMMERER ein!"
	prompt

_MaySmashText::
	text "Ein #MON könnte"
	line "ihn vielleicht"
	cont "zerschmettern."
	done

_AskRockSmashText::
	text "Dieser Fels sieht"
	line "zerbrechlich aus."

	para "Soll ZERTRÜMMERER"
	line "eingesetzt werden?"
	done

_RodBiteText::
	text "Uah!"
	line "Da hat etwas"
	cont "angebissen!"
	prompt

_RodNothingText::
	text "Nicht einmal"
	line "angeknabbert!"
	prompt

_UnusedNothingHereText::
	text "Hier scheint"
	line "nichts zu sein."
	prompt

_CantGetOffBikeText::
	text "Du kannst hier"
	line "nicht absteigen!"
	done

_GotOnBikeText::
	text "<PLAYER> steigt"
	line "aufs @"
	text_ram wStringBuffer2
	text "."
	done

_GotOffBikeText::
	text "<PLAYER> steigt von"
	line "@"
	text_ram wStringBuffer2
	text " ab."
	done


_CantGetOffBoardText::
	text "Du kannst hier"
	line "nicht absteigen!"
	done

_GotOnBoardText::
	text "<PLAYER> steigt"
	line "aufs @"
	text_ram wStringBuffer2
	text "."
	done

_GotOffBoardText::
	text "<PLAYER> steigt von"
	line "@"
	text_ram wStringBuffer2
	text " ab."
	done


_AskCutText::
	text "Du kannst den"
	line "ZERSCHNEIDER hier"
	cont "einsetzen!"

	para "Möchtest du den"
	line "ZERSCHNEIDER"

	para "einsetzen?"
	done

_CanCutText::
	text "Der ZERSCHNEIDER"
	line "kann hier"
	cont "eingesetzt werden!"
	done

_FoundItemText::
	text "<PLAYER> findet"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_CantCarryItemText::
	text "<PLAYER> kann keine"
	line "weiteren Items"
	cont "mehr tragen!"
	done

_WhitedOutText::
	text "<PLAYER> hat kein"
	line "kampffähiges"
	cont "#MON mehr!"

	para "<PLAYER> fällt"
	line "in Ohnmacht!"
	done

_ItemfinderItemNearbyText::
	text "Der DETEKTOR zeigt"
	line "dir an, dass ein"
	cont "Item in der Nähe"
	cont "ist."
	prompt

_ItemfinderNopeText::
	text "Der DETEKTOR"
	line "reagiert nicht."
	prompt

_PoisonFaintText::
	text_ram wStringBuffer3
	text_start
	line "wurde besiegt!"
	prompt

_PoisonWhiteoutText::
	text "<PLAYER> hat kein"
	line "kampffähiges"
	cont "#MON mehr!"

	para "<PLAYER> wird"
	line "ohnmächtig!"
	prompt

_UseSweetScentText::
	text_ram wStringBuffer3
	text_start
	line "ben. LOCKDUFT!"
	done

_SweetScentNothingText::
	text "Hier ist wohl"
	line "nichts…"
	done

_SquirtbottleNothingText::
	text "<PLAYER>"
	line "verspritzt Wasser."

	para "Nichts geschieht…"
	done

_UseSacredAshText::
	text "Die #MON"
	line "von <PLAYER>"
	cont "wurden geheilt!"
	done

_AnEggCantHoldAnItemText::
	text "Ein EI kann kein"
	line "Item tragen."
	prompt

_PackNoItemText::
	text "Keine Items."
	done

_AskThrowAwayText::
	text "Wie viele"
	line "wegwerfen?"
	done

_AskQuantityThrowAwayText::
	text "Wegwerfen?"
	line "@"
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " x @"
	text_ram wStringBuffer2
	text "?"
	done

_ThrewAwayText::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " x @"
	text_ram wStringBuffer2
	text_start
	line "weggeworfen."
	prompt

_OakThisIsntTheTimeText::
	text "EICH: <PLAYER>!"
	line "Es ist noch nicht"
	cont "an der Zeit, dies"
	cont "zu benutzen!"
	prompt

_YouDontHaveAMonText::
	text "Du hast kein"
	line "#MON!"
	prompt

_RegisteredItemText::
	text_ram wStringBuffer2
	text_start
	line "eingetragen."
	prompt

_CantRegisterText::
	text "Du kannst dieses"
	line "Item nicht"
	cont "eintragen."
	prompt

_AskItemMoveText::
	text "Wo soll das"
	line "hin?"
	done

_PackEmptyText::
	text_start
	done

_YouCantUseItInABattleText::
	text "Du kannst das"
	line "im Kampf nicht"
	cont "benutzen."
	prompt

_ActorNameText::
	text "<USER>@@"

_UsedMove1Text::
	text_start
	line "ben. @"

_UsedMove2Text::
	text_start
	line "ben. @"

_UsedInsteadText::
	text "stattdessen"
	cont "@@"

_MoveNameText::
	text_ram wStringBuffer2
	db "@@"

_EndUsedMove1Text::
	text "!"
	done

_EndUsedMove2Text::
	text "!"
	done

_EndUsedMove3Text::
	text "!"
	done

_EndUsedMove4Text::
	text "!"
	done

_EndUsedMove5Text::
	text "!"
	done

Text_BattleEffectActivate::
	text "<USER>s"
	line "@"
	text_ram wStringBuffer2
	text_end

	text_end ; unreferenced

_BattleStatWentWayUpText::
	text_pause
	text "<SCROLL>steigt stark!"
	prompt

_BattleStatWentUpText::
	text " steigt!"
	prompt

Text_BattleFoeEffectActivate::
	text "<TARGET>s"
	line "@"
	text_ram wStringBuffer2
	text_end

	text_end ; unreferenced

_BattleStatSharplyFellText::
	text_pause
	text "<SCROLL>sinkt stark!"
	prompt

_BattleStatFellText::
	text " sinkt!"
	prompt

Text_BattleUser::
	text "<USER>@"
	text_end

_BattleMadeWhirlwindText::
	text_start
	line "erzeugt einen"
	cont "Wirbelwind!"
	prompt

_BattleTookSunlightText::
	text_start
	line "badet im Licht!"
	prompt

_BattleLoweredHeadText::
	text_start
	line "duckt sich!"
	prompt

_BattleGlowingText::
	text_start
	line "leuchtet!"
	prompt

_BattleFlewText::
	text_start
	line "fliegt empor!"
	prompt

_BattleDugText::
	text_start
	line "gräbt ein Loch!"
	prompt

Text_BreedHuh::
	text "Huch?"

	para "@"
	text_end

_BreedClearboxText::
	text_start
	done

_BreedEggHatchText::
	text_ram wStringBuffer1
	text_start
	line "schlüpft aus dem"
	cont "EI!@"
	sound_caught_mon
	text_promptbutton
	text_end

	text_end ; unreferenced

_BreedAskNicknameText::
	text "Möchtest du"
	line "@"
	text_ram wStringBuffer1
	text " einen"
	cont "Spitznamen geben?"
	done

_LeftWithDayCareLadyText::
	text_ram wBreedMon2Nick
	text " hast du"
	line "der PENSIONSLEI-"
	cont "TERIN anvertraut."
	done

_LeftWithDayCareManText::
	text_ram wBreedMon1Nick
	text " hast du"
	line "dem PENSIONSLEITER"
	cont "anvertraut."
	done

_BreedBrimmingWithEnergyText::
	text "Es strotzt vor"
	line "Energie."
	prompt

_BreedNoInterestText::
	text_ram wStringBuffer1
	text_start
	line "ist nicht"
	cont "interessiert."
	prompt

_BreedAppearsToCareForText::
	text "Es kümmert sich um"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_BreedFriendlyText::
	text "Es ist freundlich"
	line "gegenüber"

	para "@"
	text_ram wStringBuffer1
	text "."
	prompt

_BreedShowsInterestText::
	text "Es zeigt Interesse"
	line "an @"
	text_ram wStringBuffer1
	text "."
	prompt

_EmptyMailboxText::
	text "Hier sind keine"
	line "BRIEFE."
	prompt

_MailClearedPutAwayText::
	text "Der leere BRIEF"
	line "wurde eingesteckt."
	prompt

_MailPackFullText::
	text "Dein BEUTEL"
	line "ist voll."
	prompt

_MailMessageLostText::
	text "Soll der Inhalt"
	line "des BRIEFes"
	cont "gelöscht werden?"
	done

_MailAlreadyHoldingItemText::
	text "Es hat schon"
	line "ein Item."
	prompt

_MailEggText::
	text "Du kannst einem EI"
	line "keinen BRIEF"
	cont "geben."
	prompt

_MailMovedFromBoxText::
	text "Der BRIEF wurde"
	line "aus dem BRIEF-"
	cont "KASTEN gelöscht."
	prompt

_WasSentToBillsPCText::
	text_ram wStringBuffer1
	text_start
	line "wurde auf Bills PC"
	cont "übertragen."
	prompt

_PCGottaHavePokemonText::
	text "Du benötigst"
	line "#MON!"
	prompt

_PCWhatText::
	text "Was?"
	done

_PCMonHoldingMailText::
	text "Es gibt #MON,"
	line "die einen"
	cont "BRIEF tragen."

	para "Entferne den"
	line "BRIEF."
	prompt

_PCNoSingleMonText::
	text "Du hast kein"
	line "#MON mehr!"
	prompt

_PCCantDepositLastMonText::
	text "Du kannst das"
	line "letzte #MON"
	cont "nicht ablegen!"
	prompt

_PCCantTakeText::
	text "Du kannst keine"
	line "weiteren #MON"
	cont "mehr mitnehmen."
	prompt

_ContestCaughtMonText::
	text_ram wStringBuffer1
	text " wurde"
	line "gefangen!"
	prompt

_ContestAskSwitchText::
	text "#MON tauschen?"
	done

_ContestAlreadyCaughtText::
	text "Du hast bereits"
	line "ein @"
	text_ram wStringBuffer1
	text_start
	cont "gefangen."
	prompt

_ContestJudging_FirstPlaceText::
	text "Der Gewinner des"
	line "Käferturniers ist@"
	text_pause
	text "…"

	para "@"
	text_ram wBugContestWinnerName
	text ","
	line "mit einem"

	para "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

_ContestJudging_FirstPlaceScoreText::
	text_start

	para "Mit einer Punkt-"
	line "zahl von @"
	text_decimal wBugContestFirstPlaceScore, 2, 3
	text_start
	cont "Punkten!"
	prompt

_ContestJudging_SecondPlaceText::
	text "Zweiter wurde"
	line "@"
	text_ram wBugContestWinnerName
	text ","

	para "mit einem"
	line ""
	line "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

_ContestJudging_SecondPlaceScoreText::
	text_start

	para "Die Punktzahl ist"
	line "@"
	text_decimal wBugContestSecondPlaceScore, 2, 3
	text "!"
	prompt

_ContestJudging_ThirdPlaceText::
	text "Dritter wurde"
	line "@"
	text_ram wBugContestWinnerName
	text ","

	para "mit einem"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

_ContestJudging_ThirdPlaceScoreText::
	text_start

	para "Mit einer Punkt-"
	line "zahl von @"
	text_decimal wBugContestThirdPlaceScore, 2, 3
	text "!"
	prompt

_MagikarpGuruMeasureText::
	text "Lass mich dein"
	line "KARPADOR messen."

	para "…Hm, es ist"
	line "@"
	text_ram wStringBuffer1
	text "cm"
	cont "groß."
	prompt

_KarpGuruRecordText::
	text "AKTUELLER REKORD"

	para "@"
	text_ram wStringBuffer1
	text "cm gefangen"
	line "von @"
	text_ram wMagikarpRecordHoldersName
	text "@"
	text_promptbutton
	text_end

	text_end ; unreferenced

_LuckyNumberMatchPartyText::
	text "Glückwunsch!"

	para "Die ID-Nummer"
	line "von @"
	text_ram wStringBuffer1
	text_start

	para "in deinem Team"
	line "ist stimmig."
	prompt

_LuckyNumberMatchPCText::
	text "Glückwunsch!"

	para "Die ID-Nummer"
	line "von @"
	text_ram wStringBuffer1
	text_start

	para "in deiner PC-BOX"
	line "ist stimmig."
	prompt

_CaughtAskNicknameText::
	text "Möchtest du"
	line "@"
	text_ram wStringBuffer1
	text " einen"
	cont "Spitznamen geben?"
	done

_PokecenterPCCantUseText::
	text "Dies kann nur"
	line "ein #MON"
	cont "benutzen!"
	prompt

_PlayersPCTurnOnText::
	text "<PLAYER> schaltet"
	line "den PC ein."
	prompt

_PlayersPCAskWhatDoText::
	text "Was möchtest du"
	line "tun?"
	done

_PlayersPCHowManyWithdrawText::
	text "Wie viele möchtest"
	line "du mitnehmen?"
	done

_PlayersPCWithdrewItemsText::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " x @"
	text_ram wStringBuffer2
	text_start
	line "wurde mitgenommen."
	prompt

_PlayersPCNoRoomWithdrawText::
	text "Du kannst keine"
	line "weiteren Items"
	cont "mehr tragen."
	prompt

_PlayersPCNoItemsText::
	text "Du trägst keine"
	line "Items!"
	prompt

_PlayersPCHowManyDepositText::
	text "Wie viele möchtest"
	line "du ablegen?"
	done

_PlayersPCDepositItemsText::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " x @"
	text_ram wStringBuffer2
	text_start
	line "wurde abgelegt."
	prompt

_PlayersPCNoRoomDepositText::
	text "Es ist kein Platz"
	line "für weitere Items."
	prompt

_PokecenterPCTurnOnText::
	text "<PLAYER> schaltet"
	line "den PC ein."
	prompt

_PokecenterPCWhoseText::
	text "Zugriff auf"
	line "wessen PC?"
	done

_PokecenterBillsPCText::
	text "Die Verbindung zu"
	line "BILLs PC wurde"
	cont "hergestellt."

	para "Du hast Zugriff"
	line "auf das #MON-"
	cont "LAGERUNGS-SYSTEM."
	prompt

_PokecenterPlayersPCText::
	text "Die Verbindung zu"
	line "deinem PC wurde"
	cont "hergestellt."

	para "Du hast Zugriff"
	line "auf das ITEM-"
	cont "LAGERUNGS-SYSTEM."
	prompt

_PokecenterOaksPCText::
	text "Die Verbindung zu"
	line "PROF. EICHs PC"
	cont "wurde hergestellt."

	para "Du hast Zugriff"
	line "auf die #DEX-"
	cont "BEWERTUNG."
	prompt

_PokecenterPCOaksClosedText::
	text "…"
	line "Verbindung"
	cont "beendet…"
	done

_OakPCText1::
	text "Soll dein #DEX"
	line "bewertet werden?"
	done

_OakPCText2::
	text "In deinem #DEX"
	line "steht:"
	prompt

_OakPCText3::
	text "Ges.: @"
	text_ram wStringBuffer3
	text " #MON"
	line "Bes.: @"
	text_ram wStringBuffer4
	text " #MON"

	para "PROF. EICHs"
	line "Bewertung:"
	done

_OakRating01::
	text "Suche in"
	line "hohem Gras nach"
	cont "#MON!"
	done

_OakRating02::
	text "Gut. Ich sehe, du"
	line "kannst mit #-"
	cont "BÄLLEN umgehen."
	done

_OakRating03::
	text "Du wirst immer"
	line "besser, hast aber"

	para "noch einen langen"
	line "Weg vor dir."
	done

_OakRating04::
	text "Vervollständige"
	line "den #DEX. Fange"

	para "alle Typen von"
	line "#MON!"
	done

_OakRating05::
	text "Du gibst dir Mühe."
	line "Dein #DEX"

	para "wird immer"
	line "besser."
	done

_OakRating06::
	text "Manche #MON"
	line "entwickeln sich"

	para "durch Level,"
	line "andere benötigen"
	cont "STEINE."
	done

_OakRating07::
	text "Hast du eine"
	line "ANGEL? Du"

	para "kannst damit"
	line "#MON fangen."
	done

_OakRating08::
	text "Sehr gut! Sammeln"
	line "scheint dir Spaß"
	cont "zu machen!"
	done

_OakRating09::
	text "Du kannst manchen"
	line "#MON nur zu"

	para "gewissen Tages-"
	line "zeiten begegnen."
	done

_OakRating10::
	text "Es wird immer"
	line "besser. Mach"
	cont "weiter so!"
	done

_OakRating11::
	text "Beeindruckend."
	line "Du fängst nicht"

	para "nur #MON, du"
	line "trainierst sie"
	cont "auch."
	done

_OakRating12::
	text "Hast du KURT schon"
	line "getroffen? Seine"
	cont "handgefertigten"
	cont "#BÄLLE werden"
	cont "dir helfen."
	done

_OakRating13::
	text "Wow. Du hast mehr"
	line "#MON entdeckt,"

	para "als die letzte"
	line "#DEX-For-"
	cont "schungsgruppe."
	done

_OakRating14::
	text "Tauschst du deine"
	line "#MON?"

	para "Alleine ist das"
	line "sehr schwierig!"
	done

_OakRating15::
	text "Wow! Die 200-Marke"
	line "ist erreicht! Dein"
	cont "#DEX sieht"
	cont "großartig aus!"
	done

_OakRating16::
	text "Du hast so viele"
	line "#MON gefunden!"

	para "Du hast mir damit"
	line "sehr geholfen!"
	done

_OakRating17::
	text "Fantastisch! Du"
	line "könntest auch ein"

	para "#MON-Professor"
	line "werden!"
	done

_OakRating18::
	text "Dein #DEX ist"
	line "Wahnsinn! Du"

	para "wirst noch zu"
	line "einem Profi!"
	done

_OakRating19::
	text "Boah! Der perfekte"
	line "#DEX! Davon"

	para "habe ich immer"
	line "geträumt!"
	cont "Gratulation!"
	done

_OakPCText4::
	text "Die Verbindung zu"
	line "PROF. EICHs PC"
	cont "wurde getrennt."
	done

_DummyGameYeahText::
	text "!"
	done

_DummyGameDarnText::
	text "Mist…"
	done

_StartMenuContestEndText::
	text "Möchtest du den"
	line "Wettkampf beenden?"
	done

_ItemsTossOutHowManyText::
	text "Wie viele"
	line "@"
	text_ram wStringBuffer2
	text_start
	cont "wegwerfen?"
	done

_ItemsThrowAwayText::
	text "Wegwerfen"
	line "@"
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " x @"
	text_ram wStringBuffer2
	text "?"
	done

_ItemsDiscardedText::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " x @"
	text_ram wStringBuffer1
	text_start
	line "wurde weggeworfen."
	prompt

_ItemsTooImportantText::
	text "Dieses Item ist"
	line "zu wichtig! Du"
	cont "kannst es nicht"
	cont "wegwerfen!"
	prompt

_ItemsOakWarningText::
	text "EICH: <PLAYER>!"
	line "Es ist noch nicht"
	cont "an der Zeit, dies"
	cont "zu benutzen."
	done

_PokemonSwapItemText::
	text "Nimmt @"
	text_ram wStringBuffer1
	text_start
	line "von @"
	text_ram wMonOrItemNameBuffer
	text_start

	para "und gibt ihm"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_PokemonHoldItemText::
	text "Gibt @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_PokemonRemoveMailText::
	text "Entferne zuerst"
	line "den BRIEF."
	prompt

_PokemonNotHoldingText::
	text_ram wMonOrItemNameBuffer
	text_start
	line "trägt kein Item."
	prompt

_ItemStorageFullText::
	text "Du kannst keine"
	line "weiteren Items"
	cont "mehr lagern."
	prompt

_PokemonTookItemText::
	text "Nimmt @"
	text_ram wStringBuffer1
	text_start
	line "von @"
	text_ram wMonOrItemNameBuffer
	text "."
	prompt

_PokemonAskSwapItemText::
	text_ram wMonOrItemNameBuffer
	text " hält"
	line "schon das Item"

	para "@"
	text_ram wStringBuffer1
	text "."
	line "Items wechseln?"
	done

_ItemCantHeldText::
	text "Du kannst dieses"
	line "Item keinem"
	cont "#MON geben."
	prompt

_MailLoseMessageText::
	text "Der Inhalt des"
	line "BRIEFes wird"
	cont "gelöscht"
	cont "Einverstanden?"
	done

_MailDetachedText::
	text "BRIEF entfernt von"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_MailNoSpaceText::
	text "Es ist nicht"
	line "genügend Platz"
	cont "für entfernte"
	cont "BRIEFE."
	prompt

_MailAskSendToPCText::
	text "Den entfernten"
	line "BRIEF auf deinen"
	cont "PC übertragen?"
	done

_MailboxFullText::
	text "Du kannst keine"
	line "weiteren BRIEFE"
	cont "auf deinen PC"
	cont "übertragen."
	prompt

_MailSentToPCText::
	text "Der BRIEF wurde"
	line "auf deinen PC"
	cont "übertragen."
	prompt

_PokemonNotEnoughHPText::
	text "Nicht genügend KP!"
	prompt

_MayRegisterItemText::
	text "Ein Item aus"
	line "deinem BEUTEL"

	para "kann auf"
	line "SELECT"
	cont "gelegt werden."
	done

_MainMenuTimeUnknownText::
	text "Uhrzeit unbekannt"
	done

_OakText1::
	text "Hi! Entschuldige"
	line "die Verspätung!"

	para "Willkommen in der"
	line "Welt der #MON!"

	para "Mein Name ist"
	line "EICH!"
	cont "Man nennt mich"

	para "den #MON-"
	line "PROFESSOR."
	prompt

_OakText2::
	text "Diese Welt wird"
	line "von Wesen"
	cont "bewohnt, die man"
	cont "#MON nennt.@"
	text_end

_OakText3::
	text_promptbutton
	text_end

	text_end ; unreferenced

_OakText4::
	text "Menschen und"
	line "#MON leben"

	para "zusammen und"
	line "helfen einander."

	para "Für manche Leute"
	line "sind #MON"
	cont "Haustiere, andere"
	cont "tragen Kämpfe mit"
	cont "ihnen aus."
	prompt

_OakText5::
	text "Leider wissen wir"
	line "noch nicht alles"
	cont "über #MON."

	para "Es gibt noch"
	line "viele Geheimnisse"
	cont "zu lüften."

	para "Darum studiere"
	line "ich #MON"
	cont "tagaus, tagein!"
	prompt

_OakText6::
	text "Wie lautet dein"
	line "Name?"
	prompt

_OakText6a::
	text "Ah, du bist also"
	line "<PLAYER>!"
	prompt

_OakText6b::
	text "Dieser Junge ist"
	line "seit Kindestagen"
	cont "mit dir befreun-"
	cont "det, oder?"

	para "…Ähm, wie war sein"
	line "Name noch gleich?"
	prompt

_OakText6c::
	text "…Ja, genau!"
	line "Sein Name war"
	cont "<RIVAL>!"
	prompt

_OakText7a::
	text "<PLAYER>!"

	para "Bevor du deine"
	line "Reise beginnst,"

	para "musst du noch"
	line "die Zeit und den"
	cont "Wochentag angeben."

	prompt

_OakText7::
	text "<PLAYER>, bist du"
	line "bereit?"

	para "Dein eigenes"
	line "#MON-Abenteuer"
	cont "erwartet dich."

	para "Dich erwarten tol-"
	line "le Dinge, aber"
	cont "auch harte Zeiten."

	para "Eine Welt voller"
	line "Träume und aufre-"
	cont "gender #MON-"

	para "Abenteuer erwar-"
	line "tet dich! Mach"
	cont "dich bereit!"

	para "Ich treffe dich"
	line "später!"
	done

_ClockTimeMayBeWrongText::
	text "Die Uhr könnte"
	line "falsch gestellt"
	cont "sein."

	para "Gib bitte die"
	line "genaue Uhrzeit an."
	prompt

_ClockSetWithControlPadText::
	text "Benutze dafür das"
	line "Steuerkreuz."

	para "Bestätigen:"
	line "A-Knopf"
	cont "Zurück: B-Knopf"
	done

_ClockIsThisOKText::
	text "Einverstanden?"
	done

_ClockHasResetText::
	text "Die Uhr wurde"
	line "korrigiert."
	done

_LinkTimeoutText::
	text "Es verging zu viel"
	line "Zeit. Probier's"
	cont "noch einmal."
	prompt

_LinkTradeCantBattleText::
	text "Wenn du dieses"
	line "#MON tauschst,"
	cont "kannst du nicht"
	cont "mehr kämpfen."
	prompt

_LinkAbnormalMonText::
	text "Das @"
	text_ram wStringBuffer1
	text_start
	cont "deines Freundes"
	cont "scheint nicht in"
	cont "Ordnung zu sein!"
	prompt

_LinkAskTradeForText::
	text "Tausche @"
	text_ram wceef
	text_start
	line "mit @"
	text_ram wStringBuffer1
	text "?"
	done

_WouldYouLikeToSaveTheGameText::
	text "Möchtest du das"
	line "Spiel SICHERN?"
	done

_SavingDontTurnOffThePowerText::
	text "Speichern…"
	done

_SavedTheGameText::
	text "<PLAYER> hat das"
	line "Spiel gesichert."
	done

_AlreadyASaveFileText::
	text "Es gibt bereits"
	line "einen Spielstand."

	para "Spielstand"
	line "überschreiben?"
	done

_AnotherSaveFileText::
	text "Es gibt bereits"
	line "einen Spielstand."
	cont "Spielstand"
	cont "überschreiben?"
	done

_SaveFileCorruptedText::
	text "Der Spielstand"
	line "ist zerstört!"
	prompt

_ChangeBoxSaveText::
	text "Vor einem Wechsel"
	line "der #MON-BOX"
	cont "wird das Spiel"
	cont "gesichert!"
	done

_MoveMonWOMailSaveText::
	text "Immer, wenn du"
	line "ein #MON"
	cont "verschiebst, wird"
	cont "das Spiel ge-"
	cont "sichert!"
	done

_WindowAreaExceededErrorText:: ; unreferenced
	text "Die Speicherkapa-"
	line "zität des Fensters"
	cont "wurde überschrit-"
	cont "ten."
	done

_WindowPoppingErrorText::
	text "Für den Tausch"
	line "stehen keine Fens-"
	cont "ter zur Verfügung."
	done

_CorruptedEventText:: ; unreferenced
	text "Vorgang abge-"
	cont "brochen!"
	prompt

_ObjectEventText::
	text "Object event."
	done

_BGEventText::
	text "BG event"
	done

_CoordinatesEventText::
	text "Coordinates event"
	done

_ReceivedItemText::
	text "<PLAYER> erhält"
	line "@"
	text_ram wStringBuffer4
	text "."
	done

_PutItemInPocketText::
	text "<PLAYER> steckt"
	line "@"
	text_ram wStringBuffer1
	text " in"
	cont "@"
	text_ram wStringBuffer3
	text "."
	prompt

_PocketIsFullText::
	text_ram wStringBuffer3
	text_start
	line "ist voll…"
	prompt

_CongratulationsYourPokemonText::
	text "Glückwunsch!"
	line "Dein @"
	text_ram wStringBuffer2
	text_end

	text_end ; unreferenced

_EvolvedIntoText::
	text_start

	para "wurde zu"
	line "@"
	text_ram wStringBuffer1
	text "!"
	done

_StoppedEvolvingText::
	text "Hmm? Die Entwick-"
	line "lung wurde abge-"
	cont "brochen!"
	prompt

_EvolvingText::
	text "Hey! @"
	text_ram wStringBuffer2
	text_start
	line "entwickelt sich!"
	done

_MartHowManyText::
	text "Wie viele?"
	done

_MartFinalPriceText::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " x"
	line "@"
	text_ram wStringBuffer2
	text "?"

	para "Das macht dann"
	line "¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

_HerbShopLadyIntroText::
	text "Hallo,"

	para "ich verkaufe"
	line "preiswerte"
	cont "Kräutermedizin."

	para "Sie wirkt, ist"
	line "aber bitter."

	para "Deine #MON"
	line "werden sie nicht"
	cont "mögen."

	para "Hihihihi…"
	done

_HerbalLadyHowManyText::
	text "Wie viele?"
	done

_HerbalLadyFinalPriceText::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " x @"
	text_ram wStringBuffer2
	text_start
	line "kostet ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

_HerbalLadyThanksText::
	text "Danke, Kleiner."
	line "Hihihihi…"
	done

_HerbalLadyPackFullText::
	text "Oh? In deinem"
	line "BEUTEL ist kein"
	cont "Platz mehr."
	done

_HerbalLadyNoMoneyText::
	text "Hihihi… Du hast"
	line "nicht genug Geld."
	done

_HerbalLadyComeAgainText::
	text "Besuche mich"
	line "wieder. Hihihihi…"
	done

_BargainShopIntroText::
	text "Heh! Bist du an"
	line "Schnäppchen"
	cont "interessiert?"

	para "Ich verkaufe"
	line "seltene Items,"

	para "aber leider sind"
	line "es nur Einzel-"
	cont "stücke."
	done

_BargainShopFinalPriceText::
	text_ram wStringBuffer2
	text_start
	line "kostet ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."

	para "Kaufen?"
	done

_BargainShopThanksText::
	text "Danke."
	done

_BargainShopPackFullText::
	text "Uhh, dein BEUTEL"
	line "platzt aus"
	cont "allen Nähten."
	done

_BargainShopSoldOutText::
	text "Das hast du schon"
	line "gekauft. Ich"
	cont "habe keines mehr."
	done

_BargainShopNoFundsText::
	text "Uhh, du bist knapp"
	line "bei Kasse."
	done

_BargainShopComeAgainText::
	text "Schau mal"
	line "wieder vorbei."
	done

_PharmacyIntroText::
	text "Was ist? Brauchst"
	line "du Medizin?"
	done

_PharmacyHowManyText::
	text "Wie viele?"
	done

_PharmacyFinalPriceText::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " x @"
	text_ram wStringBuffer2
	text_start
	line "kostet ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

_PharmacyThanksText::
	text "Vielen Dank!"
	done

_PharmacyPackFullText::
	text "Du hast keinen"
	line "Platz mehr."
	done

_PharmacyNoMoneyText::
	text "Wie? Das ist nicht"
	line "genügend Geld."
	done

_PharmacyComeAgainText::
	text "In Ordnung."
	line "Bis die Tage."
	done

_NothingToSellText::
	text "Du hast nichts"
	line "zu verkaufen."
	prompt

_MartSellHowManyText::
	text "Wie viele?"
	done

_MartSellPriceText::
	text "Ich zahle dir"
	line "¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."

	para "Reicht das?"
	done

_MartWelcomeText::
	text "Willkommen! Womit"
	line "kann ich dienen?"
	done

_MartThanksText::
	text "Hier, bitte."
	line "Danke schön!"
	done

_MartNoMoneyText::
	text "Du hast nicht"
	line "genügend Geld."
	done

_MartPackFullText::
	text "Du kannst keine"
	line "weiteren Items"
	cont "mehr tragen."
	done

_MartCantBuyText::
	text "Ich kann dir das"
	line "nicht abkaufen."
	prompt

_MartComeAgainText::
	text "Komm wieder!"
	done

_MartAskMoreText::
	text "Kann ich noch"
	line "etwas für dich"
	cont "tun?"
	done

_MartBoughtText::
	text "Erhält ¥@"
	text_decimal hMoneyTemp, 3, 6
	text " für"
	line "@"
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " x @"
	text_ram wStringBuffer2
	text "."
	done

_SlotsBetHowManyCoinsText::
	text "Wie viel setzen?"
	done
