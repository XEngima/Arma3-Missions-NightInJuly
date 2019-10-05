[] spawn {
	waitUntil { sleep 1; !isNil "ENG_intelDownloaded" };

	["DownloadIntelTask", "SUCCEEDED"] call ENGTASKS_SetTaskState;
	["BlowUpTigrisTask", ENG_tigris] call ENGTASKS_SetTaskTarget;
};

[] spawn {
	waitUntil { sleep 1; !alive ENG_tigris };

	["BlowUpTigrisTask", "SUCCEEDED"] call ENGTASKS_SetTaskState;
	["ReturnToMothership", "Return to mothership.", "ASSIGNED"] call ENGTASKS_CreateTask;
};

