_map = _this select 0;
_display = ctrlparent _map;

_artilleryGrid = _display displayctrl 504;
_artilleryGrid ctrlsettext "Null";

_artilleryDist = _display displayctrl 505;
_artilleryDist ctrlsettext "Null";

_artilleryDir = _display displayctrl 508;
_artilleryDir ctrlsettext "Null";

_artilleryAlt = _display displayctrl 509;
_artilleryAlt ctrlsettext "Null";

_artilleryETA = _display displayctrl 514;
_artilleryETA ctrlsettext "Null";

_map drawRectangle [
	[worldSize / 2, worldsize / 2, 0],
	worldSize,
	worldSize,
	0,
	[0,0,0,1],
	"#(rgb,1,1,1)color(0.5,0.5,0.5,1)"
];