private _map = _this select 0;
private _uav = getConnectedUAV player;

switch (true) do
{
	case (player getVariable ["TMAST_GPSunderWater", false]): {[_map] call TMAST_fnc_mapUav_Base_Blocked};
	case (player getVariable ["TMAST_GPSjammed", false]): {[_map] call TMAST_fnc_mapUav_Base_Blocked};
	case (_uav getVariable ["TMAST_GPSjammed", false]): {[_map] call TMAST_fnc_mapDrone_Base_Blocked};
	case ((player getVariable "TMAST_GPSshadow") isEqualTo "Blocked"): {[_map] call TMAST_fnc_mapUav_Base_Blocked};
	case ((_uav getVariable "TMAST_GPSshadow") isEqualTo "Blocked"): {[_map] call TMAST_fnc_mapDrone_Base_Blocked};
	case ((player getVariable "TMAST_GPSscintillation") isEqualTo "Blocked"): {[_map] call TMAST_fnc_mapUav_Base_Blocked};
	case ((_uav getVariable "TMAST_GPSscintillation") isEqualTo "Blocked"): {[_map] call TMAST_fnc_mapDrone_Base_Blocked};
	case ((player getVariable "TMAST_GPSshadow") isEqualTo "Multipathing"): {[_map] call TMAST_fnc_mapUav_Base_LagSW};
	case ((_uav getVariable "TMAST_GPSshadow") isEqualTo "Multipathing"): {[_map] call TMAST_fnc_mapDrone_Base_LagSW};
	case ((player getVariable "TMAST_GPSscintillation") isEqualTo "Multipathing"): {[_map] call TMAST_fnc_mapUav_Base_LagSN};
	case ((_uav getVariable "TMAST_GPSscintillation") isEqualTo "Multipathing"): {[_map] call TMAST_fnc_mapDrone_Base_LagSN};
	case ((player getVariable "TMAST_GPShacked") isEqualTo "TargSpoofing"): {[_map] call TMAST_fnc_mapUav_Base_Hacked};
	case ((_uav getVariable "TMAST_GPShacked") isEqualTo "TargSpoofing"): {[_map] call TMAST_fnc_mapDrone_Base_Hacked};
	case ((player getVariable "TMAST_GPShacked") isEqualTo "LocSpoofing"): {[_map] call TMAST_fnc_mapUav_Base_Spoofed};
	case ((_uav getVariable "TMAST_GPShacked") isEqualTo "LocSpoofing"): {[_map] call TMAST_fnc_mapDrone_Base_Spoofed};
	case (!(isNull _uav)): {[false] call TMAST_fnc_setActivity_Uav;};
	default {};
};