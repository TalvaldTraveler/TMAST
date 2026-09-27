_uav = getConnectedUAV player;

switch (true) do
{
	case (player getVariable ["TMAST_GPSunderWater", false]): {[] call TMAST_fnc_Uav_Restart};
	case (player getVariable ["TMAST_GPSjammed", false]): {[] call TMAST_fnc_Uav_Restart};
	case (_uav getVariable ["TMAST_GPSjammed", false]): {[] call TMAST_fnc_Uav_Restart};
	case ((player getVariable "TMAST_GPSshadow") isEqualTo "Blocked"): {[] call TMAST_fnc_Uav_Restart};
	case ((_uav getVariable "TMAST_GPSshadow") isEqualTo "Blocked"): {[] call TMAST_fnc_Uav_Restart};
	case ((player getVariable "TMAST_GPSscintillation") isEqualTo "Blocked"): {[] call TMAST_fnc_Uav_Restart};
	case ((_uav getVariable "TMAST_GPSscintillation") isEqualTo "Blocked"): {[] call TMAST_fnc_Uav_Restart};
	case ((player getVariable "TMAST_GPSshadow") isEqualTo "Multipathing"): {[] call TMAST_fnc_Uav_Restart};
	case ((_uav getVariable "TMAST_GPSshadow") isEqualTo "Multipathing"): {[] call TMAST_fnc_Uav_Restart};
	case ((player getVariable "TMAST_GPSscintillation") isEqualTo "Multipathing"): {[] call TMAST_fnc_Uav_Restart};
	case ((_uav getVariable "TMAST_GPSscintillation") isEqualTo "Multipathing"): {[] call TMAST_fnc_Uav_Restart};
	case ((player getVariable "TMAST_GPShacked") isEqualTo "TargSpoofing"): {};
	case ((_uav getVariable "TMAST_GPShacked") isEqualTo "TargSpoofing"): {};
	case ((player getVariable "TMAST_GPShacked") isEqualTo "LocSpoofing"): {};
	case ((_uav getVariable "TMAST_GPShacked") isEqualTo "LocSpoofing"): {};
	default {[] call TMAST_fnc_Uav_Restart};
};