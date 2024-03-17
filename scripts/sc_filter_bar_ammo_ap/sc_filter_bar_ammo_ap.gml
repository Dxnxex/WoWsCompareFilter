///@param Xpos
///@param Ypos

function sc_filter_bar_ammo_ap(argument0,argument1){

var _w = _w_filter; var _h = _h_filter;
var _x = _w*argument0; var _y = _h*argument1;
var _filter_coeff = 2;

		if filter_ship_ap == -1 {filter_ship_ap_text = "DONT CARE";		draw_set_color(c_black);};
		if filter_ship_ap == +0 {filter_ship_ap_text = "NO";			draw_set_color(c_black);};
		if filter_ship_ap == +1 {filter_ship_ap_text = "YES";			draw_set_color(c_red);};

		//-----BAR-----
		if filter_ship_ap >= 0 { draw_rectangle(_x+1,_y+_h,_x+_w_filter_bar-1,(_y+_h-((_h-_h_filter_reduce)/_filter_coeff)*(filter_ship_ap+1))-1,0);}
		
		//-----FILTER UP-----
		if point_in_rectangle(mouse_x,mouse_y,_x+1,_y+1,_x+_w-1,_y+_h-1) && mouse_check_button_pressed(mb_left)		{if filter_ship_ap!=(_filter_coeff-1) {filter_ship_ap+=1} else {filter_ship_ap=-1}	}
		if point_in_rectangle(mouse_x,mouse_y,_x+1,_y+1,_x+_w-1,_y+_h-1) && mouse_check_button_pressed(mb_right)	{if filter_ship_ap!=-1 {filter_ship_ap-=1}}

		//-----FILTER RESET-----
		if point_in_rectangle(mouse_x,mouse_y,_x+1,_y+1,_x+_w-1,_y+_h-1) && mouse_check_button_pressed(mb_middle) {filter_ship_ap=-1;}
	
	//-----Reset-----
	draw_set_color(c_black);
	
	//-----Rectangle-----
	draw_rectangle(_x+1,_y+1,_x+_w-1,_y+_h-1,1);
	draw_text(_x+_w/2,_y,"Ammo - AP");
	draw_text(_x+_w/2,_y+20,filter_ship_ap_text);
	

	
}