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
 * Configura as variaveis gerais da missão, edite apenas este arquivo, jamais mexa no init.sqf
 *
*/

//Versão do Krose Framework
krose_version					= "1.2.3";
//Informa o nome curto da missão
krose_shortMissionName			= "Desert Storm";
//Habilita ou Previne a missão de realizar Auto Saves
krose_CanAutoSaving 			= false;
//Previne o jogador de realizar saves
krose_CanManualSaving 			= false;
//Indica se a missão está com o Task Force Arrowread Radio ativado
krose_usingTFAR 				= true;
//Habilita ou Previne o respawn do rádio de longa distância (os que aparecem nas costas dos jogadores no respawn)
krose_noTFARLong 				= true;
//Remover rádio de todos os jogadores
krose_noTFARPersonalRadio		= false;
//Caso jogador possa utilizar rádios de longa distância, o padrão será qual? Para nomes de classes siga esse link: https://github.com/michail-nikolaev/task-force-arma-3-radio/wiki/API:-Classes
krose_defaultTFARLongRange		= "tf_rt1523g_sage";
//Seta o rádio normal que o jogador deve começar, caso krose_noTFARPersonalRadio seja true, os rádios serão removidos dos jogadores
krose_defaultTFARPersonal		= "tf_rf7800str";
//O Vento sempre sofrerá mudanças quando a missão for iniciada, essas alterações são randômicas
krose_randomizeWind				= true;
//Tempo em que o vento irá variar, em segundos
krose_windChangeTime 			= 200;
//Permite que o criador, em modo editor, tenha acesso a funções que ajudem a testar a missão.
krose_enableDebug				= false;
//Lado em que os jogadores estão jogando [WEST/EAST/GUER/CIV]
krose_playerSide				= WEST;
//Informa o lado do inimigo [WEST/EAST/GUER/CIV]
krose_enemySide					= EAST;
//Nome do clan, ou seja, o nome da classe onde todos os players irão utilizar a insignia no ombro, como definido no missionConfig.hpp
krose_clanName					= "KROSECLAN";
//Faz com que as unidades jogadores comecem sem nenhuma arma
krose_startWithNoWeapon			= false;
//Faz com que as unidades jogadoras comecem sem nenhum tipo de equipamento
krose_startWithNoGear			= false;
//Informa o tempo em que a missão irá demorar para começar
krose_startMissionAfter			= 30;
//Habilita o modo Spectator
krose_spectatorMode				= true;

//-------------------------------------------------------------
//Mostra os créditos da missão
krose_showCredits				= true;
//Tempo entre os créditos
krose_creditsTimer				= 10;
//Mensagens adicionais de crédito, caso não tenha nada, apenas deixe [] em branco
krose_additionalCredits			= [];
//Utilizar o nome curto da missão? O nome utilizado será o informado em krose_shortMissionName
krose_useShortName				= true;

//-------------------------------------------------------------
//Habilita ou desabilita o respawn no servidor
krose_canRespawn				= false;
//Quantidade de tickets totais
krose_maxTickets				= 10;

//-------------------------------------------------------------
//Roda um script que sempre verifica morte de civis
krose_checkForCIVKIA			= true;
//Habilita civis a respawnarem em torno do jogador
krose_ambientCiv				= true;
//Numero de civis que vão respawnar ao redor do jogador
krose_ambientCivNumber			= 1;
//Numero de Waypoints utilizados por um civil quando ele respawnar (para andar de um lado a outro) utilize entre 4 e 8 para melhor performance
krose_ambientCivWpt				= 5; 
//Distância máxima que um civil pode respawnar comparado ao player
krose_ambientCivSpawn			= 500;
//Habilita veículos civis de respawnarem próximos do jogador
krose_ambientVehicles			= true;
//Numero de veículos civis que vão respawnar ao redor do jogador
krose_ambientVehiclesNumber		= 2;
//Distância que os veículos vão respawnar
krose_ambientVehiclesSpawn		= 500;
//Delete os veículos depois de uma determinada distância
krose_ambientVehiclesDelete		= 1000;
//Ativa ou desativa o sistema de ocupação de cidades (pode ocorrer queda de performance) recomendo desligar a ambientação de civil e de veículos acima krose_ambientCiv e krose_ambientVehicles
krose_civilianOcupationSystem	= false;

//-------------------------------------------------------------
//Informa o tipo de insignia que será apresentada no hint de missão
krose_missionHintInsignia		= "Images\eliteinsig256.paa";

//-------------------------------------------------------------
//Performance da missão

//Permite a remoção de todos os corpos mortos (amigos, inimigos, veículos e etc... ajuda na performance do servidor, dependendo se há muitos corpos)
krose_cleanMission				= true;
//Distância mínima em metros que um jogador deve estar afastado de um determinado objeto morto ou destruído para ser deletado. Caso o jogador veja o corpo sendo removido, mude para 0.
krose_viewDistance				= 500;
//Tempo em segundos de que um corpo será deletado do cenário
krose_cleanDeadBodies			= 300;
//Tempo em segundos de que um veículo destruído será removido 
krose_cleanDestrVehicles		= 600;
//Tempo em segundos de que um veículo abandonado seja deletado.
krose_abandonedTimer			= 6000;

//-------------------------------------------------------------
//Este jogo utiliza um alto comando, um personagem que é identificado como a principal chave e que envia todas as mensagens para o jogador
//o alto comando precisa que um objeto chamado "HighCommand" seja criado.

//Alto comando habilitado? Caso sim, o sistema irá criar um personagem oficial de rank coronel
krose_haveHighCommand			= true;
//Callsign do alto comando
krose_highCommandName			= "BLACK PAPA";
//Argumentos para criar o callsign do alto comando, para referências siga este link: https://community.bistudio.com/wiki/setGroupId
krose_highCommandGroupFormat	= "%GroupColors %GroupCompany";
//Primeiro argumento do nome do HighCommand
krose_highCommandGroupFirstArg	= "GroupColor1";
//Segundo argumento do nome do HighCommand
krose_highCommandGroupSecondArg = "CompanyPapa";
//Unidade que será criada para o alto comando
krose_highCommandPerson			= "B_officer_F";
//Mostrar mensagens do alto comando no sidechat
krose_highCommandSideChat		= true;
//Salvar as mensagens do alto comando em forma de log
krose_saveHighCommandMsg		= true;
//Insignia do alto comando, aparecerá nos hints, caso deseje que nenhuma seja mostrada, deixe em branco: Ex: krose_highCommandInsignia = "";
krose_highCommandInsignia		= "Images\eliteinsig256.paa";