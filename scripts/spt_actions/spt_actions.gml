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
				
				if x_shift == 0 then obj_buttons.stuck[argument1] = true; // Sticks button down if limit is reached
		
			break;
		
			case 4: // Shift grid back to topmost position (Zero)
		
				y_shift = 0; // Sets grid X shift back to zero
				
				if y_shift == 0 then obj_buttons.stuck[argument1] = true; // Sticks button down if limit is reached
		
			break;
		
			case 5: // Zoom out	

			if cell_size > cell_min // Ensures cell size can not go beyond minimum limit
			{
				obj_buttons.stuck[6] = false; // Unsticks zoom out button
				
				cell_size = cell_size / 2; // Doubles cell size
                
				x_scale = x_scale / 2; // Double X scale
				y_scale = y_scale / 2; // Double Y scale
                
				x_limit = floor(x_limit * 2); // Half X limit
				y_limit = floor(y_limit * 2); // Half Y limit
				
				if x_limit + x_shift >= hard_x_limit then x_shift = x_shift - x_limit; // Ensures hard X limit is not breached
				if y_limit + y_shift >= hard_y_limit then y_shift = y_shift - y_limit; // Ensures hard Y limit is not breached
			}
			
			// TOGGLE BUTTON STATUS
			
			if cell_size = cell_min // Checks if cell size is less than minimum cell size
			{
				obj_buttons.stuck[5] = true; // Sticks zoom out button
			}
				else
			{
				obj_buttons.stuck[5] = false; // Unticks zoom in button
			}
			
			if cell_size = cell_min // Checks if cell size is at minimum limit
			{
				obj_buttons.stuck[5] = true; // Sticks zoom out button
			}
				else
			{
				obj_buttons.stuck[5] = false; // Unsticks zoom out button
			}
			
			break;
		
			case 6: // Zoom in
			
			if cell_size < cell_max // Ensures cell size can not go beyond maximum limit
			{
				obj_buttons.stuck[5] = false; // Unsticks zoom in button
				
				cell_size = cell_size * 2; // Doubles cell size
                
				x_scale = x_scale * 2; // Double X scale
				y_scale = y_scale * 2; // Double Y scale
                
				x_limit = floor(x_limit / 2); // Half X limit
				y_limit = floor(y_limit / 2); // Half Y limit
			}
			
			// TOGGLE BUTTON STATUS
			
			if cell_size = cell_max // Checks if cell size is at maximum limit
			{
				obj_buttons.stuck[6] = true; // Sticks zoom in button
			}
				else
			{
				obj_buttons.stuck[6] = false; // Unsticks zoom out button
			}
			
			break;
		
			case 7: // PAN GRID LEFT
		
				if x_shift > 0 then x_shift --; // Shift left by one if within limits (Greater than zero)
				
				if x_shift = 0 or x_shift + x_limit = hard_x_limit // Checks if grid is within limits
				{
					obj_buttons.stuck[3] = true // Sticks far left pan button
					obj_buttons.stuck[7] = true; // Sticks pan left button
					obj_buttons.stuck[8] = false; // Sticks pan far right button
				}
					else
				{
					obj_buttons.stuck[3] = false; // Unsticks far left pan button
					obj_buttons.stuck[7] = false; // Unsticks pan left button
					obj_buttons.stuck[8] = false // Unsticks pan far right button
				}
				
			break;
		
			case 8: // PAN GRID RIGHT
		
				if x_limit + x_shift < hard_x_limit then x_shift ++; // Checks if grid is within limits
				
				obj_buttons.stuck[7] = false; // Sticks pan left button
				obj_buttons.stuck[3] = false; // Unsticks far left pan button
				
				if x_limit + x_shift < hard_x_limit // Checks if grid is within max limits
				{
					obj_buttons.stuck[8] = false; // Unsticks pan far right button
				}
					else
				{
					obj_buttons.stuck[8] = true; // Sticks pan far right button
					obj_buttons.stuck[3] = true; // Sticks far left pan button
				}
		
			break;
		
			case 9: // PAN GRID UP
		
				if y_shift > 0 then y_shift --; // Shift left by one if within limits (Greater than zero)
				
				if y_shift = 0 or y_shift + y_limit = hard_y_limit // Checks if grid is within limits
				{
					obj_buttons.stuck[4] = true // Sticks far top pan button
					obj_buttons.stuck[9] = true; // Sticks up pan button
					obj_buttons.stuck[10] = false; // Unsticks down pan button
				}
					else
				{
					obj_buttons.stuck[4] = false; // Unsticks far top pan button
					obj_buttons.stuck[9] = false; // Unsticks up pan button
					obj_buttons.stuck[10] = false // Unsticks down pan button
				}
		
			break;
		
			case 10: // PAN GRID DOWN
		
				if y_limit + y_shift < hard_y_limit then y_shift ++; // Checks if grid is within limits
				
				obj_buttons.stuck[9] = false; // Unsticks up pan button
				obj_buttons.stuck[4] = false; // Unsticks far top pan button
				
				if y_limit + y_shift < hard_y_limit // Checks if grid is within max limits
				{
					obj_buttons.stuck[10] = false; // Unsticks down pan button
				}
					else
				{
					obj_buttons.stuck[10] = true; // Sticks down pan button
					obj_buttons.stuck[4] = true; // Sticks far top pan button
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

// CHECKS SLIDES

if argument0 == 1 // Checks if action type is slide
{
	global.current_layer = 0; // Sets global layer back to zero (collide layer)
	
	// LOOPS THROUGH SLIDES AND UNSTICKS THEM APART FROM SELECTED ONE
	
	for(i = 0; i < sprite_qty; i++) // loops through to number of slide availible
	{
		stuck[i] = false; // Unsticks current slide
	}

	stuck[argument1] = true; // Sticks selected slide

	switch argument1 // Determines which slide has been selected
	{
		case 0: // Checks if temple slide is selected
		
			tilemap_tileset("lyr_collide", tl_city); // Switch tileset to city
			
			obj_tiles.current_sprite = spr_city_tile_colour; // Sets current tile palette to city
			obj_tiles.primary_sprite = spr_city_tile_colour; // Sets primary sprite to city
			obj_tiles.secondary_sprite = spr_city_tile_grey; // Sets secondary sprite to city
		
		break;
		
		case 1: // Checks if temple slide is selected
		
			tilemap_tileset("lyr_collide", tl_temple); // Switch tileset to temple
			
			obj_tiles.current_sprite = spr_temple_tile_colour; // Sets tile palette to temple
			obj_tiles.primary_sprite = spr_temple_tile_colour; // Sets primary sprite to temple
			obj_tiles.secondary_sprite = spr_temple_tile_grey; // Sets secondary sprite to city
		
		break;
		
		case 2: // Checks if garveyard slide is selected
		
			tilemap_tileset("lyr_collide", tl_graveyard); // Switch tileset to temple
			
			obj_tiles.current_sprite = spr_graveyard_tile_colour; // Sets tile palette to temple
			obj_tiles.primary_sprite = spr_graveyard_tile_colour; // Sets primary sprite to temple
			obj_tiles.secondary_sprite = spr_graveyard_tile_grey; // Sets secondary sprite to city
		
		break;
	}
	
	// ENSURES CORRECT NUMBER OF PALETTE TILES ARE DRAWN
	
	temp_qty = sprite_get_number(obj_tiles.current_sprite); // Stores new tile qty 
	
	for(i = obj_tiles.sprite_qty; i < temp_qty; i++) // Loops through additional tiles needed
	{
		obj_tiles.stuck[i] = false; // Sets new stuck array value to false
		obj_tiles.sticky[i] = true; // Sets new sticky array value to true
	}
	
	obj_tiles.sprite_qty = temp_qty; // Sets new sprite qty
	obj_tiles.sprite_limit = temp_qty; // Sets new sprite limit
}

// CHECKS TILES

if argument0 == 2 // Checks if action type is tiles
{
	// LOOPS THROUGH SLIDES AND UNSTICKS THEM APART FROM SELECTED ONE
	
	for(i = 0; i < sprite_qty; i++) // loops through to number of tile availible
	{
		stuck[i] = false; // Unsticks current tile
	}
	
	stuck[argument1] = true; // Sticks selected tile
}

// CHECKS LAYER

if argument0 == 3 // Checks if action type is layer
{
	if mouse_check_button(global.controls[0]) // Checks for mouse click
	{
		if palette_shift < sprite_qty - 1 then palette_shift ++ else palette_shift = 0; // Cycles layers
	}
	
	image_index = palette_shift; // Sets image index to palette shift
	global.current_layer = palette_shift; // Updates current tile layer to 
}