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

//Aqui o sistema cria as duas entradas principais que precisam ser criadas para o correto funcionamento da missão
player createDiarySubject ["Elite Log","Elite Log"];
player createDiaryRecord ["Elite Log",["Elite Comm Log","<br/><br/><font color='#6c7169'>O Elite Log é um logbook onde todas as informações operacionais entre você e a DEVGRU (Designado aqui como Overlord), a agência que contratou seus serviços.<br/>Todas as mensagens possuem timestamp e são salvas na ordem que são transmitidas</font><br/><br/>"]];

player createDiarySubject ["Annotations","Anotações"];
player createDiaryRecord ["Annotations",["Sobre","<br/><br/><font color='#6c7169'>Este log contém informações importantes sobre a missão, documentos de inteligência com dados específicos que necessitam ser guardados para uso futuro.</font><br/><br/>"]];

//Aqui entram a apresentação da missão

_init = player createDiaryRecord["diary", ["Descrição", "<br/><font color='#8ef741'>Episódio 1: Desert Storm</font><br/><br/>Precisamos de sua ajuda, Jalil Afif é mais um lunático que planeja destruir seus inimigos utilizando armas nucleares, ele reuniu uma equipe de cientistas que desenvolveu um avançado dispositivo que pode ser controlado a distância, ou seja, apertando um único botão Afif pode ordenar multiplos ataques utilizando ogivas. Este dispositivo pode mudar o mundo se for utilizado. Sua missão é eliminar os cientistas, matar Jalil Afif e desarmar este dispositivo antes que ele seja utilizado."]];

_init = player createDiaryRecord["diary", ["Informação", "<br/><font color='#8ef741'>Status</font><br/><br/>Você acabou de saltar com sua equipe de um avião, totalmente desarmado apenas com uma mascara e um paraquedas. Você encontrará uma casa onde durante a noite outro avião lançou um estoque de armamentos. Você deve chegar com sua equipe até a estação de suprimentos para se armar, esteja preparado para qualquer coisa<br/><br/><font color='#8ef741'>Destruindo Comunicações</font><br/><br/>Para destruir as comunicações do inimigo, localize as torres de rádio demarcadas no mapa, suba as escadas até que uma opção se torne disponível (a opção aparecerá <font color='#E81C1C'>em vermelho</font>) você terá dois minutos para descer da torre e levar sua equipe para uma distância segura. Esteja avisado de que o raio de explosão é grande.<br/><br/><font color='#8ef741'>Dicas Finais</font><br/><br/>Entre em instalações inimigas e procure por documentos, laptops, tudo que pode ser útil para facilitar a sua entrada na cidade de Kavala."]];