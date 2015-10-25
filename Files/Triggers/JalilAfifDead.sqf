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

//Marca a tarefa como concluida
["task04","Succeeded"] call BIS_fnc_taskSetState;

//Exibe a mensagem de vitória
[["A morte de Jalil Afif foi confirmada! Ótimo trabalho."], "new_fnc_Overlord"] call BIS_fnc_MP;

//Seta a principal variavel para true.
jalilafifdead = true;
publicVariable "jalilafifdead";

if (missionautosave) then {
	saveGame;
}