function sc_filter_ship_hp(){


	for(var _i=0;_i<=ship_number;_i++) {ship_hp_result[ship_tier,_i] = "HP";}

	//SHIP HP - GET PERCENTAGE
	var _low = 9999999999999999999;
	var _high = 0;

		for(var _i=0;_i<=ship_number;_i++) {
		
			if ship_hp[ship_tier,_i] <= _low {_low=ship_hp[ship_tier,_i]}
			if ship_hp[ship_tier,_i] >= _high {_high=ship_hp[ship_tier,_i]}
	
		}


	//SHIP HP - GET RESULT
	var _per = (_high - _low)/(_filter_coeff-1);
	var _s = _low + _per *4;
	var _a = _low + _per *3;
	var _b = _low + _per *2;
	var _c = _low + _per *1;
	var _d = _low + _per *0;
	var _z = _low + _per *-1;


		for(var _i=0;_i<=ship_number;_i++) {
			
			if ship_hp[ship_tier,_i] >=_z {ship_hp_result[ship_tier,_i] = "Z TIER"};
			if ship_hp[ship_tier,_i] >=_d {ship_hp_result[ship_tier,_i] = "D TIER"};
			if ship_hp[ship_tier,_i] >=_c {ship_hp_result[ship_tier,_i] = "C TIER"};
			if ship_hp[ship_tier,_i] >=_b {ship_hp_result[ship_tier,_i] = "B TIER"};
			if ship_hp[ship_tier,_i] >=_a {ship_hp_result[ship_tier,_i] = "A TIER"};
			if ship_hp[ship_tier,_i] >=_s {ship_hp_result[ship_tier,_i] = "S TIER"};
			
		}
	
		//----FILTERS-----
		filter_ship_hp = -1;
		filter_ship_hp_low = _low;
		filter_ship_hp_high = _high;
		filter_ship_hp_per = _per;
	














}