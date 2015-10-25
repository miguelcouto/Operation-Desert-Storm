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
 * Revela todas as unidades inimigas no mapa
*/

_allEnemy = {(side _x) == krose_enemySide} count allUnits;

for "_i" from 0 to count allUnits -1 do 
{
	_item = allUnits select _i;

	if ((side _item) == krose_enemySide) then {

		markerStr = createMarker [format["enemy_%1",_i], _item];
		//markerStr setMarkerText "Nuclear Device";
		markerStr setMarkerShape "ICON";
		markerStr setMarkerType "hd_dot";
		markerStr setMarkerColor "ColorOPFOR";
	}
};