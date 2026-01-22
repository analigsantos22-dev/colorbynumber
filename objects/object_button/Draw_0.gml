var _mgr = Obj_game_manager;

if (instance_exists(_mgr)) {
    if(!_mgr.is_finished){
	
	var _col = _mgr.palette[my_color_id - 1];
    
    // Selection Ring
    if (_mgr.selected_color_id == my_color_id) {
        draw_set_color(c_white);
        draw_circle(x - 2, y - 2, (sprite_width/4) + 6, false);
    }

    draw_sprite_ext(sprite_index, 0, x, y, 1, 1, 0, _col, 1);
    draw_set_color(color_get_value(_col) < 128 ? c_white : c_black);
    draw_set_halign(fa_center); draw_set_valign(fa_middle);
    draw_text(x, y, string(my_color_id));
	}
	
} 
