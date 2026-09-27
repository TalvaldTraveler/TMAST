#include "BIS_AddonInfo.hpp"
class CfgPatches {
	class TMAST {
		name = "Traveler's Missionmakers Addon Signal Tool";
		author = "Talvald the Traveler";
		requiredVersion = 2.00;
		requiredAddons[] = {
			"A3_Data_F",
			"A3_Functions_F",
			"A3_UiFonts_F",
			"A3_Ui_F",
			"cba_main",
			"cba_xeh"};
		version = 1;
	};
};	

#include "IGUI\RscCustomInfoSpoofedMap.hpp"
#include "IGUI\RscDisplayArtillery.hpp"
#include "IGUI\RscDisplayAVTerminal.hpp"

class CfgFunctions
{
	class TMAST
	{
		class ModScripts
		{
			file = "TMAST\ModScripts";
			class InitTMAST_GPS
			{
				postInit = 1;
			};
		};
		class ModFunctions
		{
			file = "TMAST\ModFunctions";
			class clearGpsEH;
			class setGpsEH;
			class setAvEH;
			class setAcEH;
			class setPlayerIcon;
			class setPlayerIconColour;
			class signalPathingTimerEH;
			class signalShadowTimerEH;
			class signalScintillationTimerEH;
			class clr_signalPathingTimerEH;
			class clr_signalShadowTimerEH;
			class clr_signalScintillationTimerEH;
		};
		class ModFunctions_GPS
		{
			file = "TMAST\ModFunctions\GPS";
			class blockedGpsPos;
			class blockedGpsPos_ACE;
			class drawGPS;
			class hackedGpsPos;
			class hackedGpsPos_ACE;
			class laggingGpsPosSW;
			class laggingGpsPos_ACESW;
			class laggingGpsPos_BaseSW;
			class laggingGpsPosSN;
			class laggingGpsPos_ACESN;
			class laggingGpsPos_BaseSN;
			class normalGpsData;
			class normalGpsData_Base;
			class shiftedGpsPos;
			class shiftedGpsPos_ACE;
			class shiftedGpsPos_Base;
			class hideGpsScreen;
			class hideGpsScreen_Base;
		};
		class ModFunctions_ArtilleryComputer
		{
			file = "TMAST\ModFunctions\AC";
			class artilleryDirH;
			class artilleryDirSW;
			class artilleryDirSN;
			class artilleryDistH;
			class artilleryGridH;
			class artilleryGridS;
			class artilleryGridSW;
			class artilleryGridSN;
			class blockedAc;
			class drawAc;
			class hackedAc;
			class laggingAcSW;
			class laggingAcSN;
			class shiftedAc;
		};
		class ModFunctions_UavComputer
		{
			file = "TMAST\ModFunctions\UAV\Computer";
			class mapUav_draw;
			class uavPosition;
			class uavSpeed;
			class uavHeading;
			class uavPosition_Hacked;
			class uavSpeed_Hacked;
			class uavHeading_Hacked;
			class uavAlt_Hacked;
			class uavStatus_Hacked;
			class uavFuel_Hacked;
			class uavWaypoint;
			class setActivity_Uav;
		};
		class ModFunctions_UavComputer_Player
		{
			file = "TMAST\ModFunctions\UAV\Computer\Player";
			class mapUav_Base_Blocked;
			class mapUav_Base_LagSW;
			class mapUav_Base_LagSN;
			class mapUav_Base_Hacked;
			class mapUav_Base_Spoofed;
			class mapUav_Draw_LagSW;
			class mapUav_Draw_LagSN;
			class mapUav_Draw_Spoofed;
			class mapUav_Feed_Blocked;
			class mapUav_Focus_LagSW;
			class mapUav_Focus_LagSN;
			class mapUav_Focus_Hacked;
			class mapUav_Focus_Spoofed;
			class mapUav_Text_Blocked;
			class mapUav_Text_LagSW;
			class mapUav_Text_LagSN;
			class mapUav_Text_Hacked;
			class mapUav_Text_Spoofed;
			class mapUav_Array_LagSW;
			class mapUav_Array_LagSN;
			class mapUav_Array_Spoofed;
			class mapUav_Waypoint_Hacked;
			
		};
		class ModFunctions_UavComputer_Drone
		{
			file = "TMAST\ModFunctions\UAV\Computer\Drone";
			class mapDrone_Base_Blocked;
			class mapDrone_Base_LagSW;
			class mapDrone_Base_LagSN;
			class mapDrone_Base_Hacked;
			class mapDrone_Base_Spoofed;
			class mapDrone_Focus_LagSW;
			class mapDrone_Focus_LagSN;
			class mapDrone_Focus_Hacked;
			class mapDrone_Focus_Spoofed;
			class mapDrone_Text_LagSW;
			class mapDrone_Text_LagSN;
			class mapDrone_Text_Hacked;
			class mapDrone_Text_Spoofed;
		};
		class ModFunctions_UavDrone
		{
			file = "TMAST\ModFunctions\UAV\Drone";
			class setUavEH;
			class resetUavEH;
			class perFrameUav;
			class perFrameUav_Lag_Check;
			class Uav_Restart;
			class Uav_Blocked_EH;
			class Uav_Lag_EH;
			class Uav_Spoofed_EH;
			class Drone_Blocked_EH;
			class perFrameUav_Spoofed_Check;
		};
		class ModFunctions_Drone
		{
			file = "TMAST\ModFunctions\Drone";
			class maintenance_UAV_Status_EH;
			class maintenance_UAV_Status;
			class maintenance_Drone_Jammed;
			class maintenance_Drone_Unjammed;
			class maintenance_Drone_Multipathing;
			class maintenance_Drone_Unmultipathing;
			class setJammedUAV_AI;
			class setSkillUAV_AI;
			class setLaggedUAV_EH;
		};
	};
	class NGUW
	{
		class NGUW
		{
			file = "TMAST\NGUW";
			class blockingSignals;
			class unblockingSignals;
		};
	};
};


class CfgScriptPaths
{
	TMASTdisplay = "TMAST\IGUI\";
};

class Extended_DisplayLoad_EventHandlers {
    class RscCustomInfoMiniMap {
       TMAST_GpsEH_Load = "_this call TMAST_fnc_setGpsEH";
    };
	class RscDisplayArtillery
	{
		TMAST_AcEH_Load = "_this call TMAST_fnc_setAcEH";
	};
	class RscMapAVTerminal
	{
		TMAST_AvEH_Load = "_this call TMAST_fnc_setAvEH";
	};
};
class CBA_Extended_EventHandlers_base;