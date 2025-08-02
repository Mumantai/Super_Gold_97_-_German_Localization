	object_const_def ; object constants
	const KURTSHOUSE_KURT1
	const KURTSHOUSE_KURT2
	const KURTSHOUSE_FALKNER

KurtsHouse_MapScripts:
	db 2 ; scene scripts
	scene_script .SceneFalknerVisit1 ; SCENE_DEFAULT
	scene_script .SceneKurtsHouseNothing ;

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .KurtCallback
	
.SceneFalknerVisit1
	priorityjump .SceneFalknerVisit2
	end

.SceneFalknerVisit2
	applymovement PLAYER, WalkUpToFalkner
	showemote EMOTE_SHOCK, KURTSHOUSE_FALKNER, 15
	applymovement KURTSHOUSE_FALKNER, FalknerWalksToYou
	opentext
	writetext FalknerGreets
	waitbutton
	closetext
	applymovement KURTSHOUSE_FALKNER, FalknerLeaves
	playsound SFX_EXIT_BUILDING
	disappear KURTSHOUSE_FALKNER
	clearevent EVENT_PAGOTA_GYM_FALKNER
	pause 15
	applymovement PLAYER, WalkUpToKurt
	pause 15
	opentext
	writetext KurtTalks
	waitbutton
	closetext
	
	setscene SCENE_KURTS_HOUSE_NOTHING
	end
	
.SceneKurtsHouseNothing:
	end

.KurtCallback:
;	checkevent EVENT_GOT_5F_SAGE_BLESSING
	iffalse .Done
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .MakingBalls
	disappear KURTSHOUSE_KURT2
	appear KURTSHOUSE_KURT1
	return

.MakingBalls:
	disappear KURTSHOUSE_KURT1
	appear KURTSHOUSE_KURT2
.Done:
	return

Kurt1:
	faceplayer
	opentext
	checkevent EVENT_KURT_GAVE_YOU_LURE_BALL
	iftrue .GotLureBall
	checkevent EVENT_GOT_5F_SAGE_BLESSING
	iftrue .GotBlessing
	writetext UnknownText_0x18e473
	waitbutton
	closetext
;	special FadeOutMusic
;	setevent EVENT_BIRDON_TOWN_SLOWPOKETAIL_ROCKET
;	checkcode VAR_FACING
;	ifequal UP, .RunAround
;	turnobject PLAYER, DOWN
;	playsound SFX_FLY
;	applymovement KURTSHOUSE_KURT1, MovementData_0x18e466
;	playsound SFX_EXIT_BUILDING
;	disappear KURTSHOUSE_KURT1
;	waitsfx
;	special RestartMapMusic
	end

;.RunAround:
;	turnobject PLAYER, DOWN
;	playsound SFX_FLY
;	applymovement KURTSHOUSE_KURT1, MovementData_0x18e46c
;	playsound SFX_EXIT_BUILDING
;	disappear KURTSHOUSE_KURT1
;	waitsfx
;	special RestartMapMusic
;	end

.GotBlessing:
	writetext UnknownText_0x18e615
	buttonsound
	verbosegiveitem LURE_BALL
	iffalse .NoRoomForBall
	setevent EVENT_KURT_GAVE_YOU_LURE_BALL
.GotLureBall:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .ThatTurnedOutGreat
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .WaitForApricorns
	checkevent EVENT_GAVE_KURT_RED_APRICORN
	iftrue .GiveLevelBall
	checkevent EVENT_GAVE_KURT_BLU_APRICORN
	iftrue .GiveLureBall
	checkevent EVENT_GAVE_KURT_YLW_APRICORN
	iftrue .GiveMoonBall
	checkevent EVENT_GAVE_KURT_GRN_APRICORN
	iftrue .GiveFriendBall
	checkevent EVENT_GAVE_KURT_WHT_APRICORN
	iftrue .GiveFastBall
	checkevent EVENT_GAVE_KURT_BLK_APRICORN
	iftrue .GiveHeavyBall
	checkevent EVENT_GAVE_KURT_PNK_APRICORN
	iftrue .GiveLoveBall
	writetext KurtsHouseKurtBallsFromApricornsText
	promptbutton
.CheckApricorns:
	checkitem RED_APRICORN
	iftrue .AskApricorn
	checkitem BLU_APRICORN
	iftrue .AskApricorn
	checkitem YLW_APRICORN
	iftrue .AskApricorn
	checkitem GRN_APRICORN
	iftrue .AskApricorn
	checkitem WHT_APRICORN
	iftrue .AskApricorn
	checkitem BLK_APRICORN
	iftrue .AskApricorn
	checkitem PNK_APRICORN
	iftrue .AskApricorn
	closetext
	end

.AskApricorn:
	writetext KurtsHouseKurtAskYouHaveAnApricornText
	promptbutton
	special SelectApricornForKurt
	ifequal FALSE, .Cancel
	ifequal BLU_APRICORN, .Blu
	ifequal YLW_APRICORN, .Ylw
	ifequal GRN_APRICORN, .Grn
	ifequal WHT_APRICORN, .Wht
	ifequal BLK_APRICORN, .Blk
	ifequal PNK_APRICORN, .Pnk
; .Red
	setevent EVENT_GAVE_KURT_RED_APRICORN
	sjump .GaveKurtApricorns

.Blu:
	setevent EVENT_GAVE_KURT_BLU_APRICORN
	sjump .GaveKurtApricorns

.Ylw:
	setevent EVENT_GAVE_KURT_YLW_APRICORN
	sjump .GaveKurtApricorns

.Grn:
	setevent EVENT_GAVE_KURT_GRN_APRICORN
	sjump .GaveKurtApricorns

.Wht:
	setevent EVENT_GAVE_KURT_WHT_APRICORN
	sjump .GaveKurtApricorns

.Blk:
	setevent EVENT_GAVE_KURT_BLK_APRICORN
	sjump .GaveKurtApricorns

.Pnk:
	setevent EVENT_GAVE_KURT_PNK_APRICORN
	sjump .GaveKurtApricorns

.GaveKurtApricorns:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	setflag ENGINE_KURT_MAKING_BALLS
.WaitForApricorns:
	writetext KurtsHouseKurtItWillTakeADayText
	waitbutton
	closetext
	end

.Cancel:
	writetext KurtsHouseKurtThatsALetdownText
	waitbutton
	closetext
	end

.KurtMakingBallsScript:
	writetext KurtsHouseKurtDontBotherMeText
	waitbutton
	closetext
	end

._ThatTurnedOutGreat:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
.ThatTurnedOutGreat:
	writetext KurtsHouseKurtTurnedOutGreatText
	waitbutton
.NoRoomForBall:
	closetext
	end

.GiveLevelBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitem LEVEL_BALL
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_RED_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveLureBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitem LURE_BALL
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_BLU_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveMoonBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitem MOON_BALL
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_YLW_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveFriendBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitem FRIEND_BALL
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_GRN_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveFastBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitem FAST_BALL
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_WHT_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveHeavyBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitem HEAVY_BALL
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_BLK_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveLoveBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitem LOVE_BALL
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_PNK_APRICORN
	sjump ._ThatTurnedOutGreat


Script_FirstTimeBuggingKurt:
	writetext UnknownText_0x18e863
	waitbutton
	closetext
	turnobject KURTSHOUSE_KURT2, LEFT
	setevent EVENT_BUGGING_KURT_TOO_MUCH
	end




Kurt2:
	faceplayer
	opentext
;	checkevent EVENT_GAVE_GS_BALL_TO_KURT
;	iftrue KurtScript_ImCheckingItNow
KurtMakingBallsScript:
	checkevent EVENT_BUGGING_KURT_TOO_MUCH
	iffalse Script_FirstTimeBuggingKurt
	writetext KurtsHouseKurtDontBotherMeText
	waitbutton
	closetext
	turnobject KURTSHOUSE_KURT2, LEFT
	end
Falkner:
	end

KurtsHouseOakPhoto:
	jumptext KurtsHouseOakPhotoText

KurtsHouseLeafeonStatue:
	jumptext KurtsHouseLeafeonStatueText

KurtsHouseBookshelf:
	jumpstd DifficultBookshelfScript

KurtsHouseRadio:
	jumpstd Radio2Script
	
WalkUpToKurt:
	step RIGHT
	step UP
	step_end

WalkUpToFalkner:
	slow_step UP
	slow_step UP
	step_end
	
FalknerWalksToYou:
	step LEFT
	turn_head DOWN
	step_end
	
FalknerLeaves:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_0x18e46c:
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

UnknownText_0x18e473:
    text "Erklimm den"
    line "5-EBENEN-TURM.

    para "Es ist ein guter"
    line "Test, um dein Po-"
    para "tenzial als Trai-"
    line "ner zu prüfen."
	done

UnknownText_0x18e615:
	text "Du hast die Wege"
	line "der #MON"
	cont "kennengelernt."

	para "Es wäre mir eine"
	line "Ehre, für einen"

	para "Trainer wie dich"
	line "BÄLLE anzuferti-"
	cont "gen."

	para "Hier, nimm einen!"
	done

KurtsHouseKurtBallsFromApricornsText:
	text "KURT: Ich mache"
	line "BÄLLE aus APRIKO-"
	cont "KOS."

	para "Pflücke sie von"
	line "Bäumen und bring"
	cont "sie zu mir."

	para "Ich fertige daraus"
	line "BÄLLE an."
	done

KurtsHouseKurtAskYouHaveAnApricornText:
	text "KURT: Hast du eine"
	line "APRIKOKO für mich?"

	para "Schön! Ich werde"
	line "einen BALL daraus"
	cont "machen."
	done

KurtsHouseKurtItWillTakeADayText:
	text "KURT: Ich werde"
	line "einen Tag brau-"
	cont "chen, um einen"
	cont "BALL zu machen."

	para "Komm später wie-"
	line "der!"
	done

KurtsHouseKurtThatsALetdownText:
	text "KURT: Oh…"
	line "Du lässt mich im"
	cont "Stich?"
	done

KurtsHouseKurtDontBotherMeText:
	text "KURT: Ich arbeite!"
	line "Stör mich nicht!"
	done

KurtsHouseKurtJustFinishedYourBallText:
	text "KURT: Ah, <PLAYER>!"
	line "Ich bin gerade"
	cont "fertig geworden."
	cont "Hier hast du den"
	cont "BALL!"
	done

KurtsHouseKurtTurnedOutGreatText:
	text "KURT: Er ist groß-"
	line "artig geworden."

	para "Versuche, ein"
	line "#MON damit"
	cont "zu fangen."
	done

UnknownText_0x18e863:
    text "Ich merke, wie ich"
    line "mich verbessert"
    para "habe und jetzt"
    line "viel schneller als"
    para "vorher arbeiten"
    line "kann."
	done

UnknownText_0x18e8ab:
	text "W-was ist das?"

	para "Das habe ich noch"
	line "nie gesehen."

	para "Es sieht wie ein"
	line "#BALL aus, es"

	para "scheint, aber"
	line "etwas anderes zu"
	cont "sein."

	para "Ich überprüfe das"
	line "für dich."
	done

UnknownText_0x18e934:
	text "Ich überprüfe es"
	line "gerade."
	done

UnknownText_0x18e949:
	text "Ah-ha! Verstehe!"
	line "So ist das…"
	done

UnknownText_0x18e95c:
	text "<PLAYER>!"

	para "Dieser BALL hat"
	line "sich bewegt, als"
	cont "ich ihn"
	cont "überprüfte."

	para "Da geht etwas vor"
	line "sich!"
	done



KurtsHouseSlowpokeText:
	text "FLEGMON: …"
	line "Gähn?"
	done

KurtsHouseOakPhotoText:
    text "KURT, wie er mit"
    line "einem WEISEN und"
    para "einem Mann mit"
    line "KAPITÄNSMÜTZE im"
    cont "TURM steht."
	done

KurtsHouseLeafeonStatueText:
	text "Eine Statue des"
	line "Waldpatrons."
	done
	
FalknerGreets:
    text "FALK: Oh, wer bist"
    line "du denn?"

    para "<PLAYER>, hm?"
    line "Was führt dich"
    cont "hierher?"

    para "Wahrscheinlich,"
    line "weil ich gerade"
    para "nicht da bin, wo"
    line "ich sein sollte."

    para "Ich gehe zurück"
    line "in die ARENA,"
    para "damit du mich um"
    line "meinen ORDEN her-"
    cont "ausfordern kannst."

    para "…"

    para "Hm?"

    para "Du kämpfst gar"
    line "nicht um die"
    cont "ARENA-ORDEN?"

    para "Was führt dich"
    line "dann nach PAGETIA"
    cont "CITY?"

    para "…"

    para "Wow, es ist sehr"
    line "beeindruckend,"
    para "dass PROF.EICH"
    line "dich gebeten hat,"
    cont "ihm bei seiner"
    para "Forschung über"
    line "#MON zu helfen."

    para "Aber ich sehe"
    line "dieses Funkeln in"
    cont "deinen Augen!"

    para "Wenn du den Drang"
    line "verspürst, NIHONs"
    para "#MON LIGA doch"
    line "herauszufordern,"
    para "dann komm gerne"
    line "jederzeit vorbei!"

    para "Wie dem auch sei,"
    line "ich mache mich mal"
    cont "auf den Weg."

    para "Ich hoffe, wir"
    line "sehen uns bald!"
	done
	
KurtTalks:
    text "KURT: Ich habe es"
    line "gleich gespürt,"
    para "alss du herein-"
    line "gekommen bist."

    para "Du hast großes"
    line "Potenzial als"
    cont "Trainer."

    para "FALK konnte es"
    line "auch spüren."

    para "Ich schlage vor,"
    line "dass du, während"
    para "deiner Reise, die"
    line "ARENEN in NIHON"
    cont "herausforderst."

    para "Aber abgesehen"
    line "davon möchte ich"
    para "dir bei deiner"
    line "Forschung helfen"
    para "und dir etwas"
    line "geben, das dir"
    para "beim Fangen von"
    line "#MON hilft."

    para "Aber zuerst musst"
    line "du dich beweisen."

    para "Der 5-EBENEN-TURM"
    line "ist ein heiliger"
    para "Ort, an dem ich"
    line "viele Jahre damit"
    para "verbracht habe,"
    line "mein Verständnis"
    para "über die Beziehung"
    line "zwischen Menschen"
    para "und #MON zu"
    line "stärken."

    para "Ich möchte, dass"
    line "du diesen Turm"
    cont "erklimmst."

    para "Kehre danach zu"
    line "mir zurück."
	done

KurtsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, PAGOTA_CITY, 10
	warp_event  4,  7, PAGOTA_CITY, 10

	db 0 ; coord events

	db 7 ; bg events
	bg_event  6,  0, BGEVENT_READ, KurtsHouseRadio
	bg_event 14,  0, BGEVENT_READ, KurtsHouseOakPhoto
	bg_event 15,  0, BGEVENT_READ, KurtsHouseOakPhoto
	bg_event  5,  1, BGEVENT_READ, KurtsHouseBookshelf
	bg_event  2,  0, BGEVENT_READ, KurtsHouseBookshelf
	bg_event  3,  0, BGEVENT_READ, KurtsHouseBookshelf
	bg_event  7,  0, BGEVENT_READ, KurtsHouseLeafeonStatue

	db 3 ; object events
	object_event  4,  2, SPRITE_KURT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Kurt1, EVENT_KURTS_HOUSE_KURT_1
	object_event 15,  4, SPRITE_KURT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Kurt2, EVENT_KURTS_HOUSE_KURT_2
	object_event  4,  3, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Falkner, EVENT_KURTS_HOUSE_FALKNER
