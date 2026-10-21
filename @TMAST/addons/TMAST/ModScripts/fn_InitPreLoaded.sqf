addMissionEventHandler ["Loaded", {
	[{
		systemChat "";
		private _display = uiNamespace getVariable ["RscCustomInfoMiniMap", displayNull];
		[_display] call TMAST_fnc_setGpsEH;
		private _displayAir = uiNamespace getVariable ["RscCustomInfoAirborneMiniMap", displayNull];
		[_displayAir] call TMAST_fnc_setGpsAirEH;
	}, 
	[], 1] call CBA_fnc_waitAndExecute;
}];