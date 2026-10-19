if (!hasInterface) exitWith {};
waitUntil {!isNull player};

[vehicle player] call TMAST_fnc_setPlayerIcon;
[] call TMAST_fnc_setPlayerIconColour;

TMAST_PlayerViewEvent_Icon = addMissionEventHandler ["PlayerViewChanged", {
	_uav = _this select 5;
	if (_uav isEqualTo objNull)  then {  
		[vehicle player] call TMAST_fnc_setPlayerIcon;
	}  else {
		[_uav] call TMAST_fnc_setPlayerIcon;
	}; 
}];

TMAST_PlayerViewEvent_Uav = addMissionEventHandler ["PlayerViewChanged", {
	_uav = _this select 5;
	if (!(_uav isEqualTo objNull))  then {  
		[] call TMAST_fnc_setUavEH;
	}  else {
		[] call TMAST_fnc_resetUavEH;
	}; 
}];

TMAST_MapEvent = addMissionEventHandler ["Map", { 
		params ["_mapIsOpened", "_mapIsForced"]; 
		if (_mapIsOpened)  then {  
			TMAST_MapGPSEvent = addMissionEventHandler ["Draw2D", { 
				switch (true) do
				{
					case (player getVariable ["NGUW_GPSunderWater", false]): {[] call TMAST_fnc_blockedGpsPos_ACE};
					case (player getVariable ["TMAST_GPSjammed", false]): {[] call TMAST_fnc_blockedGpsPos_ACE};
					case ((player getVariable "TMAST_GPSshadow") isEqualTo "Blocked"): {[_map] call TMAST_fnc_blockedGpsPos_ACE};
					case ((player getVariable "TMAST_GPSscintillation") isEqualTo "Blocked"): {[_map] call TMAST_fnc_blockedGpsPos_ACE};
					case ((player getVariable "TMAST_GPSmultipath") isEqualTo "Multipathing"): {[_map] call TMAST_fnc_laggingGpsPos_ACESW};
					case ((player getVariable "TMAST_GPSscintillation") isEqualTo "Multipathing"): {[_map] call TMAST_fnc_laggingGpsPos_ACESN};
					case ((player getVariable "TMAST_GPShacked") isEqualTo "TargSpoofing"): {[_map] call TMAST_fnc_hackedGpsPos_ACE};
					case ((player getVariable "TMAST_GPShacked") isEqualTo "LocSpoofing"): {[_map] call TMAST_fnc_shiftedGpsPos_ACE};
					default {};
				};
			}]; 
		}  else {
		removeMissionEventHandler ["Draw2D", TMAST_MapGPSEvent];
		}; 
	}
];