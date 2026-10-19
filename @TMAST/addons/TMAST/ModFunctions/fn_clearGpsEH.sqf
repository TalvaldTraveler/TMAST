_miniMap = _this select 0;
_miniMap_air = _this select 1;

removeMissionEventHandler ["Map", TMAST_MapEvent];
removeMissionEventHandler ["Draw2D", TMAST_MapGPSEvent];
_miniMap ctrlRemoveEventHandler ["Draw", TMAST_GpsEvent_Land];
_miniMap_air ctrlRemoveEventHandler ["Draw", TMAST_GpsEvent_Air];
