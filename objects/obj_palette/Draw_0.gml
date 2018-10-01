/// @description Draw Palette

/****************************************************************************
*								DRAW PALETTE			    				*
****************************************************************************/

for (j = 0; j < outer_loop; ++j) // Outer loop (Y)
{
	for (i = 0; i < inner_loop; ++i) // Inner loop (X)
	{
		loop_count = i + j * inner_loop; // Calculates the itteration number of current instance
		
		x = i * current_sprite_width + x_gap * i + x_offset; // Calculates X possition for current sprite itteration 
		y = j * current_sprite_height + y_gap * j + y_offset; // Calculates Y possition for current sprite itteration 
			
		current_sprite_id = loop_count + palette_shift; // Calculates current sprite ID (Allows correct button presses to be identified correctly)
		if current_sprite_id > sprite_qty - 1 then current_sprite_id = current_sprite_id - sprite_qty; // Recalculates ID if loop count is higher than sprite qty
			
		if point_in_rectangle(mouse_x, mouse_y, x, y, x + current_sprite_width, y + current_sprite_height) // Checks to see if mouse is hovered over current sprite
		{
			if mouse_check_button(global.controls[0])
			{
				if stuck[current_sprite_id] == false
				{
					
				}
					else
				{
					
				}
			}
				else
			{
				if stuck[current_sprite_id] == false
				{
					
				}
					else
				{
					
				}
			}
			
		}
			else
		{
			current_x_scale = primary_x_scale; // Sets X scale to primary sprite 
			current_y_scale = primary_y_scale; // Sets Y scale to primary sprite
		}
		
		if loop_count < sprite_limit // This will prevent duplicate sprites from being drawn
		{
			draw_sprite_ext(current_sprite, loop_count + palette_shift, x, y, current_x_scale, current_y_scale, 0, c_white, 1); // Draw palette
		}
	}
}

/****************************************************************************
*							DRAW RECTANGLE BORDER			    			*
****************************************************************************/

if global.edit_enabled == true // Prevents border being drawn if edit is not enabled
{
	if point_in_rectangle(mouse_x, mouse_y, border_x1, border_y1, border_x2, border_y2) // Checks if mouse is in palette edit boundry
	{
		draw_rectangle(border_x1, border_y1, border_x2, border_y2, 1); // Draws rectangle around palette border
	}
}

