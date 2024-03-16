///@param ImageShip

function sc_ship_image(argument0){

	ship_image[ship_tier,ship_number] = sprite_add(argument0,1,0,0,0,0);


		if ship_nation[ship_tier,ship_number] == "Japonsko" {ship_image_nation[ship_tier,ship_number] = image_japan};
		if ship_nation[ship_tier,ship_number] == "USA" {ship_image_nation[ship_tier,ship_number] = image_usa};
		if ship_nation[ship_tier,ship_number] == "SSSR" {ship_image_nation[ship_tier,ship_number] = image_sssr};
		if ship_nation[ship_tier,ship_number] == "Neměcko" {ship_image_nation[ship_tier,ship_number] = image_germany};
		if ship_nation[ship_tier,ship_number] == "Británie" {ship_image_nation[ship_tier,ship_number] = image_britain};
		if ship_nation[ship_tier,ship_number] == "Francie" {ship_image_nation[ship_tier,ship_number] = image_france};
		if ship_nation[ship_tier,ship_number] == "Itálie" {ship_image_nation[ship_tier,ship_number] = image_italy};
		if ship_nation[ship_tier,ship_number] == "Panásie" {ship_image_nation[ship_tier,ship_number] = image_panasie};
		if ship_nation[ship_tier,ship_number] == "Holansko" {ship_image_nation[ship_tier,ship_number] = image_netherland};
		if ship_nation[ship_tier,ship_number] == "Panamerika" {ship_image_nation[ship_tier,ship_number] = image_panamerika};
		if ship_nation[ship_tier,ship_number] == "Španělsko" {ship_image_nation[ship_tier,ship_number] = image_spain};

}