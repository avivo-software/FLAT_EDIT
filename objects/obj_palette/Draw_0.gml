/// @description Draw Palette

/****************************************************************************
*								DRAW PALETTE			    				*
****************************************************************************/

for (j = 0; j < outer_loop; ++j) // Outer loop (Y)
{
	for (i = 0; i < inner_loop; ++i) // Inner loop (X)
	{
		loop_count = i + j * inner_loop; // Calculates the itteration number of current instance
		
		x = i * current_sprite_width + x_gap * i; // Calculates X possition for current sprite itteration 
		y = j * current_sprite_height + y_gap * j; // Calculates Y possition for current sprite itteration 
			
		if mouse_check_button(global.controls[0]) // Checks if button has been selected
		{
			if point_in_rectangle(mouse_x, mouse_y, x, y, x + current_sprite_width, y + current_sprite_height) // Checks to see if mouse is hovered over current sprite
			{
				if loop_count < sprite_limit // Prevents a non visible button from being selected
				{
					if loop_count + palette_shift > sprite_qty // Checks if loop_count + palette_shift is not greater than the sprite limit
					{
						current_sprite_id = loop_count + palette_shift - sprite_qty; // Ensures the sprite ID can't exceed the sprite qty
					}
						else
					{
						current_sprite_id = loop_count + palette_shift; // Sets current sprite number
					}
						
					show_debug_message(current_sprite_id); 
				}
			}
		}
		
		if loop_count < sprite_limit // This will prevent duplicate sprites from being drawn
		{
			draw_sprite_ext(spr_buttons_green, loop_count + palette_shift, x, y, current_x_scale, current_y_scale, 0, c_white, 1); // Draw palette
		}
	}
}



