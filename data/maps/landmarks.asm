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

SilentTownName:     db "SILENITIA@"         ; Silens (lat. Stille) + initium (lat. Anfang)
CrownCityName:      db "COROA CITY@"        ; Coroa (port. Krone)
PagotaCityName:     db "PAGETIA CITY@"      ; Pagode + vetus (lat. alt)
BirdonTownName:     db "TOTOMONIA@"         ; Tottori + Flegmon
WestportCityName:   db "PORT ABANISHI@"     ; Port (alt. Hafen) + Abanti (ahd. Abend bzw. Westen) + Nishi (jap. Westen)
TeknosCityName:     db "TEKNOPIA CITY@"     ; Teknos (griech. Technik) + Utopia
AlloyCityName:      db "GENEOS CITY@"       ; Genus (lat. Gattung) + neos (griech. neu)
SunpointCityName:   db "MINAMIDIA CITY@"    ; Minami (jap. Süden) + Pyramide
SanskritTownName:   db "GLYPHONTIA@"        ; Glyphe + Font
BlueForestName:     db "BLAUTANNENWALD@"
KikaiVillageName:   db "KIKAI VILLAGE@"     ;
DaitoRanchName:     db "DAITO RANCH@"       ;
FiveFloorTowerName: db "5 STOCK TURM@"
SanskritRuinsName:  db "GLYPHONTIA RUINEN@" ; siehe Glyphontia
BoulderMineName:    db "GERÖLLMINE@"
SlowpokeWellName:   db "FLEGMON-BRUNNEN@"
RadioTowerName:     db "RADIOTURM@"
HydroPlantName:     db "WASSERKRAFTWERK@"
NationalParkName:   db "NATIONALPARK@"
TropicalIslandName: db "TROPENINSEL@"
EndonCaveName:      db "ENDON HÖHLE@"       ;
WhirlIslandsName:   db "STRUDELINSEL@"
MtMortarName:       db "NOT USED@"
DragonsDenName:     db "DRACHENSCHLUND@"
IcePathName:        db "TIEFWASSER PASSAGE@"
NotApplicableName:  db "N/A@" ; "オバケやしき" ("HAUNTED HOUSE") in Japanese
KobanIslandName:    db "SATORIA-INSEL@"    ; Satou (jap. Zucker)
IejimaTown:         db "IEJIMA TOWN@"
KumeCityName:       db "KUME CITY@"
NagoVillageName:    db "NAGO VILLAGE@"
LavenderTownName:   db "LAVANDIA@"
AmamiTownName:      db "AMAMI TOWN@"
KantoRegionName:    db "KANTO REGION@"
RyukyuCityName:     db "RYUKYU CITY@"
StandCityName:      db "SENDESTIA CITY@"    ; Sendai + Podest
FrostpointTownName: db "SPIZARDIA@"         ; Spitze + Blizzard
MountFujiName:      db "FUJIYAMA@"
MtFujiInteriorLowerName:     db "COROA-PFAD@"
UrasoeParkName:     db "URASOE PARK@"
CharredSummitName:  db "CHARRED SUMMIT@"
ForkedStraitName:   db "FORKED STRAIT@"
SilphCoName:        db "SILPH CO.@"
SafariZoneName:     db "SAFARI ZONE@"
NanjoForestName:    db "NANJO WALD@"
PokemonMansionName: db "#MON MANSION@"
NagoCaveName:       db "NAGO CAVE@"
TropicalIslandJungleName:          db "ROUTE 1@"
Route116Name:       db "ROUTE 116@"
Route117Name:       db "ROUTE 117@"
Route118Name:       db "ROUTE 118@"
SunpointDocksName:  db "MINAMIDIA DOCKS@"
Route119Name:       db "ROUTE 119@"
Route120Name:       db "ROUTE 120@"
Route114Name:       db "ROUTE 114@"
SeasidePathName:    db "SEASIDE PATH@"
MotobuPathName:     db "MOTOBU PATH@"
UrasoeTrailName:    db "URASOE TRAIL@"
TatsugoPathName:    db "TATSUGO PATH@"
Route121Name:       db "ROUTE 121@"
KikaiStraitName:    db "KIKAI STRAIT@"
KikaiCalderaName:   db "KIKAI KRATER@"
WeatheredTrailName: db "WEATHERED TRAIL@"
RouteU8UName:       db "ROUTE 18@"
KeramaStraitName:   db "KERAMA STRAIT@"
IsenStraitName:     db "ISEN STRAIT@"
Route107Name:       db "ROUTE 107@"
RouteU7UName:       db "ROUTE 22@"
FujiSummitName:     db "ROUTE 23@"
KumePointName:      db "KUME POINT@"
MeridianPathName:   db "MERIDIAN PATH@"
RouteU6UName:       db "ROUTE 26@"
Route115Name:       db "ROUTE 115@"
RouteU5UName:       db "ROUTE 28@"
Route101Name:       db "ROUTE 101@"
Route105Name:       db "ROUTE 105@"
Route106Name:       db "ROUTE 106@"
Route112Name:       db "ROUTE 112@"
Route104Name:       db "ROUTE 104@"
Route113Name:       db "ROUTE 113@"
Route103Name:       db "ROUTE 103@"
Route102Name:       db "ROUTE 102@"
SilentHillsName:    db "SILENITIA HÜGEL@"
Route108Name:       db "ROUTE 108@"
Route109Name:       db "ROUTE 109@"
Route110Name:       db "ROUTE 110@"
Route111Name:       db "ROUTE 111@"
RouteU4UName:       db "ROUTE 42@"
BoardwalkName:      db "PROMENADE@"
UnusedRoute1Name:   db "ROUTE 44@"
UnusedPathName:     db "ROUTE 45@"
GreatEastStraitName:    db "GROẞE ÖSTL. MEERENGE@"
AmpareCavernName:   db "AMPERA HÖHLE@"
JadeForestName:     db "JADE WALD@"
MagmaShaftName:     db "MAGMA-SCHACHT@"
FastShipName:       db "SCHNELLBOOT@"
ViridianForestName: db "VERTANIAWALD@"
IcedCavernName:     db "ICED CAVERN@"
RainbowIslandName:  db "REGENBOGENINSEL@"
JouleCaveName:      db "JOULE HÖHLE@"
BattleTowerName:    db "DUELLTURM@"
SpecialMapName:     db "SPEZIAL@"
