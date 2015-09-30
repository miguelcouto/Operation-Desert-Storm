
[
	player, 
	"task02", 
	[
		"<img image='Images\nuclearDevice.jpg'/><br/><br/>É de alta prioridade que o dispositivo nuclear seja desarmado, antes das <font color='#FF3B3E'>20:00 PM</font>, ele será o responsável por mudar a face do mundo se for usado.<br/><br/>Sua localização é desconhecida, mas acredita-se que esteja em algum lugar espalhado pela cidade de Kavala.", 
		"Disarm Nuclear Device", 
		""
	], 
	"", 
	false
] call BIS_fnc_taskCreate;

[
	player, 
	"task01", 
	[
		"<font color='#8ef741'>(SECONDARY)</font><br/><br/>Sabemos através de informações que Jalil possui alguns ciêntistas trabalhando para ele, fotos de satélite confirmam a localização, foram eles que criaram o dispositivo nuclear, sua missão é ir lá e matá-los, eles não podem ficar vivos.", 
		"Kill Cientists Team", 
		""
	], 
	"", 
	false
] call BIS_fnc_taskCreate;

[
	player, 
	"task03", 
	[
		"<img image='Images\radioTower.jpg'/><br/><br/>Block the enemy comm destroying their communication towers, you need to do that to have a great advantage in your incursion to Kavala", 
		"Block Comunications", 
		""
	], 
	"", 
	false
] call BIS_fnc_taskCreate;

[
	player, 
	"task04", 
	[
		
		"<img image='Images\JalifTarget.jpg'/><br/><br/><font color='#8ef741'>Target:</font> Jalil Afif<br/><font color='#8ef741'>Age:</font> 42<br/><font color='#8ef741'>Birth:</font> June 15, 1972<br/><br/>Head of the National Liberation Front, Jalil Afif is the most dangerous terrorist alive, he pretends to launch nuclear warheads on his enemies. The only way to stop him, is putting an end to his life.", 
		"Kill Jalil Afif", 
		""
	], 
	"", 
	false
] call BIS_fnc_taskCreate;