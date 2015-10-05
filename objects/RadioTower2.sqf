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

_radioMarkerPosition = _this select 0;

//Cria o objeto da torre
global_radio2 = createVehicle ["Land_TTowerBig_2_F", getPos _radioMarkerPosition, [], 0, "CAN_COLLIDE"];

//Cria o marcador da torre no mapa
markerStr = createMarker ["RadioTower2", global_radio2];
markerStr setMarkerShape "ICON";
markerStr setMarkerType "loc_Transmitter";
markerStr setMarkerColor "ColorWhite";

actionID = global_radio2 addAction["<t size='1' color='#E81C1C'>Arm Explosive</t>", {
	
	//[["Main Mission", "Bomb Planted", "You have 2 minutes before the radio tower explodes."], "new_fnc_MissionHint"] call BIS_fnc_MP;
	//sleep 110;
	[["Main Mission", "Bomb Planted", "You have 10 seconds before the radio tower explodes."], "new_fnc_MissionHint"] call BIS_fnc_MP;
	sleep 1;
	[["Main Mission", "Bomb Planted", "You have 9 seconds before the radio tower explodes."], "new_fnc_MissionHint"] call BIS_fnc_MP;
	sleep 1;
	[["Main Mission", "Bomb Planted", "You have 8 seconds before the radio tower explodes."], "new_fnc_MissionHint"] call BIS_fnc_MP;
	sleep 1;
	[["Main Mission", "Bomb Planted", "You have 7 seconds before the radio tower explodes."], "new_fnc_MissionHint"] call BIS_fnc_MP;
	sleep 1;
	[["Main Mission", "Bomb Planted", "You have 6 seconds before the radio tower explodes."], "new_fnc_MissionHint"] call BIS_fnc_MP;
	sleep 1;
	[["Main Mission", "Bomb Planted", "You have 5 seconds before the radio tower explodes."], "new_fnc_MissionHint"] call BIS_fnc_MP;
	sleep 1;
	[["Main Mission", "Bomb Planted", "You have 4 seconds before the radio tower explodes."], "new_fnc_MissionHint"] call BIS_fnc_MP;
	sleep 1;
	[["Main Mission", "Bomb Planted", "You have 3 seconds before the radio tower explodes."], "new_fnc_MissionHint"] call BIS_fnc_MP;
	sleep 1;
	[["Main Mission", "Bomb Planted", "You have 2 seconds before the radio tower explodes."], "new_fnc_MissionHint"] call BIS_fnc_MP;
	sleep 1;
	[["Main Mission", "Bomb Planted", "You have 1 seconds before the radio tower explodes."], "new_fnc_MissionHint"] call BIS_fnc_MP;
	sleep 1;
	
	global_radio2 setdamage 1;
	radioDestroyed2 = true;
	
	if (!radioDestroyed1) then 
	{
		[["Radio tower Destroyed! One more left!"], "new_fnc_Overlord"] call BIS_fnc_MP;
	}
	
}];