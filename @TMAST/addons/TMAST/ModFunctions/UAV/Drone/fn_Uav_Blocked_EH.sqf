if (!isNil "TMAST_Uav_PerFraneHandle") then
{
	[TMAST_Uav_PerFraneHandle] call CBA_fnc_removePerFrameHandler;
};
	
getConnectedUAV player action ["UAVTerminalReleaseConnection", player];
player connectTerminalToUAV objNull;