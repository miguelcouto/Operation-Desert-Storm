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

//Task Complete
["task01","Succeeded"] call BIS_fnc_taskSetState;

//Seta os cientistas como mortos
scientistsdead = true;

//Mostra a mensagem
[["Ok, the scientists team are dead, maybe in this lab you can find some kind of intel, anything that can be useful to find or disarm the nuclear device."], "new_fnc_Overlord"] call BIS_fnc_MP;

//Informa que o jogo foi salvo
if (missionautosave) then {
	saveGame;
}

