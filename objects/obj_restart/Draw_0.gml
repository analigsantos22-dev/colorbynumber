if (visible) {
 

   
   //  Pick your colors
    var _btn_color = #F49AC3;   // The button body color
    var _text_color = #9E0B0F;   // The text color
    var _border_color = c_black; // The outline color
	draw_set_font(Font1); //  font  style

    // 2. Draw a SHAPE 
    draw_set_color(_btn_color);
    draw_roundrect_ext(x - 150, y - 50, x + 150, y + 50, 15, 15, false);// The "15" at the end is the "roundness" of the corners
    
    // 3. Draw the BORDER
    draw_set_color(_border_color);
    draw_roundrect_ext(x - 150, y - 50, x + 150, y + 50, 15, 15, true);

    // 4. Draw the BIG TEXT
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(_text_color);
    
    // Using 2.5 for a nice, clear large size
    draw_text_transformed(x, y, "RESTART", 2.5, 2.5, 0); 
}