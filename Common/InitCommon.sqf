ENG_GetPlayers = {
	private ["_playerUnits"];

	_playerUnits = [];
	if (!isNil "p1") then {
		if (isPlayer p1) then {
			_playerUnits set [count _playerUnits, p1];
		};
	};
	if (!isNil "p2") then {
		if (isPlayer p2) then {
			_playerUnits set [count _playerUnits, p2];
		};
	};
	if (!isNil "p3") then {
		if (isPlayer p3) then {
			_playerUnits set [count _playerUnits, p3];
		};
	};
	if (!isNil "p4") then {
		if (isPlayer p4) then {
			_playerUnits set [count _playerUnits, p4];
		};
	};

	_playerUnits
};

ENG_GetPlayableUnits = {
	private ["_playableUnits"];

	_playableUnits = [];
	if (!isNil "p1") then {
		_playableUnits set [count _playableUnits, p1];
	};
	if (!isNil "p2") then {
		_playableUnits set [count _playableUnits, p2];
	};
	if (!isNil "p3") then {
		_playableUnits set [count _playableUnits, p3];
	};
	if (!isNil "p4") then {
		_playableUnits set [count _playableUnits, p4];
	};

	_playableUnits
};
