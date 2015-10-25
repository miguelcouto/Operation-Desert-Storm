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
publicVariable "scientistsdead";

//Mostra a mensagem
[["Ok, a equipe de cientistas foi eliminada, talvez neste laboratório você possa encontrar algum tipo de intel, qualquer coisa que pode ser útil para desarmar o dispositivo nuclear"], "new_fnc_Overlord"] call BIS_fnc_MP;

//Informa que o jogo foi salvo
if (missionautosave) then {
	saveGame;
}

