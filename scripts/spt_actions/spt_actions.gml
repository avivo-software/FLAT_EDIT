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
				
				if x_shift == 0 then other.stuck[argument1] = true; // Sticks button down if limit is reached
		
			break;
		
			case 4: // Shift grid back to top most position (Zero)
		
				y_shift = 0; // Sets grid X shift back to zero
				
				if y_shift == 0 then other.stuck[argument1] = true; // Sticks button down if limit is reached
		
			break;
		
			case 5: // Zoom out	

			if cell_size > cell_min
			{
				cell_size = cell_size / 2; // Doubles cell size
                
				x_scale = x_scale / 2; // Double X scale
				y_scale = y_scale / 2; // Double Y scale
                
				x_limit = floor(x_limit * 2); // Half X limit
				y_limit = floor(y_limit * 2); // Half Y limit
			}
			
			if x_shift + x_limit > hard_x_limit then x_shift = x_shift - (x_limit / 2); // Ensures hard X limit is not breached
			if y_shift + y_limit > hard_y_limit then y_shift = y_shift - (y_limit / 2); // Ensures hard Y limit is not breached
			
			if x_shift < 0 then x_shift = 0; // Ensures grid can't be panned to negitive numbers X
			if y_shift < 0 then y_shift = 0; // Ensures grid can't be panned to negitive numbers Y
			
			break;
		
			case 6: // Zoom in
			
			if cell_size < cell_max
			{
				cell_size = cell_size * 2; // Doubles cell size
                
				x_scale = x_scale * 2; // Double X scale
				y_scale = y_scale * 2; // Double Y scale
                
				x_limit = floor(x_limit / 2); // Half X limit
				y_limit = floor(y_limit / 2); // Half Y limit
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
			
				show_debug_message("refresh");
			
			break;
			
			case 15: // Undo max actions
			
				show_debug_message("undo max");
			
			break;
			
			case 16: // Undo one action
			
				show_debug_message("undo one");
			
			break;
			
			case 17: // Play
			
				show_debug_message("play");
			
			break;
			
			case 18: // Pause
			
				show_debug_message("pause");
			
			break;
			
			case 19: // Redo one action
			
				show_debug_message("redo one");
			
			break;
			
			case 20: // Redo max actions
			
				show_debug_message("redo max");
			
			break;
			
			case 21: // Controls
			
				show_debug_message("controls");
			
			break;
			
			case 22: // Sound-FX
		
				global.sound_fx_enabled = !global.sound_fx_enabled; // Toggle Sound-FX
		
			break;
			
			case 23: // Music
			
				global.music_enabled = !global.music_enabled; // Toggle music
			
			break;
			
			case 24: // Settings
			
				show_debug_message("settings");
			
			break;
			
			case 25: 
			
				show_debug_message("load"); // Load
			
			break;
			
			case 26: // Save
			
				show_debug_message("save");
			
			break;
			
			case 27: // Delete
			
				show_debug_message("delete");
			
			break;
						
			case 28: // Info
			
				show_debug_message("info");
			
			break;
			
			case 29: // Help
			
				show_debug_message("help");
			
			break;

		
			case 30: // Quit
		
				game_end(); // Quit application
		
			break;
		}
	}
}