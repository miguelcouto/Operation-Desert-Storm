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
 * Este script garante uma marcação de todos os civis mortos em combate, um aviso é mostrado quando um civil for morto.
 *
*/

_civKia = 0;

if (isServer) then 
{
	//Roda o script principal apenas do lado do servidor
	krose_fnc_checkCivKia = {
		private ["_checkSide","_civKilledPos"];
		//Pega a posição de onde o civil morreu
		_civKilledPos = getPos (_this select 0);
		//Retorna qual lado executou o civil
		_checkSide = side (_this select 1);
		//Retorna quem matou o civil
		krose_CivMurderer = (_this select 1);

		if (rating krose_CivMurderer < 0) then {
			krose_CivMurderer addRating 9999;
			publicVariable "krose_CivMurderer";
		};

		//Verifica se quem matou o civil está do mesmo lado do jogador
		if (_checkSide == krose_playerSide) then {
			//Adiciona mais um na contagem de civis mortos
			_civKia = _civKia + 1;
			
			//Transforma as duas principais variaveis em publicas, para serem transmitidas para os clientes
			publicVariable "_civKia";
			publicVariable "krose_CivMurderer";

			krose_civKiaMarker = createMarker[format ["m_civkia_%1", _civKia], _civKilledPos];
			krose_civKiaMarker setMarkerShape "ICON";
			krose_civKiaMarker setMarkerType "mil_dot";
			krose_civKiaMarker setMarkerColor "ColorCIV";
			krose_civKiaMarker setMarkerText format ["%1",_civKia];
			publicVariable "krose_civKiaMarker";
		};
	};

	//Agora o sistema percorre por todas as unidades civis e adiciona um hadle de killed
	{
		if ((side _x == CIVILIAN) && (_x isKindOf "Man")) then {
			_x addEventHandler ["Killed", krose_fnc_checkCivKia];
		};
	} forEach allUnits;
} 
else 
{
	//Não é o servidor, mesmo assim os outros clientes irão receber a mensagem sempre que um civil for morto
	krose_fnc_checkCivKia_msg = {

		_dataFormat = format ["
		<t color='#A1A4AD' align='left'>Um civil foi declarado KIA por:</t>
		<t color='#FFFFFF' align='left'>%1 </t><t color='#A1A4AD' align='left'>(%2)</t><br/><br/>
		<t color='#A1A4AD' align='left'>O total de civis mortos é de: </t>
		<t color='#FFFFFF' align='left' size='1.2'>%3 </t><br/><br/>
		<t color='#A1A4AD' align='left' size='1'>Civis mortos são marcados com um </t><t color='#AE1AB0' align='left' shadow='1.2'>ponto roxo</t>
		", name vehicle krose_CivMurderer, krose_CivMurderer, _civKia];

		[["Info", "Civis Mortos", _dataFormat], "new_fnc_MissionHint"] call Bis_fnc_mp;

	};

	//Agora o sistema precisa detectar se a variavel _civKia foi transmitida para todos os clientes pelo servidor
	"_civKia" addPublicVariableEventHandler { call krose_fnc_checkCivKia_msg; };

};