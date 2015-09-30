global_Laptop = _this select 0;
global_tableToAttach = _this select 1;

//Coloca o Laptop em cima da mesa
global_Laptop attachTo [global_tableToAttach,[0.15,0.15,0.58]];
global_Laptop setPos getPos global_tableToAttach;
global_Laptop setDir 90;

//Coloca o laptop em algum ponto
possibleLaptopPosition = ["laptopPosition1","laptopPosition2","laptopPosition3","laptopPosition4","laptopPosition5","laptopPosition6","laptopPosition7"];
lapTopRandomPosition = possibleLaptopPosition select (floor random 7);
global_tableToAttach setPos getmarkerpos lapTopRandomPosition;

actionID = global_Laptop addAction["<t size='1' color='#E81C1C'>Disarm Nuclear Device</t>", 
{ 
	//Remove a ação do dispositivo
	global_Laptop removeAction actionID;
	
	//Cria o keypad para o dispositivo
	createDialog "AF_Keypad";
}];