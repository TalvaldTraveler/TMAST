params ["_jammer", "_mrkName"];

[
	{
		_jammerArg = (_this select 0 select 0);
		_mrkName = (_this select 0 select 1);
		_uav = getConnectedUAV player;
		switch (true) do
		{
			case (!(alive _jammerArg)): { [_handle] call CBA_fnc_removePerFrameHandler;};
			case (markerShape _mrkName == ""): { [_handle] call CBA_fnc_removePerFrameHandler;};
			case (player inArea _mrkName): {[_mrkName] call TMAST_fnc_setJammed;};
			case (_uav inArea _mrkName): {[_mrkName, _uav] call TMAST_fnc_setJammed_Drone;};
			default {};
		};
	}, 
	3,
	[_jammer, _mrkName]
] call CBA_fnc_addPerFrameHandler;