landmark: MACRO
; x, y, name
	db \1 + 8, \2 + 16
	dw \3
ENDM

Landmarks:
; entries correspond to constants/landmark_constants.asm
	dbbw       0,   0, SpecialMapName
	landmark 100, 116, SilentTownName
	landmark  92, 116, Route101Name
	landmark  84, 116, SilentHillsName
	landmark  84, 100, PagotaCityName
	landmark  83,  99, FiveFloorTowerName
	landmark  72, 100, Route102Name
	landmark  60, 100, WestportCityName
	landmark  59,  99, RadioTowerName
	landmark  60,  88, Route103Name
	landmark  60,  76, BirdonTownName
	landmark  59,  75, SlowpokeWellName
	landmark  60,  68, Route116Name
	landmark  52,  68, Route117Name
	landmark  44,  68, EndonCaveName
	landmark  36,  68, SanskritTownName
	landmark  36,  60, SanskritRuinsName
	landmark  24,  68, Route118Name
	landmark  12,  68, SunpointCityName
	landmark   4,  68, MagmaShaftName
	landmark  12,  60, SunpointDocksName
	landmark  12,  84, Route119Name
	landmark  20,  92, BoulderMineName
	landmark  28,  92, Route120Name
	landmark  36,  92, TeknosCityName
	landmark  36,  80, BoardwalkName
	landmark  80,  76, Route104Name
	landmark 100,  76, Route105Name
	landmark 100,  84, JadeForestName
	landmark 108,  84, Route106Name
	landmark 116,  84, AlloyCityName
	landmark 116,  72, Route107Name
	landmark 116,  60, KobanIslandName
	landmark 115,  59, DragonsDenName
	landmark 124,  84, Route108Name
	landmark 132,  76, Route109Name
	landmark 132,  68, AmpareCavernName
	landmark 136,  60, Route110Name
	landmark 148,  60, BlueForestName
	landmark 147,  59, IcePathName
	landmark 148,  48, Route111Name
	landmark 147,  47, WhirlIslandsName
	landmark 148,  36, FrostpointTownName
	landmark 148,  72, Route112Name
	landmark 148,  84, StandCityName
	landmark 140,  84, NationalParkName
	landmark 148, 100, Route113Name
	landmark 140, 116, Route114Name
	landmark 124, 116, KantoRegionName
	landmark 112, 116, Route115Name
	landmark 100, 108, MtFujiInteriorLowerName
	landmark 100, 100, CrownCityName
	landmark 100,  92, MountFujiName
	landmark 123, 115, BattleTowerName
	landmark 108, 108, MtMortarName
	landmark  92, 112, Route121Name
	landmark  80, 116, RouteU8UName
	landmark  36,  68, RouteU7UName
	landmark  28,  44, FujiSummitName
	landmark  28,  92, RouteU6UName
	landmark  20,  68, RouteU5UName
	landmark  92,  44, RouteU4UName
	landmark 120,  44, UnusedRoute1Name
	landmark 132,  64, UnusedPathName
	landmark  52,  92, TropicalIslandJungleName
	landmark 132,  68, LavenderTownName
	landmark  20, 124, RainbowIslandName
	landmark  52, 124, TropicalIslandName
	landmark  36, 124, ForkedStraitName
	landmark  36, 108, KumeCityName
	landmark  36, 100, IcedCavernName
	landmark  44, 108, KumePointName
	landmark  60, 108, KeramaStraitName
	landmark 132, 108, DaitoRanchName
	landmark 112, 108, GreatEastStraitName
	landmark  84, 108, NanjoForestName
	landmark  76, 104, UrasoeTrailName
	landmark  76,  92, UrasoeParkName
	landmark  76,  84, RyukyuCityName
	landmark  92,  76, CharredSummitName
	landmark  84,  76, MeridianPathName
	landmark  36,  52, HydroPlantName
	landmark  40,  60, WeatheredTrailName
	landmark  52,  60, IejimaTown
	landmark  68,  60, MotobuPathName
	landmark  84,  60, NagoVillageName
	landmark  96,  60, IsenStraitName
	landmark 112,  60, SeasidePathName
	landmark 124,  60, JouleCaveName
	landmark 140,  36, KikaiCalderaName
	landmark 140,  44, KikaiVillageName
	landmark 140,  52, KikaiStraitName
	landmark 128,  52, TatsugoPathName
	landmark 116,  52, AmamiTownName
	landmark  36, 124, FastShipName

AlloyCityName:      db "GENEOS CITY@"       ; Genus (lat. Gattung) + neos (griech. neu)
AmamiTownName:      db "AMAMIA@"            ; NICHT FINAL Amami - Ort in Ryukyu
AmpareCavernName:   db "AMPERA HÖHLE@"
BattleTowerName:    db "DUELLTURM@"
BirdonTownName:     db "TOTOMONIA@"         ; Tottori + Flegmon
BlueForestName:     db "KITAOMORIA CITY@"   ; Kita (jap. Norden) + ao (jap. Blau) + mori (jap. Wald)
BoardwalkName:      db "PROMENADE@"
BoulderMineName:    db "GERÖLLMINE@"        ;
CharredSummitName:  db "RUẞGIPFEL@"        ;
CrownCityName:      db "KOROKANIA CITY@"    ; Coroa (port. Krone) + oukan (jap. Krone)
DaitoRanchName:     db "DAITO RANCH@"       ; NICHT FINAL Daito - Ort in Ryukyu
DragonsDenName:     db "DRACHENSCHLUND@"    ;
EndonCaveName:      db "ENDON HÖHLE@"       ; NICHT FINAL Endon vielleicht von "No End" ?
FastShipName:       db "SCHNELLBOOT@"
FiveFloorTowerName: db "5-EBENEN-TURM@"     ; "Ebenen" anstelle von "Etagen" um Zweideutigkeit mit Spirituellem zu haben
ForkedStraitName:   db "MEERESGABELUNG@"     ;
FrostpointTownName: db "SPIZARDIA@"         ; Spitze + Blizzard     NICHT FINAL
GreatEastStraitName:    db "AGARIDINO-STRAẞE@"    ; ufuagari (okinawa. äußerster Osten) + Borodino (europ. Name für Daito-Inseln)
HydroPlantName:     db "WASSERKRAFTWERK@"   ;
IcedCavernName:     db "GEFRIERGROTTE@"     ; alt. FROSTHÖHLE
IcePathName:        db "TIEFWASSERPFAD@";
IejimaTown:         db "II-SHIMA@"          ; okinawa. Iejima - eine der Ryukyu Inseln
IsenStraitName:     db "ISEN-STRAẞE@"       ;
JadeForestName:     db "JADEWALD@"
JouleCaveName:      db "JOULEHÖHLE@"
KantoRegionName:    db "KANTO-REGION@"      ; alt. Kanto
KeramaStraitName:   db "STRAẞE VON KIRAMA@"     ; okinawa. für Kerama - Inselgruppe in Ryukyu
KikaiCalderaName:   db "KIKAI KESSEL@"      ; Caldera (span. Kessel) ggf. aber auch Caldera, da Fachbegriff
KikaiStraitName:    db "STRAẞE VON KIKAI@"  ; Kikai - Ort in Ryukyu
KikaiVillageName:   db "KIKAITANI@"         ; Kikai - Ort in Ryukyu + tanima (jap. Tal)
KobanIslandName:    db "SATORIA-INSEL@"     ; Satou (jap. Zucker)    alt. Satoria Eiland
KumeCityName:       db "KUMIA CITY@"        ; Kumijima (okinawaisch für Kume-jima) - Eine Ryukyu-Insel
KumePointName:      db "KUMIA-SPITZE@"      ;
LavenderTownName:   db "LAVANDIA@"
MagmaShaftName:     db "MAGMA-SCHACHT@"
MeridianPathName:   db "MERIDIAN-PFAD@"
MotobuPathName:     db "MUTUBU-PFAD@"       ; okinawa. Motobu - Ort in Ryukyu
MountFujiName:      db "KOROKANIABERG@"     ;
MtFujiInteriorLowerName:     db "KOROKANIA-PFAD@"
NagoCaveName:       db "NAGOHÖHLE@"         ; NICHT FINAL
NagoVillageName:    db "NAGOTANI@"          ; Nago - Stadt auf Okinawa + tanima (jap. Tal)
NanjoForestName:    db "NANJUU-WALD@"       ; Nanchuu /Nanjuu - okinawa. für Nanjo
NationalParkName:   db "NATIONALPARK@"      ;
NotApplicableName:  db "N/A@" ; "オバケやしき" ("HAUNTED HOUSE") in Japanese
PagotaCityName:     db "PAGETIA CITY@"      ; Pagode + vetus (lat. alt)
PokemonMansionName: db "#MON VILLA@"        ;
RadioTowerName:     db "RADIOTURM@"         ;
RainbowIslandName:  db "REGENBOGENINSEL@"
RyukyuCityName:     db "RUUCHUU CITY@"      ; Ruuchuu - ryukyu für Ryukyu
SafariZoneName:     db "SAFARI ZONE@"       ;
SanskritRuinsName:  db "GLYPHONTIA-RUINEN@" ; siehe Glyphontia
SanskritTownName:   db "GLYPHONTIA@"        ; Glyphe + Font
SeasidePathName:    db "KÜSTENPFAD@"
SilentHillsName:    db "SILENITIA HÜGEL@"
SilentTownName:     db "SILENITIA@"         ; Silens (lat. Stille) + initium (lat. Anfang)
SilphCoName:        db "SILPH CO.@"         ;
SlowpokeWellName:   db "FLEGMON-BRUNNEN@"   ;
StandCityName:      db "SENDESTIA CITY@"    ; Sendai + Podest
SunpointCityName:   db "KAZANAMI CITY@"     ; Kazan (jap. Vulkan) + Minami (jap. Süden)
SunpointDocksName:  db "KAZANAMI DOCKS@"
TatsugoPathName:    db "TATSUGO PFAD@"      ; Tatsugo - Ort in Ryukyu
TeknosCityName:     db "TEKNOPIA CITY@"     ; Teknos (griech. Technik) + Utopia
TropicalIslandJungleName:          db "ROUTE 1@"
TropicalIslandName: db "TROPENINSEL@"       ;
UrasoeParkName:     db "URASHI-PARK@"       ; okinawa. für Urasoe - Stadt auf Okinawa
UrasoeTrailName:    db "URASHI-WANDERWEG@"  ;
ViridianForestName: db "VERTANIAWALD@"
WeatheredTrailName: db "VERWITTERTER PFAD@"   ;
WestportCityName:   db "PORT ABANISHI@"     ; Port (alt. Hafen) + Abanti (ahd. Abend bzw. Westen) + Nishi (jap. Westen)     evtl. PORT ABANTIA
WhirlIslandsName:   db "STRUDELINSEL@"      ;


RouteU8UName:       db "ROUTE 18@"
RouteU7UName:       db "ROUTE 22@"
FujiSummitName:     db "ROUTE 23@"
RouteU6UName:       db "ROUTE 26@"
RouteU5UName:       db "ROUTE 28@"
RouteU4UName:       db "ROUTE 42@"
UnusedRoute1Name:   db "ROUTE 44@"
UnusedPathName:     db "ROUTE 45@"
Route101Name:       db "ROUTE 101@"
Route102Name:       db "ROUTE 102@"
Route103Name:       db "ROUTE 103@"
Route104Name:       db "ROUTE 104@"
Route105Name:       db "ROUTE 105@"
Route106Name:       db "ROUTE 106@"
Route107Name:       db "ROUTE 107@"
Route112Name:       db "ROUTE 112@"
Route113Name:       db "ROUTE 113@"
Route114Name:       db "ROUTE 114@"
Route115Name:       db "ROUTE 115@"
Route116Name:       db "ROUTE 116@"
Route117Name:       db "ROUTE 117@"
Route118Name:       db "ROUTE 118@"
Route119Name:       db "ROUTE 119@"
Route120Name:       db "ROUTE 120@"
Route121Name:       db "ROUTE 121@"
Route108Name:       db "ROUTE 108@"
Route109Name:       db "ROUTE 109@"
Route110Name:       db "ROUTE 110@"
Route111Name:       db "ROUTE 111@"

MtMortarName:       db "NOT USED@"
SpecialMapName:     db "SPEZIAL@"
