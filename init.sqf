ENGIMA_DEBUG = false;

call compile preprocessFileLineNumbers "Ascom.sqf";
call compile preprocessFileLineNumbers "Engima\CommonLib\CommonLib.sqf"; // Added by Engima.CommonLib

// Initialize params with default values.
call dre_fnc_CL_InitParams;

// call compile preprocessFileLineNumbers "Engima\Civilians\Init.sqf"; // Added by Engima.Civilians
call compile preprocessFileLineNumbers "Engima\Traffic\Init.sqf"; // Added by Engima.Traffic
call compile preprocessFileLineNumbers "Engima\SimpleTasks\Init.sqf"; // Added by Engima.SimpleTasks
call compile preprocessFileLineNumbers "Engima\PatrolledAreas\Init.sqf"; // Added by Engima.PatrolledAreas

call compile preprocessFileLineNumbers "Common\InitCommon.sqf";

if (isServer) then {
	call compile preprocessFileLineNumbers "Server\InitServer.sqf";
};
if (!isDedicated) then {
	call compile preprocessFileLineNumbers "Client\InitClient.sqf";
};

[] spawn {
	waitUntil { sleep 10; !isNil "ENG_laptopToKeep" };
	
	if (ENG_laptopToKeep != ENG_laptop1) then { deleteVehicle ENG_laptop1 };
	if (ENG_laptopToKeep != ENG_laptop2) then { deleteVehicle ENG_laptop2 };
	if (ENG_laptopToKeep != ENG_laptop3) then { deleteVehicle ENG_laptop3 };
};
