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
 * Ativa ou desativa o bullet tracer da missão
*/

	krose_toggleBulletTracer = !krose_toggleBulletTracer;

	if (krose_toggleBulletTracer) then
	{
		["Bullet Tracer", "Bullet Tracer ativado."] call krose_fnc_hint;
	} else
	{
		["Bullet Tracer", "Bullet Tracer desativado."] call krose_fnc_hint;
	};