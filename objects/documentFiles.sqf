global_documentFiles = _this select 0;
global_tableToAttach = _this select 1;

//Coloca o documento sobre a mesa
global_documentFiles attachTo [global_tableToAttach,[0.15,0.15,0.43]];
global_documentFiles setPos getPos global_tableToAttach;
global_documentFiles setDir 90;

actionID = global_documentFiles addAction["<t size='1' color='#E81C1C'>INTEL</t>", 
{ 
	//Remove a ação do dispositivo
	global_documentFiles removeAction actionID;
	
	//Informa ao jogador qual é a senha do dispositivo nuclear.
	[["Main Mission", "New Intel", format["You found a document with a number in the bottom:<br/><br/><t size='2.5'>%1</t><br/><br/>You have ONLY ONE CHANCE to put this password right!", nuclearTruePass]], "new_fnc_MissionHint"] call BIS_fnc_MP;
}];