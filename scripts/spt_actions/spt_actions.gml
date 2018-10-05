/***************************************************************************
*								ACTION SCRIPT							   *
***************************************************************************/

// BUTTONS

with obj_grid // Prevents unknown variable error
{
	if argument0 = 0 then // Checks if action type is buttons
	{
		switch argument1 // Checks which type of action should be executed
		{
			case 1: // Toggle grid
		
				grid_enabled = !grid_enabled // Toggle grid
		
			break;
		
			case 2: // Toggle fullscreen
		
				window_set_fullscreen(!window_get_fullscreen()); // Toggle fullscreen
		
			break;
		
			case 3: // Shift grid back to far most left position (Zero)
		
				x_shift = 0; // Sets grid X shift back to zero
				
				//if x_shift == 0 then obj_palette.
		
			break;
		
			case 4: // Shift grid back to top most position (Zero)
		
				y_shift = 0; // Sets grid X shift back to zero
		
			break;
		
			case 5: // Shift grid back to far most left position (Zero)
		
			if zoom_enabled == true  // prevents palette scrolling if it is not enabled
			{
				if cell_size * 2 < x_max // Prevents error (Can't zoom past hard Y limit)
				{
				    if cell_size < cell_max // Ensures grid can't be zoomed outside of specified limits
				    {
						if y_limit > 1 // Prevents y_limit from being zero
						{
					        cell_size = cell_size * 2; // Doubles cell size
                
					        x_scale = x_scale * 2; // Double X scale
					        y_scale = y_scale * 2; // Double Y scale
                
					        x_limit = floor(x_limit / 2); // Half X limit
					        y_limit = floor(y_limit / 2); // Half Y limit
						}
				    }
				}
			}
		
			break;
		
			case 6: // Shift grid back to top most position (Zero)
		
			if zoom_enabled == true  // prevents palette scrolling if it is not enabled
			{
				if cell_size * 2 < x_max // Prevents error (Can't zoom past hard Y limit)
				{
				    if cell_size > cell_min // Ensures grid can't be zoomed outside of specified limits
				    {
						if y_limit > 1 // Prevents y_limit from being zero
						{
					        cell_size = cell_size / 2; // Doubles cell size
                
					        x_scale = x_scale / 2; // Double X scale
					        y_scale = y_scale / 2; // Double Y scale
                
					        x_limit = floor(x_limit * 2); // Half X limit
					        y_limit = floor(y_limit * 2); // Half Y limit
						}
				    }
				}
			}
	
			break;
		
			case 7: // PAN GRID LEFT
		
				if y_shift > 0 then y_shift --; // Shift left by one if within limits
		
			break;
		
			case 8: // PAN GRID RIGHT
		
				 if y_shift + y_limit < hard_y_limit then y_shift ++; // Shift right by one if within limits
		
			break;
		
			case 9: // PAN GRID UP
		
				if x_shift > 0 then x_shift --; // Shift up by one if within limits
		
			break;
		
			case 10: // PAN GRID DOWN
		
				 if x_shift + x_limit < hard_x_limit then x_shift ++; // Shift down by one if within limits
		
			break;
			
			case 11: // Vertical tile flip
		
				 global.flip_vertical_enabled = !global.flip_vertical_enabled; // Toggles flip vertical status
				 
		
			break;
			
			case 12: // Horizontal tile flip
		
				 global.flip_horizontal_enabled = !global.flip_horizontal_enabled; // Toggles flip horizontal status
		
			break;
			
			case 13: // Tile rotation
			
				global.rotate_enabled = !global.rotate_enabled; // Toggles tile rotation status
			
			break;
			
			case 22: // Sound-FX
		
				global.sound_fx_enabled = !global.sound_fx_enabled; // Toggle Sound-FX
		
			break;
			
			case 23: // Music
			
				global.music_enabled = !global.music_enabled; // Toggle music
			
			break;
		
			case 30: // Quit
		
				game_end(); // Quit application
		
			break;
		}
	}
}