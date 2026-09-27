_map = _this select 0;
_target = _this select 1;
_holder = _this select 2;
_display = ctrlparent _map;
_dir = (floor direction _target);
		
_ctrlTime = _display displayctrl 1973199;
_ctrlTime ctrlsettext ([daytime,'HH:MM:SS'] call bis_fnc_timetostring);
		
_ctrlHeading = _display displayctrl 1973198;
_ctrlHeading ctrlsettext str _dir;

_shiftedInformation = _holder getVariable ["TMAST_GPSSpoofedData", [313,67]];

_shiftedLocation = _target getPos _shiftedInformation;

_ctrlGrid = _display displayctrl 1973197;
_ctrlGrid ctrlsettext (mapgridposition _shiftedLocation);
		
_scale = ctrlMapScale _map;
_map ctrlMapAnimAdd [0, _scale, _shiftedLocation];
ctrlMapAnimCommit _map;

_map drawIcon [
	"\A3\ui_f\data\igui\cfg\islandmap\iconplayer_ca.paa",
	[1,0,0,1],
	_shiftedLocation,
	25,
	25,
	_dir,
	"",
	1,
	0.03,
	"TahomaB",
	"right"
];
			
_map drawIcon [
	TMAST_PlayerIcon,
	TMAST_PlayerColour,
	_shiftedLocation,
	22,
	22,
	_dir,
	"",
	1,
	0.03,
	"TahomaB",
	"right"
];
	
_backgroundText = _display displayctrl 15111;
_backgroundText ctrlsettext "";

_map ctrlSetPositionH TMAST_PositionH;
_map ctrlCommit 0;