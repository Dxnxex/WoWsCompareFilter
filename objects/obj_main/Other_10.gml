var _i = 0;
	
	show_debug_message(string("Ships - Included Files ")); 
	

//-----Cruisers-----
var _file = file_find_first(working_directory + string("Cruisers/Cruiser_*.ini"), 0);
while ( _file != "" )
{
	
	show_debug_message(string("Check = ")+string(working_directory)+ string("Cruisers/")+string(_file)); 
    ship_cruisers[_i++] = working_directory + string("Cruisers/")+string(_file); 
    _file = file_find_next();
	ship_cruisers_number++;
}
file_find_close();


for(var _c=0;_c<ship_cruisers_number;_c++) {
	ini_open(ship_cruisers[_c]);
	
	
		var _current_tier = ini_read_real("Base informations","Tier",0);
		
		sc_ship_init("Cruiser",_current_tier);
		
			//-----Basic informations------
			ship_name[_current_tier,_c] = ini_read_string("Base informations","Name","");
				show_debug_message(string("Add = ")+string(ship_name[_current_tier,_c]));
			
			//ship_hp[_current_tier,_c+1] = ini_read_real("Base informations","Tier",0);
			//ship_hp[_current_tier,_c+1] = ini_read_string("Base informations","Class","");
			ship_nation[_current_tier,_c] = ini_read_string("Base informations","Nation","");
			ship_image[_current_tier,_c] = sprite_add( ini_read_string("Base informations","Image",""),1,0,0,0,0);
		
			//-----Durability-----
			ship_hp[_current_tier,_c] = ini_read_real("Durability","HP",0);
			ship_citadel[_current_tier,_c] = ini_read_real("Durability","Armor",0);
			
			//-----Movement-----
			ship_speed[_current_tier,_c] = ini_read_real("Movement","Speed",0);
			ship_turn[_current_tier,_c] = ini_read_real("Movement","Turn",0);
			ship_wheel[_current_tier,_c] = ini_read_real("Movement","Wheel",0);
			
			//-----Armament-----
			ship_firerate[_current_tier,_c] =	ini_read_real("Armament","FireRate",0);
			ship_firerange[_current_tier,_c] =  ini_read_real("Armament","FireRange",0);
			ship_detection[_current_tier,_c] =	ini_read_real("Armament","Detection",0);
			
			//-----Weapons-----
			ship_caliber[_current_tier,_c] =	ini_read_real("Weapons","Caliber",0);
			ship_battery[_current_tier,_c] =	ini_read_real("Weapons","Battery",0);
			ship_barrel[_current_tier,_c] =		ini_read_real("Weapons","Barrels",0);
			ship_rotation[_current_tier,_c] =	ini_read_real("Weapons","Rotation",0);
			ship_dispersion[_current_tier,_c] = ini_read_real("Weapons","Dispersion",0);			
			
			//-----Weapons-----
			ship_he[_current_tier,_c] =			ini_read_real("Amunition","HE",0);
			ship_he_dmg[_current_tier,_c] =		ini_read_real("Amunition","HE_DMG",0);
			ship_he_fire[_current_tier,_c] =	ini_read_real("Amunition","HE_FIRE",0);
			ship_he_speed[_current_tier,_c] =	ini_read_real("Amunition","HE_SPEED",0);
			ship_he_weight[_current_tier,_c] =	ini_read_real("Amunition","HE_WEIGHT",0);	

			ship_ap[_current_tier,_c] =			ini_read_real("Amunition","AP",0);
			ship_ap_dmg[_current_tier,_c] =		ini_read_real("Amunition","AP_DMG",0);
			ship_ap_speed[_current_tier,_c] =	ini_read_real("Amunition","AP_SPEED",0);
			ship_ap_weight[_current_tier,_c] =	ini_read_real("Amunition","AP_WEIGHT",0);	

			ship_sap[_current_tier,_c] =		ini_read_real("Amunition","SAP",0);
			ship_sap_dmg[_current_tier,_c] =	ini_read_real("Amunition","SAP_DMG",0);
			ship_sap_speed[_current_tier,_c] =	ini_read_real("Amunition","SAP_SPEED",0);
			ship_sap_weight[_current_tier,_c] = ini_read_real("Amunition","SAP_WEIGHT",0);	
			
			//-----Secondary-----
			ship_secondary[_current_tier,_c] =				ini_read_real("Secondary","Secondary",0);
			ship_secondary_range[_current_tier,_c] =		ini_read_real("Secondary","Secondary_range",0);
			ship_secondary_firerate[_current_tier,_c] =		ini_read_real("Secondary","Secondary_firerate",0);
			
			ship_secondary_he[_current_tier,_c] =					ini_read_real("Secondary","Secondary_he",0);
			ship_secondary_he_caliber[_current_tier,_c] =			ini_read_real("Secondary","Secondary_he_caliber",0);
			ship_secondary_he_battery[_current_tier,_c] =			ini_read_real("Secondary","Secondary_he_battery",0);
			ship_secondary_he_barrel[_current_tier,_c] =			ini_read_real("Secondary","Secondary_he_barrel",0);
			ship_secondary_he_dmg[_current_tier,_c] =				ini_read_real("Secondary","Secondary_he_dmg",0);
			ship_secondary_he_speed[_current_tier,_c] =				ini_read_real("Secondary","Secondary_he_speed",0);
			ship_secondary_he_fire[_current_tier,_c] =				ini_read_real("Secondary","Secondary_he_fire",0);
		
			ship_torpedo[_current_tier,_c] =						ini_read_real("Torpedo","Torpedo",0);			
			ship_torpedo_turret[_current_tier,_c] =					ini_read_real("Torpedo","Torpedo_turret",0);			
			ship_torpedo_tubes[_current_tier,_c] =					ini_read_real("Torpedo","Torpedo_tubes",0);					
			ship_torpedo_reload[_current_tier,_c] =					ini_read_real("Torpedo","Torpedo_reload",0);			
			ship_torpedo_rotation[_current_tier,_c] =				ini_read_real("Torpedo","Torpedo_rotation",0);			
			ship_torpedo_dmg[_current_tier,_c] =					ini_read_real("Torpedo","Torpedo_dmg",0);			
			ship_torpedo_speed[_current_tier,_c] =					ini_read_real("Torpedo","Torpedo_speed",0);			
			ship_torpedo_range[_current_tier,_c] =					ini_read_real("Torpedo","Torpedo_range",0);	
			
			ship_antiair[_current_tier,_c] =						ini_read_real("AntiAir_1","AntiAir",0);			
			ship_antiair_caliber[_current_tier,_c] =				ini_read_real("AntiAir_1","AntiAir_caliber",0);			
			ship_antiair_battery[_current_tier,_c] =				ini_read_real("AntiAir_1","AntiAir_battery",0);			
			ship_antiair_barrel[_current_tier,_c] =					ini_read_real("AntiAir_1","AntiAir_barrels",0);			
			ship_antiair_range[_current_tier,_c] =					ini_read_real("AntiAir_1","AntiAir_range",0);			
			ship_antiair_dps[_current_tier,_c] =					ini_read_real("AntiAir_1","AntiAir_dps",0);			
			
			ship_antiair_1[_current_tier,_c] =						ini_read_real("AntiAir_2","AntiAir",0);			
			ship_antiair_caliber_1[_current_tier,_c] =				ini_read_real("AntiAir_2","AntiAir_caliber",0);			
			ship_antiair_battery_1[_current_tier,_c] =				ini_read_real("AntiAir_2","AntiAir_battery",0);			
			ship_antiair_barrel_1[_current_tier,_c] =					ini_read_real("AntiAir_2","AntiAir_barrels",0);			
			ship_antiair_range_1[_current_tier,_c] =					ini_read_real("AntiAir_2","AntiAir_range",0);			
			ship_antiair_dps_1[_current_tier,_c] =					ini_read_real("AntiAir_2","AntiAir_dps",0);		
			
			ship_antiair_2[_current_tier,_c] =						ini_read_real("AntiAir_3","AntiAir",0);			
			ship_antiair_caliber_2[_current_tier,_c] =				ini_read_real("AntiAir_3","AntiAir_caliber",0);			
			ship_antiair_battery_2[_current_tier,_c] =				ini_read_real("AntiAir_3","AntiAir_battery",0);			
			ship_antiair_barrel_2[_current_tier,_c] =					ini_read_real("AntiAir_3","AntiAir_barrels",0);			
			ship_antiair_range_2[_current_tier,_c] =					ini_read_real("AntiAir_3","AntiAir_range",0);			
			ship_antiair_dps_2[_current_tier,_c] =					ini_read_real("AntiAir_3","AntiAir_dps",0);		
					
			
			
			
	ini_close();
	
			//-----AFTER-----
			if ship_he[_current_tier,_c] == 1 {ship_he_text[_current_tier,_c] = "Ano"} else {ship_he_text[_current_tier,_c] = "Ne"}

			if ship_nation[_current_tier,_c] == "Japan"		{	ship_image_nation[_current_tier,_c] = sprite_add("https://wiki.wgcdn.co/images/5/5b/Wows_flag_Japan.png",1,0,0,0,0);};
			if ship_nation[_current_tier,_c] == "USA"		{	ship_image_nation[_current_tier,_c] = sprite_add("https://wiki.wgcdn.co/images/f/f2/Wows_flag_USA.png",1,0,0,0,0);};
			if ship_nation[_current_tier,_c] == "SSSR"		{	ship_image_nation[_current_tier,_c] = sprite_add("https://wiki.wgcdn.co/images/0/04/Wows_flag_Russian_Empire_and_USSR.png",1,0,0,0,0);};
			if ship_nation[_current_tier,_c] == "Germany"	{	ship_image_nation[_current_tier,_c] = sprite_add("https://wiki.wgcdn.co/images/6/6b/Wows_flag_Germany.png",1,0,0,0,0);};
			if ship_nation[_current_tier,_c] == "Britain"	{	ship_image_nation[_current_tier,_c] = sprite_add("https://wiki.wgcdn.co/images/3/34/Wows_flag_UK.png",1,0,0,0,0);};
			if ship_nation[_current_tier,_c] == "France"	{	ship_image_nation[_current_tier,_c] = sprite_add("https://wiki.wgcdn.co/images/7/71/Wows_flag_France.png",1,0,0,0,0);};
			if ship_nation[_current_tier,_c] == "Italy"		{	ship_image_nation[_current_tier,_c] = sprite_add("https://wiki.wgcdn.co/images/d/d1/Wows_flag_Italy.png",1,0,0,0,0);};
			if ship_nation[_current_tier,_c] == "Panasie"	{	ship_image_nation[_current_tier,_c] = sprite_add("https://wiki.wgcdn.co/images/3/33/Wows_flag_Pan_Asia.png",1,0,0,0,0);};
			if ship_nation[_current_tier,_c] == "Netherland" {	ship_image_nation[_current_tier,_c] = sprite_add("https://wiki.wgcdn.co/images/c/c8/Wows_flag_Netherlands.png",1,0,0,0,0);};
			if ship_nation[_current_tier,_c] == "Panamerika" {	ship_image_nation[_current_tier,_c] = sprite_add("https://wiki.wgcdn.co/images/9/9e/Wows_flag_Pan_America.png",1,0,0,0,0);};
			if ship_nation[_current_tier,_c] == "Spain"		{	ship_image_nation[_current_tier,_c] = sprite_add("https://wiki.wgcdn.co/images/thumb/e/ea/Flag_of_Spain_%28state%29.jpg/80px-Flag_of_Spain_%28state%29.jpg",1,0,0,0,0);};

}

sc_ship_init("Cruiser",6);
sc_ship_name_nation("USA","Dallas");
sc_ship_image("https://wiki.wgcdn.co/images/9/9c/Ship_PASC206_Dallas.png");
sc_ship_armor(24000,89);
sc_ship_movement(32.5,650,11.1);
sc_ship_armament(8.5,13.00,11.52);
sc_ship_weaponery(152,4,2.5,8,131);	//WRONG TURRETS
sc_ship_amunition(0,0,0,0,0,0,0,0,0,0,0,0,0);

sc_ship_init("Cruiser",6);
sc_ship_name_nation("USA","Dallas");
sc_ship_image("https://wiki.wgcdn.co/images/9/9c/Ship_PASC206_Dallas.png");
sc_ship_armor(24000,89);
sc_ship_movement(32.5,650,11.1);
sc_ship_armament(8.5,13.00,11.52);
sc_ship_weaponery(152,4,2.5,8,131);	//WRONG TURRETS
sc_ship_amunition(0,0,0,0,0,0,0,0,0,0,0,0,0);
sc_ship_end();

_loading_completed = 1;