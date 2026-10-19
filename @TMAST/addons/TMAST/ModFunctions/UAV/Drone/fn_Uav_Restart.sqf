if (!isNil "TMAST_UavContollsEH") then
{
	removeMissionEventHandler ["EachFrame", TMAST_UavContollsEH];
};
[] call TMAST_fnc_setUavEH;