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
 * Cria uma instância para TODOS os jogadores assim que eles spanwam na missão
*/

_thisUnity = player;

_thisUnity spawn 
{
	//Atribui insignias para a unidade assim que ela aparecer no mapa, caso tenha
	if (krose_clanName != "") then 
	{
		[_this, krose_clanName] call BIS_fnc_setUnitInsignia;
	};
}






















/*
Krose_fnc_Soldier = 
{
	_thisUnit = (_this select 0);

	//Aguarda esta unidade aparecer
	_thisUnit spawn {
		//Atribui insignias para todas as unidades assim que elas respawnarem
		if (krose_clanName != "") then 
		{
			[_this, krose_clanName] call BIS_fnc_setUnitInsignia;
		};

		//Verifica se este personagem deve ser carregado sem armas
		if (krose_startWithNoWeapon) then { removeAllWeapons _this; };
		
		//Verifica se este personagem deve ser carregado sem seus equipamentos
		if (krose_startWithNoGear) then { 
			_this unassignitem "nvgoggles";
			_this removeitem "nvgoggles";  
			removeHeadgear _this;
			removeGoggles _this;
			removeVest _this;
			removeBackpack _this;
			removeAllAssignedItems _this;
		};

		//Verifica se o jogador possui rádios
		if (krose_noTFARPersonalRadio) then 
		{
			if (krose_usingTFAR) then 
			{
				_allRadios = ["tf_anprc152","tf_rf7800str","tf_anarc210","tf_anprc148jem","tf_anprc154","tf_fadak","tf_pnr1000a"];
				{
					_this unassignitem _x;
				} forEach _allRadios;
			};
		};
	};
};

if ((count playableUnits) != 0) then 
{
	//Será rodado diretamente no multiplayer
	{ 	
		[_x] call Krose_fnc_Soldier;
	} forEach playableUnits;
}
else
{
	//Será rodado diretamente no editor
	{
		[_x] call Krose_fnc_Soldier;
	} forEach switchableUnits;
};

//Inclui apenas no jogador designado pelo host, já que esta instrução é rodada diretamente no server
[player] call Krose_fnc_Soldier;
*/