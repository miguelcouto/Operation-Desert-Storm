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
 * Não altere este arquivo, para variáveis principais, edite o arquivo init_config.sqf, 
 * para suas próprias edições e linhas de código, edite o arquivo post_init.sqf
 *
*/

//Aguarda até que todos estejam conectados para receber tudo que é preciso
if (!isDedicated && (isNull player)) then 
{
	waitUntil {!(isNull player)}; 
	waitUntil {player == player}
};

//Apenas vai carregar o briefing caso o jogador tenha interface
if (hasInterface) then {
	//Carrega o briefing da missão antes de fazer qualquer coisa
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
		//Define o rádio de longa distância
		TF_defaultWestBackpack = krose_defaultTFARLongRange;
	};

	//Define o rádio pessoal
	TF_defaultWestPersonalRadio = krose_defaultTFARPersonal;
}
else
{
	//Irá desabilitar mesmo que o usuário tenha o Task Force
	tf_no_auto_long_range_radio = true;
	//O rádio será qualquer coisa padrão, caso o TFAR não esteja habilitado
	enableRadio true;
};

//Adiciona as funções básicas
execVM "Sources\Krose_fnc_GenFunction.sqf";

//A Randomização do vento apenas irá ocorrer no servidor, para então, propagar aos clientes
if (isServer) then 
{
	//Verifica se o cliente autorizou o vento a ser randomizado
	if (krose_randomizeWind) then 
	{
		setWind [random 4, random 4, true];
		krose_windChangeTime setWindDir (random 360);
		krose_windChangeTime setWindStr (random 1);
	};

	//Grava a posição inicial do jogador atribuido como servidor, onde ele aparece no mapa, apenas será utilizado no modo debug
	krose_initialPosition = getPos player;

	//Limpador de lixos que é acionado apenas no servidor
	if (krose_cleanMission) then { [krose_viewDistance, krose_cleanDeadBodies, krose_cleanDestrVehicles, krose_abandonedTimer] execVM "Sources\fnc\delete.sqf"; };
	//Verifica se o sistema permite os respawns baseados APENAS no lado em que o jogador está jogando
	if (krose_canRespawn) then { [krose_playerSide, krose_maxTickets] call BIS_fnc_respawnTickets; };

	//Configurações do alto Comando
	execVM "Sources\Krose_fnc_highCommand.sqf";
	//Configurações dos jogadores
	execVM "Sources\Krose_fnc_playerSpawn.sqf";
	//Configurações sobre morte de civis em campo de batalha
	if (krose_checkForCIVKIA) then { execVM "Sources\Krose_fnc_civKilled.sqf"; };

	//Inicializa a ambientação de civil, ou seja, será criado civis em construções próximas ao jogador
	if (krose_ambientCiv) then { [krose_ambientCivNumber, krose_ambientCivSpawn, krose_ambientCivWpt, krose_checkForCIVKIA] execVM "Sources\fnc\MADal\MAD_civilians.sqf"; };
	//Inicializa a ambientação de veículos civis, ou seja, eles serão criados em estradas a uma certa distância do jogador
	if (krose_ambientVehicles) then { [krose_ambientVehiclesNumber, krose_ambientVehiclesSpawn, krose_ambientVehiclesDelete, krose_checkForCIVKIA] execVM "Sources\fnc\MADal\MAD_traffic.sqf"; };
	//Inicializa a ambientação que cria cidades populadas
	if (krose_civilianOcupationSystem) then { [] execVM "Sources\fnc\cos\cosInit.sqf"; }
};

//Verifica se o jogador está com o debug habilitado, um tipo de modo DEUS no jogo onde o criador pode ter determinados acessos
if (krose_enableDebug) then 
{ 
	execVM "Sources\Krose_fnc_masterFunctions.sqf"; 
	execVM "Sources\Krose_fnc_maker.sqf"; 
};

if (!isDedicated && !krose_enableDebug) then 
{
	//Retorna a descrição da missão como está informado no onLoadMission do arquivo description.ext
	_missionDescription = getText (missionConfigFile >> "onLoadMission");
	//Retorna o autor da missão
	_missionAuthor = getText (missionConfigFile >> "author");
	//Executa a inicialização da missão
	[krose_startMissionAfter, krose_missionHintInsignia, _missionDescription, krose_showCredits, _missionAuthor, krose_creditsTimer, krose_additionalCredits, krose_useShortName, krose_shortMissionName] spawn 
	{
		_tTime = (_this select 0); //Tempo total de execução
		_tInsignia = (_this select 1); //Insignia
		_tDescr = (_this select 2);	//Descrição da missão
		_showCred = (_this select 3); //Mostra os créditos da missão
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

			//Executa créditos adicionais caso tenha
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