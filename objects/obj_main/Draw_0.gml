draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(fnt_main);

var _text = string("");
draw_text(mouse_x,mouse_y,_text);


//----FILTER BAR VARIABLES-----
sc_filter_bar_hp(0,0);
sc_filter_bar_citadel(1,0);
sc_filter_bar_speed(2,0);
sc_filter_bar_turn(3,0);
sc_filter_bar_wheel(4,0);
sc_filter_bar_firerate(5,0);
sc_filter_bar_firerange(6,0);
sc_filter_bar_detection(7,0);
sc_filter_bar_ammo_he(8,0);
sc_filter_bar_ammo_ap(9,0);
sc_filter_bar_ammo_sap(10,0);

//-----Variables-----
	var _w_count_max = 6;
	var _scale = 1;
	var _w = 160*_scale; var _h=94*_scale;var _h1 = 20; var _hr = _h+_h1;

//-----Text variables-----
	var _col = c_black;
	var _col_black = c_black;
	var _col_up = c_green;
	var _col_down = c_maroon;
	var _col_equal = c_navy;
	var _text_separator = "<><><><><><><><><><><><><><>";
	var _arrow_size = 25;
	var _arrow_y_edit = 0;
	var _xx_arrow_side = 20;
	var _yo = 21;

		//Table variables
		var _yy_rect_off = 2;
		
for(var _i=0;_i<=ship_number;_i++){
	
var _disable = 0;


	if filter_ship_hp!=0 &&			ship_hp[ship_tier,_i]		<(filter_ship_hp_low + filter_ship_hp_per*filter_ship_hp) {_disable = 1;};
	if filter_ship_citadel!=0 &&	ship_citadel[ship_tier,_i]	<(filter_ship_citadel_low + filter_ship_citadel_per*filter_ship_citadel) {_disable = 1;};
	if filter_ship_speed!=0 &&		ship_speed[ship_tier,_i]	<(filter_ship_speed_low + filter_ship_speed_per*filter_ship_speed) {_disable = 1;};
	if filter_ship_turn!=0 &&		ship_turn[ship_tier,_i]		>(filter_ship_turn_high - filter_ship_turn_per*filter_ship_turn) {_disable = 1;};
	if filter_ship_wheel!=0 &&		ship_wheel[ship_tier,_i]		>(filter_ship_wheel_high - filter_ship_wheel_per*filter_ship_wheel) {_disable = 1;};
	if filter_ship_firerate!=0 &&		ship_firerate[ship_tier,_i]		>(filter_ship_firerate_high - filter_ship_firerate_per*filter_ship_firerate) {_disable = 1;};
	if filter_ship_firerange!=0 &&		ship_firerange[ship_tier,_i]	<(filter_ship_firerange_low + filter_ship_firerange_per*filter_ship_firerange) {_disable = 1;};
	if filter_ship_detection!=0 &&		ship_detection[ship_tier,_i]		>(filter_ship_detection_high - filter_ship_detection_per*filter_ship_detection) {_disable = 1;};	
		
		if filter_ship_he!=-1 &&	ship_he[ship_tier,_i] != (filter_ship_he) {_disable = 1;};	
		if filter_ship_ap!=-1 &&	ship_ap[ship_tier,_i] != (filter_ship_ap) {_disable = 1;};	
		if filter_ship_sap!=-1 &&	ship_sap[ship_tier,_i] != (filter_ship_sap) {_disable = 1;};
		
		
		//if filter_ship_yyy!=0 &&		ship_yyy[ship_tier,_i]		>(filter_ship_yyy_high - filter_ship_yyy_per*filter_ship_yyy) {_disable = 1;};		
		//if filter_ship_xxx!=0 &&		ship_xxx[ship_tier,_i]	<(filter_ship_xxx_low + filter_ship_xxx_per*filter_ship_xxx) {_disable = 1;};

		
	if _disable == 0 {
		
		//Get ALL SHIPS
		var _offsety = 300;

		var _x = _w*_i-(_w*_w_count_max)*floor(_i/_w_count_max); var _y = _offsety+_hr*floor(_i/_w_count_max);

		draw_sprite_stretched(ship_image_nation[ship_tier,_i],0,_x,_y,_w,_h);
		draw_sprite_stretched(ship_image[ship_tier,_i],0,_x,_y,_w,_h);

		if point_in_rectangle(mouse_x,mouse_y,_x,_y,_x+_w,_y+_h) && mouse_check_button_pressed(mb_left)	 && compare_right!=_i	{	
			selected_ship = _i;
			compare_left = _i;	
			
			compare_left_image =		ship_image[ship_tier,_i];
			compare_left_image_nation = ship_image_nation[ship_tier,_i];
			
			};
		
		
		if point_in_rectangle(mouse_x,mouse_y,_x,_y,_x+_w,_y+_h) && mouse_check_button_pressed(mb_right) && compare_left!=_i	{
			
			compare_right = _i;			
			
			compare_right_image =		ship_image[ship_tier,_i];
			compare_right_image_nation = ship_image_nation[ship_tier,_i];
			
			};
		
		draw_text(_x+_w/2,_y+_h,ship_name[ship_tier,_i] );
		
	}

		
	
}

//-----Compare-----

	
	
#region LEFT COMPARE

if compare_left!=noone {

draw_set_color(c_black);
draw_set_halign(fa_right);
draw_set_valign(fa_top);
draw_set_font(fnt_side);
	
	//Variables
	var _xx = 1400;
	var _yy = 300;
	var _xx_comp = 0;
	var _i = -1;
	
		//Table variables
		var _xx_rect_off_left = 0;
		var _xx_rect_w_left = 400;
		
		var _xx_rect_off_right = 10;
		var _xx_rect_w_right = 0;
		

		
	var _arrow_left = spr_nothing;
	var _arrow_right = spr_nothing;
	var _arrow_equal = spr_nothing;
	
	var _side1 = compare_left;
	var _side2 = compare_right;
	
	//Image ABOVE
	var _x = _xx-_w;
	var _y = _yy-_h;
	
	if compare_left_image!="" {
		draw_sprite_stretched(compare_left_image_nation,0,_x,_y,_w,_h);	
		draw_sprite_stretched(compare_left_image,0,_x,_y,_w,_h);
	}


//-----START---
_i++;draw_text(_xx,_yy+_yo*_i,string("Jméno")+string(": ")+string(ship_name[6,_side1]));
_i++;draw_text(_xx,_yy+_yo*_i,string("Národnost")+string(": ")+string(ship_nation[6,_side1]));
_i++;draw_text(_xx,_yy+_yo*_i,string("Třída")+string(": ")+string(ship_class));


#region HP & ARMOR

_i++;draw_text(_xx,_yy+_yo*_i,string("ARMOR"));
draw_rectangle(_xx-_xx_rect_w_left+_xx_rect_off_left,_yy+_yo*_i+_yy_rect_off,_xx+_xx_rect_w_right+_xx_rect_off_right,_yy+_yo*(_i+1)-_yy_rect_off,1);
if point_in_rectangle(mouse_x,mouse_y,_xx-_xx_rect_w_left+_xx_rect_off_left,_yy+_yo*_i+_yy_rect_off,_xx+_xx_rect_w_right+_xx_rect_off_right,_yy+_yo*(_i+1)-_yy_rect_off) && mouse_check_button_pressed(mb_left) 
{if table_armor==0 {table_armor=1} else {table_armor=0} }

if table_armor == 1 {

	if (ship_hp[6,_side1]>ship_hp[6,_side2])																				{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_hp[6,_side1]<ship_hp[6,_side2])																				{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_hp[6,_side1]==ship_hp[6,_side2])																				{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	_i++;draw_text_color(_xx,_yy+_yo*_i,string("Životy")+string(": ")+string(ship_hp[6,_side1]),_col,_col,_col,_col,1);

	if (ship_citadel[6,_side1]>ship_citadel[6,_side2])																		{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_citadel[6,_side1]<ship_citadel[6,_side2])																		{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_citadel[6,_side1]==ship_citadel[6,_side2])																	{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	_i++;draw_text_color(_xx,_yy+_yo*_i,string("Pancíř")+string(": ")+string(ship_citadel[6,_side1]),_col,_col,_col,_col,1);

};
#endregion

#region MOVEMENT
_i++;draw_text(_xx,_yy+_yo*_i,string("MOVEMENT"));
draw_rectangle(_xx-_xx_rect_w_left+_xx_rect_off_left,_yy+_yo*_i+_yy_rect_off,_xx+_xx_rect_w_right+_xx_rect_off_right,_yy+_yo*(_i+1)-_yy_rect_off,1);
if point_in_rectangle(mouse_x,mouse_y,_xx-_xx_rect_w_left+_xx_rect_off_left,_yy+_yo*_i+_yy_rect_off,_xx+_xx_rect_w_right+_xx_rect_off_right,_yy+_yo*(_i+1)-_yy_rect_off) && mouse_check_button_pressed(mb_left) 
{if table_movement==0 {table_movement=1} else {table_movement=0} }

if table_movement == 1 {

	if (ship_speed[6,_side1]>ship_speed[6,_side2])																			{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_speed[6,_side1]<ship_speed[6,_side2])																			{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_speed[6,_side1]==ship_speed[6,_side2])																		{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	_i++;draw_text_color(_xx,_yy+_yo*_i,string("Rychlost")+string(": ")+string(ship_speed[6,_side1])+string(" ")+string("kn"),_col,_col,_col,_col,1);


	if (ship_turn[6,_side1]<ship_turn[6,_side2])																			{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_turn[6,_side1]>ship_turn[6,_side2])																			{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_turn[6,_side1]==ship_turn[6,_side2])																			{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	_i++;draw_text_color(_xx,_yy+_yo*_i,string("Poloměr otáčení")+string(": ")+string(ship_turn[6,_side1])+string(" ")+string("m"),_col,_col,_col,_col,1);

	if (ship_wheel[6,_side1]<ship_wheel[6,_side2])																			{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_wheel[6,_side1]>ship_wheel[6,_side2])																			{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_wheel[6,_side1]==ship_wheel[6,_side2])																		{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	_i++;draw_text_color(_xx,_yy+_yo*_i,string("Rychlost kormidla")+string(": ")+string(ship_wheel[6,_side1])+string(" / ")+string("sec"),_col,_col,_col,_col,1);
	
}

#endregion

#region Armament

_i++;draw_text(_xx,_yy+_yo*_i,string("ARMAMENT"));
draw_rectangle(_xx-_xx_rect_w_left+_xx_rect_off_left,_yy+_yo*_i+_yy_rect_off,_xx+_xx_rect_w_right+_xx_rect_off_right,_yy+_yo*(_i+1)-_yy_rect_off,1);
if point_in_rectangle(mouse_x,mouse_y,_xx-_xx_rect_w_left+_xx_rect_off_left,_yy+_yo*_i+_yy_rect_off,_xx+_xx_rect_w_right+_xx_rect_off_right,_yy+_yo*(_i+1)-_yy_rect_off) && mouse_check_button_pressed(mb_left) 
{if table_armament==0 {table_armament=1} else {table_armament=0} }

if table_armament == 1 {


	if ship_firerate[6,_side1]<ship_firerate[6,_side2]																		{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if ship_firerate[6,_side1]>ship_firerate[6,_side2]																		{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if ship_firerate[6,_side1]==ship_firerate[6,_side2]																	{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	_i++;draw_text_color(_xx,_yy+_yo*_i,string("Rychlost přebíjení")+string(": ")+string(ship_firerate[6,_side1])+string(" ")+string("sec"),_col,_col,_col,_col,1);

	if (60/ship_firerate[6,_side1]>(60/ship_firerate[6,_side2]))															{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (60/ship_firerate[6,_side1]<(60/ship_firerate[6,_side2]))															{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (60/ship_firerate[6,_side1]==(60/ship_firerate[6,_side2]))															{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	_i++;draw_text_color(_xx,_yy+_yo*_i,string("  Kadence střelby")+string(": ")+string(60/ship_firerate[6,_side1])+string(" / ")+string("min"),_col,_col,_col,_col,1);


	if (60/(ship_firerate[6,_side1])*(ship_battery[6,_side1]))>(60/(ship_firerate[6,_side2])*(ship_battery[6,_side2]))	{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (60/(ship_firerate[6,_side1])*(ship_battery[6,_side1]))<(60/(ship_firerate[6,_side2])*(ship_battery[6,_side2]))	{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (60/(ship_firerate[6,_side1])*(ship_battery[6,_side1]))==(60/(ship_firerate[6,_side2])*(ship_battery[6,_side2]))	{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	_i++;draw_text_color(_xx,_yy+_yo*_i,string("  Kadence střelby (Veže)")+string(": ")+string((60/(ship_firerate[6,_side1])*(ship_battery[6,_side1])))+string(" / ")+string("min"),_col,_col,_col,_col,1);



	if (60/(ship_firerate[6,_side1])*(ship_battery[6,_side1]*ship_barrel[6,_side1]))>(60/(ship_firerate[6,_side2])*(ship_battery[6,_side2]*ship_barrel[6,_side2]))																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (60/(ship_firerate[6,_side1])*(ship_battery[6,_side1]*ship_barrel[6,_side1]))<(60/(ship_firerate[6,_side2])*(ship_battery[6,_side2]*ship_barrel[6,_side2]))																	{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if(60/(ship_firerate[6,_side1])*(ship_battery[6,_side1]*ship_barrel[6,_side1]))==(60/(ship_firerate[6,_side2])*(ship_battery[6,_side2]*ship_barrel[6,_side2]))																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	_i++;draw_text_color(_xx,_yy+_yo*_i,string("  Kadence střelby (Náboje)")+string(": ")+string((60/(ship_firerate[6,_side1])*(ship_battery[6,_side1]*ship_barrel[6,_side1])))+string(" / ")+string("min"),_col,_col,_col,_col,1);



	if (ship_firerange[6,_side1]>ship_firerange[6,_side2])																		{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_firerange[6,_side1]<ship_firerange[6,_side2])																		{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_firerange[6,_side1]==ship_firerange[6,_side2])																	{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	_i++;draw_text_color(_xx,_yy+_yo*_i,string("Dostřel")+string(": ")+string(ship_firerange[6,_side1])+string(" ")+string("km"),_col,_col,_col,_col,1);


	if (ship_detection[6,_side1]<ship_detection[6,_side2])																		{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_detection[6,_side1]>ship_detection[6,_side2])																		{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_detection[6,_side1]==ship_detection[6,_side2])																	{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	_i++;draw_text_color(_xx,_yy+_yo*_i,string("Vzdálenost odhalení")+string(": ")+string(ship_detection[6,_side1])+string(" ")+string("km"),_col,_col,_col,_col,1);

}
#endregion

#region WEAPONERY
_i++;draw_text(_xx,_yy+_yo*_i,string("WEAPONEARY"));
draw_rectangle(_xx-_xx_rect_w_left+_xx_rect_off_left,_yy+_yo*_i+_yy_rect_off,_xx+_xx_rect_w_right+_xx_rect_off_right,_yy+_yo*(_i+1)-_yy_rect_off,1);
if point_in_rectangle(mouse_x,mouse_y,_xx-_xx_rect_w_left+_xx_rect_off_left,_yy+_yo*_i+_yy_rect_off,_xx+_xx_rect_w_right+_xx_rect_off_right,_yy+_yo*(_i+1)-_yy_rect_off) && mouse_check_button_pressed(mb_left) 
{if table_weaponery==0 {table_weaponery=1} else {table_weaponery=0} }

if table_weaponery == 1 {



if (ship_caliber[6,_side1]>ship_caliber[6,_side2])																		{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_caliber[6,_side1]<ship_caliber[6,_side2])																		{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_caliber[6,_side1]==ship_caliber[6,_side2])																	{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("Kalibr")+string(": ")+string(ship_caliber[6,_side1])+string(" ")+string("mm"),_col,_col,_col,_col,1);

	_i++;draw_text(_xx,_yy+_yo*_i,string("Věže")+string(": ")+string(ship_battery[6,_side1])+string("x")+string(ship_barrel[6,_side1]));	

if (ship_rotation[6,_side1]>ship_rotation[6,_side2])																	{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_rotation[6,_side1]<ship_rotation[6,_side2])																	{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_rotation[6,_side1]==ship_rotation[6,_side2])																	{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("Rychlost otáčení věže")+string(": ")+string(ship_rotation[6,_side1])+string(" ")+string("stupnů/sec"),_col,_col,_col,_col,1);

	_i++;draw_text(_xx,_yy+_yo*_i,string("   180 stupnů ")+string(": ")+string(180/ship_rotation[6,_side1])+string(" / ")+string("sec"));

if (ship_dispersion[6,_side1]<ship_dispersion[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_dispersion[6,_side1]>ship_dispersion[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_dispersion[6,_side1]==ship_dispersion[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("Rozptyl střel")+string(": ")+string(ship_dispersion[6,_side1])+string(" ")+string("m"),_col,_col,_col,_col,1);

}

#endregion

#region AMUNITON
_i++;draw_text(_xx,_yy+_yo*_i,string("AMUNITION"));
draw_rectangle(_xx-_xx_rect_w_left+_xx_rect_off_left,_yy+_yo*_i+_yy_rect_off,_xx+_xx_rect_w_right+_xx_rect_off_right,_yy+_yo*(_i+1)-_yy_rect_off,1);
if point_in_rectangle(mouse_x,mouse_y,_xx-_xx_rect_w_left+_xx_rect_off_left,_yy+_yo*_i+_yy_rect_off,_xx+_xx_rect_w_right+_xx_rect_off_right,_yy+_yo*(_i+1)-_yy_rect_off) && mouse_check_button_pressed(mb_left) 
{if table_amunition==0 {table_amunition=1} else {table_amunition=0} }

if table_amunition == 1 {

if (ship_he[6,_side1]>ship_he[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_he[6,_side1]<ship_he[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_he[6,_side1]==ship_he[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("Munice - HE")+string(": ")+string(ship_he_text[6,_side1]),_col,_col,_col,_col,1);

if (ship_he_dmg[6,_side1]>ship_he_dmg[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_he_dmg[6,_side1]<ship_he_dmg[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_he_dmg[6,_side1]==ship_he_dmg[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Poškození")+string(": ")+string(ship_he_dmg[6,_side1]),_col,_col,_col,_col,1);

if (ship_he_fire[6,_side1]>ship_he_fire[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_he_fire[6,_side1]<ship_he_fire[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_he_fire[6,_side1]==ship_he_fire[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Zapálení")+string(": ")+string(ship_he_fire[6,_side1]),_col,_col,_col,_col,1);

if (ship_he_speed[6,_side1]>ship_he_speed[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_he_speed[6,_side1]<ship_he_speed[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_he_speed[6,_side1]==ship_he_speed[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Rychlost")+string(": ")+string(ship_he_speed[6,_side1]),_col,_col,_col,_col,1);

if (ship_he_weight[6,_side1]>ship_he_weight[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_he_weight[6,_side1]<ship_he_weight[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_he_weight[6,_side1]==ship_he_weight[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Váha")+string(": ")+string(ship_he_weight[6,_side1]),_col,_col,_col,_col,1);

}

#endregion

#region SECONDARY
_i++;draw_text(_xx,_yy+_yo*_i,string("SECONDARY"));
draw_rectangle(_xx-_xx_rect_w_left+_xx_rect_off_left,_yy+_yo*_i+_yy_rect_off,_xx+_xx_rect_w_right+_xx_rect_off_right,_yy+_yo*(_i+1)-_yy_rect_off,1);
if point_in_rectangle(mouse_x,mouse_y,_xx-_xx_rect_w_left+_xx_rect_off_left,_yy+_yo*_i+_yy_rect_off,_xx+_xx_rect_w_right+_xx_rect_off_right,_yy+_yo*(_i+1)-_yy_rect_off) && mouse_check_button_pressed(mb_left) 
{if table_secondary==0 {table_secondary=1} else {table_secondary=0} }

if table_secondary == 1 {

if (ship_secondary[6,_side1]>ship_secondary[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_secondary[6,_side1]<ship_secondary[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_secondary[6,_side1]==ship_secondary[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("Sekundární vybavení")+string(": ")+string(ship_secondary[6,_side1]),_col,_col,_col,_col,1);

if (ship_secondary_he_caliber[6,_side1]>ship_secondary_he_caliber[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_secondary_he_caliber[6,_side1]<ship_secondary_he_caliber[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_secondary_he_caliber[6,_side1]==ship_secondary_he_caliber[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Kalibr")+string(": ")+string(ship_secondary_he_caliber[6,_side1]),_col,_col,_col,_col,1);

if (ship_secondary_he_battery[6,_side1]>ship_secondary_he_battery[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_secondary_he_battery[6,_side1]<ship_secondary_he_battery[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_secondary_he_battery[6,_side1]==ship_secondary_he_battery[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Věže")+string(": ")+string(ship_secondary_he_battery[6,_side1]),_col,_col,_col,_col,1);

if (ship_secondary_he_barrel[6,_side1]>ship_secondary_he_barrel[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_secondary_he_barrel[6,_side1]<ship_secondary_he_barrel[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_secondary_he_barrel[6,_side1]==ship_secondary_he_barrel[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Hlavně")+string(": ")+string(ship_secondary_he_barrel[6,_side1]),_col,_col,_col,_col,1);

if (ship_secondary_range[6,_side1]>ship_secondary_range[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_secondary_range[6,_side1]<ship_secondary_range[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_secondary_range[6,_side1]==ship_secondary_range[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Dostřel")+string(": ")+string(ship_secondary_range[6,_side1]),_col,_col,_col,_col,1);

if (ship_secondary_firerate[6,_side1]>ship_secondary_firerate[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_secondary_firerate[6,_side1]<ship_secondary_firerate[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_secondary_firerate[6,_side1]==ship_secondary_firerate[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Rychlost střelby")+string(": ")+string(ship_secondary_firerate[6,_side1]),_col,_col,_col,_col,1);

_i++;draw_text(_xx,_yy+_yo*_i,string(_text_separator));

if (ship_secondary_he[6,_side1]>ship_secondary_he[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_secondary_he[6,_side1]<ship_secondary_he[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_secondary_he[6,_side1]==ship_secondary_he[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("   HE Munice")+string(": ")+string(ship_secondary_he[6,_side1]),_col,_col,_col,_col,1);

if (ship_secondary_he_dmg[6,_side1]>ship_secondary_he_dmg[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_secondary_he_dmg[6,_side1]<ship_secondary_he_dmg[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_secondary_he_dmg[6,_side1]==ship_secondary_he_dmg[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Poškození")+string(": ")+string(ship_secondary_he_dmg[6,_side1]),_col,_col,_col,_col,1);

if (ship_secondary_he_speed[6,_side1]>ship_secondary_he_speed[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_secondary_he_speed[6,_side1]<ship_secondary_he_speed[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_secondary_he_speed[6,_side1]==ship_secondary_he_speed[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Rychlost")+string(": ")+string(ship_secondary_he_speed[6,_side1]),_col,_col,_col,_col,1);

if (ship_secondary_he_fire[6,_side1]>ship_secondary_he_fire[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_secondary_he_fire[6,_side1]<ship_secondary_he_fire[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_secondary_he_fire[6,_side1]==ship_secondary_he_fire[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Oheň")+string(": ")+string(ship_secondary_he_fire[6,_side1]),_col,_col,_col,_col,1);

}
#endregion

#region TORPEDOS
_i++;draw_text(_xx,_yy+_yo*_i,string("TORPEDOS"));
draw_rectangle(_xx-_xx_rect_w_left+_xx_rect_off_left,_yy+_yo*_i+_yy_rect_off,_xx+_xx_rect_w_right+_xx_rect_off_right,_yy+_yo*(_i+1)-_yy_rect_off,1);
if point_in_rectangle(mouse_x,mouse_y,_xx-_xx_rect_w_left+_xx_rect_off_left,_yy+_yo*_i+_yy_rect_off,_xx+_xx_rect_w_right+_xx_rect_off_right,_yy+_yo*(_i+1)-_yy_rect_off) && mouse_check_button_pressed(mb_left) 
{if table_torpedos==0 {table_torpedos=1} else {table_torpedos=0} }

if table_torpedos == 1 {

if (ship_torpedo[6,_side1]>ship_torpedo[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_torpedo[6,_side1]<ship_torpedo[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_torpedo[6,_side1]==ship_torpedo[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("Torpédové vybavení")+string(": ")+string(ship_torpedo[6,_side1]),_col,_col,_col,_col,1);

if (ship_torpedo_turret[6,_side1]>ship_torpedo_turret[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_torpedo_turret[6,_side1]<ship_torpedo_turret[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_torpedo_turret[6,_side1]==ship_torpedo_turret[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Věže")+string(": ")+string(ship_torpedo_turret[6,_side1]),_col,_col,_col,_col,1);


if (ship_torpedo_tubes[6,_side1]>ship_torpedo_tubes[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_torpedo_tubes[6,_side1]<ship_torpedo_tubes[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_torpedo_tubes[6,_side1]==ship_torpedo_tubes[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Hlavně")+string(": ")+string(ship_torpedo_tubes[6,_side1]),_col,_col,_col,_col,1);

if (ship_torpedo_reload[6,_side1]>ship_torpedo_reload[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_torpedo_reload[6,_side1]<ship_torpedo_reload[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_torpedo_reload[6,_side1]==ship_torpedo_reload[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Přebítí")+string(": ")+string(ship_torpedo_reload[6,_side1]),_col,_col,_col,_col,1);

if (ship_torpedo_rotation[6,_side1]>ship_torpedo_rotation[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_torpedo_rotation[6,_side1]<ship_torpedo_rotation[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_torpedo_rotation[6,_side1]==ship_torpedo_rotation[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Rotace")+string(": ")+string(ship_torpedo_rotation[6,_side1]),_col,_col,_col,_col,1);

if (ship_torpedo_dmg[6,_side1]>ship_torpedo_dmg[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_torpedo_dmg[6,_side1]<ship_torpedo_dmg[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_torpedo_dmg[6,_side1]==ship_torpedo_dmg[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Poškození")+string(": ")+string(ship_torpedo_dmg[6,_side1]),_col,_col,_col,_col,1);

if (ship_torpedo_speed[6,_side1]>ship_torpedo_speed[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_torpedo_speed[6,_side1]<ship_torpedo_speed[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_torpedo_speed[6,_side1]==ship_torpedo_speed[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Rychlost")+string(": ")+string(ship_torpedo_speed[6,_side1]),_col,_col,_col,_col,1);


if (ship_torpedo_range[6,_side1]>ship_torpedo_range[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_torpedo_range[6,_side1]<ship_torpedo_range[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_torpedo_range[6,_side1]==ship_torpedo_range[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Dosah")+string(": ")+string(ship_torpedo_range[6,_side1]),_col,_col,_col,_col,1);


}
#endregion

#region ANTI AIR
_i++;draw_text(_xx,_yy+_yo*_i,string("ANTI-AIR"));
draw_rectangle(_xx-_xx_rect_w_left+_xx_rect_off_left,_yy+_yo*_i+_yy_rect_off,_xx+_xx_rect_w_right+_xx_rect_off_right,_yy+_yo*(_i+1)-_yy_rect_off,1);
if point_in_rectangle(mouse_x,mouse_y,_xx-_xx_rect_w_left+_xx_rect_off_left,_yy+_yo*_i+_yy_rect_off,_xx+_xx_rect_w_right+_xx_rect_off_right,_yy+_yo*(_i+1)-_yy_rect_off) && mouse_check_button_pressed(mb_left) 
{if table_antiair==0 {table_antiair=1} else {table_antiair=0} }

if table_antiair == 1 {

	if (ship_antiair[6,_side1]>ship_antiair[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_antiair[6,_side1]<ship_antiair[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_antiair[6,_side1]==ship_antiair[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	_i++;draw_text_color(_xx,_yy+_yo*_i,string("Anti-Air Defense #1")+string(": ")+string(ship_antiair[6,_side1]),_col,_col,_col,_col,1);

	if (ship_antiair_caliber[6,_side1]>ship_antiair_caliber[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_antiair_caliber[6,_side1]<ship_antiair_caliber[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_antiair_caliber[6,_side1]==ship_antiair_caliber[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Caliber")+string(": ")+string(ship_antiair_caliber[6,_side1]),_col,_col,_col,_col,1);


	if (ship_antiair_battery[6,_side1]>ship_antiair_battery[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_antiair_battery[6,_side1]<ship_antiair_battery[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_antiair_battery[6,_side1]==ship_antiair_battery[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Battery")+string(": ")+string(ship_antiair_battery[6,_side1]),_col,_col,_col,_col,1);


	if (ship_antiair_barrel[6,_side1]>ship_antiair_barrel[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_antiair_barrel[6,_side1]<ship_antiair_barrel[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_antiair_barrel[6,_side1]==ship_antiair_barrel[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Barrel")+string(": ")+string(ship_antiair_barrel[6,_side1]),_col,_col,_col,_col,1);


	if (ship_antiair_range[6,_side1]>ship_antiair_range[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_antiair_range[6,_side1]<ship_antiair_range[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_antiair_range[6,_side1]==ship_antiair_range[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Range")+string(": ")+string(ship_antiair_range[6,_side1]),_col,_col,_col,_col,1);


	if (ship_antiair_dps[6,_side1]>ship_antiair_dps[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_antiair_dps[6,_side1]<ship_antiair_dps[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_antiair_dps[6,_side1]==ship_antiair_dps[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	_i++;draw_text_color(_xx,_yy+_yo*_i,string("   DPS")+string(": ")+string(ship_antiair_dps[6,_side1]),_col,_col,_col,_col,1);


		if (ship_antiair_1[6,_side1]>ship_antiair_1[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
		if (ship_antiair_1[6,_side1]<ship_antiair_1[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
		if (ship_antiair_1[6,_side1]==ship_antiair_1[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
		_i++;draw_text_color(_xx,_yy+_yo*_i,string("Anti-Air Defense #2")+string(": ")+string(ship_antiair_1[6,_side1]),_col,_col,_col,_col,1);

		if (ship_antiair_caliber_1[6,_side1]>ship_antiair_caliber_1[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
		if (ship_antiair_caliber_1[6,_side1]<ship_antiair_caliber_1[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
		if (ship_antiair_caliber_1[6,_side1]==ship_antiair_caliber_1[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
		_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Caliber")+string(": ")+string(ship_antiair_caliber_1[6,_side1]),_col,_col,_col,_col,1);


		if (ship_antiair_battery_1[6,_side1]>ship_antiair_battery_1[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
		if (ship_antiair_battery_1[6,_side1]<ship_antiair_battery_1[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
		if (ship_antiair_battery_1[6,_side1]==ship_antiair_battery_1[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
		_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Battery")+string(": ")+string(ship_antiair_battery_1[6,_side1]),_col,_col,_col,_col,1);


		if (ship_antiair_barrel_1[6,_side1]>ship_antiair_barrel_1[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
		if (ship_antiair_barrel_1[6,_side1]<ship_antiair_barrel_1[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
		if (ship_antiair_barrel_1[6,_side1]==ship_antiair_barrel_1[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
		_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Barrel")+string(": ")+string(ship_antiair_barrel_1[6,_side1]),_col,_col,_col,_col,1);


		if (ship_antiair_range_1[6,_side1]>ship_antiair_range_1[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
		if (ship_antiair_range_1[6,_side1]<ship_antiair_range_1[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
		if (ship_antiair_range_1[6,_side1]==ship_antiair_range_1[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
		_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Range")+string(": ")+string(ship_antiair_range_1[6,_side1]),_col,_col,_col,_col,1);


		if (ship_antiair_dps_1[6,_side1]>ship_antiair_dps_1[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
		if (ship_antiair_dps_1[6,_side1]<ship_antiair_dps_1[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
		if (ship_antiair_dps_1[6,_side1]==ship_antiair_dps_1[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
		_i++;draw_text_color(_xx,_yy+_yo*_i,string("   DPS")+string(": ")+string(ship_antiair_dps_1[6,_side1]),_col,_col,_col,_col,1);

			if (ship_antiair_2[6,_side1]>ship_antiair_2[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
			if (ship_antiair_2[6,_side1]<ship_antiair_2[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
			if (ship_antiair_2[6,_side1]==ship_antiair_2[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
			_i++;draw_text_color(_xx,_yy+_yo*_i,string("Anti-Air Defense #3")+string(": ")+string(ship_antiair_2[6,_side1]),_col,_col,_col,_col,1);

			if (ship_antiair_caliber_2[6,_side1]>ship_antiair_caliber_2[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
			if (ship_antiair_caliber_2[6,_side1]<ship_antiair_caliber_2[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
			if (ship_antiair_caliber_2[6,_side1]==ship_antiair_caliber_2[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
			_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Caliber")+string(": ")+string(ship_antiair_caliber_2[6,_side1]),_col,_col,_col,_col,1);


			if (ship_antiair_battery_2[6,_side1]>ship_antiair_battery_2[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
			if (ship_antiair_battery_2[6,_side1]<ship_antiair_battery_2[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
			if (ship_antiair_battery_2[6,_side1]==ship_antiair_battery_2[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
			_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Battery")+string(": ")+string(ship_antiair_battery_2[6,_side1]),_col,_col,_col,_col,1);


			if (ship_antiair_barrel_2[6,_side1]>ship_antiair_barrel_2[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
			if (ship_antiair_barrel_2[6,_side1]<ship_antiair_barrel_2[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
			if (ship_antiair_barrel_2[6,_side1]==ship_antiair_barrel_2[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
			_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Barrel")+string(": ")+string(ship_antiair_barrel_2[6,_side1]),_col,_col,_col,_col,1);


			if (ship_antiair_range_2[6,_side1]>ship_antiair_range_2[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
			if (ship_antiair_range_2[6,_side1]<ship_antiair_range_2[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
			if (ship_antiair_range_2[6,_side1]==ship_antiair_range_2[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
			_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Range")+string(": ")+string(ship_antiair_range_2[6,_side1]),_col,_col,_col,_col,1);


			if (ship_antiair_dps_2[6,_side1]>ship_antiair_dps_2[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
			if (ship_antiair_dps_2[6,_side1]<ship_antiair_dps_2[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
			if (ship_antiair_dps_2[6,_side1]==ship_antiair_dps_2[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
			_i++;draw_text_color(_xx,_yy+_yo*_i,string("   DPS")+string(": ")+string(ship_antiair_dps_2[6,_side1]),_col,_col,_col,_col,1);




}
#endregion




}
#endregion

#region RIGHT COMPARE

if compare_right!=noone {

draw_set_color(c_black);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_side);

	//Variables
	var _xx_pre = _xx;
	var _xx = 1500;
	var _xx_comp = _xx - _xx_pre;
	var _yy = 300;
	var _i = -1;
	
		//Table variables
		var _xx_rect_off_left =		-_xx_rect_off_right;
		var _xx_rect_w_right =		_xx_rect_w_left;
		
		var _xx_rect_off_right = 0;
		var _xx_rect_w_left = 0;
		
	var _arrow_left = spr_arrow_left;
	var _arrow_right = spr_arrow_right;
	var _arrow_equal = spr_arrow_equal;

	var _side1 = compare_right;
	var _side2 = compare_left;

		//Image ABOVE
		var _x = _xx;
		var _y = _yy-_h;
		if compare_right_image!="" {
			draw_sprite_stretched(compare_right_image_nation,0,_x,_y,_w,_h);	
			draw_sprite_stretched(compare_right_image,0,_x,_y,_w,_h);
		}

//-----START---
_i++;draw_text(_xx,_yy+_yo*_i,string("Jméno")+string(": ")+string(ship_name[6,_side1]));
_i++;draw_text(_xx,_yy+_yo*_i,string("Národnost")+string(": ")+string(ship_nation[6,_side1]));
_i++;draw_text(_xx,_yy+_yo*_i,string("Třída")+string(": ")+string(ship_class));


#region HP & ARMOR

_i++;draw_text(_xx,_yy+_yo*_i,string("ARMOR"));
draw_rectangle(_xx-_xx_rect_w_left+_xx_rect_off_left,_yy+_yo*_i+_yy_rect_off,_xx+_xx_rect_w_right+_xx_rect_off_right,_yy+_yo*(_i+1)-_yy_rect_off,1);
if point_in_rectangle(mouse_x,mouse_y,_xx-_xx_rect_w_left+_xx_rect_off_left,_yy+_yo*_i+_yy_rect_off,_xx+_xx_rect_w_right+_xx_rect_off_right,_yy+_yo*(_i+1)-_yy_rect_off) && mouse_check_button_pressed(mb_left) 
{if table_armor==0 {table_armor=1} else {table_armor=0} }

if table_armor == 1 {

	if (ship_hp[6,_side1]>ship_hp[6,_side2])																				{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_hp[6,_side1]<ship_hp[6,_side2])																				{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_hp[6,_side1]==ship_hp[6,_side2])																				{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	_i++;draw_text_color(_xx,_yy+_yo*_i,string("Životy")+string(": ")+string(ship_hp[6,_side1]),_col,_col,_col,_col,1);

	if (ship_citadel[6,_side1]>ship_citadel[6,_side2])																		{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_citadel[6,_side1]<ship_citadel[6,_side2])																		{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_citadel[6,_side1]==ship_citadel[6,_side2])																	{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	_i++;draw_text_color(_xx,_yy+_yo*_i,string("Pancíř")+string(": ")+string(ship_citadel[6,_side1]),_col,_col,_col,_col,1);

};
#endregion

#region MOVEMENT
_i++;draw_text(_xx,_yy+_yo*_i,string("MOVEMENT"));
draw_rectangle(_xx-_xx_rect_w_left+_xx_rect_off_left,_yy+_yo*_i+_yy_rect_off,_xx+_xx_rect_w_right+_xx_rect_off_right,_yy+_yo*(_i+1)-_yy_rect_off,1);
if point_in_rectangle(mouse_x,mouse_y,_xx-_xx_rect_w_left+_xx_rect_off_left,_yy+_yo*_i+_yy_rect_off,_xx+_xx_rect_w_right+_xx_rect_off_right,_yy+_yo*(_i+1)-_yy_rect_off) && mouse_check_button_pressed(mb_left) 
{if table_movement==0 {table_movement=1} else {table_movement=0} }

if table_movement == 1 {

	if (ship_speed[6,_side1]>ship_speed[6,_side2])																			{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_speed[6,_side1]<ship_speed[6,_side2])																			{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_speed[6,_side1]==ship_speed[6,_side2])																		{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	_i++;draw_text_color(_xx,_yy+_yo*_i,string("Rychlost")+string(": ")+string(ship_speed[6,_side1])+string(" ")+string("kn"),_col,_col,_col,_col,1);


	if (ship_turn[6,_side1]<ship_turn[6,_side2])																			{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_turn[6,_side1]>ship_turn[6,_side2])																			{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_turn[6,_side1]==ship_turn[6,_side2])																			{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	_i++;draw_text_color(_xx,_yy+_yo*_i,string("Poloměr otáčení")+string(": ")+string(ship_turn[6,_side1])+string(" ")+string("m"),_col,_col,_col,_col,1);

	if (ship_wheel[6,_side1]<ship_wheel[6,_side2])																			{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_wheel[6,_side1]>ship_wheel[6,_side2])																			{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_wheel[6,_side1]==ship_wheel[6,_side2])																		{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	_i++;draw_text_color(_xx,_yy+_yo*_i,string("Rychlost kormidla")+string(": ")+string(ship_wheel[6,_side1])+string(" / ")+string("sec"),_col,_col,_col,_col,1);
	
}

#endregion

#region Armament

_i++;draw_text(_xx,_yy+_yo*_i,string("ARMAMENT"));
draw_rectangle(_xx-_xx_rect_w_left+_xx_rect_off_left,_yy+_yo*_i+_yy_rect_off,_xx+_xx_rect_w_right+_xx_rect_off_right,_yy+_yo*(_i+1)-_yy_rect_off,1);
if point_in_rectangle(mouse_x,mouse_y,_xx-_xx_rect_w_left+_xx_rect_off_left,_yy+_yo*_i+_yy_rect_off,_xx+_xx_rect_w_right+_xx_rect_off_right,_yy+_yo*(_i+1)-_yy_rect_off) && mouse_check_button_pressed(mb_left) 
{if table_armament==0 {table_armament=1} else {table_armament=0} }

if table_armament == 1 {


	if ship_firerate[6,_side1]<ship_firerate[6,_side2]																		{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if ship_firerate[6,_side1]>ship_firerate[6,_side2]																		{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if ship_firerate[6,_side1]==ship_firerate[6,_side2]																	{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	_i++;draw_text_color(_xx,_yy+_yo*_i,string("Rychlost přebíjení")+string(": ")+string(ship_firerate[6,_side1])+string(" ")+string("sec"),_col,_col,_col,_col,1);

	if (60/ship_firerate[6,_side1]>(60/ship_firerate[6,_side2]))															{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (60/ship_firerate[6,_side1]<(60/ship_firerate[6,_side2]))															{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (60/ship_firerate[6,_side1]==(60/ship_firerate[6,_side2]))															{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	_i++;draw_text_color(_xx,_yy+_yo*_i,string("  Kadence střelby")+string(": ")+string(60/ship_firerate[6,_side1])+string(" / ")+string("min"),_col,_col,_col,_col,1);


	if (60/(ship_firerate[6,_side1])*(ship_battery[6,_side1]))>(60/(ship_firerate[6,_side2])*(ship_battery[6,_side2]))	{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (60/(ship_firerate[6,_side1])*(ship_battery[6,_side1]))<(60/(ship_firerate[6,_side2])*(ship_battery[6,_side2]))	{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (60/(ship_firerate[6,_side1])*(ship_battery[6,_side1]))==(60/(ship_firerate[6,_side2])*(ship_battery[6,_side2]))	{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	_i++;draw_text_color(_xx,_yy+_yo*_i,string("  Kadence střelby (Veže)")+string(": ")+string((60/(ship_firerate[6,_side1])*(ship_battery[6,_side1])))+string(" / ")+string("min"),_col,_col,_col,_col,1);



	if (60/(ship_firerate[6,_side1])*(ship_battery[6,_side1]*ship_barrel[6,_side1]))>(60/(ship_firerate[6,_side2])*(ship_battery[6,_side2]*ship_barrel[6,_side2]))																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (60/(ship_firerate[6,_side1])*(ship_battery[6,_side1]*ship_barrel[6,_side1]))<(60/(ship_firerate[6,_side2])*(ship_battery[6,_side2]*ship_barrel[6,_side2]))																	{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if(60/(ship_firerate[6,_side1])*(ship_battery[6,_side1]*ship_barrel[6,_side1]))==(60/(ship_firerate[6,_side2])*(ship_battery[6,_side2]*ship_barrel[6,_side2]))																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	_i++;draw_text_color(_xx,_yy+_yo*_i,string("  Kadence střelby (Náboje)")+string(": ")+string((60/(ship_firerate[6,_side1])*(ship_battery[6,_side1]*ship_barrel[6,_side1])))+string(" / ")+string("min"),_col,_col,_col,_col,1);



	if (ship_firerange[6,_side1]>ship_firerange[6,_side2])																		{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_firerange[6,_side1]<ship_firerange[6,_side2])																		{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_firerange[6,_side1]==ship_firerange[6,_side2])																	{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	_i++;draw_text_color(_xx,_yy+_yo*_i,string("Dostřel")+string(": ")+string(ship_firerange[6,_side1])+string(" ")+string("km"),_col,_col,_col,_col,1);


	if (ship_detection[6,_side1]<ship_detection[6,_side2])																		{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_detection[6,_side1]>ship_detection[6,_side2])																		{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_detection[6,_side1]==ship_detection[6,_side2])																	{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	_i++;draw_text_color(_xx,_yy+_yo*_i,string("Vzdálenost odhalení")+string(": ")+string(ship_detection[6,_side1])+string(" ")+string("km"),_col,_col,_col,_col,1);

}
#endregion

#region WEAPONERY
_i++;draw_text(_xx,_yy+_yo*_i,string("WEAPONEARY"));
draw_rectangle(_xx-_xx_rect_w_left+_xx_rect_off_left,_yy+_yo*_i+_yy_rect_off,_xx+_xx_rect_w_right+_xx_rect_off_right,_yy+_yo*(_i+1)-_yy_rect_off,1);
if point_in_rectangle(mouse_x,mouse_y,_xx-_xx_rect_w_left+_xx_rect_off_left,_yy+_yo*_i+_yy_rect_off,_xx+_xx_rect_w_right+_xx_rect_off_right,_yy+_yo*(_i+1)-_yy_rect_off) && mouse_check_button_pressed(mb_left) 
{if table_weaponery==0 {table_weaponery=1} else {table_weaponery=0} }

if table_weaponery == 1 {



if (ship_caliber[6,_side1]>ship_caliber[6,_side2])																		{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_caliber[6,_side1]<ship_caliber[6,_side2])																		{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_caliber[6,_side1]==ship_caliber[6,_side2])																	{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("Kalibr")+string(": ")+string(ship_caliber[6,_side1])+string(" ")+string("mm"),_col,_col,_col,_col,1);

	_i++;draw_text(_xx,_yy+_yo*_i,string("Věže")+string(": ")+string(ship_battery[6,_side1])+string("x")+string(ship_barrel[6,_side1]));	

if (ship_rotation[6,_side1]>ship_rotation[6,_side2])																	{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_rotation[6,_side1]<ship_rotation[6,_side2])																	{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_rotation[6,_side1]==ship_rotation[6,_side2])																	{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("Rychlost otáčení věže")+string(": ")+string(ship_rotation[6,_side1])+string(" ")+string("stupnů/sec"),_col,_col,_col,_col,1);

	_i++;draw_text(_xx,_yy+_yo*_i,string("   180 stupnů ")+string(": ")+string(180/ship_rotation[6,_side1])+string(" / ")+string("sec"));

if (ship_dispersion[6,_side1]<ship_dispersion[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_dispersion[6,_side1]>ship_dispersion[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_dispersion[6,_side1]==ship_dispersion[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("Rozptyl střel")+string(": ")+string(ship_dispersion[6,_side1])+string(" ")+string("m"),_col,_col,_col,_col,1);

}

#endregion

#region AMUNITON
_i++;draw_text(_xx,_yy+_yo*_i,string("AMUNITION"));
draw_rectangle(_xx-_xx_rect_w_left+_xx_rect_off_left,_yy+_yo*_i+_yy_rect_off,_xx+_xx_rect_w_right+_xx_rect_off_right,_yy+_yo*(_i+1)-_yy_rect_off,1);
if point_in_rectangle(mouse_x,mouse_y,_xx-_xx_rect_w_left+_xx_rect_off_left,_yy+_yo*_i+_yy_rect_off,_xx+_xx_rect_w_right+_xx_rect_off_right,_yy+_yo*(_i+1)-_yy_rect_off) && mouse_check_button_pressed(mb_left) 
{if table_amunition==0 {table_amunition=1} else {table_amunition=0} }

if table_amunition == 1 {

if (ship_he[6,_side1]>ship_he[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_he[6,_side1]<ship_he[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_he[6,_side1]==ship_he[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("Munice - HE")+string(": ")+string(ship_he_text[6,_side1]),_col,_col,_col,_col,1);

if (ship_he_dmg[6,_side1]>ship_he_dmg[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_he_dmg[6,_side1]<ship_he_dmg[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_he_dmg[6,_side1]==ship_he_dmg[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Poškození")+string(": ")+string(ship_he_dmg[6,_side1]),_col,_col,_col,_col,1);

if (ship_he_fire[6,_side1]>ship_he_fire[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_he_fire[6,_side1]<ship_he_fire[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_he_fire[6,_side1]==ship_he_fire[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Zapálení")+string(": ")+string(ship_he_fire[6,_side1]),_col,_col,_col,_col,1);

if (ship_he_speed[6,_side1]>ship_he_speed[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_he_speed[6,_side1]<ship_he_speed[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_he_speed[6,_side1]==ship_he_speed[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Rychlost")+string(": ")+string(ship_he_speed[6,_side1]),_col,_col,_col,_col,1);

if (ship_he_weight[6,_side1]>ship_he_weight[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_he_weight[6,_side1]<ship_he_weight[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_he_weight[6,_side1]==ship_he_weight[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Váha")+string(": ")+string(ship_he_weight[6,_side1]),_col,_col,_col,_col,1);

}

#endregion

#region SECONDARY
_i++;draw_text(_xx,_yy+_yo*_i,string("SECONDARY"));
draw_rectangle(_xx-_xx_rect_w_left+_xx_rect_off_left,_yy+_yo*_i+_yy_rect_off,_xx+_xx_rect_w_right+_xx_rect_off_right,_yy+_yo*(_i+1)-_yy_rect_off,1);
if point_in_rectangle(mouse_x,mouse_y,_xx-_xx_rect_w_left+_xx_rect_off_left,_yy+_yo*_i+_yy_rect_off,_xx+_xx_rect_w_right+_xx_rect_off_right,_yy+_yo*(_i+1)-_yy_rect_off) && mouse_check_button_pressed(mb_left) 
{if table_secondary==0 {table_secondary=1} else {table_secondary=0} }

if table_secondary == 1 {

if (ship_secondary[6,_side1]>ship_secondary[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_secondary[6,_side1]<ship_secondary[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_secondary[6,_side1]==ship_secondary[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("Sekundární vybavení")+string(": ")+string(ship_secondary[6,_side1]),_col,_col,_col,_col,1);

if (ship_secondary_he_caliber[6,_side1]>ship_secondary_he_caliber[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_secondary_he_caliber[6,_side1]<ship_secondary_he_caliber[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_secondary_he_caliber[6,_side1]==ship_secondary_he_caliber[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Kalibr")+string(": ")+string(ship_secondary_he_caliber[6,_side1]),_col,_col,_col,_col,1);

if (ship_secondary_he_battery[6,_side1]>ship_secondary_he_battery[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_secondary_he_battery[6,_side1]<ship_secondary_he_battery[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_secondary_he_battery[6,_side1]==ship_secondary_he_battery[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Věže")+string(": ")+string(ship_secondary_he_battery[6,_side1]),_col,_col,_col,_col,1);

if (ship_secondary_he_barrel[6,_side1]>ship_secondary_he_barrel[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_secondary_he_barrel[6,_side1]<ship_secondary_he_barrel[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_secondary_he_barrel[6,_side1]==ship_secondary_he_barrel[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Hlavně")+string(": ")+string(ship_secondary_he_barrel[6,_side1]),_col,_col,_col,_col,1);

if (ship_secondary_range[6,_side1]>ship_secondary_range[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_secondary_range[6,_side1]<ship_secondary_range[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_secondary_range[6,_side1]==ship_secondary_range[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Dostřel")+string(": ")+string(ship_secondary_range[6,_side1]),_col,_col,_col,_col,1);

if (ship_secondary_firerate[6,_side1]>ship_secondary_firerate[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_secondary_firerate[6,_side1]<ship_secondary_firerate[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_secondary_firerate[6,_side1]==ship_secondary_firerate[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Rychlost střelby")+string(": ")+string(ship_secondary_firerate[6,_side1]),_col,_col,_col,_col,1);

_i++;draw_text(_xx,_yy+_yo*_i,string(_text_separator));

if (ship_secondary_he[6,_side1]>ship_secondary_he[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_secondary_he[6,_side1]<ship_secondary_he[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_secondary_he[6,_side1]==ship_secondary_he[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("   HE Munice")+string(": ")+string(ship_secondary_he[6,_side1]),_col,_col,_col,_col,1);

if (ship_secondary_he_dmg[6,_side1]>ship_secondary_he_dmg[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_secondary_he_dmg[6,_side1]<ship_secondary_he_dmg[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_secondary_he_dmg[6,_side1]==ship_secondary_he_dmg[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Poškození")+string(": ")+string(ship_secondary_he_dmg[6,_side1]),_col,_col,_col,_col,1);

if (ship_secondary_he_speed[6,_side1]>ship_secondary_he_speed[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_secondary_he_speed[6,_side1]<ship_secondary_he_speed[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_secondary_he_speed[6,_side1]==ship_secondary_he_speed[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Rychlost")+string(": ")+string(ship_secondary_he_speed[6,_side1]),_col,_col,_col,_col,1);

if (ship_secondary_he_fire[6,_side1]>ship_secondary_he_fire[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_secondary_he_fire[6,_side1]<ship_secondary_he_fire[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_secondary_he_fire[6,_side1]==ship_secondary_he_fire[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Oheň")+string(": ")+string(ship_secondary_he_fire[6,_side1]),_col,_col,_col,_col,1);

}
#endregion

#region TORPEDOS
_i++;draw_text(_xx,_yy+_yo*_i,string("TORPEDOS"));
draw_rectangle(_xx-_xx_rect_w_left+_xx_rect_off_left,_yy+_yo*_i+_yy_rect_off,_xx+_xx_rect_w_right+_xx_rect_off_right,_yy+_yo*(_i+1)-_yy_rect_off,1);
if point_in_rectangle(mouse_x,mouse_y,_xx-_xx_rect_w_left+_xx_rect_off_left,_yy+_yo*_i+_yy_rect_off,_xx+_xx_rect_w_right+_xx_rect_off_right,_yy+_yo*(_i+1)-_yy_rect_off) && mouse_check_button_pressed(mb_left) 
{if table_torpedos==0 {table_torpedos=1} else {table_torpedos=0} }

if table_torpedos == 1 {

if (ship_torpedo[6,_side1]>ship_torpedo[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_torpedo[6,_side1]<ship_torpedo[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_torpedo[6,_side1]==ship_torpedo[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("Torpédové vybavení")+string(": ")+string(ship_torpedo[6,_side1]),_col,_col,_col,_col,1);

if (ship_torpedo_turret[6,_side1]>ship_torpedo_turret[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_torpedo_turret[6,_side1]<ship_torpedo_turret[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_torpedo_turret[6,_side1]==ship_torpedo_turret[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Věže")+string(": ")+string(ship_torpedo_turret[6,_side1]),_col,_col,_col,_col,1);


if (ship_torpedo_tubes[6,_side1]>ship_torpedo_tubes[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_torpedo_tubes[6,_side1]<ship_torpedo_tubes[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_torpedo_tubes[6,_side1]==ship_torpedo_tubes[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Hlavně")+string(": ")+string(ship_torpedo_tubes[6,_side1]),_col,_col,_col,_col,1);

if (ship_torpedo_reload[6,_side1]>ship_torpedo_reload[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_torpedo_reload[6,_side1]<ship_torpedo_reload[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_torpedo_reload[6,_side1]==ship_torpedo_reload[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Přebítí")+string(": ")+string(ship_torpedo_reload[6,_side1]),_col,_col,_col,_col,1);

if (ship_torpedo_rotation[6,_side1]>ship_torpedo_rotation[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_torpedo_rotation[6,_side1]<ship_torpedo_rotation[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_torpedo_rotation[6,_side1]==ship_torpedo_rotation[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Rotace")+string(": ")+string(ship_torpedo_rotation[6,_side1]),_col,_col,_col,_col,1);

if (ship_torpedo_dmg[6,_side1]>ship_torpedo_dmg[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_torpedo_dmg[6,_side1]<ship_torpedo_dmg[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_torpedo_dmg[6,_side1]==ship_torpedo_dmg[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Poškození")+string(": ")+string(ship_torpedo_dmg[6,_side1]),_col,_col,_col,_col,1);

if (ship_torpedo_speed[6,_side1]>ship_torpedo_speed[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_torpedo_speed[6,_side1]<ship_torpedo_speed[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_torpedo_speed[6,_side1]==ship_torpedo_speed[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Rychlost")+string(": ")+string(ship_torpedo_speed[6,_side1]),_col,_col,_col,_col,1);


if (ship_torpedo_range[6,_side1]>ship_torpedo_range[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_torpedo_range[6,_side1]<ship_torpedo_range[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_torpedo_range[6,_side1]==ship_torpedo_range[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Dosah")+string(": ")+string(ship_torpedo_range[6,_side1]),_col,_col,_col,_col,1);


}
#endregion

#region ANTI AIR
_i++;draw_text(_xx,_yy+_yo*_i,string("ANTI-AIR"));
draw_rectangle(_xx-_xx_rect_w_left+_xx_rect_off_left,_yy+_yo*_i+_yy_rect_off,_xx+_xx_rect_w_right+_xx_rect_off_right,_yy+_yo*(_i+1)-_yy_rect_off,1);
if point_in_rectangle(mouse_x,mouse_y,_xx-_xx_rect_w_left+_xx_rect_off_left,_yy+_yo*_i+_yy_rect_off,_xx+_xx_rect_w_right+_xx_rect_off_right,_yy+_yo*(_i+1)-_yy_rect_off) && mouse_check_button_pressed(mb_left) 
{if table_antiair==0 {table_antiair=1} else {table_antiair=0} }

if table_antiair == 1 {

	if (ship_antiair[6,_side1]>ship_antiair[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_antiair[6,_side1]<ship_antiair[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_antiair[6,_side1]==ship_antiair[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	_i++;draw_text_color(_xx,_yy+_yo*_i,string("Anti-Air Defense #1")+string(": ")+string(ship_antiair[6,_side1]),_col,_col,_col,_col,1);

	if (ship_antiair_caliber[6,_side1]>ship_antiair_caliber[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_antiair_caliber[6,_side1]<ship_antiair_caliber[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_antiair_caliber[6,_side1]==ship_antiair_caliber[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Caliber")+string(": ")+string(ship_antiair_caliber[6,_side1]),_col,_col,_col,_col,1);


	if (ship_antiair_battery[6,_side1]>ship_antiair_battery[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_antiair_battery[6,_side1]<ship_antiair_battery[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_antiair_battery[6,_side1]==ship_antiair_battery[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Battery")+string(": ")+string(ship_antiair_battery[6,_side1]),_col,_col,_col,_col,1);


	if (ship_antiair_barrel[6,_side1]>ship_antiair_barrel[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_antiair_barrel[6,_side1]<ship_antiair_barrel[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_antiair_barrel[6,_side1]==ship_antiair_barrel[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Barrel")+string(": ")+string(ship_antiair_barrel[6,_side1]),_col,_col,_col,_col,1);


	if (ship_antiair_range[6,_side1]>ship_antiair_range[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_antiair_range[6,_side1]<ship_antiair_range[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_antiair_range[6,_side1]==ship_antiair_range[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Range")+string(": ")+string(ship_antiair_range[6,_side1]),_col,_col,_col,_col,1);


	if (ship_antiair_dps[6,_side1]>ship_antiair_dps[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_antiair_dps[6,_side1]<ship_antiair_dps[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	if (ship_antiair_dps[6,_side1]==ship_antiair_dps[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
	_i++;draw_text_color(_xx,_yy+_yo*_i,string("   DPS")+string(": ")+string(ship_antiair_dps[6,_side1]),_col,_col,_col,_col,1);


		if (ship_antiair_1[6,_side1]>ship_antiair_1[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
		if (ship_antiair_1[6,_side1]<ship_antiair_1[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
		if (ship_antiair_1[6,_side1]==ship_antiair_1[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
		_i++;draw_text_color(_xx,_yy+_yo*_i,string("Anti-Air Defense #2")+string(": ")+string(ship_antiair_1[6,_side1]),_col,_col,_col,_col,1);

		if (ship_antiair_caliber_1[6,_side1]>ship_antiair_caliber_1[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
		if (ship_antiair_caliber_1[6,_side1]<ship_antiair_caliber_1[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
		if (ship_antiair_caliber_1[6,_side1]==ship_antiair_caliber_1[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
		_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Caliber")+string(": ")+string(ship_antiair_caliber_1[6,_side1]),_col,_col,_col,_col,1);


		if (ship_antiair_battery_1[6,_side1]>ship_antiair_battery_1[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
		if (ship_antiair_battery_1[6,_side1]<ship_antiair_battery_1[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
		if (ship_antiair_battery_1[6,_side1]==ship_antiair_battery_1[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
		_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Battery")+string(": ")+string(ship_antiair_battery_1[6,_side1]),_col,_col,_col,_col,1);


		if (ship_antiair_barrel_1[6,_side1]>ship_antiair_barrel_1[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
		if (ship_antiair_barrel_1[6,_side1]<ship_antiair_barrel_1[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
		if (ship_antiair_barrel_1[6,_side1]==ship_antiair_barrel_1[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
		_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Barrel")+string(": ")+string(ship_antiair_barrel_1[6,_side1]),_col,_col,_col,_col,1);


		if (ship_antiair_range_1[6,_side1]>ship_antiair_range_1[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
		if (ship_antiair_range_1[6,_side1]<ship_antiair_range_1[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
		if (ship_antiair_range_1[6,_side1]==ship_antiair_range_1[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
		_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Range")+string(": ")+string(ship_antiair_range_1[6,_side1]),_col,_col,_col,_col,1);


		if (ship_antiair_dps_1[6,_side1]>ship_antiair_dps_1[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
		if (ship_antiair_dps_1[6,_side1]<ship_antiair_dps_1[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
		if (ship_antiair_dps_1[6,_side1]==ship_antiair_dps_1[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
		_i++;draw_text_color(_xx,_yy+_yo*_i,string("   DPS")+string(": ")+string(ship_antiair_dps_1[6,_side1]),_col,_col,_col,_col,1);

			if (ship_antiair_2[6,_side1]>ship_antiair_2[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
			if (ship_antiair_2[6,_side1]<ship_antiair_2[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
			if (ship_antiair_2[6,_side1]==ship_antiair_2[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
			_i++;draw_text_color(_xx,_yy+_yo*_i,string("Anti-Air Defense #3")+string(": ")+string(ship_antiair_2[6,_side1]),_col,_col,_col,_col,1);

			if (ship_antiair_caliber_2[6,_side1]>ship_antiair_caliber_2[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
			if (ship_antiair_caliber_2[6,_side1]<ship_antiair_caliber_2[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
			if (ship_antiair_caliber_2[6,_side1]==ship_antiair_caliber_2[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
			_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Caliber")+string(": ")+string(ship_antiair_caliber_2[6,_side1]),_col,_col,_col,_col,1);


			if (ship_antiair_battery_2[6,_side1]>ship_antiair_battery_2[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
			if (ship_antiair_battery_2[6,_side1]<ship_antiair_battery_2[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
			if (ship_antiair_battery_2[6,_side1]==ship_antiair_battery_2[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
			_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Battery")+string(": ")+string(ship_antiair_battery_2[6,_side1]),_col,_col,_col,_col,1);


			if (ship_antiair_barrel_2[6,_side1]>ship_antiair_barrel_2[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
			if (ship_antiair_barrel_2[6,_side1]<ship_antiair_barrel_2[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
			if (ship_antiair_barrel_2[6,_side1]==ship_antiair_barrel_2[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
			_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Barrel")+string(": ")+string(ship_antiair_barrel_2[6,_side1]),_col,_col,_col,_col,1);


			if (ship_antiair_range_2[6,_side1]>ship_antiair_range_2[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
			if (ship_antiair_range_2[6,_side1]<ship_antiair_range_2[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
			if (ship_antiair_range_2[6,_side1]==ship_antiair_range_2[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
			_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Range")+string(": ")+string(ship_antiair_range_2[6,_side1]),_col,_col,_col,_col,1);


			if (ship_antiair_dps_2[6,_side1]>ship_antiair_dps_2[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
			if (ship_antiair_dps_2[6,_side1]<ship_antiair_dps_2[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
			if (ship_antiair_dps_2[6,_side1]==ship_antiair_dps_2[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
			_i++;draw_text_color(_xx,_yy+_yo*_i,string("   DPS")+string(": ")+string(ship_antiair_dps_2[6,_side1]),_col,_col,_col,_col,1);




}
#endregion





}
#endregion