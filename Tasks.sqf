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

waitUntil {!(isNull player)};
waitUntil {player==player};
switch (side player) do
{
	case WEST:
	{

		_task05 = [west, "task05", [		
			"<br/><font color='#8ef741'>(PRINCIPAL)</font>:Durante a noite um dos aviões da DEVGRU lançou de paraquedas muitos suprimentos, este lugar está marcado no seu mapa, alcance-o e equipe-se. Esteja preparado para tudo, lembre-se, você não sabe o que vai encontrar no seu caminho até a cidade de Kavala, você não possui outro esquadrão e nenhum suporte.", 
		"Alcance os suprimentos", ""], "", false] call BIS_fnc_taskCreate;

		_task02 = [west, "task02", [
			"<img image='Images\nuclearDevice.jpg'/><br/><br/><font color='#8ef741'>(PRINCIPAL)</font>: É de alta prioridade desarmar o dispositivo nuclear, ele pode ser responsável por mudar o face do mundo se Jalil Afif resolver utilizá-lo para sua loucura: Atacar nuclearmente seus inimigos. A localização deste dispositivo é desconhecida, imagens de satélite não conseguem localizá-los na cidade. Nossa inteligência acredita que ele está enfiado em algum buraco daquela cidade e você precisa encontrá-lo.", 
		"Desarmar Dispositivo", ""], "", false] call BIS_fnc_taskCreate;

		_task01 = [west, "task01", [
			"<br/><font color='#8ef741'>(PRINCIPAL)</font>: Sabemos que Jalil Afif contratou alguns cientistas para desenvolver este dispositivo, eles criaram uma arma letal que pode ser controlada a distância, fotos de satélite confirmaram a posição do laboratório. Sua missão é eliminar esta equipe, ninguém pode continuar vivo.", 
		"Eliminar Cientistas", ""], "", false] call BIS_fnc_taskCreate;

		

		_task03 = [west, "task03", [
			"<img image='Images\radioTower.jpg'/><br/><br/><font color='#8ef741'>(SECUNDÁRIO)</font>: Para facilitar sua entrada na cidade de Kavala, você deve destruir as torres de rádio do inimigo, isso irá impedir que eles chamem por reforços tornando a entrada ou saída da cidade de Kavala uma missão complicada.", 
		"Bloquear Comunicações", ""], "", false] call BIS_fnc_taskCreate;


		_task04 = [west, "task04", [
			"<img image='Images\JalifTarget.jpg'/><br/><br/><font color='#8ef741'>Alvo:</font> Jalil Afif<br/><font color='#8ef741'>Idade:</font> 42<br/><font color='#8ef741'>Nascimento:</font> 15 de Junho, 1972<br/><br/>Jalil Afif é líder da Frente de Liberação Nacional (FLN), é um dis mais perigosos terroristas atualmente vivo. Ele pretende lançar uma série de ataques nucleares em seus inimigos utilizando um novo dispositivo nuclear, criado apenas para este propósito. Não sabemos quando será realizado este ataque, mas, a unica maneira que temos de interromper seus planos é colocando um fim em sua vida. Ele se encontra em uma posição desconhecida dentro da cidade de Kavala. Você deve procurá-lo e eliminá-lo.", 
		"Kill Jalil Afif", ""], "", false] call BIS_fnc_taskCreate;
		
	};
	case EAST:
	{

	};
	case RESISTANCE:
	{

	};
	case CIVILIAN:
	{

	};
};