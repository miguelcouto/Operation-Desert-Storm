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
 * Inicialização de variaveis reservadas para melhor execução do aplicativo
 *
*/

//Verifica se os principais DLCs do arma estão ativos, Marksman, Helicopters e o Bundle.
krose_have_marksman = isClass(configFile >> "CfgMods" >> "Mark");
krose_have_bundle = isClass(configFile >> "CfgMods" >> "DLCBundle");
krose_have_heli = isClass(configFile >> "CfgMods" >> "Heli");

//Agora o sistema verifica outros módulos que são também importantes
krose_have_cba = isClass (configFile >> "CfgPatches" >> "cba_main");
krose_have_tfar = isClass (configFile >> "CfgPatches" >> "task_force_radio");
krose_have_ace3 = isClass (configFile >> "CfgPatches" >> "ace_common");

//Inicializa algumas variaveis globais
//---------------------------------------------------------------------------

krose_mission_started			= false;			//Informa se a missão iniciou
krose_isHC						= false;			//Headless client
krose_lastObjectClass 			= "";				//Ultimo objeto selecionado
krose_highCommandObject			= nil;				//Objeto relacionado ao personagem criado para representar o alto comando
krose_initialPosition			= nil;				//Grava a posição inicial do jogador
krose_toggleBulletTracer		= false;			//Controla o bullet tracer da missão (apenas disponível no editor e no modo debug)
krose_toggleBulletCam			= false;			//Controla o bullet camera da missão (apenas disponível no editor e no modo debug)
krose_toggleBulletCamAbort		= false;			//Controle utilizado pelo bullet camera para cancelar a camera manualmente pressionando enter
krose_CivMurderer				= nil;				//Registra o nome do jogador que matou o ultimo civil
krose_lastCivilCreated			= nil;				//Registra a posição do ultimo civil criado no spawn

//Informa se este framework ou missão está rodando em modo alpha, irá sempre aparecer uma mensagem
krose_devBuild					= "Release";

//Configura algumas informações finais do jogo
player setVariable ["BIS_noCoreConversations",true]; //Desabilita o chatter AI
enableSentences false; //Reinforça desabilitar o chatter AI
enableSaving [krose_CanManualSaving, krose_CanAutoSaving];
enableEngineArtillery false;
enableTeamSwitch false; //Impede que um jogador troque de time