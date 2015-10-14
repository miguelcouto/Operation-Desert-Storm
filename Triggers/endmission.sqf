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

[["Missão Principal", "Missão Completa", "Ótimo trabalho, esta missão está concluida."], "new_fnc_MissionHint"] call BIS_fnc_MP;
sleep 10;
[["Victory",true,true], "BIS_fnc_endMission"] call BIS_fnc_MP;
//["Victory",true,true] call BIS_fnc_endMission;