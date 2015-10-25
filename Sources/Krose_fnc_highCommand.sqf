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

//Verifica se este jogo possui um alto comando
if (krose_haveHighCommand) then
{
	//Verifica se o gamelog do highcommand realmente existe
	if (HighCommand != objNull) then
	{
		_group = createGroup krose_playerSide;
		//Cria um callsign para o grupo
		_group setGroupId [krose_highCommandGroupFormat, krose_highCommandGroupFirstArg, krose_highCommandGroupSecondArg];
		//Retorna a opção do gameLogic criado para este objetivo
		_highCommandPos = getPos HighCommand;
		//Cria a unidade
		krose_highCommandPerson createUnit[_highCommandPos, _group,"krose_highCommandObject = this;", 0.6, "COLONEL"];

		//Atribui todos os componentes na unidade de alto comando
		krose_highCommandObject spawn 
		{
			removeallweapons krose_highCommandObject; 
			krose_highCommandObject unassignitem "nvgoggles"; 
			krose_highCommandObject removeitem "nvgoggles"; 
			removeHeadgear krose_highCommandObject;
			removeGoggles krose_highCommandObject;
			removeVest krose_highCommandObject;
			removeBackpack krose_highCommandObject;
			removeUniform krose_highCommandObject;

			krose_highCommandObject forceAddUniform "U_Marshal";
			krose_highCommandObject addHeadgear "H_Beret_Colonel";
			krose_highCommandObject addVest "V_Rangemaster_belt";

			krose_highCommandObject allowDamage false;
			krose_highCommandObject disableAI "MOVE";

			[krose_highCommandObject, krose_clanName] call BIS_fnc_setUnitInsignia;
		};
	};
};