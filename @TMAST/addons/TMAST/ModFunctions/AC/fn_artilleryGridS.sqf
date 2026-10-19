_artilleryGrid = _this select 0;
_display = ctrlparent _artilleryGrid;
_map = _display displayctrl 500;

_shiftedInformation = player getVariable ["TMAST_GPSSpoofedData", [313,67];
_mousePos = _map ctrlMapScreenToWorld getMousePosition;
_shiftedLocation = _mousePos getPos _shiftedInformation;

_artilleryGrid ctrlsettext (mapgridposition _shiftedLocation);