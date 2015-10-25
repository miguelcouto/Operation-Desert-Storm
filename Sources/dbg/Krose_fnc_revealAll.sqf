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
 * Realiza uma contagem de quantas unidades amigas ou inimigas existem atualmente.
*/

_cntO = {(side _x) == EAST} count allUnits;
_cntOg = {(side _x) == EAST} count allGroups;
_cntOp = {(side _x) == EAST} count playableUnits;
_cntB = {(side _x) == WEST} count allUnits;
_cntBg = {(side _x) == WEST} count allGroups;
_cntBp = {(side _x) == WEST} count playableUnits;
_cntI = {(side _x) == RESISTANCE} count allUnits;
_cntIg = {(side _x) == RESISTANCE} count allGroups;
_cntIp = {(side _x) == RESISTANCE} count playableUnits;
_cntC = {(side _x) == CIVILIAN} count allUnits;
_cntCg = {(side _x) == CIVILIAN} count allGroups;
_cntCp = {(side _x) == CIVILIAN} count playableUnits;
_cntD = count allDead;
_cntTTL = count allUnits;
_cntTTLg = count allGroups;
_cntTTLp = count playableUnits;
_cntObj = count (allMissionObjects "All");
_cntV = count vehicles;

["Unidades", format["
<t align='left'><t size='1.2' align='left' shadow='3'>Unidades Ativas Atualmente/Groups</t><br/><br/>
<t color='#A1A4AD' size='1'>Opfor: </t><t color='#FE2E2E' size='1'>%1</t><t size='.8' color='#A1A4AD' align='right'>(%2 grupos)</t><br/>
<t color='#A1A4AD' size='1'>Bluefor: </t><t color='#2E64FE' size='1'>%3</t><t size='.8' color='#A1A4AD' align='right'>(%4 grupos)</t><br/>
<t color='#A1A4AD' size='1'>Independ.: </t><t color='#A5DF00' size='1'>%5</t><t size='.8' color='#A1A4AD' align='right'>(%6 grupos)</t><br/>
<t color='#A1A4AD' size='1'>Civis: </t><t color='#DA81F5' size='1'>%7</t><t size='.8' color='#A1A4AD' align='right'>(%8 grupos)</t><br/>
<t color='#000000'>--------------------------------------------------------</t><br/>
<t color='#A1A4AD'>Unidades Totais: </t><t color='#F7D358'>%9</t><t size='.8' color='#A1A4AD' align='right'>(Total: %10)</t><br/><br/>
<t size='1.2' color='#ffffff' align='left'>Veículos Ativos</t><br/><br/>
<t color='#A1A4AD'>Vehicles count: </t><t color='#F7D358'>%11</t><br/><br/>
<t size='1.2' color='#ffffff' align='left'>Total de Objetos</t><br/><br/>
<t color='#A1A4AD'>Objects count: </t><t color='#F7D358'>%12</t><br/><br/>
<t size='1.2' color='#ffffff' align='left'>Unidades Jogáveis</t><br/><br/>
<t color='#A1A4AD'>Slots: </t><t color='#FE2E2E'>%13</t><t color='#000000'> / </t><t color='#2E64FE'>%14</t><t color='#000000'> / </t><t color='#A5DF00'>%15</t><t color='#000000'> / </t><t color='#DA81F5'>%16</t><t color='#000000'> / </t><t color='#A1A4AD'>TTL: </t><t color='#F7D358'>%17</t>
", _cntO, _cntOg, _cntB, _cntBg, _cntI, _cntIg, _cntC, _cntCg, _cntTTL, _cntTTLg, _cntV, _cntObj, _cntOp, _cntBp, _cntIp, _cntCp, _cntTTLp]] call krose_fnc_hint;