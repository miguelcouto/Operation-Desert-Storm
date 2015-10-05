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

global_jalif = _this select 0;

nul = global_jalif spawn { 
	
	_this setName ["Jalil Afif", "Jalil", "Afif"];
	_this setFace "PersianHead_A3_01";
	
	removeallweapons _this; 
	_this unassignitem "nvgoggles"; 
	_this removeitem "nvgoggles"; 
	removeHeadgear _this;
	removeGoggles _this;
	removeVest _this;
	removeBackpack _this;
	removeUniform _this;
	
	//Adiciona as roupas e vestimentas
	_this addUniform "U_OG_Guerilla2_1";
	_this addGoggles "G_Squares_Tinted";
	_this addHeadgear "H_Beret_red";
	_this addVest "V_Rangemaster_belt";
	
	//Adiciona as Armas e munições
	_this addMagazine "30Rnd_65x39_caseless_mag"; 
	_this addWeapon "arifle_MXM_F"; 
	_this addMagazine "30Rnd_65x39_caseless_mag"; 
	_this addMagazine "30Rnd_65x39_caseless_mag";
	_this addMagazine "30Rnd_65x39_caseless_mag";
	_this addMagazine "30Rnd_65x39_caseless_mag";
};


actionID = global_jalif addAction["<t size='1' color='#E81C1C'>Search Intel</t>", {
	
	//Remove a ação do personagem
	global_jalif removeAction actionID;
	
	//Verifica se a bomba já foi desarmada, caso não, o sistema irá mostrar a posição do dispositivo nuclear
	if (!nuclearDeviceDesarmed) then 
	{
		if (!nuclearDeviceFound) then 
		{
			[["Main Mission", "New Intel", "You found informations about the nuclear device location in Jalil Afif body. Your map was updated."], "new_fnc_MissionHint"] call BIS_fnc_MP;
			
			markerStr = createMarker ["NuclearDevice", worktable];
			markerStr setMarkerText "Nuclear Device";
			markerStr setMarkerShape "ICON";
			markerStr setMarkerType "hd_flag";
			markerStr setMarkerColor "ColorOrange";
		}
		else
		{
			[["You already have the location of the nuclear device."], "new_fnc_Overlord"] call BIS_fnc_MP;
		}
	}
	else
	{
		[["No Intel", "No Intel Avaible."], "new_fnc_hint"] call BIS_fnc_MP;
	}

}];