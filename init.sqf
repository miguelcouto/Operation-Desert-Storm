enableSaving [true,true];					//Permite salvar dentro do jogo
enableRadio true;							//Ativa o r�dio interno do jogo
tf_no_auto_long_range_radio = true;			//Remove a mochila do TaskForce Radio, j� que o jogo ser� single player n�o h� necessidade de mostr�-la

//Carrega tudo
[] execVM "Tasks.sqf";
[] execVM "Briefing.sqf";
[] execVM "AF_Keypad\AF_KP_vars.sqf";


//Fun��es valiosas

new_fnc_hint = 
{
	hintTitle = (_this select 0);
	hintText = (_this select 1);
	
	strTxtFormated = format["<t size='2.5' color='#28B559'>%1</t><br/><t color='#ffff00'>......................................</t><br/><br/>%2<br/><br/>", hintTitle, hintText];
	strTxt = parseText(strTxtFormated);
	hint strTxt;
	//systemChat hintText;
};

new_fnc_MissionHint = 
{
	hintMission = (_this select 0);
	hintTitle = (_this select 1);
	hintText = (_this select 2);
	
	strTxtFormated = format["<t size='2.5' color='#28B559'>%1</t><br/><t size='1.3' color='#287DB5'>%2</t><br/><t color='#ffff00'>......................................</t><br/><br/>%3<br/><br/>", hintMission, hintTitle, hintText];
	strTxt = parseText(strTxtFormated);
	hint strTxt;
	//systemChat hintText;
};

//-----------------------------------------------------------------------
//Global Variables

//Gera uma senha de 5 digitos que ser� utilizada para desarmar a bomba
nuclearTruePass = format["%1%2%3%4%5",round(random 9),round(random 9),round(random 9),round(random 9),round(random 9)];

scientistsdead = false;				//Verifica se todos os cientistas est�o mortos
nuclearDeviceDesarmed = false;		//Informa se o dispositivo nuclear foi desarmado
radioDestroyed1 = false;			//Torre de R�dio 1 n�o destruida
radioDestroyed2 = false;			//Torre de R�dio 2 n�o destruida
jalilafifdead = false;				//Informa se Jalil est� mesmo morto
missionautosave = false;
