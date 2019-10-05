DRE_RespawnFix_PlayerIsIncapacitated = false;

if (!isDedicated) then {
	waitUntil { player == player };

	player addEventHandler ["Hit", {
		private ["_player"];
		
		_player = _this select 0;
		
		if (_player getVariable ["BIS_revive_incapacitated", false] && !DRE_RespawnFix_PlayerIsIncapacitated) then {
			player allowDamage false;
			DRE_RespawnFix_PlayerIsIncapacitated = true;
			
			[] spawn {
				waitUntil {!DRE_RespawnFix_PlayerIsIncapacitated || !(player getVariable ["BIS_revive_incapacitated", false]) };
				
				player allowDamage true;
				DRE_RespawnFix_PlayerIsIncapacitated = false;
			};
		};
	}];

	player addEventHandler ["Respawn", {
		player allowDamage true;
		DRE_RespawnFix_PlayerIsIncapacitated = false;
	}];
};
