	object_const_def ; object_event constants
	const RYUKYUTHEATRE_KIMONO_GIRL1
	const RYUKYUTHEATRE_KIMONO_GIRL2
	const RYUKYUTHEATRE_KIMONO_GIRL3
	const RYUKYUTHEATRE_KIMONO_GIRL4
	const RYUKYUTHEATRE_KIMONO_GIRL5
	const RYUKYUTHEATRE_KIMONO_GIRL6
	const RYUKYUTHEATRE_GENTLEMAN
	const RYUKYUTHEATRE_RHYDON
	const RYUKYUTHEATRE_COOLTRAINER_M
	const RYUKYUTHEATRE_GRANNY
	const RYUKYUTHEATRE_JANINE
	const RYUKYUTHEATRE_POKEFAN_M
	const RYUKYUTHEATRE_POKEFAN_F
	const RYUKYUTHEATRE_SUPER_NERD

RyukyuTheatre_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerKimonoGirlNaoko:
	trainer KIMONO_GIRL, NAOKO, EVENT_BEAT_KIMONO_GIRL_NAOKO, KimonoGirlNaokoSeenText, KimonoGirlNaokoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlNaokoAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlSayo:
	trainer KIMONO_GIRL, SAYO, EVENT_BEAT_KIMONO_GIRL_SAYO, KimonoGirlSayoSeenText, KimonoGirlSayoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlSayoAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlZuki:
	trainer KIMONO_GIRL, ZUKI, EVENT_BEAT_KIMONO_GIRL_ZUKI, KimonoGirlZukiSeenText, KimonoGirlZukiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlZukiAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlKuni:
	trainer KIMONO_GIRL, KUNI, EVENT_BEAT_KIMONO_GIRL_KUNI, KimonoGirlKuniSeenText, KimonoGirlKuniBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlKuniAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlKyoko:
	trainer KIMONO_GIRL, KYOKO, EVENT_BEAT_KIMONO_GIRL_KYOKO, KimonoGirlKyokoSeenText, KimonoGirlKyokoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlKyokoAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlMiki:
	trainer KIMONO_GIRL, MIKI, EVENT_BEAT_KIMONO_GIRL_MIKI, KimonoGirlMikiSeenText, KimonoGirlMikiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlMikiAfterBattleText
	waitbutton
	closetext
	end

RyukyuTheaterCoinsGuy:
	faceplayer
	opentext
	writetext CoinsGuyNeverLeftAScratchText
	promptbutton
	checkevent EVENT_GOT_COINS_FROM_GENTLEMAN
	iftrue CoinsGuyAlreadyGaveCoins
	checkevent EVENT_BEAT_KIMONO_GIRL_NAOKO
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_SAYO
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_ZUKI
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_KUNI
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_MIKI
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_KYOKO
	iffalse .KimonoGirlsUndefeated
	sjump .GetCoins

.KimonoGirlsUndefeated:
	writetext CoinsGuyLadGiftText
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_COINS_GUY
	end

.GetCoins:
	checkevent EVENT_TALKED_TO_COINS_GUY
	iftrue .ContinueGetCoins
	writetext CoinsGuyLadGiftText
	waitbutton
.ContinueGetCoins
	writetext CoinsGuyLikeADanceText
	buttonsound
	checkitem COIN_CASE
	iffalse .NoCoinCase
	checkcoins MAX_COINS - 1
	ifequal HAVE_MORE, .FullCoinCase
	stringtotext .coinname, MEM_BUFFER_1
	scall .GiveCoins
	givecoins 10000
	setevent EVENT_GOT_COINS_FROM_GENTLEMAN
	writetext CoinsGuyGotCoins
	waitbutton
	closetext
	end

.GiveCoins:
	jumpstd ReceiveItemScript
	end

.coinname
	db "MÜNZEN@"

.NoCoinCase:
	writetext CoinsGuyNoCoinCaseText
	waitbutton
	closetext
	end

.FullCoinCase:
	writetext CoinsGuyFullCoinCaseText
	waitbutton
	closetext
	end


CoinsGuyAlreadyGaveCoins:
	writetext CoinsGuyElegantKimonoGirlsText
	waitbutton
	closetext
	end

RyukyuTheaterRhydon:
	faceplayer
	opentext
	writetext RhydonText
	cry RHYDON
	waitbutton
	closetext
	end
	
RyukyuTheatreJanineScript:
	jumptextfaceplayer RyukyuTheatreJanineText

RyukyuTheatreCooltrainerMScript:
	jumptextfaceplayer RyukyuTheatreCooltrainerMText

RyukyuTheatreGrannyScript:
	jumptextfaceplayer RyukyuTheatreGrannyText

RyukyuTheatreFancyPanel:
	jumptext RyukyuTheatreFancyPanelText
	
RyukyuTheatrePokefanMScript:
	jumptextfaceplayer RyukyuTheatrePokefanMText
	
RyukyuTheatrePokefanFScript:
	jumptextfaceplayer RyukyuTheatrePokefanFText
	
RyukyuTheatreSuperNerdScript:
	jumptextfaceplayer RyukyuTheatreSuperNerdText
	
RyukyuTheatreSuperNerdText:
	text "Die Vorstellung"
	line "ist großartig!"
	done

RyukyuTheatrePokefanMText:
	text "Meine Frau liebt"
	line "es, im RUUCHUU"
	cont "HOTEL zu wohnen!"
	done
	
RyukyuTheatrePokefanFText:
	text "Was für ein"
	line "wunderschöner"
	cont "Urlaub das war!"
	done
	
RyukyuTheatreJanineText:
	text "Nichts über ein"
	line "Essen und eine"
	para "Vorstellung, wenn"
	line "ich RUUCHUU CITY"
	cont "besuche!"
	done
	
CoinsGuyNoCoinCaseText:
	text "Oh, was ist das?"

	para "Du hast keinen"
	line "MÜNZKORB!"
	done
	
CoinsGuyFullCoinCaseText:
    text "Tja, Kumpel. Sieht"
    line "so aus, als wäre"
    para "dein MÜNZKORB"
    line "schon voll!"
	done
	
CoinsGuyGotCoins:
	text "Hol dir was Schönes"
	line "in einer der"
	para "SPIELHALLEN in"
	line "ganz NIHON!"
	done

KimonoGirlNaokoSeenText:
	text "Du hast hübsche"
	line "#MON. Darf ich"
	cont "sehen, wie sie"
	cont "kämpfen?"
	done

KimonoGirlNaokoBeatenText:
	text "Oh, du bist sehr"
	line "stark."
	done

KimonoGirlNaokoAfterBattleText:
	text "Das war ein toller"
	line "Kampf. Ich würde"
	cont "dich gerne mal"
	cont "wieder sehen."
	done

KimonoGirlSayoSeenText:
	text "Ich tanze immer"
	line "mit meinen #-"
	cont "MON. Natürlich"
	para "trainiere ich sie"
	line "auch."
	done

KimonoGirlSayoBeatenText:
	text "Oh, beinahe!"
	line "Fast hätte ich"
	cont "dich gehabt."
	done

KimonoGirlSayoAfterBattleText:
	text "Rhythmus ist nicht"
	line "nur zum Tanzen,"
	para "sondern auch für"
	line "#MON wichtig."
	done

KimonoGirlKyokoSeenText:
	text "Tanzen ist ein"
	line "tolles Mittel"
	cont "gegen Stress."
	done

KimonoGirlKyokoBeatenText:
	text "Ich glaube, ich"
	line "wurde besiegt."
	done

KimonoGirlKyokoAfterBattleText:
    text "Wir lernen jeden"
    line "Monat einen neuen"
    cont "Tanz."
	done

KimonoGirlZukiSeenText:
	text "Ist meine Haar-"
	line "spange nicht"
	cont "hübsch?"

	para "Oh, ein #MON-"
	line "Kampf?"
	done

KimonoGirlZukiBeatenText:
	text "Ich habe keine"
	line "#MON mehr"
	cont "übrig…"
	done

KimonoGirlZukiAfterBattleText:
	text "Jeden Monat stecke"
	line "ich mir eine ande-"
	cont "re Blume in die"
	cont "Spange."
	done

KimonoGirlKuniSeenText:
	text "Oh, du scheinst"
	line "nett zu sein."
	cont "Willst du kämpfen?"
	done

KimonoGirlKuniBeatenText:
	text "Du bist stärker"
	line "als du aussiehst."
	done

KimonoGirlKuniAfterBattleText:
	text "Ich habe viel"
	line "trainiert. Also"
	para "dachte ich, ich"
	line "wäre gut. Aber ich"
	cont "bin es wohl nicht."
	done

KimonoGirlMikiSeenText:
	text "Gefällt dir mein"
	line "Tanz? Ich kenne"
	cont "mich auch gut mit"
	cont "#MON aus."
	done

KimonoGirlMikiBeatenText:
	text "Ooh, du kennst"
	line "dich auch gut mit"
	cont "#MON aus."
	done

KimonoGirlMikiAfterBattleText:
	text "Ich werde nicht"
	line "aufhören zu tan-"
	cont "zen, solange es"
	cont "Leute gibt, denen"
	para "ich dadurch Freude"
	line "bereite."

	para "Auch meine #MON"
	line "unterstützen mich"
	cont "dabei."
	done

CoinsGuyNeverLeftAScratchText:
	text "Die KIMONO-GIRLS"
	line "sind nicht nur"
	para "großartige Tänzer,"
	line "sie sind auch gute"
	cont "#MON-Trainer."

	para "Ich fordere sie"
	line "ständig heraus,"
	para "konnte sie aber"
	line "noch nie besiegen…"
	done

CoinsGuyLadGiftText:
    text "Junge! Ich hatte"
    line "etwas Glück bei"
    cont "den Spielen oben!"

    para "Wenn du alle"
    line "KIMONO-GIRLS"
    para "besiegst, fülle"
    line "ich deinen MÜNZ-"
    cont "KORB bis zum Rand!"
	done

CoinsGuyLikeADanceText:
	text "Die Art wie du"
	line "kämpfst, ist wie"
	cont "ein Tanz."

	para "So etwas sieht man"
	line "nicht oft!"

	para "Hier, Kumpel, wie"
	line "versprochen!"
	done

CoinsGuyElegantKimonoGirlsText:
	text "Ich wünschte, mei-"
	line "ne #MON wären"
	cont "so elegant wie die"
	cont "KIMONO-GIRLS…"
	done

RhydonText:
	text "RIZEROS: Gugooh"
	line "gugogooh!"
	done

RyukyuTheatreCooltrainerMText:
	text "Die Tänze der"
	line "KIMONO-GIRLS sind"
	cont "so hypnotisch…"
	done

RyukyuTheatreGrannyText:
	text "Die KIMONO-GIRLS"
	line "sind so hübsch…"

	para "Aber sie müssen"
	line "hart trainieren."

	para "Und sie müssen"
	line "so viele Dinge"
	para "lernen, bevor sie"
	line "öffentlich auftre-"
	cont "ten."

	para "Aber wenn du etwas"
	line "liebst, ist alles"
	cont "möglich."
	done

RyukyuTheatreFancyPanelText:
	text "Eine hübsche, mit"
	line "Blumen dekorierte"
	cont "Tafel."
	done

RyukyuTheatre_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 19,  7, RYUKYU_RESTAURANT, 5


	db 0 ; coord events

	db 2 ; bg events
	bg_event 19,  2, BGEVENT_UP, RyukyuTheatreFancyPanel
	bg_event 19,  3, BGEVENT_UP, RyukyuTheatreFancyPanel

	db 14 ; object events
	object_event  1,  3, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlNaoko, -1
	object_event  4,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlSayo, -1
	object_event  7,  3, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlZuki, -1
	object_event 10,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlKuni, -1
	object_event 13,  3, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlMiki, -1
	object_event 16,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlKyoko, -1
	object_event  3,  9, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RyukyuTheaterCoinsGuy, -1
	object_event  2,  9, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, RyukyuTheaterRhydon, -1
	object_event 11, 13, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RyukyuTheatreCooltrainerMScript, -1
	object_event  7,  9, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RyukyuTheatreGrannyScript, -1
	object_event 14,  9, SPRITE_JANINE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RyukyuTheatreJanineScript, -1
	object_event  6, 13, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, RyukyuTheatrePokefanMScript, -1
	object_event  7, 13, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RyukyuTheatrePokefanFScript, -1
	object_event 12, 17, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, RyukyuTheatreSuperNerdScript, -1


