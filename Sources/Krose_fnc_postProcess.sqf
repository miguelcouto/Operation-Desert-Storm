/*
 *  _  __                   
 * | |/ /                   
 * | ' / _ __ ___  ___  ___ 
 * |  < | '__/ _ \/ __|/ _ \
 * | . \| | | (_) \__ \  __/
 * |_|\_\_|  \___/|___/\___|
 *
 * Arma 3 Mission Framework
 * Created by: Krose
 *
 * Aqui o sistema realiza o post processing da missão, informando ao usuário que tudo está sendo alinhado
 *
*/

private["_thisUnity","_timerToStart","_timer","_cnt"];

//Retorna o jogador
_thisUnity 			= player;
//Tempo para começar a missão
_timerToStart 		= (_this select 0);
//Tempo para o contador
_timer 				= _timerToStart / 100;
//Contador da barra de loading
_cnt 				= 0;

//Informa uma mensagem caso o sistema seja alpha ou beta
if ((krose_devBuild == "Alpha") || (krose_devBuild == "Beta")) then
{
	_alphaMessage = format["Esta é uma versão em desenvolvimento do Krose Framework (versão: %1 - %2) não utilize em missões reais!", krose_version, krose_devBuild];
	[_alphaMessage, "systemChat"] call BIS_fnc_mp;
};

//Finaliza a missão
finishMissionInit;
sleep 3;
krose_mission_started = true;
//Realiza um broadcast da missão
publicVariable "ADF_missionInit";