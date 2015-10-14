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

global_x9Laptop = _this select 0;
global_x9tableToAttach = _this select 1;

//Coloca o Laptop em cima da mesa
global_x9Laptop attachTo [global_x9tableToAttach,[0.15,0.07,0.58]];
global_x9Laptop setPos getPos global_x9tableToAttach;
global_x9Laptop setDir 180;

actionID = global_x9Laptop addAction["<t size='1' color='#E81C1C'>INTEL</t>", 
{ 
	global_x9Laptop removeAction actionID;
	//[["Main Mission", "New Intel", "This laptop contains informations about the nuclear device location."], "new_fnc_MissionHint"] call BIS_fnc_MP;
	
	markerStr = createMarker ["NuclearDevice", worktable];
	markerStr setMarkerText "Nuclear Device";
	markerStr setMarkerShape "ICON";
	markerStr setMarkerType "hd_flag";
	markerStr setMarkerColor "ColorOrange";
	
	nuclearDeviceFound = true;
	
	sleep 10;
	[["Este laptop continha informações sobre a localização do dispositivo nuclear dentro da cidade de Kavala. Uma nova marcação foi feita no seu mapa."], "new_fnc_Overlord"] call BIS_fnc_MP;
}];