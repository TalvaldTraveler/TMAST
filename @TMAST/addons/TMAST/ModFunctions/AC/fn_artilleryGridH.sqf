_artilleryGrid = _this select 0;

_shiftedInformation = player getVariable ["TMAST_GPSHackedData", [0,0,0]];
_shiftedLocation = getPos _shiftedInformation;

_artilleryGrid ctrlsettext (mapgridposition _shiftedLocation);