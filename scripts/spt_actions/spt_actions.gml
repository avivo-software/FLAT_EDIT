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
				
				if x_shift == 0 then other.stuck[argument1] = true; // Sticks button down if minimum limit is reached
		
			break;
		
			case 4: // Shift grid back to top most position (Zero)
		
				y_shift = 0; // Sets grid X shift back to zero
		
			break;
		
			case 5: // Shift grid back to far most left position (Zero)
			
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
			
			other.stuck[6] = false; // Unsticks zoom in button
			
			if cell_size = cell_min // Checks if minimum limit has been reached
			{
				other.stuck[5] = true; // Sticks zoom button
			}
				else
			{
				other.stuck[5] = false; // Unsticks zoom out button
			}
			
			break;
		
			case 6: // Shift grid back to top most position (Zero)
			
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
			
			other.stuck[5] = false; // Unsticks zoom out button
			
			if cell_size = cell_max // Checks if maximum limit has been reached
			{
				other.stuck[6] = true; // Sticks zoom in button
			}
				else
			{
				other.stuck[6] = false; // Unsticks zoom in button
			}
			
			break;
		
			case 7: // PAN GRID LEFT
		
				if x_shift > 0 then x_shift --; // Shift left by one if within limits (Greater than zero)
				
				if x_shift = 0 or x_shift + x_limit = hard_x_limit // Checks if grid is within limits
				{
					other.stuck[3] = true // Sticks far left pan button
					other.stuck[7] = true; // Sticks pan left button
					other.stuck[8] = false; // Sticks pan far right button
				}
					else
				{
					other.stuck[3] = false; // Unsticks far left pan button
					other.stuck[7] = false; // Unsticks pan left button
					other.stuck[8] = false // Unsticks pan far right button
				}
		
			break;
		
			case 8: // PAN GRID RIGHT
		
				if x_limit + x_shift < hard_x_limit then x_shift ++; // Checks if grid is within limits
				
				other.stuck[7] = false; // Sticks pan left button
				other.stuck[3] = false; // Unsticks far left pan button
				
				if x_limit + x_shift < hard_x_limit // Checks if grid is within max limits
				{
					other.stuck[8] = false; // Unsticks pan far right button
				}
					else
				{
					other.stuck[8] = true; // Sticks pan far right button
					other.stuck[3] = true; // Sticks far left pan button
				}
		
			break;
		
			case 9: // PAN GRID UP
		
				if y_shift > 0 then y_shift --; // Shift left by one if within limits (Greater than zero)
				
				if y_shift = 0 or y_shift + y_limit = hard_y_limit // Checks if grid is within limits
				{
					other.stuck[4] = true // Sticks far top pan button
					other.stuck[9] = true; // Sticks up pan button
					other.stuck[10] = false; // Unsticks down pan button
				}
					else
				{
					other.stuck[4] = false; // Unsticks far top pan button
					other.stuck[9] = false; // Unsticks up pan button
					other.stuck[10] = false // Unsticks down pan button
				}
		
			break;
		
			case 10: // PAN GRID DOWN
		
				if y_limit + y_shift < hard_y_limit then y_shift ++; // Checks if grid is within limits
				
				other.stuck[9] = false; // Unsticks up pan button
				other.stuck[4] = false; // Unsticks far top pan button
				
				if y_limit + y_shift < hard_y_limit // Checks if grid is within max limits
				{
					other.stuck[10] = false; // Unsticks down pan button
				}
					else
				{
					other.stuck[10] = true; // Sticks down pan button
					other.stuck[4] = true; // Sticks far top pan button
				}
		
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
			
			case 14: // Refresh
			
				show_message("refresh");
			
			break;
			
			case 15: // Undo max actions
			
				show_message("undo max");
			
			break;
			
			case 16: // Undo one action
			
				show_message("undo one");
			
			break;
			
			case 17: // Play
			
				show_message("play");
			
			break;
			
			case 18: // Pause
			
				show_message("pause");
			
			break;
			
			case 19: // Redo one action
			
				show_message("redo one");
			
			break;
			
			case 20: // Redo max actions
			
				show_message("redo max");
			
			break;
			
			case 21: // Controls
			
				show_message("controls");
			
			break;
			
			case 22: // Sound-FX
		
				global.sound_fx_enabled = !global.sound_fx_enabled; // Toggle Sound-FX
		
			break;
			
			case 23: // Music
			
				global.music_enabled = !global.music_enabled; // Toggle music
			
			break;
			
			case 24: // Settings
			
				show_message("settings");
			
			break;
			
			case 25: 
			
				show_message("load"); // Load
			
			break;
			
			case 26: // Save
			
				show_message("save");
			
			break;
			
			case 27: // Delete
			
				show_message("delete");
			
			break;
						
			case 28: // Info
			
				show_message("info");
			
			break;
			
			case 29: // Help
			
				show_message("help");
			
			break;

		
			case 30: // Quit
		
				game_end(); // Quit application
		
			break;
		}
	}
}