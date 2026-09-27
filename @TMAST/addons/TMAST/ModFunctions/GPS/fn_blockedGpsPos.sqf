_map = _this select 0;
_display = ctrlparent _map;

_map ctrlSetPositionH 0;
_map ctrlCommit 0;

private _ctrlGrid = _display displayctrl 1973197;
_ctrlGrid ctrlsettext "Null";
	
private _ctrlTime = _display displayctrl 1973199;
_ctrlTime ctrlsettext "Null";
	
private _ctrlHeading = _display displayctrl 1973198;
_ctrlHeading ctrlsettext "Null";
	
_backgroundText = _display displayctrl 15111;
_backgroundText ctrlsettext "No Connection";