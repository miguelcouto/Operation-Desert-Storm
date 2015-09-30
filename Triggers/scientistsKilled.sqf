//Task Complete
["task01","Succeeded"] call BIS_fnc_taskSetState;

//Seta os cientistas como mortos
scientistsdead = true;

//Mostra a mensagem
[["Secondary Mission", "Kill scientists team", "Good, the scientists team are all dead, they have created the most dangerous device that can change the face of the world, now you need to find some intel in this lab."], "new_fnc_MissionHint"] call BIS_fnc_MP;

//Informa que o jogo foi salvo
if (missionautosave) then {
	saveGame;
}

