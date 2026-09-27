_uavFuel = _this select 0;
_connectedUav = _this select 1;
_holder = _this select 2; 

if (!isNull _connectedUav) then
{
	_shiftedInformation = _holder getVariable ["TMAST_GPSHackedData", objNull];
	_fuel = fuel _shiftedInformation;
	_mathfuel = linearConversion [0, 1, _fuel, 0, 100];
	_uavFuel ctrlsettext str _mathfuel;
};