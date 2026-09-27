_shiftedInformation = player getVariable ["TMAST_GPSHackedData", [0,0,0]];
_shiftedLocation = getPos _shiftedInformation;

_mapCtrl = findDisplay 12 displayCtrl 51; 
_mapDisplay = ctrlParent _mapCtrl; 
_cordctrl = _mapDisplay displayCtrl 913592;  
_cordctrl ctrlsettext (mapgridposition _shiftedLocation);