private _map = _this select 0;

[_map] call TMAST_fnc_mapUav_Array_LagSW;
[_map] call TMAST_fnc_mapUav_Focus_LagSW;
[_map] call TMAST_fnc_mapUav_Text_LagSW;
[false] call TMAST_fnc_setActivity_Uav;