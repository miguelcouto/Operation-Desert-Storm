/*
 *  _  __                   
 * | |/ /                   
 * | ' / _ __ ___  ___  ___ 
 * |  < | '__/ _ \/ __|/ _ \
 * | . \| | | (_) \__ \  __/
 * |_|\_\_|  \___/|___/\___|
 *
 * Arma 3 Mission
 * Created by: Krose
 * Mission: ELITE - Episode I - Operation Desert Storm
 *
*/

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
	["task02","Failed"] call BIS_fnc_taskSetState;
	
	[["Main Mission", "Disarm Nuclear Device", "You failed to disarm the nuclear device, the wrong password started the launch sequence, in some place of Altis."], "new_fnc_MissionHint"] call BIS_fnc_MP;
	sleep 10;
	[["ALERT! ALERT! The bombs are in the air! The bombs are in the air! What happened? I repeat, the b...."], "new_fnc_Overlord"] call BIS_fnc_MP;
	sleep 10;
	[["No Communication", "The nuclear bombs are flying now, they are jamming the radio signal with your base, your mission is over..."], "new_fnc_hint"] call BIS_fnc_MP;
	sleep 5;
	["Failure",false,true] call BIS_fnc_endMission;
}