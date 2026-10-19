_mapCtrl = findDisplay 12 displayCtrl 51; 
_mapDisplay = ctrlParent _mapCtrl; 
_dirctrl = _mapDisplay displayCtrl 913590;  
_dirctrl ctrlSetText "Error"; 
_altctrl = _mapDisplay displayCtrl 913591;  
_altctrl ctrlSetText "No data";  
_cordctrl = _mapDisplay displayCtrl 913592;  
_cordctrl ctrlSetText "Null"; 