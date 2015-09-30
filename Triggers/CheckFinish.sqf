
hint format["%1 %2 %3",scientistsdead,nuclearDeviceDesarmed,jalilafifdead];

if (scientistsdead && nuclearDeviceDesarmed && jalilafifdead) then 
{
	[["Main Mission", "Mission Completed", "Congratulations! You finished the mission, now, go back to your home."], "new_fnc_MissionHint"] call BIS_fnc_MP;
	sleep 5;
	["Victory",true,true] call BIS_fnc_endMission;
}
else
{
	//[["Not Completed", "You need to complete all your missions to extract!"], "new_fnc_hint"] call BIS_fnc_MP;
}