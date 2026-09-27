_uavPosition = _this select 0;
_connectedUav = _this select 1;
_holder = _this select 2; 

if (!isNull _connectedUav) then
{
	_shiftedInformation = _holder getVariable ["TMAST_GPSHackedData", [0,0,0]];
	_shiftedLocation = getPos _shiftedInformation;
	_uavPosition ctrlsettext (mapgridposition _shiftedLocation);
};