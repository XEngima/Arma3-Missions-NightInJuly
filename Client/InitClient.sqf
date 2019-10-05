execVM "Briefing.sqf";

call compile preprocessFileLineNumbers "Client\RespawnFix.sqf";

// Spawn unit to correct position
if (!ENGIMA_DEBUG) then {
	[] spawn {
		waitUntil { player == player };
		
		while {vehicle player == player} do {
			sleep random 0.5;
			
			if (isNull driver ENG_assaultBoat) then {
				player moveInDriver ENG_assaultBoat;
			}
			else {
				player moveInCargo ENG_assaultBoat;
			};
		
			{
				if (_x != player && local _x) then {
					_x moveInCargo ENG_assaultBoat;
				};
			} foreach call ENG_GetPlayableUnits;
		};
	};
};


player addEventHandler ["Fired", {
	private ["_satchel", "_satchelPos"];

	_satchel = _this select 6;
	_satchelPos = getPos player;
	
	[_satchel, _satchelPos] spawn {
		[_this select 0, _this select 1] call dre_OnSatchelPlacedServer;
	};
}];

/*
player addEventHandler ["Killed", {
	player setVariable ["ENG_isIncapacitated", true, true];
}];

player addEventHandler ["Respawn", {
	private ["_unit", "_corpse", "_otherUnit", "_cam", "_garbageGroup"];
	
	_unit = _this select 0;
	_corpse = _this select 1;

	player allowDamage false;
	
	[] spawn {
		waitUntil { !captive player };
		player allowDamage true;
		player setVariable ["ENG_isIncapacitated", false, true];
	};

	if (_unit == player) then {
		_otherUnit = objNull;
		
		{
			if (_x != player && lifeState _x == "HEALTHY") then {
				_otherUnit = _x;
			};
		} foreach call ENG_GetPlayers;
		
		if (isNull _otherUnit) then {
			{
				if (_x != player && lifeState _x == "INJURED") then {
					_otherUnit = _x;
				};
			} foreach call ENG_GetPlayers;
		};
		
		if (isNull _otherUnit) then {
			{
				if (_x != player) then {
					_otherUnit = _x;
				};
			} foreach call ENG_GetPlayers;
		};
		
		if (isNull _otherUnit) then {
			_otherUnit = _corpse;
		};
		
		if (_unit distance _corpse > 100) then { // Unit killed for real
			player allowDamage false;
			player setVariable ["ENG_isDead", true, true];
			
			if (!isNull _otherUnit) then {
				_garbageGroup = createGroup side _unit;
				[_unit] joinSilent _garbageGroup;
				
				_cam = "camera" camCreate (_otherUnit modelToWorld [0, -5, 3]);
				_cam camSetTarget _otherUnit;
				_cam attachTo [_otherUnit, [0, -5, 3]];
				_cam cameraEffect ["internal", "back"];
				_cam camCommit 1;
			};
		};
	};
}];
*/
