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
execVM "Files\functions.sqf";					//Todas as fun��es

laboratorio = nil;
medhouse = nil;

//Cria o Laborat�rio, apenas no servidor, o restante dos clientes v�o ter a variavel propagada
if (isServer) then 
{
	//Isso impede que o laborat�rio seja criado dezenas de vezes dependendo da quantidade de jogadores dispon�veis
	laboratorio = createVehicle ["Land_Medevac_HQ_V1_F", getPos labPos, [], 0, "CAN_COLLIDE"];
	publicVariable "laboratorio";

	//Agora cria a torre que fica do lado do laborat�rio
	medhouse = createVehicle ["Land_Cargo_Tower_V1_No1_F", getPos medBase, [], 0, "CAN_COLLIDE"];
	publicVariable "medhouse";
};

//Carrega a caixa de armas
[weaponCrate, "B_CargoNet_01_ammo_F", [WEST], ["weapon", "ammo", "attach"]] execVM "Sources\fnc\Krose_fnc_createCrate.sqf";

//-----------------------------------------------------------------------
//Global Variables

scientistsdead = false;						//Verifica se todos os cientistas est�o mortos
nuclearDeviceDesarmed = false;				//Informa se o dispositivo nuclear foi desarmado
radioDestroyed1 = false;					//Torre de R�dio 1 n�o destruida
radioDestroyed2 = false;					//Torre de R�dio 2 n�o destruida
jalilafifdead = false;						//Informa se Jalil est� mesmo morto
missionautosave = false;					//Informa se a miss�o possui pontos de auto-save
mainmissionfinished = false;				//Informa se a miss�o principal j� foi concluida
nuclearDeviceFound = false;					//Informa se o dispositivo nuclear j� foi encontrado

if (isServer) then {
	[["Bem vindo ao campo, apenas sua equipe pode fazer este trabalho. Fa�a seu caminho at� a localiza��o dos suprimentos e esteja preparado para tudo."], "new_fnc_Overlord"] call BIS_fnc_MP;
	sleep 10;
	[["Lembre-se, seu esquadr�o est� sozinho, sem ajuda e sem suporte... Cuidado."], "new_fnc_Overlord"] call BIS_fnc_MP;
}