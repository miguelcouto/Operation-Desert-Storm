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

hook_all_action = {
	_object = (_this select 0);

	actionID = _object addAction["<t size='1' color='#E81C1C'>Armar explosivo</t>", 
	{	

		_thisTower = (_this select 0);

		[["Missão Principal", "Bomba Plantada", "Você tem 2 mikes antes que a torre de rádio exploda."], "new_fnc_MissionHint"] call BIS_fnc_MP;
		sleep 60;
		[["Missão Principal", "Bomba Plantada", "Você tem 1 mikes antes que a torre de rádio exploda."], "new_fnc_MissionHint"] call BIS_fnc_MP;
		sleep 50;
		[["Missão Principal", "Bomba Plantada", "Você tem 10 segundos antes que a torre de rádio exploda."], "new_fnc_MissionHint"] call BIS_fnc_MP;
		sleep 1;
		[["Missão Principal", "Bomba Plantada", "Você tem 9 segundos antes que a torre de rádio exploda."], "new_fnc_MissionHint"] call BIS_fnc_MP;
		sleep 1;
		[["Missão Principal", "Bomba Plantada", "Você tem 8 segundos antes que a torre de rádio exploda."], "new_fnc_MissionHint"] call BIS_fnc_MP;
		sleep 1;
		[["Missão Principal", "Bomba Plantada", "Você tem 7 segundos antes que a torre de rádio exploda."], "new_fnc_MissionHint"] call BIS_fnc_MP;
		sleep 1;
		[["Missão Principal", "Bomba Plantada", "Você tem 6 segundos antes que a torre de rádio exploda."], "new_fnc_MissionHint"] call BIS_fnc_MP;
		sleep 1;
		[["Missão Principal", "Bomba Plantada", "Você tem 5 segundos antes que a torre de rádio exploda."], "new_fnc_MissionHint"] call BIS_fnc_MP;
		sleep 1;
		[["Missão Principal", "Bomba Plantada", "Você tem 4 segundos antes que a torre de rádio exploda."], "new_fnc_MissionHint"] call BIS_fnc_MP;
		sleep 1;
		[["Missão Principal", "Bomba Plantada", "Você tem 3 segundos antes que a torre de rádio exploda."], "new_fnc_MissionHint"] call BIS_fnc_MP;
		sleep 1;
		[["Missão Principal", "Bomba Plantada", "Você tem 2 segundos antes que a torre de rádio exploda."], "new_fnc_MissionHint"] call BIS_fnc_MP;
		sleep 1;
		[["Missão Principal", "Bomba Plantada", "Você tem 1 segundos antes que a torre de rádio exploda."], "new_fnc_MissionHint"] call BIS_fnc_MP;
		sleep 1;
		
		_thisTower setdamage 1;
		radioDestroyed1 = true;
		//Transmite a variavel
		publicVariable "radioDestroyed1";

		if (!radioDestroyed2) then 
		{
			[["Torre de rádio foi destruída. Resta mais uma."], "new_fnc_Overlord"] call BIS_fnc_MP;
		}
	}];

};

//Apenas o servidor vai poder criar a torre de rádio
if (isServer) then 
{
	_radioMarkerPosition = _this select 0;

	//Cria o objeto da torre
	global_radio1 = createVehicle ["Land_TTowerBig_2_F", getPos _radioMarkerPosition, [], 0, "CAN_COLLIDE"];
	publicVariable "global_radio1";

	//Cria o marcador da torre no mapa
	markerStr = createMarker ["RadioTower1", global_radio1];
	markerStr setMarkerShape "ICON";
	markerStr setMarkerType "loc_Transmitter";
	markerStr setMarkerColor "ColorWhite";

	[[global_radio1],"hook_all_action"] call BIS_fnc_MP;

};

