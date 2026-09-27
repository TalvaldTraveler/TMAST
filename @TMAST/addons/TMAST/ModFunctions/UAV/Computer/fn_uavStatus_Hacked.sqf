_uavStatus = _this select 0;
_connectedUav = _this select 1;
_holder = _this select 2; 

if (!isNull _connectedUav) then
{
	_shiftedInformation = _holder getVariable ["TMAST_GPSHackedData", _holder];
	if (alive _shiftedInformation) then
	{
		_uavStatus ctrlsettext "Active";
	}
	else
	{
		_uavStatus ctrlsettext "Unactive";
	};
};