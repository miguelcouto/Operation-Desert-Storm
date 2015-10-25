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
*/

new_fnc_Overlord = 
{
	_hintText = (_this select 0);
	
	_strTxtFormated = nil;
	if (krose_highCommandInsignia != "") then 
	{
		_strTxtFormated = format["<br/><img image='%2' shadow='false' align='center' size='6'/><br/><br/><t align='left'><t color='#9EE872'>%3:</t> <t color='#AFB5AC'>%1</t></t>", _hintText, krose_highCommandInsignia, krose_highCommandName];
	}
	else
	{
		_strTxtFormated = format["<br/><t align='left'><t color='#9EE872'>%2:</t> <t color='#AFB5AC'>%1</t></t>", _hintText, krose_highCommandName];
	};

	
	_strTxt = parseText(_strTxtFormated);
	
	if (krose_haveHighCommand) then
	{
		if (krose_highCommandSideChat) then
		{
			if (alive krose_highCommandObject) then
			{
				krose_highCommandObject sideChat _hintText;
			};
		};
	};

	//Mostra o Hint na tela do jogador
	hintSilent _strTxt;

	if (krose_saveHighCommandMsg) then
	{
		//Realiza o log
		_logTime = [dayTime] call BIS_fnc_timeToString;
		_logTimeText = "Log: " + _logTime;
		_groupPlayer = groupId (group player);
		
		player createDiaryRecord ["Elite Log",[_logTimeText,"
		<br/>
		<font color='#9EE872'>DE:</font> " + krose_highCommandName + "<br/>
		<font color='#9EE872'>PARA:</font> " + _groupPlayer + "<br/>
		<font color='#9EE872'>HORA:</font> " + _logTime + "<br/>
		<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/>
		<font color='#FFFFFF'>MENSAGEM REGISTRADA:</font> " + _hintText + " <br/>
		<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/>"]];
	};
};

new_fnc_MissionHint = 
{
	_hintMission = (_this select 0);
	_hintTitle = (_this select 1);
	_hintText = (_this select 2);
	
	_strTxtFormated = nil;
	if (krose_missionHintInsignia != "") then 
	{
		_strTxtFormated = format["
		<br/><img image='%4' shadow='false' align='center' size='6'/><br/>
		<t size='2.5' color='#28B559'>%1</t><br/>
		<t size='1.3' color='#287DB5'>%2</t><br/>
		<t color='#ffff00'>......................................</t><br/><br/>
		%3
		<br/><br/>", _hintMission, _hintTitle, _hintText, krose_missionHintInsignia];
	}
	else 
	{
		_strTxtFormated = format["
		<br/>
		<t size='2.5' color='#28B559'>%1</t><br/>
		<t size='1.3' color='#287DB5'>%2</t><br/>
		<t color='#ffff00'>......................................</t><br/><br/>
		%3
		<br/><br/>", _hintMission, _hintTitle, _hintText];
	};

	_strTxt = parseText(_strTxtFormated);
	hintSilent _strTxt;
};