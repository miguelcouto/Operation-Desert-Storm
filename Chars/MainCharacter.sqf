global_Main = _this select 0;

//Remove tudo do personagem

removeallweapons global_Main; 
global_Main unassignitem "nvgoggles"; 
global_Main removeitem "nvgoggles"; 
removeHeadgear global_Main;
removeGoggles global_Main;
removeVest global_Main;
removeBackpack global_Main;
removeUniform global_Main;
removeAllItems global_Main;

//Adiciona apenas o necessário a ele

global_Main addUniform "U_B_CombatUniform_mcam_tshirt";
global_Main addWeapon "hgun_ACPC2_snds_F";
global_Main addPrimaryWeaponItem "muzzle_snds_acp";
global_Main addmagazine "9Rnd_45ACP_Mag";
global_Main addmagazine "9Rnd_45ACP_Mag";