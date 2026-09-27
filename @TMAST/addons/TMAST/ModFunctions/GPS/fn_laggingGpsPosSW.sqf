_map = _this select 0;
_target = _this select 1;
_holder = _this select 2;
_display = ctrlparent _map;
		
_ctrlTime = _display displayctrl 1973199;
_time = daytime-0.08;
_ctrlTime ctrlsettext ([_time,'HH:MM:SS'] call bis_fnc_timetostring);

_laggingInformation = _holder getVariable ["TMAST_GPSShadowData", [1337,69]];

_laggingLocation = _target getPos _laggingInformation;
_dir = (floor direction _target)-10;

_display = ctrlparent _map;
_ctrlGrid = _display displayctrl 1973197;
_ctrlGrid ctrlsettext (mapgridposition _laggingLocation);
		
_ctrlHeading = _display displayctrl 1973198;
_ctrlHeading ctrlsettext str _dir;
		
_scale = ctrlMapScale _map;
_map ctrlMapAnimAdd [0, _scale, _laggingLocation];
ctrlMapAnimCommit _map;


_map drawIcon [
	"\A3\ui_f\data\igui\cfg\islandmap\iconplayer_ca.paa",
	[1,0,0,1],
	_laggingLocation,
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
	_laggingLocation,
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