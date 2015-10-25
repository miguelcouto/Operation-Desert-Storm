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
 * Ativa ou desativa o bullet cam da missão
*/

	krose_toggleBulletCam = !krose_toggleBulletCam;
	if (krose_toggleBulletCam) then
	{
		["Bullet Camera", "Bullet Camera ativado."] call krose_fnc_hint;
	} else
	{
		["Bullet Camera", "Bullet Camera desativado."] call krose_fnc_hint;
	};