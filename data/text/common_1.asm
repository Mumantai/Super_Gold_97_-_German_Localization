_FruitBearingTreeText::
	text "Es ist ein"
	line "Obstbaum."
	done

_HeyItsFruitText::
	text "Hey! Das ist eine"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_ObtainedFruitText::
	text_ram wStringBuffer3
	text_start
	line "erhalten!"
	done

_FruitPackIsFullText::
	text "Aber der BEUTEL"
	line "ist voll…"
	done

_NothingHereText::
	text "Hier ist"
	line "nichts…"
	done

_RecoveredSomeHPText::
	text_ram wStringBuffer1
	text_start
	line "erhält @"
	text_decimal wCurHPAnimDeltaHP, 2, 3
	text " KP!"
	done

_CuredOfPoisonText::
	text "Die Vergiftung von"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "wurde geheilt."
	done

_RidOfParalysisText::
	text "Die Paralyse von"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "wurde aufgehoben."
	done

_BurnWasHealedText::
	text "Verbrennung von"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "wurde geheilt."
	done

_WasDefrostedText::
	text_ram wStringBuffer1
	text_start
	line "wurde aufgetaut."
	done

_WokeUpText::
	text_ram wStringBuffer1
	text_start
	line "ist aufgewacht."
	done

_HealthReturnedText::
	text_ram wStringBuffer1
	text_start
	line "ist wieder fit."
	done

_RevitalizedText::
	text_ram wStringBuffer1
	text_start
	line "ist wieder fit."
	done

_GrewToLevelText::
	text_ram wStringBuffer1
	text " er-"
	line "reicht Level @"
	text_decimal wCurPartyLevel, 1, 3
	text "!@"
	sound_dex_fanfare_50_79 ; plays SFX_DEX_FANFARE_50_79, identical to SFX_LEVEL_UP
	text_promptbutton
	text_end

_CameToItsSensesText::
	text_ram wStringBuffer1
	text " kommt"
	line "wieder zu sich."
	done

_OakTimeWokeUpText::
	text "<……><……><……><……><……><……>"
	line "<……><……><……><……><……><……>"

	para "Zzz… Hm? Was…?"
	line "Du hast mich auf-"
	cont "geweckt. Kannst du"

	para "mir sagen, wie"
	line "spät es ist?"
	prompt

_OakTimeWhatTimeIsItText::
	text "Wie spät ist es?"
	done

_OakTimeWhatHoursText::
	text "Was?@"
	text_end

_OakTimeHoursQuestionMarkText::
	text "?"
	done

_OakTimeHowManyMinutesText::
	text "Wie viele Minuten?"
	done

_OakTimeWhoaMinutesText::
	text "Wow!@"
	text_end

_OakTimeMinutesQuestionMarkText::
	text "?"
	done

_OakTimeOversleptText::
	text "!"
	line "Ich habe"
	cont "verschlafen!"
	done

_OakTimeYikesText::
	text "!"
	line "Uah! Ich habe"
	cont "verschlafen!"
	done


_OakTimeSoDarkText::
	text "!"
	line "Kein Wunder, dass"
	cont "es so dunkel ist!"
	done

_OakTimeWhatDayIsItText::
	text "Welcher Tag ist"
	line "heute?"
	done

_OakTimeIsItText::
	text ", oder?"
	done

_EnemyWithdrewText::
	text "<ENEMY>"
	line "ersetzt"
	cont "@"
	text_ram wEnemyMonNickname
	text "!"
	prompt

_EnemyUsedOnText::
	text "<ENEMY>"
	line "setzt @"
	text_ram wMonOrItemNameBuffer
	text_start
	cont "bei"

	para "@"
	text_ram wEnemyMonNickname
	text_start
	line "ein!"
	prompt

_ThatCantBeUsedRightNowText:: ; unreferenced
	text "Es ist noch nicht"
	line "an der Zeit, dies"
	cont "zu benutzen."
	prompt

_ThatItemCantBePutInThePackText:: ; unreferenced
	text "Dieses Item gehört"
	line "nicht in den"
	cont "BEUTEL."
	done

_TheItemWasPutInThePackText:: ; unreferenced
	text_ram wStringBuffer1
	text_start
	line "wurde im BEUTEL"
	cont "verstaut."
	done

_RemainingTimeText:: ; unreferenced
	text "Verbleibende Zeit"
	done

_YourMonsHPWasHealedText:: ; unreferenced
	text "Dein #MON wurde"
	line "komplett geheilt."
	prompt

_WarpingText:: ; unreferenced
	text "Warpen…"
	done

_ChangeWhichNumberText:: ; unreferenced
	text "Welche Nummer soll"
	line "geändert werden?"
	done

_WillYouPlayWithMonText:: ; unreferenced
	text "Möchtest du"
	line "@"
	text_ram wStringBuffer2
	text " einsetzen?"
	done

_YouNeedTwoMonForBreedingText:: ; unreferenced
	text "Du benötigst zwei"
	line "#MON, um zu"
	cont "züchten."
	prompt

_BreedingIsNotPossibleText:: ; unreferenced
	text "Züchten ist hier"
	line "nicht möglich."
	prompt

_CompatibilityShouldTheyBreedText:: ; unreferenced
	text "Sie passen"
	line "@"
	text_decimal wBreedingCompatibility, 1, 3
	text_start
	cont "zueinander."
	cont "Züchten?"
	done

_ThereIsNoEggText:: ; unreferenced
	text "Es gibt kein EI."
	line ""
	prompt

_ItsGoingToHatchText:: ; unreferenced
	text "Es wird bald aus"
	line "dem EI schlüpfen!"
	prompt

_TestEventText:: ; unreferenced
	text "Ereignistest"
	line "@"
	text_decimal wStringBuffer2, 1, 2
	text "?"
	done

_WhatDoYouWantToPlayWithText:: ; unreferenced
	text "Womit möchtest"
	line "du spielen?"
	done

_YouCanHaveThisText:: ; unreferenced
	text "Du kannst das"
	line "haben."
	prompt

_TheBoxIsFullText:: ; unreferenced
	text "Die BOX ist voll!"
	done

_ObtainedTheVoltorbBadgeText:: ; unreferenced
	text "VOLTOBALORDEN"
	line "erhalten!"
	done

_ThePasswordIsText:: ; unreferenced
	text "Das Passwort ist:"
	line ""
	done

_IsThisOKText:: ; unreferenced
	text "In Ordnung?"
	done

_EnterTheIDNoText:: ; unreferenced
	text "Gib die"
	line "ID-Nummer ein.."
	done

_EnterTheAmountText:: ; unreferenced
	text "Gib den"
	line "Betrag ein."
	done

_NothingToChooseText::
	text "Es gibt nichts"
	line "zum Auswählen."
	prompt

_WhichSidePutOnText::
	text "Auf welcher Seite"
	line "willst du sie"
	cont "ablegen?"
	done

_WhichSidePutAwayText::
	text "Welche Seite"
	line "willst du ablegen?"
	done

_PutAwayTheDecoText::
	text_ram wStringBuffer3
	text_start
	line "ablegen."
	prompt

_NothingToPutAwayText::
	text "Hier ist nichts"
	line "zum Ablegen."
	prompt

_SetUpTheDecoText::
	text "Dekoriere dein"
	line "Zimmer mit"

	para "@"
	text_ram wStringBuffer3
	text "."
	prompt

_PutAwayAndSetUpText::
	text "Entferne"
	line "@"
	text_ram wStringBuffer3
	text_start

	para "und dekoriere mit"
	line "@"
	text_ram wStringBuffer4
	text "."
	prompt

_AlreadySetUpText::
	text "Das ist schon"
	line "in deinem Zimmer."
	prompt

_LookTownMapText::
	text "Das ist die KARTE."
	done

_LookPikachuPosterText::
	text "Das ist ein Poster"
	line "eines niedlichen"
	cont "PIKACHUs."
	done

_LookClefairyPosterText::
	text "Das ist ein Poster"
	line "eines niedlichen"
	cont "PIEPIs."
	done

_LookJigglypuffPosterText::
	text "Das ist ein Poster"
	line "eines niedlichen"
	cont "PUMMELUFFs."
	done

_LookAdorableDecoText::
	text "Sehr bezaubernd:"
	line "@"
	text_ram wStringBuffer3
	text "."
	done

_ConsoleDecoText::
	text "<PLAYER> Spielt"
	line " @"
	text_ram wStringBuffer3
	text "!"
	para "…OK! Die Reise"
	line "kann beginnen!"
	done

_LookGiantDecoText::
	text "Eine Riesenpuppe!"
	line "Sie ist flauschig"
	cont "und weich."
	done

_MomHiHowAreYouText::
	text "Hi, <PLAYER>!"
	line "Wie geht es dir?"
	prompt

_MomFoundAnItemText::
	text "Ich habe beim"
	line "Einkaufen ein"
	cont "nützliches Item"
	cont "gefunden und"
	prompt

_MomBoughtWithYourMoneyText::
	text "ich habe dieses"
	line "dekorative Item"

	para "von deinem Geld"
	line "gekauft!"
	prompt

_MomItsInPCText::
	text "Es ist in deinem"
	line "PC. Es wird dir"
	cont "gefallen!"
	done

_MomFoundADollText::
	text "Beim Einkaufen"
	line "heute habe ich"
	cont "eine tolle Puppe"
	cont "gesehen und"
	prompt

_MomItsInYourRoomText::
	text "Sie ist in deinem"
	line "Zimmer. Du wirst"
	cont "sie lieben!"
	done

_MonWasSentToText::
	text_ram wPlayerTrademonSpeciesName
	text " ge-"
	line "sendet an @"
	text_ram wOTTrademonSenderName
	text "."
	done

_MonNameSentToText::
	text_start
	done

_BidsFarewellToMonText::
	text "Lebwohl,"
	line "@"
	text_ram wOTTrademonSpeciesName
	text_end

	text_end ; unused

_MonNameBidsFarewellText::
	text "sagt @"
	text_ram wOTTrademonSenderName
	text "."
	done

_TakeGoodCareOfMonText::
	text "Kümmere dich um"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_ForYourMonSendsText::
	text "Für @"
	text_ram wPlayerTrademonSenderName
	text "s"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text_end

	text_end ; unused

_OTSendsText::
	text "überträgt @"
	text_ram wOTTrademonSenderName
	text_start
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_WillTradeText::
	text_ram wOTTrademonSenderName
	text " tauscht"
	line "@"
	text_ram wOTTrademonSpeciesName
	text_end

	text_end ; unreferenced

_ForYourMonWillTradeText::
	text "gegen @"
	text_ram wPlayerTrademonSenderName
	text "s"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text "."
	done

; Oak's Pokémon Talk

_OPT_IntroText1::
	text_start
	line "MARGIT:"
	done

_OPT_IntroText2::
	text_start
	line "PROF. EICHs"
	done

_OPT_IntroText3::
	text_start
	line "#MON-TALK!"
	done

_OPT_OakText1::
	text_start
	line "EICH: @"
	text_ram wMonOrItemNameBuffer
	text_end

	text_end ; unreferenced

_OPT_OakText2::
	text_start
	line "wurde gesehen auf"
	done

_OPT_OakText3::
	text_start
	line "@"
	text_ram wStringBuffer1
	text "."
	done

_OPT_MaryText1::
	text_start
	line "MARGIT: @"
	text_ram wStringBuffer1
	text_end

	text_end ; unused

_OPT_SweetAdorablyText::
	text_start
	line "Wie bezaubernd."
	done

_OPT_WigglySlicklyText::
	text_start
	line "Wie smart."
	done

_OPT_AptlyNamedText::
	text_start
	line "Wie reizend."
	done

_OPT_UndeniablyKindOfText::
	text_start
	line "Wie freundlich."
	done

_OPT_UnbearablyText::
	text_start
	line "Nicht zu ertragen…"
	done

_OPT_WowImpressivelyText::
	text_start
	line "Wow, faszinierend."
	done

_OPT_AlmostPoisonouslyText::
	text_start
	line "Fast giftig."
	done

_OPT_SensuallyText::
	text_start
	line "Wie einfühlsam."
	done

_OPT_MischievouslyText::
	text_start
	line "So schelmisch."
	done

_OPT_TopicallyText::
	text_start
	line "Sehr aktuell."
	done

_OPT_AddictivelyText::
	text_start
	line "Suchterregend."
	done

_OPT_LooksInWaterText::
	text_start
	line "Schaut ins Wasser."
	done

_OPT_EvolutionMustBeText::
	text_start
	line "Entwicklung, ja."
	done

_OPT_ProvocativelyText::
	text_start
	line "Wie provozierend."
	done

_OPT_FlippedOutText::
	text_start
	line "Wie ausgeflippt."
	done

_OPT_HeartMeltinglyText::
	text_start
	line "Wie wunderbar."
	done

_OPT_CuteText::
	text_start
	line "Wie niedlich."
	done

_OPT_WeirdText::
	text_start
	line "Wie verrückt."
	done

_OPT_PleasantText::
	text_start
	line "Wie angenehm."
	done

_OPT_BoldSortOfText::
	text_start
	line "Wie dreist."
	done

_OPT_FrighteningText::
	text_start
	line "Furchterregend."
	done

_OPT_SuaveDebonairText::
	text_start
	line "Wie weltmännisch!"
	done

_OPT_PowerfulText::
	text_start
	line "Wie stark."
	done

_OPT_ExcitingText::
	text_start
	line "Wie aufregend."
	done

_OPT_NowText::
	text_start
	line "Jetzt!"
	done

_OPT_InspiringText::
	text_start
	line "Wie inspirierend."
	done

_OPT_FriendlyText::
	text_start
	line "Wie freundlich."
	done

_OPT_HotHotHotText::
	text_start
	line "Wie interessant!"
	done

_OPT_StimulatingText::
	text_start
	line "Wie anregend."
	done

_OPT_GuardedText::
	text_start
	line "Gut geschützt."
	done

_OPT_LovelyText::
	text_start
	line "Wie lieblich."
	done

_OPT_SpeedyText::
	text_start
	line "Wie rasant."
	done

_OPT_PokemonChannelText::
	text "#MON"
	done

_PokedexShowText::
	text_start
	line "@"
	text_ram wStringBuffer1
	text_end

	text_end ; unreferenced

; Pokémon Music Channel / Pokémusic

_BenIntroText1::
	text_start
	line "BEN: #MON-MUSIK"
	done

_BenIntroText2::
	text_start
	line "PROGRAMM!"
	done

_BenIntroText3::
	text_start
	line "Ich bin's, DJ BEN!"
	done

_FernIntroText1::
	text_start
	line "FABIAN: #MUSIK!"
	done

_FernIntroText2::
	text_start
	line "Mit DJ FABIAN!"
	done

_BenFernText1::
	text_start
	line "Es ist @"
	text_today
	text "!"
	done

_BenFernText2A::
	text_start
	line "Mach mit beim"
	done

_BenFernText2B::
	text_start
	line "Entspann dich beim"
	done

_BenFernText3A::
	text_start
	line "#MON-Marsch!"
	done

_BenFernText3B::
	text_start
	line "PKMN-Schlaflied!"
	done

; Lucky Channel

_LC_Text1::
	text_start
	line "BASTIAN: Yeah! Wie"
	done

_LC_Text2::
	text_start
	line "geht es euch nun?"
	done

_LC_Text3::
	text_start
	line "Geht es gut, oder"
	done

_LC_Text4::
	text_start
	line "geht es nicht,"
	done

_LC_Text5::
	text_start
	line "die GLÜCKSZAHLSHOW"
	done

_LC_Text6::
	text_start
	line "ist immer Pflicht!"
	done

_LC_Text7::
	text_start
	line "Die Glückszahl ist"
	done

_LC_Text8::
	text_start
	line "@"
	text_pause
	text_ram wStringBuffer1
	text "!"
	done

_LC_Text9::
	text_start
	line "Ich wiederhole!"
	done

_LC_Text10::
	text_start
	line "Gewonnen? Kommt"
	done

_LC_Text11::
	text_start
	line "zum RADIOTURM!"
	done

_LC_DragText1::
	text_start
	line "…Die Wiederholung"
	done

_LC_DragText2::
	text_start
	line "verzögert alles…"
	done

; Places and People

_PnP_Text1::
	text_start
	line "ORTE UND PERSONEN!"
	done

_PnP_Text2::
	text_start
	line "Moderiert von"
	done

_PnP_Text3::
	text_start
	line "DJ LILLY!"
	done

_PnP_Text4::
	text_start
	line "@"
	text_ram wStringBuffer2
	text " @"
	text_ram wStringBuffer1
	text_end

	text_end ; unreferenced

_PnP_CuteText::
	text_start
	line "ist niedlich."
	done

_PnP_LazyText::
	text_start
	line "irgendwie faul."
	done

_PnP_HappyText::
	text_start
	line "ist immer heiter."
	done

_PnP_NoisyText::
	text_start
	line "ist ziemlich laut."
	done

_PnP_PrecociousText::
	text_start
	line "ist frühreif."
	done

_PnP_BoldText::
	text_start
	line "ist wohl dreist."
	done

_PnP_PickyText::
	text_start
	line "ist zu wählerisch!"
	done

_PnP_SortOfOKText::
	text_start
	line "ist O.K."
	done

_PnP_SoSoText::
	text_start
	line "geht so."
	done

_PnP_GreatText::
	text_start
	line "ist großartig."
	done

_PnP_MyTypeText::
	text_start
	line "ist mein Typ."
	done

_PnP_CoolText::
	text_start
	line "ist so cool, oder?"
	done

_PnP_InspiringText::
	text_start
	line "ist inspirierend!"
	done

_PnP_WeirdText::
	text_start
	line "ist verrückt."
	done

_PnP_RightForMeText::
	text_start
	line "ist genau richtig?"
	done

_PnP_OddText::
	text_start
	line "ist merkwürdig!"
	done

_PnP_Text5::
	text_start
	line "@"
	text_ram wStringBuffer1
	text_end

	text_end ; unreferenced

_RocketRadioText1::
	text_start
	line "… …Ähm, wir sind"
	done

_RocketRadioText2::
	text_start
	line "TEAM ROCKET!"
	done

_RocketRadioText3::
	text_start
	line "Nach drei Jahren"
	done

_RocketRadioText4::
	text_start
	line "Vorbereitung sind"
	done

_RocketRadioText5::
	text_start
	line "wir bereit für"
	done

_RocketRadioText6::
	text_start
	line "unser Comeback!"
	done

_RocketRadioText7::
	text_start
	line "GIOVANNI! @"
	text_pause
	text "Hörst"
	done

_RocketRadioText8::
	text_start
	line "du uns? Geschafft!"
	done

_RocketRadioText9::
	text_start
	line "@"
	text_pause
	text "Wo ist unser Boss?"
	done

_RocketRadioText10::
	text_start
	line "@"
	text_pause
	text "Hört er zu?"
	done

_AskFloorElevatorText::
	text "Welcher Stock?"
	done

_BugCatchingContestTimeUpText::
	text "SPRECHER: BIEP!"

	para "Die Zeit ist um!"
	done

_BugCatchingContestIsOverText::
	text "SPRECHER: Der"
	line "Wettkampf ist"
	cont "vorbei!"
	done

_RepelWoreOffText::
	text "SCHUTZ wirkt"
	line "nicht mehr."
	done

_PlayerFoundItemText::
	text "<PLAYER> findet"
	line "@"
	text_ram wStringBuffer3
	text "."
	done

_ButNoSpaceText::
	text "Aber <PLAYER> hat"
	line "keinen Platz"
	cont "dafür…"
	done

_JustSawSomeRareMonText::
	text "Ich sah seltene"
	line "@"
	text_ram wStringBuffer1
	text " bei"
	cont "@"
	text_ram wStringBuffer2
	text "."

	para "Ich rufe an, wenn"
	line "ich ein anderes"
	cont "seltenes #MON"
	cont "sehe, in Ordnung?"
	prompt

_SavingRecordText::
	text "SPEICHERN…"
	line ""
	done

_ReceiveItemText::
	text_ram wPlayerName
	text " erhält"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	sound_item
	text_promptbutton
	text_end

	text_end ; unreferenced

_NoCoinsText::
	text "Du hast keine"
	line "Münzen."
	prompt

_NoCoinCaseText::
	text "Du hast keinen"
	line "MÜNZKORB."
	prompt

_NPCTradeCableText::
	text "O.K., benutze das"
	line "Game Link-Kabel."
	prompt

Text_NPCTraded::
	text "<PLAYER> tauscht"
	line "@"
	text_ram wMonOrItemNameBuffer
	text " gegen"
	cont "@"
	text_ram wStringBuffer2
	text ".@"
	text_end

_NPCTradeFanfareText::
	sound_dex_fanfare_80_109
	text_pause
	text_end

	text_end ; unreferenced

_NPCTradeIntroText1::
	text "Ich sammle #-"
	line "MON. Hast du ein"
	cont "@"
	text_ram wStringBuffer1
	text "?"

	para "Möchtest du es"
	line "gegen mein"

	para "@"
	text_ram wStringBuffer2
	text_start
	line "tauschen?"
	done

_NPCTradeCancelText1::
	text "Du möchtest nicht"
	line "tauschen? Schade…"
	done

_NPCTradeWrongText1::
	text "Häh? Das ist kein"
	line "@"
	text_ram wStringBuffer1
	text "."
	cont "Wie enttäuschend…"
	done

_NPCTradeCompleteText1::
	text "Yo! Ich habe mir"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "besorgt! Danke!"
	done

_NPCTradeAfterText1::
	text "Hi, wie geht es"
	line "meinem @"
	text_ram wStringBuffer2
	text "?"
	done

_NPCTradeIntroText2::
	text "Hi, ich suche"
	line "ein #MON."

	para "Wenn du ein"
	line "@"
	text_ram wStringBuffer1
	text " hast,"

	para "tauschst du es"
	line "gegen mein"
	cont "@"
	text_ram wStringBuffer2
	text "?"
	done

_NPCTradeCancelText2::
	text "Du hast auch"
	line "keines?"

	para "Das ist wirklich"
	line "enttäuschend…"
	done

_NPCTradeWrongText2::
	text "Du hast kein"
	line "@"
	text_ram wStringBuffer1
	text "? Das"
	cont "ist schade, na ja."
	done

_NPCTradeCompleteText2::
	text "Großartig! Danke!"

	para "Endlich habe ich"
	line "ein @"
	text_ram wStringBuffer1
	text "."
	done

_NPCTradeAfterText2::
	text "Dem @"
	text_ram wMonOrItemNameBuffer
	text ","
	line "das du mit mir"
	cont "getauscht hast,"
	cont "geht es gut!"
	done

_NPCTradeIntroText3::
	text_ram wMonOrItemNameBuffer
	text " ist"
	line "niedlich, aber ich"

	para "habe keines. Hast"
	line "du ein @"
	text_ram wStringBuffer1
	text "?"

	para "Möchtest du es"
	line "gegen mein"

	para "@"
	text_ram wStringBuffer2
	text_start
	line "tauschen?"
	done

_NPCTradeCancelText3::
	text "Du möchtest nicht"
	line "tauschen? Schade…"
	done

_NPCTradeWrongText3::
	text "Das ist kein"
	line "@"
	text_ram wStringBuffer1
	text "."

	para "Komm wieder, wenn"
	line "du tauschen"
	cont "möchtest."
	done

_NPCTradeCompleteText3::
	text "Danke! Ich wollte"
	line "immer schon ein"
	cont "@"
	text_ram wMonOrItemNameBuffer
	text "!"
	done

_NPCTradeAfterText3::
	text "Wie geht es dem"
	line "getauschten"
	cont "@"
	text_ram wStringBuffer2
	text "?"

	para "Dein @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "ist so niedlich!"
	done

_MomLeavingText1::
	text "Das ist ein nied-"
	line "liches #MON."

	para "Wo hast du es"
	line "her?"

	para "…"

	para "Du beginnst also"
	line "ein Abenteuer…"

	para "O.K.! Auch ich"
	line "werde dir helfen."

	para "Aber was kann ich"
	line "für dich tun?"

	para "Ich weiß! Ich"
	line "werde für dich"
	cont "sparen."

	para "Auf einer langen"
	line "Reise ist Geld"
	cont "sehr wichtig."

	para "Soll ich dein"
	line "Geld sparen?"
	done

_MomLeavingText2::
	text "O.K., ich verwalte"
	line "deine Ersparnisse."

	para "<……><……><……>"
	prompt

_MomLeavingText3::
	text "Sei auf der Hut."

	para "#MON sind"
	line "deine Kameraden."
	cont "Ihr müsst als Team"
	cont "auftreten."

	para "Also mach's gut!"
	done

_MomIsThisAboutYourMoneyText::
	text "Hi! Willkommen!"
	line "Ich sehe, du"
	cont "bemühst dich sehr."

	para "Ich habe dein"
	line "Zimmer aufgeräumt."

	para "Ist es wegen"
	line "deinem Geld?"
	done

_MomBankWhatDoYouWantToDoText::
	text "Was wirst du"
	line "tun?"
	done

_MomStoreMoneyText::
	text "Wie viel möchtest"
	line "du sparen?"
	done

_MomTakeMoneyText::
	text "Wie viel möchtest"
	line "du mitnehmen?"
	done

_MomSaveMoneyText::
	text "Möchtest du weiter"
	line "Geld sparen?"
	done

_MomHaventSavedThatMuchText::
	text "So viel hast du"
	line "nicht gespart."
	prompt

_MomNotEnoughRoomInWalletText::
	text "So viel kannst du"
	line "nicht mitnehmen."
	prompt

_MomInsufficientFundsInWalletText::
	text "So viel hast"
	line "du nicht."
	prompt

_MomNotEnoughRoomInBankText::
	text "So viel kannst"
	line "du nicht sparen."
	prompt

_MomStartSavingMoneyText::
	text "O.K., ich spare"
	line "für dich! Traue"
	cont "mir!"

	para "<PLAYER>, bleib"
	line "dabei!"
	done

_MomStoredMoneyText::
	text "Dein Geld ist hier"
	line "sicher! Tschüss!"
	done

_MomTakenMoneyText::
	text "<PLAYER>, nur nicht"
	line "aufgeben!"
	done

_MomJustDoWhatYouCanText::
	text "Gib immer dein"
	line "Bestes."
	done

_DaycareDummyText::
	text_start
	done

_DayCareManIntroText::
	text "Ich bin der"
	line "PENSIONSLEITER."
	cont "Soll ich eines"
	cont "deiner #MON"
	cont "aufziehen?"
	done

_DayCareManIntroEggText::
	text "Ich bin der"
	line "PENSIONSLEITER."
	cont "Kennst du dich"
	cont "mit EIERN aus?"

	para "Ich habe #MON"
	line "mit meiner"
	cont "Frau aufgezogen."

	para "Wir waren ent-"
	line "setzt, als wir ein"
	cont "EI fanden!"

	para "Das ist doch"
	line "unglaublich, oder?"

	para "Soll ich ein"
	line "#MON aufziehen?"
	done

_DayCareLadyIntroText::
	text "Ich bin die"
	line "PENSIONSLEITERIN."

	para "Soll ich eines"
	line "deiner #MON"
	cont "aufziehen?"
	done

_DayCareLadyIntroEggText::
	text "Ich bin die"
	line "PENSIONSLEITERIN."
	cont "Kennst du dich"
	cont "mit EIERN aus?"

	para "Mein Mann und ich"
	line "haben #MON"
	cont "aufgezogen."

	para "Wir waren er-"
	line "staunt, als wir"
	cont "ein EI fanden!"

	para "Das ist doch"
	line "unglaublich, oder?"

	para "Soll ich eines"
	line "deiner #MON"
	cont "aufziehen?"
	done

_WhatShouldIRaiseText::
	text "Welches soll"
	line "ich aufziehen?"
	prompt

_OnlyOneMonText::
	text "Oh? Aber du hast"
	line "nur ein #MON."
	prompt

_CantAcceptEggText::
	text "Tut mir Leid, aber"
	line "ich kann kein EI"
	cont "annehmen."
	prompt

_RemoveMailText::
	text "Entferne den"
	line "BRIEF, ehe du mich"
	cont "aufsuchst."
	prompt

_LastHealthyMonText::
	text "Wenn du mir das"
	line "gibst, wer soll"
	cont "dann kämpfen?"
	prompt

_IllRaiseYourMonText::
	text "O.K. Ich kümmere"
	line "mich um dein"
	cont "@"
	text_ram wStringBuffer1
	text "."
	prompt

_ComeBackLaterText::
	text "Hole es später"
	line "wieder ab."
	done

_AreWeGeniusesText::
	text "Wir sind genial,"
	line "oder? Möchtest du"
	cont "dein @"
	text_ram wStringBuffer1
	text_start
	cont "sehen?"
	done

_YourMonHasGrownText::
	text "Dein @"
	text_ram wStringBuffer1
	text_start
	line "ist groß geworden."

	para "Es ist um @"
	text_decimal wStringBuffer2 + 1, 1, 3
	text_start
	line "Level gestiegen."

	para "Wenn du dein"
	line "#MON zurück"
	cont "haben möchtest,"
	cont "kostet dich das"
	cont "¥@"
	text_decimal wStringBuffer2 + 2, 3, 4
	text "."
	done

_PerfectHeresYourMonText::
	text "Perfekt! Hier ist"
	line "dein #MON."
	prompt

_GotBackMonText::
	text "<PLAYER> erhält"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_BackAlreadyText::
	text "Huh? Schon zurück?"
	line "Dein @"
	text_ram wStringBuffer1
	text_start
	para "sollte noch ein"
	line "wenig hierbleiben."

	para "Wenn du dein"
	line "#MON zurück-"
	cont "haben möchtest,"
	cont "zahle ¥100."
	done

_HaveNoRoomText::
	text "Du hast keinen"
	line "Platz mehr."
	prompt

_NotEnoughMoneyText::
	text "Du hast nicht"
	line "genügend Geld."
	prompt

_OhFineThenText::
	text "Oh, in Ordnung."
	prompt

_ComeAgainText::
	text "Komm wieder."
	done

_NotYetText::
	text "Noch nicht…"
	done

_FoundAnEggText::
	text "Ah, du bist's!"

	para "Wir haben uns um"
	line "dein #MON"

	para "gekümmert und"
	line "waren sehr"
	cont "erstaunt!"

	para "Dein #MON hatte"
	line "ein EI!"

	para "Wir wissen nicht,"
	line "wie es dahin"

	para "gekommen ist; dein"
	line "#MON hat es."
	cont "Möchtest du es?"
	done

_ReceivedEggText::
	text "<PLAYER> erhält"
	line "das EI!"
	done

_TakeGoodCareOfEggText::
	text "Pass gut darauf"
	line "auf."
	done

_IllKeepItThanksText::
	text "Gut, ich passe"
	line "darauf auf. Danke!"
	done

_NoRoomForEggText::
	text "Du kannst keine"
	line "#MON mehr"
	cont "tragen. Komm"
	cont "später wieder."
	done

_WhichMonPhotoText::
	text "Welches #MON"
	line "soll ich"
	cont "fotografieren?"
	prompt

_HoldStillText::
	text "O.K. Beweg dich"
	line "nicht."
	prompt

_PrestoAllDoneText::
	text "Erledigt! Schau"
	line "mal wieder vorbei!"
	done

_NoPhotoText::
	text "Kein Foto? Schau"
	line "mal wieder vorbei!"
	done

_EggPhotoText::
	text "Ein EI? Mein"
	line "Talent hat mehr"
	cont "verdient…"
	done

_NameRaterHelloText::
	text "Hallo! Ich bin der"
	line "NAMEN-BEWERTER."

	para "Ich bewerte die"
	line "Namen deiner"
	cont "#MON."

	para "Soll ich einen"
	line "Namen bewerten?"
	done

_NameRaterWhichMonText::
	text "Welchen #MON-"
	line "Spitznamen soll"
	cont "ich bewerten?"
	prompt

_NameRaterBetterNameText::
	text "Hm… @"
	text_ram wStringBuffer1
	text "…"
	line "Das ist kein"
	cont "schlechter Name."

	para "Aber überlege dir"
	line "einen besseren"
	cont "Spitznamen!"

	para "Soll ich ihm einen"
	line "neuen Namen geben?"
	done

_NameRaterWhatNameText::
	text "O.K. Welchen"
	line "Namen möchtest"
	cont "du haben?"
	prompt

_NameRaterFinishedText::
	text "Dieser Name"
	line "ist besser!"

	para "Gut gemacht!"
	done

_NameRaterComeAgainText::
	text "O.K. Du kannst"
	line "mich immer be-"
	cont "suchen."
	done

_NameRaterPerfectNameText::
	text "Hm… @"
	text_ram wStringBuffer1
	text "?"
	line "Ein wirklich"
	cont "tadelloser Name!"

	para "Kümmere dich gut"
	line "um @"
	text_ram wStringBuffer1
	text "."
	done

_NameRaterEggText::
	text "Wow… Das ist nur"
	line "ein EI."
	done

_NameRaterSameNameText::
	text "Er sieht genauso"
	line "aus, wie der alte,"

	para "aber er ist "
	line "viel besser."

	para "Gut gemacht!"
	done

_NameRaterNamedText::
	text "O.K. Der neue Name"
	line "dieses #MON"
	cont "ist @"
	text_ram wStringBuffer1
	text "."
	prompt

Text_Gained::
	text_ram wStringBuffer1
	text " erhält@"
	text_end

_BoostedExpPointsText::
; BUG: Five-digit experience gain is printed incorrectly (see docs/bugs_and_glitches.md)
	text_start
	line "spezielle"
	cont "@"
	text_decimal wStringBuffer2, 2, 4
	text " EP!"
	prompt

_ExpPointsText::
; BUG: Five-digit experience gain is printed incorrectly (see docs/bugs_and_glitches.md)
	text_start
	line "@"
	text_decimal wStringBuffer2, 2, 4
	text " EP!"
	prompt

Text_GoMon::
	text "Los! @"
	text_ram wBattleMonNick
	text "!"
	done

Text_DoItMon::
	text "Los! @"
	text_ram wBattleMonNick
	text "!"
	done

Text_GoForItMon::
	text "Los,"
	line "@"
	text_ram wBattleMonNick
	text "!"
	done

Text_YourFoesWeakGetmMon::
	text "Mach es fertig!"
	line "Los, @"
	text_ram wBattleMonNick
	text "!"
	done

Text_BattleMonNickComma::
	text_ram wBattleMonNick
	text ",@@"

_ThatsEnoughComeBackText::
	text " genug!"
	line "Komm zurück!@"
	text_end

_OKComeBackText::
	text " O.K.!"
	line "Komm zurück!@"
	text_end

_GoodComeBackText::
	text " super!"
	line "Komm zurück!@"
	text_end

_ComeBackText::
	text " komm"
	line "zurück!"
	done

_PlayerPickedUpPayDayMoney::
	text "<PLAYER> hebt"
	line "¥@"
	text_decimal wPayDayMoney, 3, 6
	text " auf!"
	prompt

_BootedTMText::
	text "TM aktiviert."
	prompt

_BootedHMText::
	text "VM aktiviert."
	prompt

_ContainedMoveText::
	text "Sie enthält"
	line "@"
	text_ram wStringBuffer2
	text "."

	para "@"
	text_ram wStringBuffer2
	text_start
	line "einem #MON"
	cont "beibringen?"
	done

_TMHMNotCompatibleText::
	text_ram wStringBuffer2
	text " ist"
	line "nicht kompatibel"
	cont "mit @"
	text_ram wStringBuffer1
	text "."

	para "Es kann"
	line "@"
	text_ram wStringBuffer2
	text_start
	cont "nicht erlernen."
	prompt

_NoRoomTMHMText::
	text "Du hast keinen"
	line "Platz mehr für:"
	cont "@"
	text_ram wStringBuffer1
	text "."
	prompt

_ReceivedTMHMText::
	text "Du erhältst"
	line "@"
	text_ram wStringBuffer1
	text "!"
	prompt

_MysteryGiftCanceledText::
	text "Die Verbindung"
	line "wurde getrennt."
	prompt

_MysteryGiftCommErrorText::
	text "Übertragungs-"
	line "fehler."
	prompt

_RetrieveMysteryGiftText::
	text "Hole dir die"
	line "GABE im"
	cont "#MON-CENTER."
	prompt

_YourFriendIsNotReadyText::
	text "Dein Freund ist"
	line "nicht bereit."
	prompt

_MysteryGiftFiveADayText::
	text "Nur fünf GABEN"
	line "pro Tag."
	prompt

_MysteryGiftOneADayText::
	text "Nur eine GABE"
	line "pro Person pro"
	cont "Tag."
	prompt

_MysteryGiftSentText::
	text_ram wMysteryGiftPartnerName
	text " schickte"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_MysteryGiftSentHomeText::
	text_ram wMysteryGiftPartnerName
	text " schickte"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "zur Adresse von"
	cont "@"
	text_ram wMysteryGiftPlayerName
	text "."
	prompt

_BadgeRequiredText::
	text "Du benötigst einen"
	line "neuen ORDEN."
	prompt

_CantUseItemText::
	text "Du kannst das hier"
	line "nicht benutzen."
	prompt

_UseCutText::
	text_ram wStringBuffer2
	text " setzt"
	line "den ZERSCHNEIDER"
	cont "ein!"
	prompt

_CutNothingText::
	text "Hier kann"
	line "man nichts"
	cont "zerschneiden."
	prompt

_BlindingFlashText::
	text "Ein gleißender"
	line "BLITZ erhellt"
	cont "das Gebiet!@"
	text_promptbutton
	text_end

	text_end ; unreferenced

_UsedSurfText::
	text_ram wStringBuffer2
	text " setzt"
	line "SURFER ein!"
	done
