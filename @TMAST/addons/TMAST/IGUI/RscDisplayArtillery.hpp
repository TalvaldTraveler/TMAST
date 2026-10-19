class RscStandardDisplay;

class RscDisplayArtillery: RscStandardDisplay
{
	idd=1128
	scriptName="RscDisplayArtillery";
	scriptPath="TMASTdisplay";
	onLoad="[""onLoad"",_this,""RscDisplayArtillery"",'TMASTdisplay'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
	onUnload="[""onUnload"",_this,""RscDisplayArtillery"",'TMASTdisplay'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
	class controlsBackground
	{
		class CA_TSMap: RscMapControl
		{
		};
	};
};
