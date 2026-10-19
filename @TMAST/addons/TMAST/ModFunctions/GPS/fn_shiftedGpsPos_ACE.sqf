_shiftedInformation = player getVariable ["TMAST_GPSSpoofedData", [313,67]];
_shiftedLocation = vehicle player getPos _shiftedInformation;

_mapCtrl = findDisplay 12 displayCtrl 51; 
_mapDisplay = ctrlParent _mapCtrl; 
_cordctrl = _mapDisplay displayCtrl 913592;  
_cordctrl ctrlsettext (mapgridposition _shiftedLocation);