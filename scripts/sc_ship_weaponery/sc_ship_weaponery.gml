///@param caliber
///@param battery
///@param barrels
///@param rotation
///@param dispersion

function sc_ship_weaponery(argument0,argument1,argument2,argument3,argument4){

	ship_caliber[ship_tier,ship_number] = argument0;
	ship_battery[ship_tier,ship_number] = argument1;
	ship_barrel[ship_tier,ship_number] = argument2;
	ship_rotation[ship_tier,ship_number] = argument3;
	ship_dispersion[ship_tier,ship_number] = argument4;

}