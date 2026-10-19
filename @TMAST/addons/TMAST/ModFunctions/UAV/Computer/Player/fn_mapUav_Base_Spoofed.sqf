private _map = _this select 0;

[_map] call TMAST_fnc_mapUav_Array_Spoofed;
[_map] call TMAST_fnc_mapUav_Focus_Spoofed;
[_map] call TMAST_fnc_mapUav_Text_Spoofed;
[false] call TMAST_fnc_setActivity_Uav;