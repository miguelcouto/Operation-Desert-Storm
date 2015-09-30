//Marca a tarefa como concluida
["task04","Succeeded"] call BIS_fnc_taskSetState;

//Exibe a mensagem de vitória
[["Main Mission", "Jalil Afif Dead", "Congratulations! Jalil Afif is now dead and all your plans with him."], "new_fnc_MissionHint"] call BIS_fnc_MP;

//Seta a principal variavel para true.
jalilafifdead = true;

if (missionautosave) then {
	saveGame;
}