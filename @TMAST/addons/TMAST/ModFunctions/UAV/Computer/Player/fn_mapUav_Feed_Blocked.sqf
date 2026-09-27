_map = _this select 0;
_uav = getConnectedUAV player;

_map drawRectangle [
	[worldSize / 2, worldsize / 2, 0],
	worldSize,
	worldSize,
	0,
	[0,0,0,1],
	"#(rgb,1,1,1)color(0.5,0.5,0.5,1)"
];

if (isNull _uav) exitWith {};
player connectTerminalToUAV objNull; 