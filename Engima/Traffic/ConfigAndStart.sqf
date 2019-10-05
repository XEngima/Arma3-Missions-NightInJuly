/* 
 * This file contains parameters to config and function call to start an instance of
 * traffic in the mission. The file is edited by the mission developer.
 *
 * See file Engima\Traffic\Documentation.txt for documentation and a full reference of 
 * how to customize and use Engima's Traffic.
 */
 
private ["_parameters", "_skill", "_frequency"];

_skill = ((paramsArray select 0) + 1) / 5 - 0.1;
if ((paramsArray select 1) == 1) then { _frequency = 3; };
if ((paramsArray select 1) == 2) then { _frequency = 5; };
if ((paramsArray select 1) == 3) then { _frequency = 8; };

_parameters = [
	["SIDE", east],
	["VEHICLES", ["O_MRAP_02_F", "O_MRAP_02_F", "O_MRAP_02_F", "O_MRAP_02_F", "O_MRAP_02_F", "O_Quadbike_01_F", "O_Quadbike_01_F", "O_Quadbike_01_F", "O_Truck_02_transport_F", "O_Truck_02_transport_F", "O_MRAP_02_hmg_F", "O_MRAP_02_hmg_F", "O_APC_Tracked_02_cannon_F", "C_SUV_01_F", "C_SUV_01_F", "C_SUV_01_F", "C_Van_01_fuel_F", "C_Van_01_fuel_F", "C_Van_01_fuel_F"]],
	["VEHICLES_COUNT", _frequency],
	["MIN_SPAWN_DISTANCE", 500],
	["MAX_SPAWN_DISTANCE", 1500],
	["MIN_SKILL", _skill - 0.1],
	["MAX_SKILL", _skill + 0.1],
	["DEBUG", false]
];

// Start an instance of the traffic
_parameters spawn ENGIMA_TRAFFIC_StartTraffic;
