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
 * Base de configurações da missão
 *
*/

//Insignias das unidades
 class CfgUnitInsignia {
 	
 	//Insignia principal dos jogadores, não alterar o nome da classe
 	class KROSECLAN {
 		displayName = "ELITE";					//Nome que será mostrado no arsenal
 		author = "Krose"						//Author da insignia
 		texture = "Images\eliteinsig256.paa";	//Textura da insignia, recomendado que seja 128X128 arquivo PAA.
 		textureVehicle = ""; 					//Esta opção atualmente não faz nada, a Bohemia Interactive a está reservando para uso futuro
 	};
 };