///@param Xpos
///@param Ypos

function sc_filter_bar_citadel(argument0,argument1){

var _w = _w_filter; var _h = _h_filter;
var _x = _w*argument0; var _y = _h*argument1;

	
		if filter_ship_citadel == -1 {filter_ship_citadel_text = "NO FILTER";			draw_set_color(_filter_col_0)};
		if filter_ship_citadel == 0 {filter_ship_citadel_text = "LOWEST";				draw_set_color(_filter_col_1)};
		if filter_ship_citadel == 1 {filter_ship_citadel_text = "LOW";					draw_set_color(_filter_col_2)};
		if filter_ship_citadel == 2 {filter_ship_citadel_text = "MEDIUM";				draw_set_color(_filter_col_3)};
		if filter_ship_citadel == 3 {filter_ship_citadel_text = "HIGH";					draw_set_color(_filter_col_4)};
		if filter_ship_citadel == 4 {filter_ship_citadel_text = "HIGHEST";				draw_set_color(_filter_col_5)};

		//-----BAR-----
		if filter_ship_citadel >= 0 { draw_rectangle(_x+1,_y+_h,_x+_w_filter_bar-1,(_y+_h-((_h-_h_filter_reduce)/_filter_coeff)*(filter_ship_citadel+1))-1,0);}
		
		//-----FILTER UP-----
		if point_in_rectangle(mouse_x,mouse_y,_x+1,_y+1,_x+_w-1,_y+_h-1) && mouse_check_button_pressed(mb_left)		{if filter_ship_citadel!=(_filter_coeff-1) {filter_ship_citadel+=1} else {filter_ship_citadel=-1}	}
		if point_in_rectangle(mouse_x,mouse_y,_x+1,_y+1,_x+_w-1,_y+_h-1) && mouse_check_button_pressed(mb_right)	{if filter_ship_citadel!=-1 {filter_ship_citadel-=1}}

		//-----FILTER RESET-----
		if point_in_rectangle(mouse_x,mouse_y,_x+1,_y+1,_x+_w-1,_y+_h-1) && mouse_check_button_pressed(mb_middle) {filter_ship_citadel=-1;}
	
	//-----Reset-----
	draw_set_color(c_black);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_font(fnt_filter);
	
	//-----Rectangle-----
	draw_rectangle(_x+1,_y+1,_x+_w-1,_y+_h-1,1);
	draw_text(_x+_w/2,_y,"CITADEL");
	draw_text(_x+_w/2,_y+20,filter_ship_citadel_text);	
	
}