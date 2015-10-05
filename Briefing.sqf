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

player createDiarySubject ["Elite Log","Elite Log"];
player createDiaryRecord ["Elite Log",["Elite Comm Log","<br/><br/><font color='#6c7169'>The Elite Log is a logbook of all operational radio comms between you and Overlord, your boss, or the agency that contracted you for this job.<br/> All messages are time-stamped and saved in order of appearance.</font><br/><br/>"]];

player createDiarySubject ["Annotations","Annotations"];
player createDiaryRecord ["Annotations",["About","<br/><br/><font color='#6c7169'>In this log, you can see all important informations about this mission.</font><br/><br/>"]];

_init = player createDiaryRecord["diary", ["Description", "<br/><img image='Images\eliteinsig256.paa' shadow='false' align='center' size='3'/><br/><font color='#8ef741'>Episode 1: Desert Storm</font><br/><br/>We need your help, this is a job for a lone wolf like you. Jalil Afif is another lunatic who plans to attack your enemies with nuclear weapons, he is in a possession of a device that can change the face of the world if used. We need you to invade the city of Kavala, kill Jalil Afif and eliminate any trace of the existence od this device."]];
_init = player createDiaryRecord["diary", ["Information", "<br/><font color='#8ef741'>Mission Information</font><br/><br/>You're starting this mission totally unarmed, only with an oxygen helmet and a parachute. You jumped from the plane around 5000 meters of altitude. You should get to the supply station to arm yourself. Be prepared for anything.<br/><br/><font color='#8ef741'>Destroying the Radio Towers</font><br/><br/>To destroy the Radio Towers you need to climb until an option becomes available (The option will appear as <font color='#E81C1C'>Red Text</font>)<br/><br/><font color='#8ef741'>Final Tips</font><br/><br/>Search for documents, laptops everything can be useful in this mission to give you some important intel."]];