private _uav = _this select 0;
private _condition = _this select 1;
private _uavGroup = group (driver _uav);

if (_condition) then {
	_commandChangeEH = _uavGroup addEventHandler ["CommandChanged", {
		params ["_uavGroup", "_newCommand"];
		if (_newCommand isEqualTo "MOVE") then {
			_vehicles = assignedVehicles _uavGroup;
			_uavVic = _vehicles select 0;
			if (!(_uavVic getVariable ["TMAST_CommandLagTimeOut", false])) then {
				_uavVic setVariable ["TMAST_CommandLagTimeOut", true];
				_wpindex = currentWaypoint _uavGroup;
				_wpPos = waypointPosition [_uavGroup, _wpindex];
				_laggingInformation = _uavVic getVariable "TMAST_GPSSpoofedData";
				_wpPosLag = _wpPos getPos _laggingInformation;
				_distance = ((_wpPos distance _wpPosLag)/100);
				_dir = _laggingInformation select 1;
				_wpPos = _wpPos getPos [_distance, _dir];
				[_uavGroup, _wpindex] setWaypointPosition [_wpPos, 10];
			};
		};
	}];
	_enemyDetectedEH = _uavGroup addEventHandler ["EnemyDetected", {
		params ["_uavGroup", "_newTarget"];
		_uavAIs = units _uavGroup;
		_possibleTargets = _uavGroup targets [false, 300];
		_lagTarget = selectRandom  _possibleTargets;
		if (_newTarget != _lagTarget) then {
			_uavAIs doWatch (getPos _lagTarget);
			systemChat str _lagTarget;
		};
	}];
	_waypointCompleteEH = _uavGroup addEventHandler ["WaypointComplete", {
		params ["_uavGroup", "_waypointIndex"];
		_vehicles = assignedVehicles _uavGroup;
		_uavVic = _vehicles select 0;
		_uavVic setVariable ["TMAST_CommandLagTimeOut", false];
	}];
	_uav setVariable ["TMAST_UAVLag_CommandChangeEH", _commandChangeEH];
	_uav setVariable ["TMAST_UAVLag_EnemyDetectedEH", _enemyDetectedEH];
	_uav setVariable ["TMAST_UAVLag_WaypointCompleteEH", _waypointCompleteEH];
} else {
	_commandChangeEH = _uav getVariable "TMAST_UAVLag_CommandChangeEH";
	_enemyDetectedEH = _uav getVariable "TMAST_UAVLag_EnemyDetectedEH";
	_waypointCompleteEH = _uav getVariable "TMAST_UAVLag_WaypointCompleteEH";
	_uavGroup removeEventHandler ["CommandChanged", _commandChangeEH];
	_uavGroup removeEventHandler ["EnemyDetected", _enemyDetectedEH];
	_uavGroup removeEventHandler ["WaypointComplete", _waypointCompleteEH];
	_uavAIs = units _uavGroup;
	_uavAIs doWatch objNull;
};
