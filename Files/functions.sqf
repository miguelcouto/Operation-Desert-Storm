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

new_fnc_hint = 
{
	hintTitle = (_this select 0);
	hintText = (_this select 1);

	strTxtFormated = format["<t size='2.5' color='#28B559'>%1</t><br/><t color='#ffff00'>......................................</t><br/><br/>%2<br/><br/>", hintTitle, hintText];
	strTxt = parseText(strTxtFormated);
	hint strTxt;
};

new_fnc_Annotation =
{
	hintText = (_this select 0);
	
	//Realiza o log
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	
	player createDiaryRecord ["Annotations",[_logTimeText, "
	<br/>
	<font color='#9EE872'>REGISTERED AT:</font> " + _logTime + "<br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/>
	<font color='#FFFFFF'>NOTE:</font> " + hintText + " <br/>
	"]];
};

new_fnc_fadeEffect =
{
	cutText ["", "BLACK FADED"];
	10 fadeSound 1;
	10 fadeMusic 0.5;
	sleep 5;
	titleCut ["", "BLACK IN", 10];
};

new_fnc_MPInitialInfo = 
{	
	["E.L.I.T.E", "Episódio 1"] call BIS_fnc_infoText;
	sleep 5;
	["Operação", "Desert Storm"] call BIS_fnc_infoText;
	sleep 10;

	[["Bem vindo ao campo, apenas sua equipe pode fazer este trabalho. Faça seu caminho até a localização dos suprimentos e esteja preparado para tudo."], "new_fnc_Overlord"] call BIS_fnc_MP;
	sleep 10;
	[["Lembre-se, seu esquadrão está sozinho, sem ajuda e sem suporte... Cuidado."], "new_fnc_Overlord"] call BIS_fnc_MP;
};