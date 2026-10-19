_artilleryDir = _this select 0;
_display = ctrlparent _artilleryDir;
_map = _display displayctrl 500;

_laggingInformation = player getVariable ["TMAST_GPSSscintillationData", [670,67];
_lag = _laggingInformation select 1;
_mousePos = _map ctrlMapScreenToWorld getMousePosition;
_pos = getPos player;
_azimuth = (_pos getDir _mousePos) - _lag;

_artilleryDir ctrlsettext str (floor _azimuth);