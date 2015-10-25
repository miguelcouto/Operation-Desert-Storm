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
 * Retorna o nome de um objeto selecionado pelo cursor do mouse
*/

if ((typeOf cursorTarget) == "") then 
{
	["Identificar Objeto", "Para determinar o nome de um objeto, apenas coloque a mira do mouse diretamente sobre o objeto."] call krose_fnc_hint;
	//Como não foi selecionado nada, o sistema aproveita para limpar a variavel
	krose_lastObjectClass = "";
} 
else 
{
	["Identificar Objeto", format["Nome do Objeto:<br/><br/><t color='#8BDB14'>%1</t><br/><br/> Nome foi copiado para o clipboard.", (typeOf cursorTarget)]] call krose_fnc_hint;
	//Registra em uma variavel o ultimo nome do objeto
	krose_lastObjectClass = (typeOf cursorTarget);
	copyToClipboard krose_lastObjectClass;
}