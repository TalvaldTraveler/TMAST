if (!isNil "TMAST_Uav_PerFraneHandle") then
{
	[TMAST_Uav_PerFraneHandle] call CBA_fnc_removePerFrameHandler;
};

[false] call TMAST_fnc_setActivity_Uav;

TMAST_UavConnected = getConnectedUAV player;

switch (true) do
{
	case (TMAST_UavConnected isKindOf "LandVehicle"): {
		TMAST_UavContollsEH = addMissionEventHandler ["EachFrame", {
			[] call TMAST_fnc_perFrameUav_Spoofed_check;
		}];
	};
	case (TMAST_UavConnected isKindOf "Helicopter"): {
		TMAST_UavContollsEH = addMissionEventHandler ["EachFrame", {
			[] call TMAST_fnc_perFrameUav_Spoofed_check;
		}];
	};
	case (TMAST_UavConnected isKindOf "Plane"): {
		TMAST_UavContollsEH = addMissionEventHandler ["EachFrame", {
			[] call TMAST_fnc_perFrameUav_Spoofed_check;
		}];
	};
	case (TMAST_UavConnected isKindOf "SDV_01_base_F"): {
		TMAST_UavContollsEH = addMissionEventHandler ["EachFrame", {
			[] call TMAST_fnc_perFrameUav_Spoofed_check;
		}];
	};
	case (TMAST_UavConnected isKindOf "Ship_F"): {
		TMAST_UavContollsEH = addMissionEventHandler ["EachFrame", {
			[] call TMAST_fnc_perFrameUav_Spoofed_check;
		}];
	};
	default {};
};

