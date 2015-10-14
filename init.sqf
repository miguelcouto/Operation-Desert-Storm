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

//Aguarda at� que todos estejam conectados para receber tudo que � preciso
if (!isDedicated && (isNull player)) then {waitUntil {!(isNull player)}; waitUntil {player == player}};

enableSaving [true,true];					//Permite salvar dentro do jogo
enableRadio true;							//Ativa o r�dio interno do jogo
tf_no_auto_long_range_radio = true;			//Remove a mochila do TaskForce Radio, j� que o jogo ser� single player n�o h� necessidade de mostr�-la

//Carrega tudo
//[] execVM "Tasks.sqf";						
[[[],"Tasks.sqf"],"BIS_fnc_execVM",false,true] call BIS_fnc_MP;		//Todas as taredas de todos os jogadores
[] execVM "Briefing.sqf";					//Briefing completo da miss�o
[] execVM "functions.sqf";					//Todas as fun��es

//-----------------------------------------------------------------------
//Global Variables

//enableDebugConsole = 1;
scientistsdead = false;						//Verifica se todos os cientistas est�o mortos
nuclearDeviceDesarmed = false;				//Informa se o dispositivo nuclear foi desarmado
radioDestroyed1 = false;					//Torre de R�dio 1 n�o destruida
radioDestroyed2 = false;					//Torre de R�dio 2 n�o destruida
jalilafifdead = false;						//Informa se Jalil est� mesmo morto
missionautosave = false;					//Informa se a miss�o possui pontos de auto-save
mainmissionfinished = false;				//Informa se a miss�o principal j� foi concluida
nuclearDeviceFound = false;					//Informa se o dispositivo nuclear j� foi encontrado

//-----------------------------------------------------------------------
//Inicializa��o da miss�o

[[], "new_fnc_MPInitialInfo"] call BIS_fnc_mp;
[[], "new_fnc_fadeEffect"] call BIS_fnc_mp;