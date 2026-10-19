if (!hasInterface) exitWith {};
private _miniMap = _this select 0;

if (!isNil "TMAST_DrawAvEvent") then
{
	_miniMap ctrlRemoveEventHandler ["Draw", TMAST_DrawAvEvent];
};

TMAST_allUnitsUAV = [];
{
	if (side player == side (driver _x)) then
	{
		TMAST_allUnitsUAV pushBack _x;
	};
} forEach allUnitsUAV;

TMAST_DrawAvEvent = _miniMap ctrlAddEventHandler ["Draw", {[_this select 0] call TMAST_fnc_mapUav_draw}];

