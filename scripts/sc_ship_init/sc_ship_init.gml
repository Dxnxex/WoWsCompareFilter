///@param Class
///@param Tier

function sc_ship_init(argument0,argument1){

	ship_class = argument0;
	ship_tier = argument1;
	
	ship_number +=1;
		
	var _c = argument0;
	var _t = argument1;
	var _n = ship_number;
	
			//Pre-error
			ship_image[_t,_n] = spr_nothing;
			ship_image_nation[_t,_n] = spr_nothing;
			ship_nation[_t,_n] = "";
			ship_name[_t,_n] = "";

			ship_hp[_t,_n] = 0;
			ship_citadel[_t,_n] = 0;
		
			ship_speed[_t,_n] = 0;
			ship_turn[_t,_n] = 0;
			ship_wheel[_t,_n] = 0;
			
			ship_firerate[_t,_n] = 0;
			ship_firerange[_t,_n] = 0;
			ship_detection[_t,_n] = 0;		
			
			ship_caliber[_t,_n] = 0;
			ship_battery[_t,_n] = 0;
			ship_barrel[_t,_n] = 0;
			ship_rotation[_t,_n] = 0;
			ship_dispersion[_t,_n] = 0;	
			
			ship_he[_t,_n] = 0;
			ship_he_dmg[_t,_n] = 0;
			ship_he_fire[_t,_n] = 0;
			ship_he_speed[_t,_n] = 0;
			ship_he_weight[_t,_n] = 0;

			ship_ap[_t,_n] = 0;
			ship_ap_dmg[_t,_n] = 0;
			ship_ap_speed[_t,_n] = 0;
			ship_ap_weight[_t,_n] = 0;
	
			ship_sap[_t,_n] = 0;
			ship_sap_dmg[_t,_n] = 0;
			ship_sap_speed[_t,_n] = 0;
			ship_sap_weight[_t,_n] = 0;			
			
			ship_secondary[_t,_n] = 0;			
			ship_secondary_range[_t,_n] = 0;			
			ship_secondary_firerate[_t,_n] = 0;	
			
			ship_secondary_he[_t,_n] = 0;	
			ship_secondary_he_caliber[_t,_n] = 0;	
			ship_secondary_he_battery[_t,_n] = 0;	
			ship_secondary_he_barrel[_t,_n] = 0;	
			ship_secondary_he_dmg[_t,_n] = 0;	
			ship_secondary_he_speed[_t,_n] = 0;	
			ship_secondary_he_fire[_t,_n] = 0;	

			ship_secondary_sap[_t,_n] = 0;		
			
			ship_torpedo[_t,_n] = 0;
			ship_torpedo_turret[_t,_n] = 0;
			ship_torpedo_tubes[_t,_n] = 0;
			ship_torpedo_reload[_t,_n] = 0;
			ship_torpedo_rotation[_t,_n] = 0;
			ship_torpedo_dmg[_t,_n] = 0;
			ship_torpedo_speed[_t,_n] = 0;
			ship_torpedo_range[_t,_n] = 0;
	
			ship_antiair[_t,_n] = 0;
			ship_antiair_caliber[_t,_n] = 0;
			ship_antiair_battery[_t,_n] = 0;
			ship_antiair_barrel[_t,_n] = 0;
			ship_antiair_range[_t,_n] = 0;
			ship_antiair_dps[_t,_n] = 0;
			
			ship_antiair_1[_t,_n] = 0;
			ship_antiair_caliber_1[_t,_n] = 0;
			ship_antiair_battery_1[_t,_n] = 0;
			ship_antiair_barrel_1[_t,_n] = 0;
			ship_antiair_range_1[_t,_n] = 0;
			ship_antiair_dps_1[_t,_n] = 0;			
			
			ship_antiair_2[_t,_n] = 0;
			ship_antiair_caliber_2[_t,_n] = 0;
			ship_antiair_battery_2[_t,_n] = 0;
			ship_antiair_barrel_2[_t,_n] = 0;
			ship_antiair_range_2[_t,_n] = 0;
			ship_antiair_dps_2[_t,_n] = 0;			
			
			
			
}

/*
if (ship_xxxx[6,_side1]>ship_xxxx[6,_side2])																{_col=_col_up		draw_sprite_stretched_ext(_arrow_right,0,	_xx-_xx_comp/2 -_arrow_size/2 + _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_xxxx[6,_side1]<ship_xxxx[6,_side2])																{_col=_col_down		draw_sprite_stretched_ext(_arrow_left,0,		_xx-_xx_comp/2 -_arrow_size/2 - _xx_arrow_side	,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
if (ship_xxxx[6,_side1]==ship_xxxx[6,_side2])																{_col=_col_equal	draw_sprite_stretched_ext(_arrow_equal,0,	_xx-_xx_comp/2 -_arrow_size/2 					,_yy+_yo*(_i+1)+_arrow_y_edit,_arrow_size,_arrow_size,_col_black,1);	};
_i++;draw_text_color(_xx,_yy+_yo*_i,string("   Váha")+string(": ")+string(ship_xxxx[6,_side1]),_col,_col,_col,_col,1);
