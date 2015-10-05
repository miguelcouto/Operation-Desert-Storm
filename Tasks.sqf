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


[player, "task05", [		
	"<br/><font color='#8ef741'>(PRIMARY)</font>:You need to reach the NATO supply crate to arm your self. Choose wisely what you will carry with you, remember, you are alone in this mission, no squad, no support no rescue.", 
"Reach the Supply", ""], "", true] call BIS_fnc_taskCreate;

[player, "task02", [
	"<img image='Images\nuclearDevice.jpg'/><br/><br/><font color='#8ef741'>(PRIMARY)</font>: It is a high priority disarm that nuclear device, it will be responsible for changing the face of the world if Jalil Afif launch the bombs. The location is unknown, but its believed to be in some hole through the city of Kavala.", 
"Disarm Nuclear Device", ""], "", true] call BIS_fnc_taskCreate;

[player, "task01", [
	"<br/><font color='#8ef741'>(PRIMARY)</font>: We know from some informations that Jalil Afif has some scientists working for him, satellite photos had confirm the location, they created the nuclear device, your mission is to go there kill them all and search for any valuable intel.", 
"Kill Cientists Team", ""], "", true] call BIS_fnc_taskCreate;

[player, "task03", [
	"<img image='Images\radioTower.jpg'/><br/><br/><font color='#8ef741'>(SECONDARY)</font>: To facilitate your entry into the city of Kavala, you need to destroy the communication towers", 
"Block Comunications", ""], "", true] call BIS_fnc_taskCreate;

[player, "task04", [		
	"<img image='Images\JalifTarget.jpg'/><br/><br/><font color='#8ef741'>Target:</font> Jalil Afif<br/><font color='#8ef741'>Age:</font> 42<br/><font color='#8ef741'>Birth:</font> June 15, 1972<br/><br/>Head of the National Liberation Front, Jalil Afif is the most dangerous terrorist alive, he pretends to launch nuclear warheads on his enemies. The only way to stop him, is putting an end to his life.", 
"Kill Jalil Afif", ""], "", true] call BIS_fnc_taskCreate;