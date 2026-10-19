if (count allUnitsUAV == 0) exitWith {
};

{
	[_x] call TMAST_fnc_maintenance_UAV_Status; 
} forEach allUnitsUAV;