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
 * Esta função apenas pode ser utilizada quando o criador está editando a 
 * missão no editor, isso irá dar ao jogador poderes especiais sobre a missão.
*/

//Reporta 
if (isServer) then 
{
	diag_log "KROSE RPT: Init - executing Krose_fnc_maker.sqf";
};

//Adiciona uma série de opções ao criador da missão para que ele possa controlar quaisquer aspectos no editor
if (isServer && !isDedicated) then 
{
	//Aguarda pelo jogador para receber as opções
	waitUntil { player == player && alive vehicle player };

	//Cor das opções
	_colorOptions = "F2592E";

	//Opções a serem adicionadas
	player addAction ["<t align='left' color='#" + _colorOptions + "'>Alternar Modo Invisivel.</t>",{ execVM "Sources\dbg\Krose_fnc_phantom.sqf"; }];
	player addAction ["<t align='left' color='#" + _colorOptions + "'>Identificar Objeto.</t>",{ execVM "Sources\dbg\Krose_fnc_objectIdent.sqf"; }];
	player addAction ["<t align='left' color='#" + _colorOptions + "'>Criar ultimo objeto identificado.</t>",{ execVM "Sources\dbg\Krose_fnc_objectLastCreate.sqf"; }];
	player addAction ["<t align='left' color='#" + _colorOptions + "'>Adicionar 6 horas.</t>",{ skipTime 6; }];
	player addAction ["<t align='left' color='#" + _colorOptions + "'>Reduzir 6 horas.</t>",{ skipTime -6; }];
	player addAction ["<t align='left' color='#" + _colorOptions + "'>Revelar Todas as Unidades.</t>",{ execVM "Sources\dbg\Krose_fnc_revealAll.sqf"; }];
	player addAction ["<t align='left' color='#" + _colorOptions + "'>Spotar unidades no mapa.</t>",{ execVM "Sources\dbg\Krose_fnc_revealOnMap.sqf"; }];
	player addAction ["<t align='left' color='#" + _colorOptions + "'>Teleportar para posicao.</t>",{ execVM "Sources\dbg\Krose_fnc_teleport.sqf"; }];
	player addAction ["<t align='left' color='#" + _colorOptions + "'>Salvar Posicao.</t>",{ krose_initialPosition = getPos player; }];
	player addAction ["<t align='left' color='#" + _colorOptions + "'>Retornar para Posição Inicial.</t>",{ player setPos krose_initialPosition; }];
	player addAction ["<t align='left' color='#" + _colorOptions + "'>Acessar Arsenal Virtual</t>",{ ["Open", true] call BIS_fnc_arsenal; }];
	player addAction ["<t align='left' color='#" + _colorOptions + "'>Alternar Bullet Tracer</t>",{ execVM "Sources\dbg\Krose_fnc_toggleBulletTracer.sqf"; }];
	player addAction ["<t align='left' color='#" + _colorOptions + "'>Alternar Bullet Camera</t>",{ execVM "Sources\dbg\Krose_fnc_toggleBulletCam.sqf"; }];
	player addAction ["<t align='left' color='#" + _colorOptions + "'>Forçar modo espectador</t>",{ ["forced"] spawn CSSA3_fnc_createSpectateDialog; }];
	player addAction ["<t align='left' color='#" + _colorOptions + "'>Ir para ultimo civil spawnado.</t>",{ if (isNil krose_lastCivilCreated) then { ["Civilian Spawn", "Ainda não foi spawnado nenhum civil ou veículo civil"] call krose_fnc_hint; } else { player setPosASL krose_lastCivilCreated; }; }];

	player addEventHandler ["fired", { _this execVM "Sources\dbg\Krose_fnc_bullettracer.sqf"; }];
	player addEventHandler ["fired", { _this execVM "Sources\dbg\Krose_fnc_bulletCam.sqf"; }];
}