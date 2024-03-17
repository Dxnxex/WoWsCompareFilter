///@param firerate
///@param firerange
///@param detection

function sc_ship_armament(argument0,argument1,argument2){

	ship_firerate[ship_tier,ship_number] = argument0;
	ship_firerange[ship_tier,ship_number] = argument1;
	ship_detection[ship_tier,ship_number] = argument2;

}