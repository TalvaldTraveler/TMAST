if (!hasInterface) exitWith {};
private _display = _this select 0;
private _miniMap = _display displayCtrl 500;

if (!isNil "TMAST_DrawAcEvent") then
{
	_miniMap ctrlRemoveEventHandler ["Draw", TMAST_DrawAcEvent];
};

TMAST_DrawAcEvent = _miniMap ctrlAddEventHandler ["Draw", {[_this select 0] call TMAST_fnc_drawAc}];