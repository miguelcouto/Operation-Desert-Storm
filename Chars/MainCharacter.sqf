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

_localHero = _this select 0;

nul = _localHero spawn { 
	removeallweapons _this; 
	_this unassignitem "nvgoggles"; 
	_this removeitem "nvgoggles"; 
	removeHeadgear _this;
	removeGoggles _this;
	removeVest _this;
	removeBackpack _this;
	removeUniform _this;
	removeAllItems _this;
	removeAllAssignedItems _this;
	
	_this linkItem "ItemWatch";			//Adiciona o Relógio ao jogador
	_this linkItem "ItemMap";			//Adiciona o mapa ao jogador
	
	//Adiciona apenas os itens necessário a ele, como vai começar saltando 
	//de paraquedas, o jogador apenas precisa de uma roupa e um capacete para o oxigênio

	_this addUniform "U_B_CombatUniform_mcam_vest";
	_this addHeadgear "H_CrewHelmetHeli_B";

	//Faz com que o jogador inicie com um parachute
	_this addBackpack "B_Parachute"; 
	//Faz com que ele inicie a 5000 metros de altura
	_this setPos [getPos _this select 0, getPos _this select 1, 5000]; 
	
	//Certifica que o personagem não é imortal
	_this allowDamage true;
};