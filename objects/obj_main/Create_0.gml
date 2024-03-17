sc_filter_start();	
sc_ship_start();

_loading_completed = 0;


ship_cruisers[0] = "";
ship_cruisers_number = 0;
ship_cruiser_download = noone;


directory_destroy(working_directory + string("Cruisers"));
var _test = http_get_file("https://raw.githubusercontent.com/Dxnxex/WoWsCompareFilter/main/Cruisers/Cruisers.txt",working_directory + string("Cruisers/Cruisers.txt"));
alarm[0] = 30;



/*


sc_ship_init("Cruiser",6);
sc_ship_name_nation("Japonsko","Aoba");
sc_ship_image("https://wiki.wgcdn.co/images/c/cd/Ship_PJSC007_Aoba_1943.png");
sc_ship_armor(30500,105);
sc_ship_movement(35.0,710,8.40);
sc_ship_armament(11.0,13.35,11.7);
sc_ship_weaponery(203,3,2,5,116);
sc_ship_amunition(1,3300,17,840,125.85,1,4700,840,125.85,0,0,0,0);



sc_ship_init("Cruiser",6);
sc_ship_name_nation("Japonsko","Gokase");
sc_ship_image("https://wiki.wgcdn.co/images/4/40/Ship_PJSC206_Gokase.png");
sc_ship_armor(25900,76);
sc_ship_movement(37.5,750,11.1);
sc_ship_armament(9.0,12.6,11.9);
sc_ship_weaponery(152,4,2,6,128);
sc_ship_amunition(1,2600,13,850,45.4,1,2900,850,45.4,0,0,0,0);



sc_ship_init("Cruiser",6);
sc_ship_name_nation("USA","Pensacola");
sc_ship_image("https://wiki.wgcdn.co/images/f/f1/Ship_PASC106_Pensacola_1944.png");
sc_ship_armor(31200,102);
sc_ship_movement(32.5,620,9.1);
sc_ship_armament(15.0,14.25,13.75);
sc_ship_weaponery(203,4,2.5,4,131);	//WRONG TURRETS
sc_ship_amunition(0,0,0,0,0,0,0,0,0,0,0,0,0);

sc_ship_init("Cruiser",6);
sc_ship_name_nation("SSSR","Budyonny");
sc_ship_image("https://wiki.wgcdn.co/images/d/d1/Ship_PRSC106_Pr_94_Budeny.png");
sc_ship_armor(25800,175);
sc_ship_movement(35.00,820,12.1);
sc_ship_armament(8.0,15.11,12.76);
sc_ship_weaponery(152,3,3,7.2,147);
sc_ship_amunition(0,0,0,0,0,0,0,0,0,0,0,0,0);

sc_ship_init("Cruiser",6);
sc_ship_name_nation("Neměcko","Nürnberg");
sc_ship_image("https://wiki.wgcdn.co/images/c/ce/Ship_PGSC106_Nurnberg.png");
sc_ship_armor(23800,100);
sc_ship_movement(32.00,720,10.6);
sc_ship_armament(6.0,14.99,12.22);
sc_ship_weaponery(150,3,3,7.6,136)
sc_ship_amunition(0,0,0,0,0,0,0,0,0,0,0,0,0);

sc_ship_init("Cruiser",6);
sc_ship_name_nation("Británie","Leander");
sc_ship_image("https://wiki.wgcdn.co/images/1/11/Ship_PBSC106_Leander.png");
sc_ship_armor(24500,100);
sc_ship_movement(32.50,710,11);
sc_ship_armament(9.0,11.97,9.96);
sc_ship_weaponery(152,4,2,7,123);
sc_ship_amunition(0,0,0,0,0,0,0,0,0,0,0,0,0);

sc_ship_init("Cruiser",6);
sc_ship_name_nation("Británie","Devonshire");
sc_ship_image("https://wiki.wgcdn.co/images/7/72/Ship_PBSC206_Devonshire.png");
sc_ship_armor(28600,114);
sc_ship_movement(31.25,710,11);
sc_ship_armament(14.0,12.73,11.17);
sc_ship_weaponery(203,4,2,8,120);
sc_ship_amunition(0,0,0,0,0,0,0,0,0,0,0,0,0);

sc_ship_init("Cruiser",6);
sc_ship_name_nation("Francie","La Galissonnière");
sc_ship_image("https://wiki.wgcdn.co/images/8/8b/Ship_PFSC106_La_Galissonniere.png");
sc_ship_armor(24800,105);
sc_ship_movement(31.00,650,10.7);
sc_ship_armament(9.0,14.47,12.92)
sc_ship_weaponery(152,3,3,12,132);
sc_ship_amunition(0,0,0,0,0,0,0,0,0,0,0,0,0);

sc_ship_init("Cruiser",6);
sc_ship_name_nation("Itálie","Trento");
sc_ship_image("https://wiki.wgcdn.co/images/a/ac/Ship_PISC106_Trento.png");
sc_ship_armor(29700,100);
sc_ship_movement(35.00,630,13.3);
sc_ship_armament(15.0,14.65,14.06);
sc_ship_weaponery(203,4,2,7,134);
sc_ship_amunition(0,0,0,0,0,0,0,0,0,0,0,0,0);

sc_ship_init("Cruiser",6);
sc_ship_name_nation("Panásie","Rahmat");
sc_ship_image("https://wiki.wgcdn.co/images/3/38/Ship_PZSC106_Rahmat.png");
sc_ship_armor(21200,89);
sc_ship_movement(32.3,580,9.1);
sc_ship_armament(7.0,12.27,9.96);
sc_ship_weaponery(113,5,2,10,126);
sc_ship_amunition(0,0,0,0,0,0,0,0,0,0,0,0,0);

sc_ship_init("Cruiser",6);
sc_ship_name_nation("Holansko","Kijkduin");
sc_ship_image("https://wiki.wgcdn.co/images/a/a2/Ship_PHSC106_Kijkduin.png");
sc_ship_armor(28000,100);
sc_ship_movement(33.00,720,12.5);
sc_ship_armament(8.5,13.24,11.52);
sc_ship_weaponery(152,4,2,8,133);
sc_ship_amunition(0,0,0,0,0,0,0,0,0,0,0,0,0);

sc_ship_init("Cruiser",6);
sc_ship_name_nation("Panamerika","Almirante Cochrane");
sc_ship_image("https://wiki.wgcdn.co/images/a/a8/Ship_PVSC106_Almirante_Cochrane.png");
sc_ship_armor(27900,130);
sc_ship_movement(34.8,680,12.1);
sc_ship_armament(7.0,13.15,9.86);
sc_ship_weaponery(152,4,2,9,113);
sc_ship_amunition(0,0,0,0,0,0,0,0,0,0,0,0,0);

sc_ship_init("Cruiser",6);
sc_ship_name_nation("Španělsko","Baleares");
sc_ship_image("https://wiki.wgcdn.co/images/1/1a/Ship_PSSC106_Baleares.png");
sc_ship_armor(30300,51);
sc_ship_movement(33.00,740,13.4);
sc_ship_armament(13.0,14.18,11.70);
sc_ship_weaponery(203,4,2,8,140);
sc_ship_amunition(0,0,0,0,0,0,0,0,0,0,0,0,0);






		


		




	
	
	
	

	
	
	
	
	
	