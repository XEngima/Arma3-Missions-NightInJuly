// Executed on the server.
dre_OnSatchelPlaced = {
    private ["_satchel", "_satchelPos"];

    _satchel = _this select 0;
    _satchelPos = _this select 1;
    
    private ["_satchelFound", "_distanceFromSatchel", "_soldier", "_group", "_originalGroup"];

	_satchelFound = false;
	_distanceFromSatchel = 50;

    while { !_satchelFound } do {
    	sleep 10;
    	
    	{
    		if (_x isKindOf "Man" && side _x == east && (_x distance _satchel) < _distanceFromSatchel) then {
    			_soldier = _x;
    			_satchelFound = true;
    		};
    	} foreach allUnits;
    };
    
    _group = createGroup east;
    
    _originalGroup = group _soldier;
    [_soldier] joinSilent _group;
    
    _soldier move _satchelPos;
    _soldier setBehaviour "SAFE";
    
    waitUntil { _soldier distance _satchelPos < 3 };
    sleep 20;
    
    deleteVehicle _satchel; // phew!
    
    sleep 5;
    
    // Return to group
    [_soldier] joinSilent _originalGroup;    
};
