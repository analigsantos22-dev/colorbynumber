//draw_clear(make_color_rgb(45, 45, 45)); // dark grey Background

for (var yy = 0; yy < grid_h; yy++) {
    for (var xx = 0; xx < grid_w; xx++) {
        var _val = strawberry_memory[yy][xx];
        if (_val == -1) 
			continue;

        var _x1 = offset_x + (xx * cell_size);
        var _y1 = offset_y + (yy * cell_size);
        var _id = array_get_index(palette, _val) + 1;

        if (player_progress[yy][xx]) {
            draw_set_color(_val);
            draw_rectangle(_x1, _y1, _x1 + cell_size - 1, _y1 + cell_size - 1, false);
        } else {
            draw_set_color(c_white);
            draw_rectangle(_x1, _y1, _x1 + cell_size - 1, _y1 + cell_size - 1, false);
             // Outline

            // GREY HIGHLIGHT 
            if (selected_color_id == _id) {
			draw_set_color(c_ltgray);
            draw_rectangle(_x1, _y1, _x1 + cell_size - 1, _y1 + cell_size - 1, false);
                draw_set_color(c_black); // Selected number turns grey
            } else {
                draw_set_color(c_ltgray); // Others stay white
            }

            draw_set_halign(fa_center); draw_set_valign(fa_middle);
            draw_text_transformed(_x1 + cell_size/2, _y1 + cell_size/2, string(_id), 1, 1, 0);
        }
    }
}