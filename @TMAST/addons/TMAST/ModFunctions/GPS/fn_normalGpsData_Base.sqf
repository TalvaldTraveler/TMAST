_map = _this select 0;

if (!isRemoteControlling player) then
{
	[_map, vehicle player] call TMAST_fnc_normalGpsData;
}
else
{
	_uav = getConnectedUAV player;
	[_map, _uav] call TMAST_fnc_normalGpsData;
};