// click color
if (!is_finished && mouse_check_button(mb_left)) {
    var gx = (mouse_x - offset_x) div cell_size;
    var gy = (mouse_y - offset_y) div cell_size;
    
    if (gx >= 0 && gx < grid_w && gy >= 0 && gy < grid_h) {
        var _target = strawberry_memory[gy][gx];
        if (_target != -1) {
            var _idx = array_get_index(palette, _target);
            if ((_idx + 1) == selected_color_id) {
                player_progress[gy][gx] = true;
            }
        }
    }
}

/*// UNLOCK RESTART BUTTON- will not activate before
var _win = true;
for (var yy = 0; yy < grid_h; yy++) {
    for (var xx = 0; xx < grid_w; xx++) {
        if (strawberry_memory[yy][xx] != -1 && !player_progress[yy][xx]) {
            _win = false; 
			break;
        }
    }
}
if (_win && !is_finished) {
    is_finished = true;

	
    if (instance_exists(obj_restart)) 
	obj_restart.visible = true;
}*/
if (!is_finished) {
    var _all_filled = true;
    var _any_cells_exist = false;

    for (var yy = 0; yy < grid_h; yy++) {
        for (var xx = 0; xx < grid_w; xx++) {
            if (strawberry_memory[yy][xx] != -1) {
                _any_cells_exist = true; // Make sure there is actually a game to win
                if (!player_progress[yy][xx]) {
                    _all_filled = false;
                    break;
                }
            }
        }
    }

    // Only win if cells exist and they are all filled
    if (_any_cells_exist && _all_filled) {
        is_finished = true;
        if (instance_exists(obj_restart)) {
            obj_restart.visible = true;
        }
    }
}