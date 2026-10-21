if (!hasInterface) exitWith {};
private _display = _this select 0;
private _miniMapControlGroup = _display displayCtrl 13301;
private _miniMap = _miniMapControlGroup controlsGroupCtrl 101;
_positionH = ctrlPosition _miniMap;

if (!isNil "TMAST_DrawGpsEvent_Air") then
{
	_miniMap ctrlRemoveEventHandler ["Draw", TMAST_DrawGpsEvent_Air];
};

TMAST_DrawGpsEvent_Air =_miniMap ctrlAddEventHandler ["Draw", {[_this select 0] call TMAST_fnc_drawGPS}];