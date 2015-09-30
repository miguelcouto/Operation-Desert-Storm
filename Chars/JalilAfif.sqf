global_jalif = _this select 0;

global_jalif setName ["Jalil Afif", "Jalil", "Afif"];
global_jalif setFace "PersianHead_A3_01";

removeallweapons global_jalif; 
global_jalif unassignitem "nvgoggles"; 
global_jalif removeitem "nvgoggles"; 
removeHeadgear global_jalif;
removeGoggles global_jalif;
removeVest global_jalif;
removeBackpack global_jalif;
removeUniform global_jalif;

//this disableAI "move"; 

nul = global_jalif spawn { 
	sleep 1;
	global_jalif addUniform "U_OG_Guerilla2_1";
	global_jalif addGoggles "G_Squares_Tinted";
	global_jalif addHeadgear "H_Beret_red";
	global_jalif addVest "V_Rangemaster_belt";
	
	//global_jalif addMagazine "30Rnd_65x39_caseless_mag"; 
	//global_jalif addWeapon "arifle_MXM_F"; 
	//global_jalif addMagazine "30Rnd_65x39_caseless_mag"; 
	//global_jalif addMagazine "30Rnd_65x39_caseless_mag";
};

actionID = global_jalif addAction["<t size='1' color='#E81C1C'>Search Intel</t>", {

	global_jalif removeAction actionID;
	
	if (!nuclearDeviceDesarmed) then 
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
		[["Main Mission", "No Intel", "No Intel Avaible."], "new_fnc_MissionHint"] call BIS_fnc_MP;
	}

}];