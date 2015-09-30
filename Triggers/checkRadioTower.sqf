//Conclui a tarefa
["task03","Succeeded"] call BIS_fnc_taskSetState;
//Informa o que aconteceu
[["Main Mission", "Enemy Communications Blocked", "Good! But be careful, they know that someone is messing with their communications, take care!"], "new_fnc_MissionHint"] call BIS_fnc_MP;