removeallweapons this;
this unassignitem "nvgoggles";
this removeitem "nvgoggles";
removeHeadgear this;  
removeGoggles this;
removeVest this;
removeBackpack this;
removeUniform this;
this addUniform "U_C_Scientist"; 
this disableAI "move"; 

player action ["Surrender", this];