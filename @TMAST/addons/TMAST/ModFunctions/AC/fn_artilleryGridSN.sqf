_artilleryGrid = _this select 0;
_display = ctrlparent _artilleryGrid;
_map = _display displayctrl 500;

_laggingInformation = player getVariable ["TMAST_GPSSscintillationData", [670,67];
_mousePos = _map ctrlMapScreenToWorld getMousePosition;
_laggingLocation = _mousePos getPos _laggingInformation;

_artilleryGrid ctrlsettext (mapgridposition _laggingLocation);