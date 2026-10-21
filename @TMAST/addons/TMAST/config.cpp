#include "BIS_AddonInfo.hpp"
class CfgPatches {
	class TMAST {
		name = "Traveler's Missionmakers Addon Signal Tool";
		author = "Talvald the Traveler";
		units[] = { 
			"TMAST_Module_SetUpJammer",
			"TMAST_Module_SetUpSpoofer",
			"TMAST_Module_SetUpHacker",  
			"TMAST_Module_SetUpSignalShadow",  
			"TMAST_Module_SetUpScintillation",
			"TMAST_Module_SetUpNGUW"
		};
		requiredVersion = 2.00;
		requiredAddons[] = {
			"A3_Data_F",
			"A3_Functions_F",
			"A3_UiFonts_F",
			"A3_Ui_F",
			"A3_Modules_F",
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
			class InitPreLoaded
			{
				preInit = 1;
			};
		};
		class ModFunctions
		{
			file = "TMAST\ModFunctions";
			class clearGpsEH;
			class setGpsEH;
			class setGpsAirEH;
			class setAvEH;
			class setAcEH;
			class setPlayerIcon;
			class setPlayerIconColour;
		};
		class ModFunctions_Special
		{
			file = "TMAST\ModFunctions\Special";
			class setUpScintillation;
			class setUpJammer;
			class setUpJammer_startAction;
			class setUpJammer_stopAction;
			class setUpJammer_jamming;
			class setJammed;
			class setJammed_Drone;
			class setUpSpoofer;
			class setUpSpoofer_startAction;
			class setUpSpoofer_stopAction;
			class setUpSpoofer_spoofing;
			class setSpoofed;
			class setSpoofed_Drone;
			class setUpHacker;
			class setUpHacker_startAction;
			class setUpHacker_stopAction;
			class setUpHacker_hacking;
			class setHacked;
			class setHacked_Drone;
			class setUpSignalShadow;
			class setUpSignalShadow_Shifting;
			class setUpSignalShadow_ShadowStrong;
			class setUpSignalShadow_MultipathingStrong;
			class setSignalShadow;
			class setSignalShadow_Drone;
			class setSignalShadow_Strong;
			class setSignalShadow_Strong_Drone;
			class setSignalShadow_Pathing;
			class setSignalShadow_Pathing_Drone;
			class moveZone;
			
		};
		class ModFunctions_Module
		{
			file = "TMAST\ModFunctions\Module";
			class setUpJammer_Module;
			class setUpHacker_Module;
			class setUpSpoofer_Module;
			class setUpShadow_Module;
			class setUpScintillation_Module;
			class setUpNGUW_Module;
			
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
    class RscCustomInfoAirborneMiniMap {
       TMAST_GpsAirEH_Load = "_this call TMAST_fnc_setGpsAirEH";
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

class CfgFactionClasses
{
    class TMAST_Modules
    {
        displayName = "TMAST";
    };
};


class CfgVehicles
{
    class Logic;
    class Module_F: Logic
    {
        class AttributesBase
        {
            class Default;
            class Title: Default {};
            class Combo;
            class Checkbox;
            class Edit;
        };

        class ModuleDescription
        {
            class AnyBrain;
        };
    };

    class TMAST_Module_SetUpJammer: Module_F
    {
        scope = 2;
        scopeCurator = 2;
        displayName = "Jammer Set Up";
        category = "TMAST_Modules";
        function = "TMAST_fnc_setUpJammer_Module";
        functionPriority = 1;
        isGlobal = 0;
        isTriggerActivated = 1;
        isDisposable = 1;
		
        icon = "\A3\Modules_F_Curator\Data\iconRadio_ca.paa";

        class Attributes: AttributesBase
        {
			class Side: Combo
			{
				property = "TMAST_Module_SetUpJammer_Side";
				displayName = "Target Side";
				tooltip = "Side or custom player list affected by the jammer.";
				typeName = "STRING";
				defaultValue = """ALLPLAYERS""";

				class Values
				{
					class AllPlayers
					{
						name = "All Players";
						value = "ALLPLAYERS";
					};
					class West
					{
						name = "BLUFOR";
						value = "WEST";
					};
					class East
					{
						name = "OPFOR";
						value = "EAST";
					};
					class Independent
					{
						name = "Independent";
						value = "GUER";
					};
					class Civilian
					{
						name = "Civilian";
						value = "CIV";
					};
					class Custom
					{
						name = "Custom";
						value = "CUSTOM";
					};
				};
			};

            class Size: Edit
            {
                property = "TMAST_Module_SetUpJammer_Size";
                displayName = "Jamming Radius";
                tooltip = "Jamming radius in metres.";
                typeName = "NUMBER";
                defaultValue = "2500";
            };

            class Active: Checkbox
            {
                property = "TMAST_Module_SetUpJammer_Active";
                displayName = "Active Jammer";
                tooltip = "Activate the jammer when it’s set up.";
                typeName = "BOOL";
                defaultValue = "true";
            };

            class Switch: Checkbox
            {
                property = "TMAST_Module_SetUpJammer_Switch";
                displayName = "Enable Start Action";
                tooltip = "Should the Jammer be able to be turned on?";
                typeName = "BOOL";
                defaultValue = "false";
            };

            class Moveable: Checkbox
            {
                property = "TMAST_Module_SetUpJammer_Moveable";
                displayName = "Enable Moveable Zone";
                tooltip = "Should the jamming zone follow the Jammer?";
                typeName = "BOOL";
                defaultValue = "false";
            };
			
            class CustomPlayers: Edit
            {
                property = "TMAST_Module_SetUpJammer_CustomPlayers";
                displayName = "Custom Players Array";
                tooltip = "When Target Side is Custom, enter an array of targeted player units, e.g. [unit1, unit2].";
                typeName = "STRING";
                defaultValue = """[]""";
            };

        };

        class ModuleDescription: ModuleDescription
        {
            description = "Configures a TMAST jammer. Synchronize this module to the object that acts as the jammer.";
            sync[] = {"Anything"};
        };
    };

    class TMAST_Module_SetUpHacker: Module_F
    {
        scope = 2;
        scopeCurator = 2;
        displayName = "Hacker Set Up";
        category = "TMAST_Modules";
        function = "TMAST_fnc_setUpHacker_Module";
        functionPriority = 1;
        isGlobal = 0;
        isTriggerActivated = 1;
        isDisposable = 1;
		
        icon = "\A3\Modules_F_Curator\Data\iconRadio_ca.paa";

        class Attributes: AttributesBase
        {
			class Side: Combo
			{
				property = "TMAST_Module_SetUpHacker_Side";
				displayName = "Target Side";
				tooltip = "Side or custom player list affected by the spoofer.";
				typeName = "STRING";
				defaultValue = """ALLPLAYERS""";

				class Values
				{
					class AllPlayers
					{
						name = "All Players";
						value = "ALLPLAYERS";
					};
					class West
					{
						name = "BLUFOR";
						value = "WEST";
					};
					class East
					{
						name = "OPFOR";
						value = "EAST";
					};
					class Independent
					{
						name = "Independent";
						value = "GUER";
					};
					class Civilian
					{
						name = "Civilian";
						value = "CIV";
					};
					class Custom
					{
						name = "Custom";
						value = "CUSTOM";
					};
				};
			};

            class Size: Edit
            {
                property = "TMAST_Module_SetUpHacker_Size";
                displayName = "Spoofing Radius";
                tooltip = "Spoofing radius in metres.";
                typeName = "NUMBER";
                defaultValue = "2500";
            };

            class Active: Checkbox
            {
                property = "TMAST_Module_SetUpHacker_Active";
                displayName = "Active Spoofer";
                tooltip = "Activate the spoofer when it’s set up.";
                typeName = "BOOL";
                defaultValue = "true";
            };

            class Switch: Checkbox
            {
                property = "TMAST_Module_SetUpHacker_Switch";
                displayName = "Enable Start Action";
                tooltip = "Should the Spoofer be able to be turned on?";
                typeName = "BOOL";
                defaultValue = "false";
            };
			
            class Target: Edit
            {
                property = "TMAST_Module_SetUpHacker_Target";
                displayName = "Custom Targeted Position";
                tooltip = "Set the object where the spoofed GPS should follow";
                typeName = "STRING";
                defaultValue = """_hacker""";
            };

            class Moveable: Checkbox
            {
                property = "TMAST_Module_SetUpHacker_Moveable";
                displayName = "Enable Moveable Zone";
                tooltip = "Should the spoofing zone follow the Spoofer?";
                typeName = "BOOL";
                defaultValue = "false";
            };
			
            class CustomPlayers: Edit
            {
                property = "TMAST_Module_SetUpHacker_CustomPlayers";
                displayName = "Custom Players Array";
                tooltip = "When Target Side is Custom, enter an array of targeted player units, e.g. [unit1, unit2].";
                typeName = "STRING";
                defaultValue = """[]""";
            };

        };

        class ModuleDescription: ModuleDescription
        {
            description = "Configures a TMAST spoofer. Synchronize this module to the object that acts as the spoofer.";
            sync[] = {"Anything"};
        };
    };

    class TMAST_Module_SetUpSpoofer: Module_F
    {
        scope = 2;
        scopeCurator = 2;
        displayName = "Spoofer Set Up";
        category = "TMAST_Modules";
        function = "TMAST_fnc_setUpSpoofer_Module";
        functionPriority = 1;
        isGlobal = 0;
        isTriggerActivated = 1;
        isDisposable = 1;
		
        icon = "\A3\Modules_F_Curator\Data\iconRadio_ca.paa";

        class Attributes: AttributesBase
        {
			class Side: Combo
			{
				property = "TMAST_Module_SetUpSpoofer_Side";
				displayName = "Target Side";
				tooltip = "Side or custom player list affected by the spoofer.";
				typeName = "STRING";
				defaultValue = """ALLPLAYERS""";

				class Values
				{
					class AllPlayers
					{
						name = "All Players";
						value = "ALLPLAYERS";
					};
					class West
					{
						name = "BLUFOR";
						value = "WEST";
					};
					class East
					{
						name = "OPFOR";
						value = "EAST";
					};
					class Independent
					{
						name = "Independent";
						value = "GUER";
					};
					class Civilian
					{
						name = "Civilian";
						value = "CIV";
					};
					class Custom
					{
						name = "Custom";
						value = "CUSTOM";
					};
				};
			};

            class Size: Edit
            {
                property = "TMAST_Module_SetUpSpoofer_Size";
                displayName = "Spoofing Radius";
                tooltip = "Spoofing radius in metres.";
                typeName = "NUMBER";
                defaultValue = "2500";
            };

            class Active: Checkbox
            {
                property = "TMAST_Module_SetUpSpoofer_Active";
                displayName = "Active Spoofer";
                tooltip = "Activate the spoofer when it’s set up.";
                typeName = "BOOL";
                defaultValue = "true";
            };

            class Switch: Checkbox
            {
                property = "TMAST_Module_SetUpSpoofer_Switch";
                displayName = "Enable Start Action";
                tooltip = "Should the Spoofer be able to be turned on?";
                typeName = "BOOL";
                defaultValue = "false";
            };
			
            class Distance: Edit
            {
                property = "TMAST_Module_SetUpSpoofer_Distance";
                displayName = "Spoofed Shift";
                tooltip = "Spoofed shifting in metres.";
                typeName = "NUMBER";
                defaultValue = "313";
            };

            class Angle: Edit
            {
                property = "TMAST_Module_SetUpSpoofer_Angle";
                displayName = "Spoofed Angle";
                tooltip = "Spoofed shifting angles.";
                typeName = "NUMBER";
                defaultValue = "67";
            };

            class Moveable: Checkbox
            {
                property = "TMAST_Module_SetUpHSpoofer_Moveable";
                typeName = "BOOL";
                defaultValue = "false";
                displayName = "Enable Moveable Zone";
                tooltip = "Should the spoofing zone follow the Spoofer?";
            };
			
            class CustomPlayers: Edit
            {
                property = "TMAST_Module_SetUpSpoofer_CustomPlayers";
                displayName = "Custom Players Array";
                tooltip = "When Target Side is Custom, enter an array of targeted player units, e.g. [unit1, unit2].";
                typeName = "STRING";
                defaultValue = """[]""";
            };

        };

        class ModuleDescription: ModuleDescription
        {
            description = "Configures a TMAST spoofer. Synchronize this module to the object that acts as the spoofer.";
            sync[] = {"Anything"};
        };
    };
	
	class TMAST_Module_SetUpSignalShadow: Module_F
    {
        scope = 2;
        scopeCurator = 2;
        displayName = "Set Shadow Zone";
        category = "TMAST_Modules";
        function = "TMAST_fnc_setUpShadow_Module";
        functionPriority = 1;
        isGlobal = 0;
        isTriggerActivated = 1;
        isDisposable = 1;
		
        icon = "\A3\Modules_F_Curator\Data\iconRadio_ca.paa";

        class Attributes: AttributesBase
        {
			class MarkerName: Edit
			{
				property = "TMAST_Module_SetUpSignalShadow_MarkerName";
				displayName = "Marker Name";
				tooltip = "Variable name for marker indicating area.";
				typeName = "STRING";
                defaultValue = """SignalShadow_Mrk_1""";
			};
			
            class ShadowActive: Checkbox
            {
                property = "TMAST_Module_SetUpSignalShadow_Shadow";
                displayName = "Enable Signal Shadow";
                tooltip = "Enable signal shadow";
                typeName = "BOOL";
                defaultValue = "true";
            };

            class MultipathingActive: Checkbox
            {
                property = "TMAST_Module_SetUpSignalShadow_Multipathing";
                displayName = "Enable Multipathing";
                tooltip = "Enable signal multipathing";
                typeName = "BOOL";
                defaultValue = "false";
            };

            class ShiftingActive: Checkbox
            {
                property = "TMAST_Module_SetUpSignalShadow_Shifting";
                displayName = "Enable normal signal";
                tooltip = "Enable shifting behavior between error and normal signals";
                typeName = "BOOL";
                defaultValue = "false";
            };

            class ShiftingSec: Edit
            {
                property = "TMAST_Module_SetUpSignalShadow_ShiftingInterval";
                displayName = "Shifting Interval";
                tooltip = "Intervals between each shifting cycle";
				typeName = "NUMBER";
                defaultValue = "60";
            };
			
            class Distance: Edit
            {
                property = "TMAST_Module_SetUpSignalShadow_Distance";
                displayName = "Multipathing Shift";
                tooltip = "Multipathing shifting in metres.";
                typeName = "NUMBER";
                defaultValue = "235";
            };

            class Angle: Edit
            {
                property = "TMAST_Module_SetUpSignalShadow_Angle";
                displayName = "Multipathing Angle";
                tooltip = "Multipathing shifting angles.";
                typeName = "NUMBER";
                defaultValue = "69";
            };

            class ShadowWeight: Edit
            {
                property = "TMAST_Module_SetUpSignalShadow_ShadowWeight";
                displayName = "Shadow weight";
                tooltip = "A higher number increases the weight for signal shadow to be selected in a shifting interval.";
                typeName = "NUMBER";
                defaultValue = "50";
            };

            class PathingWeight: Edit
            {
                property = "TMAST_Module_SetUpSignalShadow_PathingWeight";
                displayName = "Multipathing weight";
                tooltip = "A higher number increases the weight for multipathing to be selected in a shifting interval.";
                typeName = "NUMBER";
                defaultValue = "30";
            };
			
            class SignalWeight: Edit
            {
                property = "TMAST_Module_SetUpSignalShadow_SignalWeight";
                displayName = "Normal Signal weight";
                tooltip = "A higher number increases the weight for normal signals to be selected in a shifting interval.";
                typeName = "NUMBER";
                defaultValue = "20";
            };
			
            class Altitude: Edit
            {
                property = "TMAST_Module_SetUpSignalShadow_Altitude";
                displayName = "Altitude";
                tooltip = "How high up in the zone, from sea level, one shall be affected by this module.";
                typeName = "NUMBER";
                defaultValue = "750";
            };
        };

        class ModuleDescription: ModuleDescription
        {
            description = "";
            sync[] = {"Anything"};
        };
    };
	
	class TMAST_Module_SetUpScintillation: Module_F
    {
        scope = 2;
        scopeCurator = 2;
        displayName = "Set Scintillation";
        category = "TMAST_Modules";
        function = "TMAST_fnc_setUpScintillation_Module";
        functionPriority = 1;
        isGlobal = 0;
        isTriggerActivated = 1;
        isDisposable = 1;
		
        icon = "\A3\Modules_F_Curator\Data\iconRadio_ca.paa";

        class Attributes: AttributesBase
        {
			class TimeEffect: Edit
            {
                property = "TMAST_Module_SetUpScintillation_ShiftingInterval";
                displayName = "Shifting Interval";
                tooltip = "Intervals between each shifting cycle";
				typeName = "NUMBER";
                defaultValue = "120";
            };
			
            class LagWeigth: Edit
            {
                property = "TMAST_Module_SetUpScintillation_LagWeigth";
                displayName = "Lag weight";
                tooltip = "A higher number increases the weight for signal lag to be selected in a shifting interval.";
                typeName = "NUMBER";
                defaultValue = "50";
            };

            class BlockWeight: Edit
            {
                property = "TMAST_Module_SetUpScintillation_BlockWeight";
                displayName = "Block weight";
                tooltip = "A higher number increases the weight for signal blocking to be selected in a shifting interval.";
                typeName = "NUMBER";
                defaultValue = "25";
            };
			
            class NormWeight: Edit
            {
                property = "TMAST_Module_SetUpScintillation_NormWeight";
                displayName = "Normal Signal weight";
                tooltip = "A higher number increases the weight for normal signals to be selected in a shifting interval.";
                typeName = "NUMBER";
                defaultValue = "25";
            };
			
			class Target: Combo
			{
				property = "TMAST_Module_SetUpScintillation_Side";
				displayName = "Targets";
				tooltip = "Side or custom player list affected by the scintillation.";
				typeName = "STRING";
				defaultValue = """ALLPLAYERS""";

				class Values
				{
					class AllPlayers
					{
						name = "All Players";
						value = "ALLPLAYERS";
					};
					class West
					{
						name = "BLUFOR";
						value = "WEST";
					};
					class East
					{
						name = "OPFOR";
						value = "EAST";
					};
					class Independent
					{
						name = "Independent";
						value = "GUER";
					};
					class Civilian
					{
						name = "Civilian";
						value = "CIV";
					};
					class Custom
					{
						name = "Custom";
						value = "CUSTOM";
					};
				};
			};
			
            class CustomPlayers: Edit
            {
                property = "TMAST_Module_SetUpScintillation_CustomPlayers";
                displayName = "Custom Players Array";
                tooltip = "When Targets is Custom, enter an array of targeted player units, e.g. [unit1, unit2].";
                typeName = "STRING";
                defaultValue = """[]""";
            };
			
            class Distance: Edit
            {
                property = "TMAST_Module_SetUpScintillation_Distance";
                displayName = "Scintillation Shift";
                tooltip = "Scintillation shifting in metres.";
                typeName = "NUMBER";
                defaultValue = "670";
            };

            class Angle: Edit
            {
                property = "TMAST_Module_SetUpScintillation_Angle";
                displayName = "Scintillation Angle";
                tooltip = "Scintillation shifting angles.";
                typeName = "NUMBER";
                defaultValue = "67";
            };
        };

        class ModuleDescription: ModuleDescription
        {
            description = "";
            sync[] = {"Anything"};
        };
    };
	
		class TMAST_Module_SetUpNGUW: Module_F
    {
        scope = 2;
        scopeCurator = 2;
        displayName = "Enable No GPS Under Water";
        category = "TMAST_Modules";
        function = "TMAST_fnc_setUpNGUW_Module";
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 1;
        isDisposable = 1;

        class ModuleDescription: ModuleDescription
        {
            description = "";
            sync[] = {"Anything"};
        };
    };
};
