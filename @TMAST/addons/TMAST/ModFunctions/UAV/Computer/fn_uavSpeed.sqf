_uavSpeed = _this select 0;
_connectedUav = _this select 1;

if (!isNull _connectedUav) then
{
	_speed = floor ((speed _connectedUav)-10);
	_uavSpeed ctrlsettext str _speed;
};