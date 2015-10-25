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

//Conclui a tarefa
["task03","Succeeded"] call BIS_fnc_taskSetState;

//Informa o que aconteceu
[["Missão Principal", "Comunicações Perdidas", "Enemy communications are now blocked, the two radio towers are destroyed."], "new_fnc_MissionHint"] call BIS_fnc_MP;
sleep 10;
[["Be advised, our sattellite images are showing that the enemy are all crazy, they know that something happened with the radio towers and they will converge now to towers position."], "new_fnc_Overlord"] call BIS_fnc_MP;