class RscDisplayAVTerminal
{
	class controlsBackground
	{
		class CA_Map: RscMapControl
		{
		scriptName="RscMapAVTerminal";
		scriptPath="TMASTdisplay";
		onLoad="[""onLoad"",_this,""RscMapAVTerminal"",'TMASTdisplay'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
		onUnload="[""onUnload"",_this,""RscMapAVTerminal"",'TMASTdisplay'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
		};
	};
};
