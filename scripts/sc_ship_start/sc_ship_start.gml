
function sc_ship_start(){


image = spr_nothing;
image_japan = sprite_add("https://wiki.wgcdn.co/images/5/5b/Wows_flag_Japan.png",1,0,0,0,0);
image_usa = sprite_add("https://wiki.wgcdn.co/images/f/f2/Wows_flag_USA.png",1,0,0,0,0);
image_sssr = sprite_add("https://wiki.wgcdn.co/images/0/04/Wows_flag_Russian_Empire_and_USSR.png",1,0,0,0,0);
image_germany = sprite_add("https://wiki.wgcdn.co/images/6/6b/Wows_flag_Germany.png",1,0,0,0,0);
image_britain = sprite_add("https://wiki.wgcdn.co/images/3/34/Wows_flag_UK.png",1,0,0,0,0);
image_france = sprite_add("https://wiki.wgcdn.co/images/7/71/Wows_flag_France.png",1,0,0,0,0);
image_italy = sprite_add("https://wiki.wgcdn.co/images/d/d1/Wows_flag_Italy.png",1,0,0,0,0);
image_panasie = sprite_add("https://wiki.wgcdn.co/images/3/33/Wows_flag_Pan_Asia.png",1,0,0,0,0);
image_netherland = sprite_add("https://wiki.wgcdn.co/images/c/c8/Wows_flag_Netherlands.png",1,0,0,0,0);
image_panamerika = sprite_add("https://wiki.wgcdn.co/images/9/9e/Wows_flag_Pan_America.png",1,0,0,0,0);
image_spain = sprite_add("https://wiki.wgcdn.co/images/thumb/e/ea/Flag_of_Spain_%28state%29.jpg/80px-Flag_of_Spain_%28state%29.jpg",1,0,0,0,0);
	



	ship_number = -1;
	
		filter_ship_hp_text = "NOONE";
		filter_ship_citadel_text = "NOONE";	
		filter_ship_speed_text = "NOONE";	
		filter_ship_turn_text = "NOONE";	
		filter_ship_wheel_text = "NOONE";	
		filter_ship_he_text = "NOONE";	
		filter_ship_ap_text = "NOONE";	
		filter_ship_sap_text = "NOONE";	
	
		selected_ship = 0;
		compare_left = 0;
		compare_right = 1;
		
			compare_left_image = "";
			compare_left_image_nation = "";

			compare_right_image = "";
			compare_right_image_nation = "";
	
	
		table_armor = 0;	
		table_movement = 0;	
		table_armament = 0;	
		table_weaponery = 0;	
		table_amunition = 0;	
		table_secondary = 0;	
		table_torpedos = 0;	
		table_antiair = 0;	


}