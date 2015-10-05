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
[["Very good! Jalil Afif is finally dead and all your plans with him. Search your body for some intel."], "new_fnc_Overlord"] call BIS_fnc_MP;

//Seta a principal variavel para true.
jalilafifdead = true;

if (missionautosave) then {
	saveGame;
}