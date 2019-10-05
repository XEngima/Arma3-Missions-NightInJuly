private ["_tempestArray", "_laptopArray", "_group", "_unit", "_skill", "_frequency"];

call compile preprocessFileLineNumbers "Server\Functions.sqf";

// Put all enemy tempests in an array
_tempestArray = [ENG_enemyTempest1, ENG_enemyTempest2, ENG_enemyTempest3, ENG_enemyTempest4, ENG_enemyTempest5];

// Put all laptops in an array
_laptopArray = [ENG_laptop1, ENG_laptop2, ENG_laptop3];

// Pick one random tempest as our target and let all machines in the network know
ENG_enemyTargetTempest = _tempestArray select floor random count _tempestArray;
publicVariable "ENG_enemyTargetTempest";

// Remove two of the laptops
ENG_laptopToKeep = _laptopArray select floor random count _laptopArray;
publicVariable "ENG_laptopToKeep";

ENG_enemyTempestBlownUp = false;
publicVariable "ENG_enemyTempestBlownUp";

// Populate houses

_frequency = paramsArray select 1;
for "_i" from 1 to _frequency do {
	if (random 100 > 50) then {
		_skill = ((paramsArray select 0) + 1) / 5 - 0.1;
		_group = createGroup east;
		_unit = _group createUnit ["O_G_Soldier_lite_F", getMarkerPos "ENG_militaryLogisticsMarker", [], 0, "FORM"];
		_unit setSkill _skill;
		[_unit] execVM "Tophe\HousePatrol\HousePatrol.sqf";
	};
	
	if (random 100 > 50) then {
		_skill = ((paramsArray select 0) + 1) / 5 - 0.1;
		_group = createGroup east;
		_unit = _group createUnit ["O_G_Soldier_lite_F", getMarkerPos "ENG_militaryOfficeMarker", [], 0, "FORM"];
		_unit setSkill _skill;
		[_unit] execVM "Tophe\HousePatrol\HousePatrol.sqf";
	};
	
	if (random 100 > 50) then {
		_skill = ((paramsArray select 0) + 1) / 5 - 0.1;
		_group = createGroup east;
		_unit = _group createUnit ["O_G_Soldier_lite_F", getMarkerPos "ENG_harbourMarker", [], 0, "FORM"];
		_unit setSkill _skill;
		[_unit] execVM "Tophe\HousePatrol\HousePatrol.sqf";
	};
};

// End trigger
[] spawn {
	private ["_playerGroup"];
	
	waitUntil { sleep 1; count (call ENG_GetPlayers) > 0 };
	_playerGroup = group ((call ENG_GetPlayers) select 0);
	
	waitUntil { sleep 1; leader _playerGroup distance ENG_mothership > 20 };
	
	waitUntil { sleep 1; leader _playerGroup distance ENG_mothership < 10 };
	
	["BackToMothershipTask", "SUCCEEDED"] call ENGTASKS_SetTaskState;
	
	if (ENG_enemyTempestBlownUp) then {
		ENG_missionSuccess = true;
		publicVariable "ENG_missionSuccess";
	}
	else {
		ENG_missionFailure = true;
		publicVariable "ENG_missionFailure";
	};
};

// Chopper take off
[] spawn {
	private ["_startTimeSec", "_waypoint"];
	
	_startTimeSec = random (60 * 30);
	sleep _startTimeSec;
	
	_waypoint = group ENG_opforChopper addWaypoint [getMarkerPos "ENG_chopperDestinationMarker", 0];
	_waypoint setWaypointBehaviour "SAFE";
	
	waitUntil { ENG_opforChopper distance (getMarkerPos "ENG_chopperDestinationMarker") < 100 };
	deleteVehicle ENG_opforChopper;
};
