_artilleryDir = _this select 0;

_shiftedInformation = player getVariable ["TMAST_GPSHackedData", [0,0,0]];
_shiftedLocation = getPos _shiftedInformation;
_pos = getPos player;
_azimuth = (_pos getDir _shiftedLocation);

_artilleryDir ctrlsettext str (floor _azimuth);