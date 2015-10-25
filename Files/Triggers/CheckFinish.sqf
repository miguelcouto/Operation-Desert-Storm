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

//Marca a missão principal como terminada
mainmissionfinished = true;
publicVariable "mainmissionfinished";

//Marca a extração
markerStr = createMarker ["EZ", expoint];
markerStr setMarkerText "Extraction Point";
markerStr setMarkerShape "ICON";
markerStr setMarkerType "hd_end";
markerStr setMarkerColor "ColorOrange";

[["Missão Completa! Siga para a extração"], "new_fnc_Overlord"] call BIS_fnc_MP;