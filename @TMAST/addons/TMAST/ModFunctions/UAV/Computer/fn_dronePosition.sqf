_uavPosition = _this select 0;
_connectedUav = _this select 1;
_error = _this select 2;

_information = _connectedUav getVariable _error;

if (!isNull _connectedUav) then
{
	_pos = _connectedUav getPos _information;
	_uavPosition ctrlsettext (mapgridposition _pos);
};