_map = _this select 0;
switch (true) do
{
	case (player getVariable ["TMAST_GPSjammed", false]): {[_map] call TMAST_fnc_blockedAc};
	case ((player getVariable "TMAST_GPSshadow") isEqualTo "Blocked"): {[_map] call TMAST_fnc_blockedAc};
	case ((player getVariable "TMAST_GPSscintillation") isEqualTo "Blocked"): {[_map] call TMAST_fnc_blockedAc};
	case ((player getVariable "TMAST_GPSshadow") isEqualTo "Multipathing"): {[_map] call TMAST_fnc_laggingAcSW};
	case ((player getVariable "TMAST_GPSscintillation") isEqualTo "Multipathing"): {[_map] call TMAST_fnc_laggingAcSN};
	case ((player getVariable "TMAST_GPShacked") isEqualTo "TargSpoofing"): {[_map] call TMAST_fnc_hackedAc};
	case ((player getVariable "TMAST_GPShacked") isEqualTo "LocSpoofing"): {[_map] call TMAST_fnc_shiftedAc};
	default {};
};