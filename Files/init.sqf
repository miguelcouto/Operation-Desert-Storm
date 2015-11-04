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


//Carrega tudo
execVM "Files\Tasks.sqf"; 						//Todas as taredas de todos os jogadores
execVM "Files\functions.sqf";					//Todas as funções

laboratorio = nil;
medhouse = nil;

//Cria o Laboratório, apenas no servidor, o restante dos clientes vão ter a variavel propagada
if (isServer) then 
{
	//Isso impede que o laboratório seja criado dezenas de vezes dependendo da quantidade de jogadores disponíveis
	laboratorio = createVehicle ["Land_Medevac_HQ_V1_F", getPos labPos, [], 0, "CAN_COLLIDE"];
	publicVariable "laboratorio";

	//Agora cria a torre que fica do lado do laboratório
	medhouse = createVehicle ["Land_Cargo_Tower_V1_No1_F", getPos medBase, [], 0, "CAN_COLLIDE"];
	publicVariable "medhouse";
};

//Carrega a caixa de armas
[weaponCrate, "B_CargoNet_01_ammo_F", [WEST], ["weapon", "ammo", "attach"]] execVM "Sources\fnc\Krose_fnc_createCrate.sqf";

//-----------------------------------------------------------------------
//Global Variables

scientistsdead = false;						//Verifica se todos os cientistas estão mortos
nuclearDeviceDesarmed = false;				//Informa se o dispositivo nuclear foi desarmado
radioDestroyed1 = false;					//Torre de Rádio 1 não destruida
radioDestroyed2 = false;					//Torre de Rádio 2 não destruida
jalilafifdead = false;						//Informa se Jalil está mesmo morto
missionautosave = false;					//Informa se a missão possui pontos de auto-save
mainmissionfinished = false;				//Informa se a missão principal já foi concluida
nuclearDeviceFound = false;					//Informa se o dispositivo nuclear já foi encontrado

if (isServer) then {
	[["Bem vindo ao campo, apenas sua equipe pode fazer este trabalho. Faça seu caminho até a localização dos suprimentos e esteja preparado para tudo."], "new_fnc_Overlord"] call BIS_fnc_MP;
	sleep 10;
	[["Lembre-se, seu esquadrão está sozinho, sem ajuda e sem suporte... Cuidado."], "new_fnc_Overlord"] call BIS_fnc_MP;
}