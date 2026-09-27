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
	case ((player getVariable "TMAST_GPSshadow") isEqualTo "Multipathing"): {};
	case ((_uav getVariable "TMAST_GPSshadow") isEqualTo "Multipathing"): {};
	case ((player getVariable "TMAST_GPSscintillation") isEqualTo "Multipathing"): {};
	case ((_uav getVariable "TMAST_GPSscintillation") isEqualTo "Multipathing"): {};
	default {[] call TMAST_fnc_Uav_Restart};
};