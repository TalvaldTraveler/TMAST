private _uav = _this select 0;
switch (true) do
{
	case (_uav getVariable ["TMAST_GPSjammed", false]): {[_uav, "TMAST_UAV_JammedSet"] call TMAST_fnc_maintenance_Drone_Jammed};
	case (_uav getVariable ["TMAST_UAV_JammedSet", false]): {[_uav, "TMAST_UAV_JammedSet"] call TMAST_fnc_maintenance_Drone_Unjammed};
	case ((_uav getVariable "TMAST_GPSshadow") isEqualTo "Blocked"): {[_uav, "TMAST_UAV_ShadowSet_Blocked"] call TMAST_fnc_maintenance_Drone_Jammed};
	case (_uav getVariable ["TMAST_UAV_ShadowSet", false]): {[_uav, "TMAST_UAV_ShadowSet_Blocked"] call TMAST_fnc_maintenance_Drone_Unjammed};
	case ((_uav getVariable "TMAST_GPSscintillation") isEqualTo "Blocked"): {[_uav, "TMAST_UAV_SscintillationSet_Blocked"] call TMAST_fnc_maintenance_Drone_Jammed};
	case (_uav getVariable ["TMAST_UAV_SscintillationSet", false]): {[_uav, "TMAST_UAV_SscintillationSet_Blocked"] call TMAST_fnc_maintenance_Drone_Unjammed};
	case ((_uav getVariable "TMAST_GPShacked") isEqualTo "LocSpoofing"): {[_uav, "TMAST_UAV_ShadowSet_Lag"] call TMAST_fnc_maintenance_Drone_Multipathing};
	case (_uav getVariable ["TMAST_UAV_ShadowSet_Lag", false]): {[_uav, "TMAST_UAV_ShadowSet_Lag"] call TMAST_fnc_maintenance_Drone_Unmultipathing};
	default {};
};