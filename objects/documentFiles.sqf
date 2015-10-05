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
	[["Main Mission", "New Intel", format["You found a document with information about the disarm password:<br/><br/><t size='2.5'>%1</t><br/><br/>You have ONLY ONE CHANCE to put this password right!", nuclearTruePass]], "new_fnc_MissionHint"] call BIS_fnc_MP;
	//Registra nas anotacoes
	[[format["I found a document with the disarm password of the nuclear device, the password are: %1, i only have one chance to do this right.", nuclearTruePass]], "new_fnc_Annotation"] call BIS_fnc_MP;
	sleep 10;
	[["Good DELTA-ONE, you found a document with the password, i hope you can remember this number, our intel says that you will have only one chance to put this password right. Dont blow everything. You can see the password in the annotations section."], "new_fnc_Overlord"] call BIS_fnc_MP;
}];