params ["_spoofer", "_mrkName", "_spoofedData"];

[
	{
		_spoofArg = (_this select 0 select 0);
		_mrkName = (_this select 0 select 1);
		_spoofDataArg = (_this select 0 select 2);
		_uav = getConnectedUAV player;
		switch (true) do
		{
			case (!(alive _spoofArg)): { [_handle] call CBA_fnc_removePerFrameHandler;};
			case (markerShape _mrkName == ""): { [_handle] call CBA_fnc_removePerFrameHandler;};
			case (player inArea _mrkName): {[_mrkName, _spoofDataArg] call TMAST_fnc_setSpoofed;};
			case (_uav inArea _mrkName): {[_mrkName, _uav, _spoofDataArg] call TMAST_fnc_setSpoofed_Drone;};
			default {};
		};
	}, 
	3,
	[_spoofer, _mrkName, _spoofedData]
] call CBA_fnc_addPerFrameHandler;