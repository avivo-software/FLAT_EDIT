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
			if mouse_check_button_released(global.controls[0]) // Checks if mouse button has been released
			{
				if stuck[current_sprite_id] == false  // Playes sound depending if sprite has been released or pressed
				{
					spt_sound(0, 0); // Play click sound	
				}
					else
				{
					spt_sound(0, 1); // Play unclick sound
				}
			}
			
			if mouse_check_button_pressed(global.controls[0]) // Checks if mouse is clicked 
			{
				if global.edit_enabled == false // Prevents sprites being interacted with when edit mode is enabled
				{
					stuck[current_sprite_id] = !stuck[current_sprite_id]; // Toggles sprite status 
					last_selection = current_sprite_id; // Updates last selection ID
					
					spt_actions(action_id, current_sprite_id); // Executes selected action based upon type of palette
				}
			}
		}
			if current_sprite_id < sprite_qty // Prevents out of range error
			{
				if stuck[current_sprite_id] == true // Checks if current sprite is stuck
				{
					current_sprite = secondary_sprite; // Sets current sprite to secondary sprite
			
					current_x_scale = secondary_x_scale; // Sets current X scale to secondary X scale
					current_y_scale = secondary_y_scale; // Sets current Y scale to secondary Y scale
				}
					else
				{
					current_sprite = primary_sprite; // Sets current sprite to primary sprite
			
					current_x_scale = primary_x_scale; // Sets current X scale to primary X scale
					current_y_scale = primary_y_scale; // Sets current Y scale to primary Y scale
				}
				
				if sticky[current_sprite_id] == false then stuck[current_sprite_id] = false; // Pops sprite back out if button is not sticky (Creates a clicking effect)
			}
		
		// DRAW SPRITE
		
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
