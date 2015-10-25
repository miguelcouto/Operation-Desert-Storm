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
 * Funções principais apenas utilizadas pelo sistema no editor
*/

krose_fnc_hint = {
	_hintTitle = (_this select 0);
	_hintText = (_this select 1);

	strTxtFormated = format["
	<br/><img image='Sources\images\kroselogo.paa' shadow='false' align='center' size='6'/><br/>
	<t size='2.3' color='#28B559'>%1</t><br/>
	<t color='#ffff00'>......................................</t><br/><br/>
	%2
	<br/><br/>", 
	_hintTitle, _hintText];

	strTxt = parseText(strTxtFormated);
	hintSilent strTxt;
}