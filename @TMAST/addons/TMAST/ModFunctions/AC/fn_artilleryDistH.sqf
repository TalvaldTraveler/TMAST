_artilleryDist = _this select 0;

_shiftedInformation = player getVariable ["TMAST_GPSHackedData", [0,0,0]];
_shiftedLocation = getPos _shiftedInformation;
_pos = getPos player;
_dist = _pos distance _shiftedLocation;

_artilleryDist ctrlsettext str (floor _dist);