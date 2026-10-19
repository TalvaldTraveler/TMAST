_uavSpeed = _this select 0;
_connectedUav = _this select 1;
_holder = _this select 2;

if (!isNull _connectedUav) then
{
	_shiftedInformation = _holder getVariable ["TMAST_GPSHackedData", _holder];
	_speed = floor ((speed _shiftedInformation));
	_uavSpeed ctrlsettext str _speed;
};