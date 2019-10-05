/******************************************************************************************/
/*
 * See the file Engima\PatrolledAreas\Documentation.txt for a full documentation regarding 
 * start parameters.
 *
/******************************************************************************************/

private ["_parameters", "_skill", "_areaPerGroup"];

_skill = ((paramsArray select 0) + 1) / 5 - 0.1;
if (paramsArray select 1 == 1) then { _areaPerGroup = 100000; };
if (paramsArray select 1 == 2) then { _areaPerGroup = 70000; };
if (paramsArray select 1 == 3) then { _areaPerGroup = 50000; };

// Set custom parameters here
_parameters = [
	["PATROL_AREAS", ["ENG_enemyMarker1", "ENG_enemyMarker2"]],
	["UNIT_CLASSES", ["O_G_Soldier_F", "O_G_Soldier_lite_F", "O_G_Soldier_SL_F", "O_G_Soldier_TL_F", "O_G_Soldier_AR_F", "O_G_medic_F", "O_G_engineer_F", "O_G_Soldier_exp_F", "O_G_Soldier_GL_F", "O_G_Soldier_M_F", "O_G_Soldier_LAT_F", "O_G_Soldier_A_F", "O_G_officer_F"]],
	["SIDE", east],
	["MIN_UNITS_PER_GROUP", 2],
	["MAX_UNITS_PER_GROUP", 4],
	["SPAWN_DISTANCE", 10000],
	["AREA_PER_GROUP", _areaPerGroup],
	["GROUP_PROBABILITY_OF_PRESENCE", 1],
	["MIN_SKILL", _skill - 0.1],
	["MAX_SKILL", _skill + 0.1],
	["DEBUG", false]
];

/******************************************************************************************/
/*  Function Call - Do not edit below this line (unless you know what you are doing)      */
/******************************************************************************************/

// Start script
_parameters call PATAREAS_PatrolledAreas;

// Start script
_parameters call PATAREAS_PatrolledAreas;

_parameters = [
	["PATROL_AREAS", ["ENG_truckGuardMarker1", "ENG_truckGuardMarker2", "ENG_truckGuardMarker3", "ENG_truckGuardMarker4", "ENG_truckGuardMarker5"]],
	["UNIT_CLASSES", ["O_G_Soldier_F", "O_G_Soldier_lite_F", "O_G_Soldier_SL_F", "O_G_Soldier_TL_F", "O_G_Soldier_exp_F", "O_G_Soldier_GL_F", "O_G_Soldier_M_F", "O_G_Soldier_A_F"]],
	["SIDE", east],
	["MIN_UNITS_PER_GROUP", 2],
	["MAX_UNITS_PER_GROUP", 3],
	["SPAWN_DISTANCE", 10000],
	["AREA_PER_GROUP", _areaPerGroup],
	["GROUP_PROBABILITY_OF_PRESENCE", 0.75],
	["MIN_SKILL", _skill - 0.1],
	["MAX_SKILL", _skill + 0.1],
	["DEBUG", false]
];

// Start script
_parameters call PATAREAS_PatrolledAreas;
