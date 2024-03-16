///@param HE
///@param HE_DMG
///@param HE_FIRE
///@param HE_SPEED
///@param HE_WEIGHT
///@param AP
///@param AP_DMG
///@param AP_SPEED
///@param AP_WEIGHT
///@param SAP
///@param SAP_DMG
///@param SAP_SPEED
///@param SAP_WEIGHT


function sc_ship_amunition(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10,argument11,argument12){

	ship_he[ship_tier,ship_number] = argument0;
	ship_he_dmg[ship_tier,ship_number] = argument1;
	ship_he_fire[ship_tier,ship_number] = argument2;
	ship_he_speed[ship_tier,ship_number] = argument3;
	ship_he_weight[ship_tier,ship_number] = argument4;

	ship_ap[ship_tier,ship_number] = argument5;
	ship_ap_dmg[ship_tier,ship_number] = argument6;
	ship_ap_speed[ship_tier,ship_number] = argument7;
	ship_ap_weight[ship_tier,ship_number] = argument8;
	
	ship_sap[ship_tier,ship_number] = argument9;
	ship_sap_dmg[ship_tier,ship_number] = argument10;
	ship_sap_speed[ship_tier,ship_number] = argument11;
	ship_sap_weight[ship_tier,ship_number] = argument12;
	
		if argument0 == 1 {ship_he_text[ship_tier,ship_number] = "Ano"} else {ship_he_text[ship_tier,ship_number] = "Ne"}
}