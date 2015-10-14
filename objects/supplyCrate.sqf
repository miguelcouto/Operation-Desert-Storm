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

if (isServer) then {
	clearweaponcargoGlobal _this;
	clearmagazinecargoGlobal _this;
	clearitemcargoGlobal _this;

	_weaponNumber = 5;
	_magazineNumber = 30;
	_attachNumber = 10;

	//Weapons
	_this addweaponcargoGlobal ["launch_RPG32_F",_weaponNumber];
	_this addweaponcargoGlobal ["launch_NLAW_F",_weaponNumber];
	_this addweaponcargoGlobal ["launch_B_Titan_short_F",_weaponNumber];
	_this addweaponcargoGlobal ["launch_I_Titan_short_F",_weaponNumber];
	_this addweaponcargoGlobal ["launch_O_Titan_short_F",_weaponNumber];
	_this addweaponcargoGlobal ["launch_Titan_short_F",_weaponNumber];
	_this addweaponcargoGlobal ["srifle_EBR_F",_weaponNumber];
	_this addweaponcargoGlobal ["srifle_GM6_F",_weaponNumber];
	_this addweaponcargoGlobal ["srifle_LRR_F",_weaponNumber];
	_this addweaponcargoGlobal ["LMG_Mk200_F",_weaponNumber];
	_this addweaponcargoGlobal ["SMG_01_F",_weaponNumber];
	_this addweaponcargoGlobal ["arifle_MXC_F",_weaponNumber];
	_this addweaponcargoGlobal ["arifle_MX_F",_weaponNumber];
	_this addweaponcargoGlobal ["arifle_MX_GL_F",_weaponNumber];
	_this addweaponcargoGlobal ["arifle_MXM_F",_weaponNumber];
	_this addweaponcargoGlobal ["arifle_MX_pointer_F",_weaponNumber];
	_this addweaponcargoGlobal ["arifle_MX_GL_ACO_F",_weaponNumber];
	_this addweaponcargoGlobal ["arifle_MX_GL_ACO_pointer_F",_weaponNumber];
	_this addweaponcargoGlobal ["arifle_MX_GL_Hamr_pointer_F",_weaponNumber];
	_this addweaponcargoGlobal ["arifle_MXC_Holo_F",_weaponNumber];
	_this addweaponcargoGlobal ["arifle_MX_SW_pointer_F",_weaponNumber];
	_this addweaponcargoGlobal ["arifle_MXM_Hamr_pointer_F",_weaponNumber];
	_this addweaponcargoGlobal ["arifle_MXM_SOS_pointer_F",_weaponNumber];
	_this addweaponcargoGlobal ["arifle_MXC_Black_F",_weaponNumber];
	_this addweaponcargoGlobal ["arifle_MX_Black_F",_weaponNumber];
	_this addweaponcargoGlobal ["arifle_MX_SW_Black_F",_weaponNumber];
	_this addweaponcargoGlobal ["arifle_MXM_Black_F",_weaponNumber];
	_this addweaponcargoGlobal ["arifle_MX_GL_Black_Hamr_pointer_F",_weaponNumber];
	_this addweaponcargoGlobal ["arifle_MX_Black_Hamr_pointer_F",_weaponNumber];
	_this addweaponcargoGlobal ["arifle_MX_SW_Black_Hamr_pointer_F",_weaponNumber];

	//Pistols
	_this addweaponcargoGlobal ["hgun_ACPC2_F",_weaponNumber];
	_this addweaponcargoGlobal ["hgun_P07_F",_weaponNumber];
	_this addweaponcargoGlobal ["hgun_Pistol_heavy_01_F",_weaponNumber];
	_this addweaponcargoGlobal ["hgun_Pistol_heavy_02_F",_weaponNumber];
	_this addweaponcargoGlobal ["hgun_Rook40_F",_weaponNumber];

	//Magazines
	_this addmagazinecargoGlobal ["RPG32_F",_magazineNumber];
    _this addmagazinecargoGlobal ["RPG32_HE_F",_magazineNumber];
    _this addmagazinecargoGlobal ["NLAW_F",_magazineNumber];
	_this addmagazinecargoGlobal ["Titan_AT",_magazineNumber];
	_this addmagazinecargoGlobal ["Titan_AP",_magazineNumber];
	_this addmagazinecargoGlobal ["20Rnd_762x51_Mag",_magazineNumber];
	_this addmagazinecargoGlobal ["5Rnd_127x108_Mag",_magazineNumber];
	_this addmagazinecargoGlobal ["5Rnd_127x108_APDS_Mag",_magazineNumber];
	_this addmagazinecargoGlobal ["7Rnd_408_Mag",_magazineNumber];
	_this addmagazinecargoGlobal ["200Rnd_65x39_cased_Box",_magazineNumber];
	_this addmagazinecargoGlobal ["200Rnd_65x39_cased_Box_Tracer",_magazineNumber];
	_this addmagazinecargoGlobal ["9Rnd_45ACP_Mag",_magazineNumber];
	_this addmagazinecargoGlobal ["16Rnd_9x21_Mag",_magazineNumber];
	_this addmagazinecargoGlobal ["30Rnd_9x21_Mag",_magazineNumber];
	_this addmagazinecargoGlobal ["11Rnd_45ACP_Mag",_magazineNumber];
	_this addmagazinecargoGlobal ["6Rnd_45ACP_Cylinder",_magazineNumber];
	_this addmagazinecargoGlobal ["30Rnd_45ACP_Mag_SMG_01",_magazineNumber];
	_this addmagazinecargoGlobal ["30Rnd_45ACP_Mag_SMG_01_tracer_green",_magazineNumber];
	_this addmagazinecargoGlobal ["30Rnd_65x39_caseless_mag",_magazineNumber];
	_this addmagazinecargoGlobal ["30Rnd_65x39_caseless_mag_Tracer",_magazineNumber];
	_this addmagazinecargoGlobal ["1Rnd_HE_Grenade_shell",_magazineNumber];
	_this addmagazinecargoGlobal ["UGL_FlareWhite_F",_magazineNumber];
	_this addmagazinecargoGlobal ["UGL_FlareGreen_F",_magazineNumber];
	_this addmagazinecargoGlobal ["UGL_FlareRed_F",_magazineNumber];
	_this addmagazinecargoGlobal ["UGL_FlareYellow_F",_magazineNumber];
	_this addmagazinecargoGlobal ["UGL_FlareCIR_F",_magazineNumber];
	_this addmagazinecargoGlobal ["1Rnd_Smoke_Grenade_shell",_magazineNumber];
	_this addmagazinecargoGlobal ["1Rnd_SmokeRed_Grenade_shell",_magazineNumber];
	_this addmagazinecargoGlobal ["1Rnd_SmokeGreen_Grenade_shell",_magazineNumber];
	_this addmagazinecargoGlobal ["1Rnd_SmokeYellow_Grenade_shell",_magazineNumber];
	_this addmagazinecargoGlobal ["1Rnd_SmokePurple_Grenade_shell",_magazineNumber];
	_this addmagazinecargoGlobal ["1Rnd_SmokeBlue_Grenade_shell",_magazineNumber];
	_this addmagazinecargoGlobal ["1Rnd_SmokeOrange_Grenade_shell",_magazineNumber];
	_this addmagazinecargoGlobal ["3Rnd_HE_Grenade_shell",_magazineNumber];
	_this addmagazinecargoGlobal ["3Rnd_UGL_FlareWhite_F",_magazineNumber];
	_this addmagazinecargoGlobal ["3Rnd_UGL_FlareGreen_F",_magazineNumber];
	_this addmagazinecargoGlobal ["3Rnd_UGL_FlareRed_F",_magazineNumber];
	_this addmagazinecargoGlobal ["3Rnd_UGL_FlareYellow_F",_magazineNumber];
	_this addmagazinecargoGlobal ["3Rnd_UGL_FlareCIR_F",_magazineNumber];
	_this addmagazinecargoGlobal ["3Rnd_Smoke_Grenade_shell",_magazineNumber];
	_this addmagazinecargoGlobal ["3Rnd_SmokeRed_Grenade_shell",_magazineNumber];
	_this addmagazinecargoGlobal ["3Rnd_SmokeGreen_Grenade_shell",_magazineNumber];
	_this addmagazinecargoGlobal ["3Rnd_SmokeYellow_Grenade_shell",_magazineNumber];
	_this addmagazinecargoGlobal ["3Rnd_SmokePurple_Grenade_shell",_magazineNumber];
	_this addmagazinecargoGlobal ["3Rnd_SmokeBlue_Grenade_shell",_magazineNumber];
	_this addmagazinecargoGlobal ["3Rnd_SmokeOrange_Grenade_shell",_magazineNumber];
	_this addmagazinecargoGlobal ["100Rnd_65x39_caseless_mag_Tracer",_magazineNumber];
	_this addmagazinecargoGlobal ["100Rnd_65x39_caseless_mag",_magazineNumber];

	//Attachments
	_this additemcargoGlobal ["optic_Arco",_attachNumber];
	_this additemcargoGlobal ["acc_pointer_IR",_attachNumber];
	_this additemcargoGlobal ["muzzle_snds_B",_attachNumber];
	_this additemcargoGlobal ["optic_LRPS",_attachNumber];
	_this additemcargoGlobal ["optic_SOS",_attachNumber];
	_this additemcargoGlobal ["optic_MRCO",_attachNumber];
	_this additemcargoGlobal ["acc_pointer_IR",_attachNumber];
	_this additemcargoGlobal ["muzzle_snds_acp",_attachNumber];
	_this additemcargoGlobal ["muzzle_snds_L",_attachNumber];
	_this additemcargoGlobal ["optic_MRD",_attachNumber];
	_this additemcargoGlobal ["optic_Yorris",_attachNumber];
	_this additemcargoGlobal ["optic_Holosight_smg",_attachNumber];
	_this additemcargoGlobal ["muzzle_snds_acp",_attachNumber];
	_this additemcargoGlobal ["optic_Aco_smg",_attachNumber];
	_this additemcargoGlobal ["optic_Holosight",_attachNumber];
	_this additemcargoGlobal ["optic_Hamr",_attachNumber];
	_this additemcargoGlobal ["optic_Aco",_attachNumber];
	_this additemcargoGlobal ["muzzle_snds_H",_attachNumber];
};


