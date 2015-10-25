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
 * Transforma o jogador em um "fantasma" fazendo com que ele ande entre as linhas inimigas sem ser detectado
 * esta opção apenas irá funcionar caso o jogador esteja no editor
*/

if (captive player) then
{
	player setCaptive false;
	player allowDamage true;

	["Debug", "Modo Fantasma OFF"] call krose_fnc_hint;

	//hintSilent "Modo Fantasma OFF";
}
else
{
	player setCaptive true;
	player allowDamage false;

	["Debug", "Modo Fantasma ON"] call krose_fnc_hint;
	//hintSilent "Modo Fantasma ON";
}