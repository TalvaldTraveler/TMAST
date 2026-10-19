private _map = _this select 0;
private _display = ctrlparent _map;

_artilleryGrid = _display displayctrl 504;
[_artilleryGrid] call TMAST_fnc_artilleryGridSN;

_artilleryDir = _display displayctrl 508;
[_artilleryDir] call TMAST_fnc_artilleryDirSN;