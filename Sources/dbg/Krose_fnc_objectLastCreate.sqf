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
 * Recria o ultimo objeto selecionado pelo criador
*/

if (krose_lastObjectClass != "") then
{
	_position = screenToWorld [0.5, 0.5];
	_veh = createVehicle[krose_lastObjectClass, [_position select 0, _position select 1, 0.0], [], 0, "CAN_COLLIDE"];
}
else
{
	["Criar Objeto", "Não há nenhum objeto identificado para ser copiado."] call krose_fnc_hint;
}