global_element = _this select 0;

//Cria o objeto da torre
global_radio1 = createVehicle ["Land_TTowerBig_2_F", getPos global_element, [], 0, "CAN_COLLIDE"];

//Cria o marcador da torre no mapa
markerStr = createMarker ["RadioTower1", global_radio1];
markerStr setMarkerShape "ICON";
markerStr setMarkerType "loc_Transmitter";
markerStr setMarkerColor "ColorWhite";

actionID = global_radio1 addAction["<t size='1' color='#E81C1C'>Arm Explosive</t>", {
	
	[["Main Mission", "Bomb Planted", "You have 2 minutes before the radio tower explodes."], "new_fnc_MissionHint"] call BIS_fnc_MP;
	sleep 60;
	[["Main Mission", "Bomb Planted", "You have 1 minutes before the radio tower explodes."], "new_fnc_MissionHint"] call BIS_fnc_MP;
	sleep 30;
	[["Main Mission", "Bomb Planted", "You have 30 seconds before the radio tower explodes."], "new_fnc_MissionHint"] call BIS_fnc_MP;
	sleep 20;
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
	
	global_radio1 setdamage 1;
	radioDestroyed1 = true;
	
}];