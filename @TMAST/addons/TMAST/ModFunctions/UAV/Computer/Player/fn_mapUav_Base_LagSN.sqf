private _map = _this select 0;

[_map] call TMAST_fnc_mapUav_Array_LagSN;
[_map] call TMAST_fnc_mapUav_Focus_LagSN;
[_map] call TMAST_fnc_mapUav_Text_LagSN;
[false] call TMAST_fnc_setActivity_Uav;