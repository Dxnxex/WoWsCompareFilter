function sc_filter_ship_ammo_sap(){

for(var _i=0;_i<=ship_number;_i++) {ship_sap_result[ship_tier,_i] = "firerate";}
	

var _main = ship_sap;
var _result = ship_sap_result;

	//SHIP HP - GET PERCENTAGE
	var _low = 9999999999999999999;
	var _high = 0;

		for(var _i=0;_i<=ship_number;_i++) {
		
			if _main[ship_tier,_i] <= _low {_low=_main[ship_tier,_i]}
			if _main[ship_tier,_i] >= _high {_high=_main[ship_tier,_i]}
	
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
			
			if _main[ship_tier,_i] >=_z {_result[ship_tier,_i] = "Z TIER"};
			if _main[ship_tier,_i] >=_d {_result[ship_tier,_i] = "D TIER"};
			if _main[ship_tier,_i] >=_c {_result[ship_tier,_i] = "C TIER"};
			if _main[ship_tier,_i] >=_b {_result[ship_tier,_i] = "B TIER"};
			if _main[ship_tier,_i] >=_a {_result[ship_tier,_i] = "A TIER"};
			if _main[ship_tier,_i] >=_s {_result[ship_tier,_i] = "S TIER"};
			
		}
	
		//----FILTERS-----
		filter_ship_sap = -1;
		filter_ship_sap_low = _low;
		filter_ship_sap_high = _high;
		filter_ship_sap_per = _per;
	














}