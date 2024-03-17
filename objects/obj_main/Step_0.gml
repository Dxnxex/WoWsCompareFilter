

//-----Controls-----
var _key_end = keyboard_check_pressed(vk_escape);
var _key_mouse_middle = mouse_check_button_pressed(mb_middle);
var _key_json_create = keyboard_check_pressed(ord("E"));

//-----Actions-----
if _key_end {game_end()};
if _key_mouse_middle {
	
			compare_left=0;
			compare_right=1
	
			compare_left_image = "";
			compare_left_image_nation = "";

			compare_right_image = "";
			compare_right_image_nation = "";	
			
			sc_ship_end();
	};


if _key_json_create {

ini_open("Cruisers.ini");
ini_write_string("Base informations","Name","")
ini_write_string("Base informations","Tier","");
ini_write_string("Base informations","Class","");
ini_write_string("Base informations","Nation","");
ini_write_string("Base informations","Image","");

ini_write_string("Durability","HP",0);
ini_write_string("Durability","Armor",0);

ini_write_string("Movement","Speed",0);
ini_write_string("Movement","Turn",0);
ini_write_string("Movement","Wheel",0);

ini_write_string("Armament","FireRate",0);
ini_write_string("Armament","FireRange",0);
ini_write_string("Armament","Detection",0);

ini_write_string("Weapons","Caliber",0);
ini_write_string("Weapons","Battery",0);
ini_write_string("Weapons","Barrels",0);
ini_write_string("Weapons","Rotation",0);
ini_write_string("Weapons","Dispersion",0);

ini_write_string("Amunition","HE",0);
ini_write_string("Amunition","HE_DMG",0);
ini_write_string("Amunition","HE_FIRE",0);
ini_write_string("Amunition","HE_SPEED",0);
ini_write_string("Amunition","HE_WEIGHT",0);

ini_write_string("Amunition","AP",0);
ini_write_string("Amunition","AP_DMG",0);
ini_write_string("Amunition","AP_SPEED",0);
ini_write_string("Amunition","AP_WEIGHT",0);

ini_write_string("Amunition","SAP",0);
ini_write_string("Amunition","SAP_DMG",0);
ini_write_string("Amunition","SAP_SPEED",0);
ini_write_string("Amunition","SAP_WEIGHT",0);

ini_write_string("Secondary","Secondary",0);
ini_write_string("Secondary","Secondary_range",0);
ini_write_string("Secondary","Secondary_firerate",0);

ini_write_string("Secondary","Secondary_he",0);
ini_write_string("Secondary","Secondary_he_caliber",0);
ini_write_string("Secondary","Secondary_he_battery",0);
ini_write_string("Secondary","Secondary_he_barrel",0);
ini_write_string("Secondary","Secondary_he_dmg",0);
ini_write_string("Secondary","Secondary_he_speed",0);
ini_write_string("Secondary","Secondary_he_fire",0);

ini_write_string("Secondary","Secondary_sap",0);

ini_write_string("Torpedo","Torpedo",0);
ini_write_string("Torpedo","Torpedo_turret",0);
ini_write_string("Torpedo","Torpedo_tubes",0);
ini_write_string("Torpedo","Torpedo_reload",0);
ini_write_string("Torpedo","Torpedo_rotation",0);
ini_write_string("Torpedo","Torpedo_dmg",0);
ini_write_string("Torpedo","Torpedo_speed",0);
ini_write_string("Torpedo","Torpedo_range",0);

ini_write_string("AntiAir_1","AntiAir",0);
ini_write_string("AntiAir_1","AntiAir_caliber",0);
ini_write_string("AntiAir_1","AntiAir_battery",0);
ini_write_string("AntiAir_1","AntiAir_barrels",0);
ini_write_string("AntiAir_1","AntiAir_range",0);
ini_write_string("AntiAir_1","AntiAir_dps",0);

ini_write_string("AntiAir_2","AntiAir",0);
ini_write_string("AntiAir_2","AntiAir_caliber",0);
ini_write_string("AntiAir_2","AntiAir_battery",0);
ini_write_string("AntiAir_2","AntiAir_barrels",0);
ini_write_string("AntiAir_2","AntiAir_range",0);
ini_write_string("AntiAir_2","AntiAir_dps",0);

ini_write_string("AntiAir_3","AntiAir",0);
ini_write_string("AntiAir_3","AntiAir_caliber",0);
ini_write_string("AntiAir_3","AntiAir_battery",0);
ini_write_string("AntiAir_3","AntiAir_barrels",0);
ini_write_string("AntiAir_3","AntiAir_range",0);
ini_write_string("AntiAir_3","AntiAir_dps",0);



ini_close();




};



/*

