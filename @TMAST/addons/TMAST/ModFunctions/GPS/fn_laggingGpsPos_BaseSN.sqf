_map = _this select 0;

if (!isRemoteControlling player) then
{
	[_map, vehicle player, player] call TMAST_fnc_laggingGpsPosSN;
}
else
{
	_uav = remoteControlled player;
	[_map, _uav, player] call TMAST_fnc_laggingGpsPosSN;
};