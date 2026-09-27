_map = _this select 0;
_target = _this select 1;
_display = ctrlparent _map;

_map ctrlSetPositionH 0;
_map ctrlCommit 0;

_ctrlHeading = _display displayctrl 1973198;
_ctrlHeading ctrlsettext str (floor direction _target);

_ctrlGrid = _display displayctrl 1973197;
_ctrlGrid ctrlsettext (mapgridposition _target);
		
_ctrlTime = _display displayctrl 1973199;
_ctrlTime ctrlsettext ([daytime,'HH:MM:SS'] call bis_fnc_timetostring);
	
_backgroundText = _display displayctrl 15111;
_backgroundText ctrlsettext "";