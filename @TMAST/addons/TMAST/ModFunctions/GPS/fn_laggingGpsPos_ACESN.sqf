_laggingInformation = player getVariable ["TMAST_GPSSscintillationData", [670,67]];
_laggingLocation = vehicle player getPos _laggingInformation;

_mapCtrl = findDisplay 12 displayCtrl 51; 
_mapDisplay = ctrlParent _mapCtrl; 
_cordctrl = _mapDisplay displayCtrl 913592;  
_cordctrl ctrlSetText (mapgridposition _laggingLocation);

_dir = (floor direction vehicle player)-10;
_dirctrl = _mapDisplay displayCtrl 913590;  
_dirctrl ctrlSetText str _dir; 