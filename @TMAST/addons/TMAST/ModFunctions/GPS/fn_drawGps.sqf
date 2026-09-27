private _map = _this select 0;
_uav = getConnectedUAV player;
if (!isRemoteControlling player) then
{
	_uav = nil;
};

switch (true) do
{
	case (player getVariable ["TMAST_GPSunderWater", false]): {[_map] call TMAST_fnc_blockedGpsPos};
	case (player getVariable ["TMAST_GPSjammed", false]): {[_map] call TMAST_fnc_blockedGpsPos};
	case (_uav getVariable ["TMAST_GPSjammed", false]): {[_map] call TMAST_fnc_blockedGpsPos};
	case ((player getVariable "TMAST_GPSshadow") isEqualTo "Blocked"): {[_map] call TMAST_fnc_blockedGpsPos};
	case ((_uav getVariable "TMAST_GPSshadow") isEqualTo "Blocked"): {[_map] call TMAST_fnc_blockedGpsPos};
	case ((player getVariable "TMAST_GPSscintillation") isEqualTo "Blocked"): {[_map] call TMAST_fnc_blockedGpsPos};
	case ((_uav getVariable "TMAST_GPSscintillation") isEqualTo "Blocked"): {[_map] call TMAST_fnc_blockedGpsPos};
	case (player getVariable ["TMAST_HideGPS", false]): {[_map] call TMAST_fnc_hideGpsScreen_Base};
	case ((player getVariable "TMAST_GPSshadow") isEqualTo "Multipathing"): {[_map] call TMAST_fnc_laggingGpsPos_BaseSW};
	case ((_uav getVariable "TMAST_GPSshadow") isEqualTo "Multipathing"): {[_map, _uav, _uav] call TMAST_fnc_laggingGpsSW};
	case ((player getVariable "TMAST_GPSscintillation") isEqualTo "Multipathing"): {[_map] call TMAST_fnc_laggingGpsPos_BaseSN};
	case ((_uav getVariable "TMAST_GPSscintillation") isEqualTo "Multipathing"): {[_map] call TMAST_fnc_laggingGpsSN};
	case ((player getVariable "TMAST_GPShacked") isEqualTo "TargSpoofing"): {[_map, player] call TMAST_fnc_hackedGpsPos};
	case ((_uav getVariable "TMAST_GPShacked") isEqualTo "TargSpoofing"): {[_map, _uav] call TMAST_fnc_hackedGpsPos};
	case ((player getVariable "TMAST_GPShacked") isEqualTo "LocSpoofing"): {[_map] call TMAST_fnc_shiftedGpsPos_Base};
	case ((_uav getVariable "TMAST_GPShacked") isEqualTo "LocSpoofing"): {[_map, _uav, _uav] call TMAST_fnc_shiftedGpsPos};
	default {[_map] call TMAST_fnc_normalGpsData_Base};
};