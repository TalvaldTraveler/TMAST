_uavHeading = _this select 0;
_connectedUav = _this select 1;

if (!isNull _connectedUav) then
{
	_dir = (floor direction _connectedUav)-10;
	_uavHeading ctrlsettext str _dir;
};