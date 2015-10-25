/*
 *  _  __                   
 * | |/ /                   
 * | ' / _ __ ___  ___  ___ 
 * |  < | '__/ _ \/ __|/ _ \
 * | . \| | | (_) \__ \  __/
 * |_|\_\_|  \___/|___/\___|
 *
 * Arma 3 Mission Framework
 * Created by: Krose
 *
 * Cria uma caixa de armas ou equipamentos personalizada
 *
 * exemplo:
 * [object,boxtype,[side],[type]] execVM "Sources\fnc\Krose_fnc_createCrate.sqf";
 *
 * object = Objeto "gamelogic" que será utilizado para preencher a caixa
 * boxtype = String da caixa que será criada
 * side = WEST/EAST/RESISTANCE Você pode selecionar o array que quiser e as armas serão respawnadas
 * type
*/

krose_crateRefill = true;
krose_refreshTime = 2000;

if (!isServer) exitWith {};

private["_crateLogic", "_crateObject", "_crateSpawnObjects", "_crateSide"];
_crateLogic = _this select 0;
_crateObject = param [1, "B_CargoNet_01_ammo_F"];
_crateSide = param [2, [WEST]];
_crateSpawnObjects = _this select 3;

_weaponCount = 10;	//Quantidade de armas que serão criadas dentro da caixa
_ammoCount = 50;	//Quantidade de munições que serão criadas dentro da caixa
_itemsCount = 30;
_explosivesCount = 30;
_Base_Weapons = 1;	//Todas as armas que irão aparecer nesta caixa não possuem nenhum attachment

//Retorna a posição do objeto GameLogic
_cratePos = getPos _crateLogic;
//Cria a caixa
_boxCrate = _crateObject createVehicle _cratePos;

//Limpa o conteúdo da caixa
clearMagazineCargoGlobal _boxCrate;
clearWeaponCargoGlobal _boxCrate;
clearItemCargoGlobal _boxCrate;
clearBackpackCargoGlobal _boxCrate;

//Todas as armas primárias, lançadores e munições da NATO
_nato_primary_weapons = ["launch_NLAW_F","launch_B_Titan_short_F","launch_I_Titan_short_F","launch_O_Titan_short_F","launch_Titan_short_F","srifle_EBR_F","srifle_GM6_F","srifle_LRR_camo_F","srifle_LRR_F","LMG_Mk200_F","SMG_01_F","arifle_MXC_F","arifle_MX_F","arifle_MX_GL_F","arifle_MXM_F","arifle_MX_pointer_F","arifle_MX_GL_ACO_F","arifle_MX_GL_ACO_pointer_F","arifle_MX_GL_Hamr_pointer_F","arifle_MXC_Holo_F","arifle_MX_SW_pointer_F","arifle_MXM_Hamr_pointer_F","arifle_MXM_SOS_pointer_F","arifle_MXC_Black_F","arifle_MX_Black_F","arifle_MX_SW_Black_F","arifle_MXM_Black_F","arifle_MX_GL_Black_Hamr_pointer_F","arifle_MX_Black_Hamr_pointer_F","arifle_MX_SW_Black_Hamr_pointer_F"];
_nato_pistols_weapon = ["hgun_Pistol_Signal_F","hgun_ACPC2_F","hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_02_F","hgun_Rook40_F"];
_nato_magazines = ["6Rnd_GreenSignal_F","6Rnd_RedSignal_F","NLAW_F","Titan_AT","Titan_AP","20Rnd_762x51_Mag","5Rnd_127x108_Mag","5Rnd_127x108_APDS_Mag","7Rnd_408_Mag","200Rnd_65x39_cased_Box","200Rnd_65x39_cased_Box_Tracer","9Rnd_45ACP_Mag","16Rnd_9x21_Mag","30Rnd_9x21_Mag","11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01_tracer_green","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag_Tracer","1Rnd_HE_Grenade_shell","UGL_FlareWhite_F","UGL_FlareGreen_F","UGL_FlareRed_F","UGL_FlareYellow_F","UGL_FlareCIR_F","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeRed_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeYellow_Grenade_shell","1Rnd_SmokePurple_Grenade_shell","1Rnd_SmokeBlue_Grenade_shell","1Rnd_SmokeOrange_Grenade_shell","3Rnd_HE_Grenade_shell","3Rnd_UGL_FlareWhite_F","3Rnd_UGL_FlareGreen_F","3Rnd_UGL_FlareRed_F","3Rnd_UGL_FlareYellow_F","3Rnd_UGL_FlareCIR_F","3Rnd_Smoke_Grenade_shell","3Rnd_SmokeRed_Grenade_shell","3Rnd_SmokeGreen_Grenade_shell","3Rnd_SmokeYellow_Grenade_shell","3Rnd_SmokePurple_Grenade_shell","3Rnd_SmokeBlue_Grenade_shell","3Rnd_SmokeOrange_Grenade_shell","100Rnd_65x39_caseless_mag_Tracer","100Rnd_65x39_caseless_mag"];
_nato_uniforms = ["U_B_CombatUniform_mcam","U_B_CombatUniform_mcam_tshirt","U_B_CombatUniform_mcam_vest","U_B_GhillieSuit","U_B_HeliPilotCoveralls","U_B_Wetsuit","U_B_CombatUniform_mcam_worn","U_B_CombatUniform_wdl","U_B_CombatUniform_wdl_tshirt","U_B_CombatUniform_wdl_vest","U_B_CombatUniform_sgg","U_B_CombatUniform_sgg_tshirt","U_B_CombatUniform_sgg_vest","U_B_SpecopsUniform_sgg","U_B_PilotCoveralls","U_B_CTRG_1","U_B_CTRG_2","U_B_CTRG_3","U_B_survival_uniform","U_B_FullGhillie_lsh","U_B_FullGhillie_sard","U_B_FullGhillie_ard"];

//Todas as armas primárias, lançadores e munições da CSAT 
_csat_primary_weapons = ["launch_RPG32_F","srifle_DMR_01_F","srifle_GM6_F","srifle_GM6_camo_F","arifle_Katiba_F","arifle_Katiba_GL_F","arifle_Katiba_C_F","LMG_Zafir_F","hgun_PDW2000_F","SMG_02_F"];
_csat_pistols_weapon = ["hgun_Pistol_Signal_F","hgun_Rook40_F","hgun_Pistol_heavy_02_F"];
_csat_magazines = ["6Rnd_GreenSignal_F","6Rnd_RedSignal_F","10Rnd_762x54_Mag","RPG32_F","RPG32_HE_F","5Rnd_127x108_Mag","16Rnd_9x21_Mag","6Rnd_45ACP_Cylinder","30Rnd_9x21_Mag","5Rnd_127x108_APDS_Mag","30Rnd_9x21_Mag","16Rnd_9x21_Mag","30Rnd_65x39_caseless_green","150Rnd_762x54_Box","150Rnd_762x54_Box_Tracer","30Rnd_65x39_caseless_green_mag_Tracer","1Rnd_HE_Grenade_shell","UGL_FlareWhite_F","UGL_FlareGreen_F","UGL_FlareRed_F","UGL_FlareYellow_F","UGL_FlareCIR_F","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeRed_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeYellow_Grenade_shell","1Rnd_SmokePurple_Grenade_shell","1Rnd_SmokeBlue_Grenade_shell","1Rnd_SmokeOrange_Grenade_shell"];
_csat_uniforms = ["U_O_CombatUniform_ocamo","U_O_GhillieSuit","U_O_PilotCoveralls","U_O_Wetsuit","U_O_CombatUniform_oucamo","U_O_SpecopsUniform_ocamo","U_O_SpecopsUniform_blk","U_O_OfficerUniform_ocamo","U_O_FullGhillie_lsh","U_O_FullGhillie_sard","U_O_FullGhillie_ard"];

//Todas as armas primárias, lançadores e munições dos independentes
_guer_primary_weapons = ["launch_RPG32_F","launch_B_Titan_short_F","launch_I_Titan_short_F","launch_O_Titan_short_F","launch_Titan_short_F","LMG_Mk200_F","arifle_TRG21_F","arifle_SDAR_F","arifle_Mk20_F","LMG_Mk200_LP_BI_F"];
_guer_pistols_weapons = ["hgun_Pistol_Signal_F","hgun_ACPC2_F"];
_guer_magazines = ["6Rnd_GreenSignal_F","6Rnd_RedSignal_F","RPG32_F","Titan_AT","Titan_AP","RPG32_HE_F","200Rnd_65x39_cased_Box","9Rnd_45ACP_Mag","200Rnd_65x39_cased_Box_Tracer","20Rnd_556x45_UW_mag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_Tracer_Green","30Rnd_556x45_Stanag_Tracer_Yellow","1Rnd_HE_Grenade_shell","UGL_FlareWhite_F","UGL_FlareGreen_F","UGL_FlareRed_F","UGL_FlareYellow_F","UGL_FlareCIR_F","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeRed_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeYellow_Grenade_shell","1Rnd_SmokePurple_Grenade_shell","1Rnd_SmokeBlue_Grenade_shell","1Rnd_SmokeOrange_Grenade_shell"];
_guer_uniforms = ["U_I_CombatUniform","U_I_CombatUniform_tshirt","U_I_CombatUniform_shortsleeve","U_I_pilotCoveralls","U_I_HeliPilotCoveralls","U_I_GhillieSuit","U_I_OfficerUniform","U_I_Wetsuit", "U_I_G_resistanceLeader_F","U_I_FullGhillie_lsh","U_I_FullGhillie_sard","U_I_FullGhillie_ard","U_IG_Guerilla1_1","U_IG_Guerilla2_1","U_IG_Guerilla2_2","U_IG_Guerilla2_3","U_IG_Guerilla3_1","U_IG_Guerilla3_2","U_IG_leader","U_BG_Guerilla1_1","U_BG_Guerilla2_1","U_BG_Guerilla2_2","U_BG_Guerilla2_3","U_BG_Guerilla3_1","U_BG_Guerilla3_2","U_BG_leader","U_OG_Guerilla1_1","U_OG_Guerilla2_1","U_OG_Guerilla2_2","U_OG_Guerilla2_3","U_OG_Guerilla3_1","U_OG_Guerilla3_2","U_OG_leader"];

//Uniformes Civies
_civ_uniforms = ["U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poloshirt_salmon","U_C_Poloshirt_redwhite","U_C_Commoner1_1","U_C_Commoner1_2","U_C_Commoner1_3","U_C_Poor_1","U_C_Poor_2","U_C_Scavenger_1","U_C_Scavenger_2","U_C_Farmer","U_C_Fisherman","U_C_WorkerOveralls","U_C_FishermanOveralls","U_C_WorkerCoveralls","U_C_HunterBody_grn","U_C_HunterBody_brn","U_C_Commoner2_1","U_C_Commoner2_2","U_C_Commoner2_3","U_C_PriestBody","U_C_Poor_shorts_1","U_C_Poor_shorts_2","U_C_Commoner_shorts","U_C_ShirtSurfer_shorts","U_C_TeeSurfer_shorts_1","U_C_TeeSurfer_shorts_2","U_C_Journalist","U_C_Scientist","U_C_Driver_1","U_C_Driver_2","U_C_Driver_3","U_C_Driver_4","U_C_Driver_1_black","U_C_Driver_1_blue","U_C_Driver_1_green","U_C_Driver_1_red","U_C_Driver_1_white","U_C_Driver_1_yellow","U_C_Driver_1_orange"];

//Todos os Attachments
_all_attachments = ["optic_Arco","optic_ACO_grn_smg","optic_ACO_grn","optic_DMS","acc_pointer_IR","muzzle_snds_B","optic_LRPS","optic_SOS","optic_MRCO","muzzle_snds_acp","muzzle_snds_L","optic_MRD","optic_Yorris","optic_Holosight_smg","muzzle_snds_acp","optic_Aco_smg","optic_Holosight","optic_Hamr","optic_Aco","muzzle_snds_H"];
//Granadas e Luzes
_all_throwStuff = ["HandGrenade_Stone","HandGrenade","MiniGrenade","SmokeShell","SmokeShellYellow","SmokeShellGreen","SmokeShellRed","SmokeShellPurple","SmokeShellOrange","SmokeShellBlue","Chemlight_green","Chemlight_red","Chemlight_yellow","Chemlight_blue","B_IR_Grenade","O_IR_Grenade","I_IR_Grenade"];
//Charges e explosivos
_all_explosives = ["DemoCharge_Remote_Mag","IEDUrbanSmall_Remote_Mag","IEDLandSmall_Remote_Mag","SatchelCharge_Remote_Mag","IEDUrbanBig_Remote_Mag","IEDLandBig_Remote_Mag","ATMine_Range_Mag","ClaymoreDirectionalMine_Remote_Mag","APERSMine_Range_Mag","APERSBoundingMine_Range_Mag","SLAMDirectionalMine_Wire_Mag","APERSTripMine_Wire_Mag"];

//Todos os uniformes
_all_uniforms = ["U_B_CombatUniform_mcam","U_B_CombatUniform_mcam_tshirt","U_B_CombatUniform_mcam_vest","U_B_GhillieSuit","U_B_HeliPilotCoveralls","U_B_Wetsuit","U_O_CombatUniform_ocamo","U_O_GhillieSuit","U_O_PilotCoveralls","U_O_Wetsuit","U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poloshirt_salmon","U_C_Poloshirt_redwhite","U_C_Commoner1_1","U_C_Commoner1_2","U_C_Commoner1_3","U_Rangemaster","U_NikosBody","U_OrestesBody","U_B_CombatUniform_mcam_worn","U_B_CombatUniform_wdl","U_B_CombatUniform_wdl_tshirt","U_B_CombatUniform_wdl_vest","U_B_CombatUniform_sgg","U_B_CombatUniform_sgg_tshirt","U_B_CombatUniform_sgg_vest","U_B_SpecopsUniform_sgg","U_B_PilotCoveralls","U_O_CombatUniform_oucamo","U_O_SpecopsUniform_ocamo","U_O_SpecopsUniform_blk","U_O_OfficerUniform_ocamo","U_I_CombatUniform","U_I_CombatUniform_tshirt","U_I_CombatUniform_shortsleeve","U_I_pilotCoveralls","U_I_HeliPilotCoveralls","U_I_GhillieSuit","U_I_OfficerUniform","U_I_Wetsuit","U_Competitor","U_MillerBody","U_KerryBody","U_AttisBody","U_AntigonaBody","U_IG_Menelaos","U_C_Novak","U_OI_Scientist","U_IG_Guerilla1_1","U_IG_Guerilla2_1","U_IG_Guerilla2_2","U_IG_Guerilla2_3","U_IG_Guerilla3_1","U_IG_Guerilla3_2","U_IG_leader","U_BG_Guerilla1_1","U_BG_Guerilla2_1","U_BG_Guerilla2_2","U_BG_Guerilla2_3","U_BG_Guerilla3_1","U_BG_Guerilla3_2","U_BG_leader","U_OG_Guerilla1_1","U_OG_Guerilla2_1","U_OG_Guerilla2_2","U_OG_Guerilla2_3","U_OG_Guerilla3_1","U_OG_Guerilla3_2","U_OG_leader","U_C_Poor_1","U_C_Poor_2","U_C_Scavenger_1","U_C_Scavenger_2","U_C_Farmer","U_C_Fisherman","U_C_WorkerOveralls","U_C_FishermanOveralls","U_C_WorkerCoveralls","U_C_HunterBody_grn","U_C_HunterBody_brn","U_C_Commoner2_1","U_C_Commoner2_2","U_C_Commoner2_3","U_C_PriestBody","U_C_Poor_shorts_1","U_C_Poor_shorts_2","U_C_Commoner_shorts","U_C_ShirtSurfer_shorts","U_C_TeeSurfer_shorts_1","U_C_TeeSurfer_shorts_2","U_B_CTRG_1","U_B_CTRG_2","U_B_CTRG_3","U_B_survival_uniform","U_I_G_Story_Protagonist_F","U_I_G_resistanceLeader_F","U_C_Journalist","U_C_Scientist","U_NikosAgedBody","U_Marshal","U_B_Protagonist_VR","U_O_Protagonist_VR","U_I_Protagonist_VR","U_IG_Guerrilla_6_1","U_BG_Guerrilla_6_1","U_OG_Guerrilla_6_1","U_B_Soldier_VR","U_O_Soldier_VR","U_I_Soldier_VR","U_C_Soldier_VR","U_C_Driver_1","U_C_Driver_2","U_C_Driver_3","U_C_Driver_4","U_C_Driver_1_black","U_C_Driver_1_blue","U_C_Driver_1_green","U_C_Driver_1_red","U_C_Driver_1_white","U_C_Driver_1_yellow","U_C_Driver_1_orange","U_B_FullGhillie_lsh","U_B_FullGhillie_sard","U_B_FullGhillie_ard","U_O_FullGhillie_lsh","U_O_FullGhillie_sard","U_O_FullGhillie_ard","U_I_FullGhillie_lsh","U_I_FullGhillie_sard","U_I_FullGhillie_ard"];
//Todos os Vests
_all_vests = ["V_Rangemaster_belt","V_BandollierB_khk","V_BandollierB_cbr","V_BandollierB_rgr","V_BandollierB_blk","V_BandollierB_oli","V_PlateCarrier1_rgr","V_PlateCarrier2_rgr","V_PlateCarrier3_rgr","V_PlateCarrierGL_rgr","V_PlateCarrier1_blk","V_PlateCarrierSpec_rgr","V_Chestrig_khk","V_Chestrig_rgr","V_Chestrig_blk","V_Chestrig_oli","V_TacVest_khk","V_TacVest_brn","V_TacVest_oli","V_TacVest_blk","V_TacVest_camo","V_TacVest_blk_POLICE","V_TacVestIR_blk","V_TacVestCamo_khk","V_HarnessO_brn","V_HarnessOGL_brn","V_HarnessO_gry","V_HarnessOGL_gry","V_HarnessOSpec_brn","V_HarnessOSpec_gry","V_PlateCarrierIA1_dgtl","V_PlateCarrierIA2_dgtl","V_PlateCarrierIAGL_dgtl","V_RebreatherB","V_RebreatherIR","V_RebreatherIA","V_PlateCarrier_Kerry","V_PlateCarrierL_CTRG","V_PlateCarrierH_CTRG","V_I_G_resistanceLeader_F","V_Press_F","V_PlateCarrierGL_blk","V_PlateCarrierGL_mtp","V_PlateCarrierSpec_blk","V_PlateCarrierSpec_mtp","V_PlateCarrierIAGL_oli"];
//Todos os helmets
_all_helmets = ["H_HelmetB","H_HelmetB_camo","H_HelmetB_paint","H_HelmetB_light","H_Booniehat_khk","H_Booniehat_oli","H_Booniehat_indp","H_Booniehat_mcamo","H_Booniehat_grn","H_Booniehat_tan","H_Booniehat_dirty","H_Booniehat_dgtl","H_Booniehat_khk_hs","H_HelmetB_plain_mcamo","H_HelmetB_plain_blk","H_HelmetSpecB","H_HelmetSpecB_paint1","H_HelmetSpecB_paint2","H_HelmetSpecB_blk","H_HelmetIA","H_HelmetIA_net","H_HelmetIA_camo","H_Helmet_Kerry","H_HelmetB_grass","H_HelmetB_snakeskin","H_HelmetB_desert","H_HelmetB_black","H_HelmetB_sand","H_Cap_red","H_Cap_blu","H_Cap_oli","H_Cap_headphones","H_Cap_tan","H_Cap_blk","H_Cap_blk_CMMG","H_Cap_brn_SPECOPS","H_Cap_tan_specops_US","H_Cap_khaki_specops_UK","H_Cap_grn","H_Cap_grn_BI","H_Cap_blk_Raven","H_Cap_blk_ION","H_Cap_oli_hs","H_Cap_press","H_Cap_usblack","H_Cap_surfer","H_Cap_police","H_HelmetCrew_B","H_HelmetCrew_O","H_HelmetCrew_I","H_PilotHelmetFighter_B","H_PilotHelmetFighter_O","H_PilotHelmetFighter_I","H_PilotHelmetHeli_B","H_PilotHelmetHeli_O","H_PilotHelmetHeli_I","H_CrewHelmetHeli_B","H_CrewHelmetHeli_O","H_CrewHelmetHeli_I","H_HelmetO_ocamo","H_HelmetLeaderO_ocamo","H_MilCap_ocamo","H_MilCap_mcamo","H_MilCap_oucamo","H_MilCap_rucamo","H_MilCap_gry","H_MilCap_dgtl","H_MilCap_blue","H_HelmetB_light_grass","H_HelmetB_light_snakeskin","H_HelmetB_light_desert","H_HelmetB_light_black","H_HelmetB_light_sand","H_BandMask_blk","H_BandMask_khk","H_BandMask_reaper","H_BandMask_demon","H_HelmetO_oucamo","H_HelmetLeaderO_oucamo","H_HelmetSpecO_ocamo","H_HelmetSpecO_blk","H_Bandanna_surfer","H_Bandanna_khk","H_Bandanna_khk_hs","H_Bandanna_cbr","H_Bandanna_sgg","H_Bandanna_sand","H_Bandanna_surfer_blk","H_Bandanna_surfer_grn","H_Bandanna_gry","H_Bandanna_blu","H_Bandanna_camo","H_Bandanna_mcamo","H_Shemag_khk","H_Shemag_tan","H_Shemag_olive","H_Shemag_olive_hs","H_ShemagOpen_khk","H_ShemagOpen_tan","H_Beret_blk","H_Beret_blk_POLICE","H_Beret_red","H_Beret_grn","H_Beret_grn_SF","H_Beret_brn_SF","H_Beret_ocamo","H_Beret_02","H_Beret_Colonel","H_Watchcap_blk","H_Watchcap_cbr","H_Watchcap_khk","H_Watchcap_camo","H_Watchcap_sgg","H_TurbanO_blk","H_StrawHat","H_StrawHat_dark","H_Hat_blue","H_Hat_brown","H_Hat_camo","H_Hat_grey","H_Hat_checker","H_Hat_tan","H_RacingHelmet_1_F","H_RacingHelmet_2_F","H_RacingHelmet_3_F","H_RacingHelmet_4_F","H_RacingHelmet_1_black_F","H_RacingHelmet_1_blue_F","H_RacingHelmet_1_green_F","H_RacingHelmet_1_red_F","H_RacingHelmet_1_white_F","H_RacingHelmet_1_yellow_F","H_RacingHelmet_1_orange_F","H_Cap_marshal"];

{
	_crateSetSide = _x;
	{
		_objectToSpawn = _x;

		if (_objectToSpawn == "weapon") then
		{
			switch (_crateSetSide) do
			{
				case WEST:
				{
					{ _boxCrate addWeaponCargoGlobal [_x, _weaponCount] } forEach _nato_primary_weapons;
					{ _boxCrate addWeaponCargoGlobal [_x, _weaponCount] } forEach _nato_pistols_weapon;
				};
				case EAST:
				{
					{ _boxCrate addWeaponCargoGlobal [_x, _weaponCount] } forEach _csat_primary_weapons;
					{ _boxCrate addWeaponCargoGlobal [_x, _weaponCount] } forEach _csat_pistols_weapon;
				};
				case RESISTANCE:
				{
					{ _boxCrate addWeaponCargoGlobal [_x, _weaponCount] } forEach _guer_primary_weapons;
					{ _boxCrate addWeaponCargoGlobal [_x, _weaponCount] } forEach _guer_pistols_weapons;
				};
			};
		};

		if (_objectToSpawn == "ammo") then
		{
			switch (_crateSetSide) do
			{
				case WEST:
				{
					{ _boxCrate addMagazineCargoGlobal [_x, _ammoCount] } forEach _nato_magazines;
				};
				case EAST:
				{
					{ _boxCrate addMagazineCargoGlobal [_x, _ammoCount] } forEach _csat_magazines;
				};
				case RESISTANCE:
				{
					{ _boxCrate addMagazineCargoGlobal [_x, _ammoCount] } forEach _guer_magazines;
				};
			};
		};

		if (_objectToSpawn == "attach") then
		{
			{ _boxCrate additemcargoGlobal [_x, _itemsCount] } forEach _all_attachments;
		};

		if (_objectToSpawn == "explosive") then
		{
			{ _boxCrate addItemCargoGlobal [_x, _explosivesCount] } forEach _all_explosives;
			{ _boxCrate addItemCargoGlobal [_x, _explosivesCount] } forEach _all_throwStuff;
		};

	} forEach _crateSpawnObjects;
} forEach _crateSide;