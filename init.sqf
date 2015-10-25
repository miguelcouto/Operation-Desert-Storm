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
 * N�o altere este arquivo, para vari�veis principais, edite o arquivo init_config.sqf, 
 * para suas pr�prias edi��es e linhas de c�digo, edite o arquivo post_init.sqf
 *
*/

//Aguarda at� que todos estejam conectados para receber tudo que � preciso
if (!isDedicated && (isNull player)) then 
{
	waitUntil {!(isNull player)}; 
	waitUntil {player == player}
};

//Apenas vai carregar o briefing caso o jogador tenha interface
if (hasInterface) then {
	//Carrega o briefing da miss�o antes de fazer qualquer coisa
	execVM "Files\Briefing.sqf";
};

//Carrega as variaveis que iniciam o sistema.
#include "init_config.sqf";
#include "Sources\Krose_init.sqf";

if (krose_usingTFAR) then 
{
	tf_no_auto_long_range_radio = krose_noTFARLong;

	if (!krose_noTFARLong) then 
	{
		//Define o r�dio de longa dist�ncia
		TF_defaultWestBackpack = krose_defaultTFARLongRange;
	};

	//Define o r�dio pessoal
	TF_defaultWestPersonalRadio = krose_defaultTFARPersonal;
}
else
{
	//Ir� desabilitar mesmo que o usu�rio tenha o Task Force
	tf_no_auto_long_range_radio = true;
	//O r�dio ser� qualquer coisa padr�o, caso o TFAR n�o esteja habilitado
	enableRadio true;
};

//Adiciona as fun��es b�sicas
execVM "Sources\Krose_fnc_GenFunction.sqf";

//A Randomiza��o do vento apenas ir� ocorrer no servidor, para ent�o, propagar aos clientes
if (isServer) then 
{
	//Verifica se o cliente autorizou o vento a ser randomizado
	if (krose_randomizeWind) then 
	{
		setWind [random 4, random 4, true];
		krose_windChangeTime setWindDir (random 360);
		krose_windChangeTime setWindStr (random 1);
	};

	//Grava a posi��o inicial do jogador atribuido como servidor, onde ele aparece no mapa, apenas ser� utilizado no modo debug
	krose_initialPosition = getPos player;

	//Limpador de lixos que � acionado apenas no servidor
	if (krose_cleanMission) then { [krose_viewDistance, krose_cleanDeadBodies, krose_cleanDestrVehicles, krose_abandonedTimer] execVM "Sources\fnc\delete.sqf"; };
	//Verifica se o sistema permite os respawns baseados APENAS no lado em que o jogador est� jogando
	if (krose_canRespawn) then { [krose_playerSide, krose_maxTickets] call BIS_fnc_respawnTickets; };

	//Configura��es do alto Comando
	execVM "Sources\Krose_fnc_highCommand.sqf";
	//Configura��es dos jogadores
	execVM "Sources\Krose_fnc_playerSpawn.sqf";
	//Configura��es sobre morte de civis em campo de batalha
	if (krose_checkForCIVKIA) then { execVM "Sources\Krose_fnc_civKilled.sqf"; };

	//Inicializa a ambienta��o de civil, ou seja, ser� criado civis em constru��es pr�ximas ao jogador
	if (krose_ambientCiv) then { [krose_ambientCivNumber, krose_ambientCivSpawn, krose_ambientCivWpt, krose_checkForCIVKIA] execVM "Sources\fnc\MADal\MAD_civilians.sqf"; };
	//Inicializa a ambienta��o de ve�culos civis, ou seja, eles ser�o criados em estradas a uma certa dist�ncia do jogador
	if (krose_ambientVehicles) then { [krose_ambientVehiclesNumber, krose_ambientVehiclesSpawn, krose_ambientVehiclesDelete, krose_checkForCIVKIA] execVM "Sources\fnc\MADal\MAD_traffic.sqf"; };
	//Inicializa a ambienta��o que cria cidades populadas
	if (krose_civilianOcupationSystem) then { [] execVM "Sources\fnc\cos\cosInit.sqf"; }
};

//Verifica se o jogador est� com o debug habilitado, um tipo de modo DEUS no jogo onde o criador pode ter determinados acessos
if (krose_enableDebug) then 
{ 
	execVM "Sources\Krose_fnc_masterFunctions.sqf"; 
	execVM "Sources\Krose_fnc_maker.sqf"; 
};

if (!isDedicated && !krose_enableDebug) then 
{
	//Retorna a descri��o da miss�o como est� informado no onLoadMission do arquivo description.ext
	_missionDescription = getText (missionConfigFile >> "onLoadMission");
	//Retorna o autor da miss�o
	_missionAuthor = getText (missionConfigFile >> "author");
	//Executa a inicializa��o da miss�o
	[krose_startMissionAfter, krose_missionHintInsignia, _missionDescription, krose_showCredits, _missionAuthor, krose_creditsTimer, krose_additionalCredits, krose_useShortName, krose_shortMissionName] spawn 
	{
		_tTime = (_this select 0); //Tempo total de execu��o
		_tInsignia = (_this select 1); //Insignia
		_tDescr = (_this select 2);	//Descri��o da miss�o
		_showCred = (_this select 3); //Mostra os cr�ditos da miss�o
		_author = (_this select 4);
		_credTimer = (_this select 5);
		_addCredits = (_this select 6);
		_useShortName = (_this select 7);
		_shortName = (_this select 8);

		//Cria uma layer para lidar com o fade in 
		_l = ["tLayer"] call BIS_fnc_rscLayer;
		_l cutText ["", "BLACK IN", (_tTime + 10)];
		//Aguarda o BlackIn terminar
		waitUntil {time > (_tTime - 10)};
		["<img size= '9' shadow='false' image='" + _tInsignia + "'/><br/><br/><t size='.7' color='#FFFFFF'>" + _tDescr + "</t>",0,0,3,12] spawn BIS_fnc_dynamicText;
		
		if (_showCred) then 
		{
			sleep _credTimer;

			if (_useShortName) then {
				[["Missao", _shortName], "BIS_fnc_infoText"] call BIS_fnc_MP;	
			} else {
				[["Missao", _tDescr], "BIS_fnc_infoText"] call BIS_fnc_MP;
			};

			sleep _credTimer;
			[["Criado por", _author], "BIS_fnc_infoText"] call BIS_fnc_MP;

			//Executa cr�ditos adicionais caso tenha
			{
				_title = (_x select 0);
				_msg = (_x select 1);
				sleep _credTimer;
				[[_title, _msg], "BIS_fnc_infoText"] call BIS_fnc_MP;
			} forEach _addCredits;

		};
	}
}

//Aqui agora roda o script que deve ser editado pelo criador
execVM "Files\init.sqf";

//Aqui o sistema realiza o Post Processing 
execVM "Krose_fnc_postProcess.sqf";