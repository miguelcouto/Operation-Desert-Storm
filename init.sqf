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

//Aguarda até que todos estejam conectados para receber tudo que é preciso
if (!isDedicated && (isNull player)) then {waitUntil {!(isNull player)}; waitUntil {player == player}};

enableSaving [true,true];					//Permite salvar dentro do jogo
enableRadio true;							//Ativa o rádio interno do jogo
tf_no_auto_long_range_radio = true;			//Remove a mochila do TaskForce Radio, já que o jogo será single player não há necessidade de mostrá-la

//Carrega tudo
//[] execVM "Tasks.sqf";						
[[[],"Tasks.sqf"],"BIS_fnc_execVM",false,true] call BIS_fnc_MP;		//Todas as taredas de todos os jogadores
[] execVM "Briefing.sqf";					//Briefing completo da missão
[] execVM "functions.sqf";					//Todas as funções

//-----------------------------------------------------------------------
//Global Variables

//enableDebugConsole = 1;
scientistsdead = false;						//Verifica se todos os cientistas estão mortos
nuclearDeviceDesarmed = false;				//Informa se o dispositivo nuclear foi desarmado
radioDestroyed1 = false;					//Torre de Rádio 1 não destruida
radioDestroyed2 = false;					//Torre de Rádio 2 não destruida
jalilafifdead = false;						//Informa se Jalil está mesmo morto
missionautosave = false;					//Informa se a missão possui pontos de auto-save
mainmissionfinished = false;				//Informa se a missão principal já foi concluida
nuclearDeviceFound = false;					//Informa se o dispositivo nuclear já foi encontrado

//-----------------------------------------------------------------------
//Inicialização da missão

[[], "new_fnc_MPInitialInfo"] call BIS_fnc_mp;
[[], "new_fnc_fadeEffect"] call BIS_fnc_mp;