global_passwordKey = _this select 0;

//Compara o password
if (global_passwordKey == nuclearTruePass) then
{
	//Task Complete
	["task02","Succeeded"] call BIS_fnc_taskSetState;
	
	//Informa que o dispositivo nuclear foi desarmado
	nuclearDeviceDesarmed = true;
	
	[["Main Mission", "Disarm Nuclear Device", "The nuclear device are disarm! Congratulations!"], "new_fnc_MissionHint"] call BIS_fnc_MP;
	
	//Informa que o jogo foi salvo
	if (missionautosave) then {
		saveGame;
	}
}
else
{
	//Password errado
	playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", player];
	
	//A missão é dada como falha
	["task03","Failed"] call BIS_fnc_taskSetState;
	[["Main Mission", "You had only one chance to put the right password on the laptop, but you failed... The ogives are now in the air, God help us all..."], "new_fnc_hint"] call BIS_fnc_MP;
	
	sleep 5;
	["Failure",false,true] call BIS_fnc_endMission;
}