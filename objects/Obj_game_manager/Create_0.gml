is_finished = false;
selected_color_id = 1;

palette = [
    make_color_rgb(0, 0, 0),		 // 1: black
    make_color_rgb(189, 50, 43),    // 2: red
    make_color_rgb(216, 79, 73),   // 3:light red
    make_color_rgb(238,169,100),   // 4: yellow
    make_color_rgb(225, 117, 114), // 5: Pink
    make_color_rgb(104, 156, 56),  // 6: green
    make_color_rgb(150, 204, 90),  // 7: light green
    make_color_rgb(195,66,60)    // 8: other red(2 pixels only)
];



cell_size = 20; 
var _w = sprite_get_width(spr_Strawberry);
var _h = sprite_get_height(spr_Strawberry);
grid_w = _w div cell_size;
grid_h = _h div cell_size;
offset_x = (room_width - (grid_w * cell_size)) / 2;
offset_y = (room_height - (grid_h * cell_size)) / 3;

//  MEMORY INITIALIZATION
strawberry_memory = array_create(grid_h);
player_progress = array_create(grid_h);
for (var i = 0; i < grid_h; i++) {
    strawberry_memory[i] = array_create(grid_w, -1);
    player_progress[i] = array_create(grid_w, false);
}



// 4. MANUAL SCANNER
var strawberry_scanner = surface_create(_w, _h);
surface_set_target(strawberry_scanner);
draw_clear_alpha(c_black, 0); // Start with total transparency
draw_sprite_stretched(spr_Strawberry, 0, 0, 0, _w, _h);
surface_reset_target();

for (var yy = 0; yy < grid_h; yy++) {
    for (var xx = 0; xx < grid_w; xx++) {
        var _px = (xx * cell_size) + (cell_size / 2);//px pixel x
        var _py = (yy * cell_size) + (cell_size / 2);//py pixel y
        
        // Check the exact pixel
        var _raw = surface_getpixel(strawberry_scanner, _px, _py);
        
        // If it's transparent (alpha is 0), try to look slightly to the left/right
        if (surface_getpixel_ext(strawberry_scanner, _px, _py) == 0) {
            _raw = surface_getpixel(strawberry_scanner, _px + 2, _py + 2); 
        }

        // If we found a color (Alpha is NOT 0)
        if (surface_getpixel_ext(strawberry_scanner, _px, _py) != 0) { 
            var _best_id = 0;
            var _min_dist = 1000;
            for (var i = 0; i < array_length(palette); i++) {
                var _d = abs(color_get_red(_raw) - color_get_red(palette[i])) + 
                         abs(color_get_green(_raw) - color_get_green(palette[i])) + 
                         abs(color_get_blue(_raw) - color_get_blue(palette[i]));
                if (_d < _min_dist)
				{ _min_dist = _d; _best_id = i; 
				
				}
            }
            strawberry_memory[yy][xx] = palette[_best_id];
        } else {
            strawberry_memory[yy][xx] = -1; // Truly empty space
        }
    }
}
surface_free(strawberry_scanner);
