class RscControlsGroupNoScrollbars;
class RscIGUIText;


class RscMapControl
{
};

class RscCustomInfoMiniMap
{
	class controlsBackground
	{
		class BackgroundText
		{
			IDC=15111;
			type=13;
			style="0x0C + 0xC0";
			x="0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			y="0.5 * 		(profilenamespace getvariable [""IGUI_GRID_CUSTOMINFORIGHT_H"",		(10 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25))])";
			w="(profilenamespace getvariable [""IGUI_GRID_CUSTOMINFORIGHT_W"",		(10 * 			(			((safezoneW / safezoneH) min 1.2) / 40))])";
			h="1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			text="";
			colorBackground[]={0,0,0,0};
			size="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			class Attributes
			{
				font="RobotoCondensed";
				color="#555555";
				align="center";
				valign="middle";
				shadow=0;
				size=1;
			};
		};
	};
	class controls
	{
		class MiniMap: RscControlsGroupNoScrollbars
		{
			class Controls
			{
				class CA_MiniMap: RscMapControl
				{
					scriptName="RscMapAVTerminal";
					scriptPath="TMASTdisplay";
					onLoad="[""onLoad"",_this,""RscMapAVTerminal"",'TMASTdisplay'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
					onUnload="[""onUnload"",_this,""RscMapAVTerminal"",'TMASTdisplay'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
				};
			};
		};
		class Title: RscIGUIText
		{
		};
		class Time: RscIGUIText
		{
			style=2;
			idc=1973199;
			text="Null";
		};
		class Heading: Time
		{
			style=2;
			idc=1973198;
			text="Null";
		};
		class Grid: Time
		{
			style=1;
			idc=1973197;
			text="Null";
		};
	};
};