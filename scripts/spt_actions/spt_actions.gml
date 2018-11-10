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
			case 0 : // Home
			
			
			break;
			
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
			

			
			break;
			
			case 15: // Undo max actions
			
				show_debug_message("undo max");
			
			break;
			
			case 16: // Undo one action
			
				show_debug_message("undo one");
			
			break;
			
			case 17: // Play
			
			for(j = 0; j < obj_grid.hard_y_limit; j++) // Outer loop
			{
				for(i = 0; i < obj_grid.hard_x_limit; i++) // Inner loop
				{
					// COLLIDE MAP
					
					lay_id = layer_get_id("lyr_collide"); // Gets layer ID for collide layer
					map_id = layer_tilemap_get_id(lay_id); // Gets map ID for collide layer

					data = tilemap_get(map_id, i, j); // Gets data blob
					index = tile_get_index(data); // Gets index for data blob
					data = tile_set_index(data, obj_place.collide_index[i, j]); // Applies index to data blob
					
					data = tile_set_flip(data, obj_place.collide_flip_data[i, j]); // Applies flip data to blob
					data = tile_set_mirror(data, obj_place.collide_mirror_data[i, j]); // Applies mirror data to blob
					data = tile_set_rotate(data, obj_place.collide_rotate_data[i, j]); // Applies rotate data to blob

					tilemap_set(map_id, data, i, j); // Applies modified blob data

				}
			}
			
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
			
			case 25: // Load
			
			ini_open("test.txt"); // Open ini file for writing
			
			// READ AND APPLY SETTINGS DATA
			
			spt_actions(1, ini_read_real("settings_data", "last_selection", "")); // Toggles slide back to correct possition causeing tile palette to be updated
			
			// POPULATE DANGER GRID WITH DATA
			
			ds_grid_read(obj_place.danger_grid_index, ini_read_string("danger_data", "danger_grid_index", "")); // Read danger index data from file
			ds_grid_read(obj_place.danger_grid_angle, ini_read_string("danger_data", "danger_grid_angle", "")); // Read danger angle data from file
			ds_grid_read(obj_place.danger_grid_flip_horizontal, ini_read_string("danger_data", "danger_grid_flip_horizontal", "")); // Read danger flip horizontal data from file
			ds_grid_read(obj_place.danger_grid_flip_vertical, ini_read_string("danger_data", "danger_grid_flip_vertical", "")); // Read danger flip vertical data from file
			
			// POPULATE COLLIDE DATA
			
			ds_grid_read(obj_place.collide_grid_index, ini_read_string("collide_data", "collide_grid_index", ""));// Read collide index data from file
			ds_grid_read(obj_place.collide_grid_angle, ini_read_string("collide_data", "collide_grid_angle", "")); // Read collide angle data from file
			ds_grid_read(obj_place.collide_grid_flip_horizontal, ini_read_string("collide_data", "collide_grid_flip_horizontal", "")); // Read collide flip horizontal data from file
			ds_grid_read(obj_place.collide_grid_flip_vertical, ini_read_string("collide_data", "collide_grid_flip_vertical", "")); // Read collide flip vertical data from file
			
			// POPULATE ARRAYS WITH PREVIOUSLY LOADED GRID DATA
			
			for(j = 0; j < obj_grid.hard_y_limit; j++) // Outer loop
			{
				for(i = 0; i < obj_grid.hard_x_limit; i++) // Inner loop
				{
					// LOAD DANGER GRID DATA INTO ARRAY
					
					obj_place.danger_index[i, j] = ds_grid_get(obj_place.danger_grid_index, i, j); // Populate danger index array with previously loaded grid data
					obj_place.danger_angle[i, j] = ds_grid_get(obj_place.danger_grid_angle, i, j); // Populate danger angle array with previously loaded grid data
					obj_place.danger_flip_horizontal[i, j] = ds_grid_get(obj_place.danger_grid_flip_horizontal, i, j); // Populate danger flip horizontal array with previously loaded grid data
					obj_place.danger_flip_vertical[i, j] = ds_grid_get(obj_place.danger_grid_flip_vertical, i, j); // Populate danger flip vertical array with previously loaded grid data
					
					// LOAD COLLIDE GRID DATA INTO ARRAY
					
					obj_place.collide_index[i, j] = ds_grid_get(obj_place.collide_grid_index, i, j); // Populate danger index array with previously loaded grid data
					obj_place.collide_angle[i, j] = ds_grid_get(obj_place.collide_grid_angle, i, j); // Populate danger angle array with previously loaded grid data
					obj_place.collide_flip_horizontal[i, j] = ds_grid_get(obj_place.collide_grid_flip_horizontal, i, j); // Populate danger flip horizontal array with previously loaded grid data
					obj_place.collide_flip_vertical[i, j] = ds_grid_get(obj_place.collide_grid_flip_vertical, i, j); // Populate danger flip vertical array with previously loaded grid data
				}
			}
			
			ini_close(); // Closes ini file for writing preventing memmory leak
			
			obj_buttons.stuck[25] = false; // Ensures button does not stick
			
			break;
			
			case 26: // Save
			
			// CLEAR DANGER GRID DATA (PREVENTS ERROR)
			
			ds_grid_clear(obj_place.danger_grid_index, 0); // Clear danger index data
			ds_grid_clear(obj_place.danger_grid_angle, 0); // Clear danger angle data
			ds_grid_clear(obj_place.danger_grid_flip_horizontal, 0); // Clear danger flip horizontal data
			ds_grid_clear(obj_place.danger_grid_flip_vertical, 0); // Clear danger flip vertical data
			
			// CLEAR COLLIDE GRID DATA (PREVENTS ERROR)
			
			ds_grid_clear(obj_place.collide_grid_index, 0); // Clear collide index data
			ds_grid_clear(obj_place.collide_grid_angle, 0); // Clear collide angle data
			ds_grid_clear(obj_place.collide_grid_flip_horizontal, 0); // Clear collide flip horizontal data
			ds_grid_clear(obj_place.collide_grid_flip_vertical, 0); // Clear collide flip vertical data

			// LOOP THROUGH GRID DATA AND ADD DATA

			for(j = 0; j < obj_grid.hard_y_limit; j++) // Outer loop
			{
				for(i = 0; i < obj_grid.hard_x_limit; i++) // Inner loop
				{
					// ADD DANGER DATA TO GRID
					
					ds_grid_add(obj_place.danger_grid_index, i, j, obj_place.danger_index[i, j]); // Loads array danger index data to grid
					ds_grid_add(obj_place.danger_grid_angle, i, j, obj_place.danger_angle[i, j]); // Loads array danger angle data to grid
					ds_grid_add(obj_place.danger_grid_flip_horizontal, i, j, obj_place.danger_flip_horizontal[i, j]); // Loads array danger flip horizontal data to grid
					ds_grid_add(obj_place.danger_grid_flip_vertical, i, j, obj_place.danger_flip_vertical[i, j]); // Loads array danger flip vertical data to grid
					
					// ADD COLLIDE DATA TO GRID
					
					ds_grid_add(obj_place.collide_grid_index, i, j, obj_place.collide_index[i, j]); // Loads array collide index data to grid
					ds_grid_add(obj_place.collide_grid_angle, i, j, obj_place.collide_angle[i, j]); // Loads array collide angle data to grid
					ds_grid_add(obj_place.collide_grid_flip_horizontal, i, j, obj_place.collide_flip_horizontal[i, j]); // Loads array collide flip horizontal data to grid
					ds_grid_add(obj_place.collide_grid_flip_vertical, i, j, obj_place.collide_flip_vertical[i, j]); // Loads array collide flip vertical data to grid
				}
			}
			
			ini_open("test.txt"); // Open ini file for writing
			
			// WRITE SETTINGS
			
			ini_write_real("settings_data", "last_selection", obj_slides.last_selection); // Write current slide to file
			
			// WRITE DANGER GRID DATA TO FILE
			
			ini_write_string("danger_data", "danger_grid_index", ds_grid_write(obj_place.danger_grid_index)); // Write danger index data to file
			ini_write_string("danger_data", "danger_grid_angle", ds_grid_write(obj_place.danger_grid_angle)); // Write danger angle data to file
			ini_write_string("danger_data", "danger_grid_flip_horizontal", ds_grid_write(obj_place.danger_grid_flip_horizontal)); // Write danger flip horizontal data to file
			ini_write_string("danger_data", "danger_grid_flip_vertical", ds_grid_write(obj_place.danger_grid_flip_vertical)); // Write danger flip vertical data to file
						
			// WRITE COLLIDE GRID DATA TO FILE
						
			ini_write_string("collide_data", "collide_grid_index", ds_grid_write(obj_place.collide_grid_index)); // Write collide index data to file
			ini_write_string("collide_data", "collide_grid_angle", ds_grid_write(obj_place.collide_grid_angle)); // Write collide angle data to file
			ini_write_string("collide_data", "collide_grid_flip_horizontal", ds_grid_write(obj_place.collide_grid_flip_horizontal)); // Write collide flip horizontal data to file
			ini_write_string("collide_data", "collide_grid_flip_vertical", ds_grid_write(obj_place.collide_grid_flip_vertical)); // Write collide flip vertical data to file
			
			ini_close(); // Closes ini file for writing preventing memmory leak
			
			obj_buttons.stuck[26] = false; // Ensures button does not stick
			
			break;
			
			case 27: // Delete
				
				for(j = 0; j < obj_grid.hard_y_limit; j++) // Outer loop
				{
					for(i = 0; i < obj_grid.hard_x_limit; i++) // Inner loop
					{
						// CLEAR COLLIDE VARIABLES
		
						obj_place.collide_index[i, j] = 0; // Set collide index
						obj_place.collide_angle[i, j] = 0; // Set collide angle
						obj_place.collide_flip_horizontal[i, j] = 1; // Set collide flip horizontal
						obj_place.collide_flip_vertical[i, j] = 1; // Set collide flip vertical
		
						// CLEAR DANGER VARIABLES
		
						obj_place.danger_index[i, j] = 0; // Set danger index
						obj_place.danger_angle[i, j] = 0; // Set danger angle
						obj_place.danger_flip_horizontal[i, j] = 1; // Set danger flip horizontal
						obj_place.danger_flip_vertical[i, j] = 1; // Set danger flip vertical
					}
				}
				
				spt_sound(0, 3); // Play delete sound
				
				obj_buttons.stuck[27] = false; // Ensures button does not stick
				
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
	obj_layer.palette_shift = 0; // Sets layer to correct sprite
	
	// LOOPS THROUGH SLIDES AND UNSTICKS THEM APART FROM SELECTED ONE
	
	for(i = 0; i < obj_slides.sprite_qty; i++) // loops through to number of slide availible
	{
		obj_slides.stuck[i] = false; // Unsticks current slide
	}

	obj_slides.stuck[argument1] = true; // Sticks selected slide
	
	switch argument1 // Determines which slide has been selected
	{
		case 0: // Checks if temple slide is selected
		
			tilemap_tileset("lyr_collide", tl_city); // Switch tileset to city
			
			obj_tiles.current_sprite = spr_city_tile_colour; // Sets current tile palette to city
			obj_tiles.primary_sprite = spr_city_tile_colour; // Sets primary sprite to city
			obj_tiles.secondary_sprite = spr_city_tile_grey; // Sets secondary sprite to city
			
			global.current_sprite = spr_city_tile_colour; // Sets current tile palette to city (global)
			global.primary_sprite = spr_city_tile_colour; // Sets primary sprite to city (global)
			global.secondary_sprite = spr_city_tile_grey; // Sets secondary sprite to city (global)
		
		break;
		
		case 1: // Checks if temple slide is selected
		
			tilemap_tileset("lyr_collide", tl_temple); // Switch tileset to temple
			
			obj_tiles.current_sprite = spr_temple_tile_colour; // Sets tile palette to temple
			obj_tiles.primary_sprite = spr_temple_tile_colour; // Sets primary sprite to temple
			obj_tiles.secondary_sprite = spr_temple_tile_grey; // Sets secondary sprite to city
			
			global.current_sprite = spr_temple_tile_colour; // Sets current tile palette to temple (global)
			global.primary_sprite = spr_temple_tile_colour; // Sets primary sprite to temple (global)
			global.secondary_sprite = spr_temple_tile_grey; // Sets secondary sprite to temple (global)
		
		break;
		
		case 2: // Checks if garveyard slide is selected
			
			tilemap_tileset("lyr_collide", tl_graveyard); // Switch tileset to temple
			
			obj_tiles.current_sprite = spr_graveyard_tile_colour; // Sets tile palette to temple
			obj_tiles.primary_sprite = spr_graveyard_tile_colour; // Sets primary sprite to temple
			obj_tiles.secondary_sprite = spr_graveyard_tile_grey; // Sets secondary sprite to city
			
			global.current_sprite = spr_graveyard_tile_colour; // Sets current tile palette to temple (global)
			global.primary_sprite = spr_graveyard_tile_colour; // Sets primary sprite to temple (global)
			global.secondary_sprite = spr_graveyard_tile_grey; // Sets secondary sprite to temple (global)
			
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
	
	palette_shift = global.current_layer; // Updates layer to match current
	global.current_layer = palette_shift; // Updates global layer
	
	if palette_shift == 0
	{
		spt_actions(1, obj_slides.last_selection);
	}
	
	if palette_shift == 1
	{
		tilemap_tileset("lyr_danger", tl_danger); // Switch tileset to city
			
		obj_tiles.current_sprite = spr_danger_tile_colour; // Sets current tile palette to danger
		obj_tiles.primary_sprite = spr_danger_tile_colour; // Sets primary sprite to danger
		obj_tiles.secondary_sprite = spr_danger_tile_grey; // Sets secondary sprite to danger
		
		obj_tiles.sprite_qty = sprite_get_number(obj_tiles.current_sprite); // Stores the number of sub images in current sprite
		obj_tiles.sprite_limit = obj_tiles.sprite_qty; // Sets the maximum number of sprites to draw
	}
}

// OBJECTS PALETTE

if argument0 == 4 // Checks for objects palette
{
	stuck[argument1] = true; // Sticks selected tile
	
	global.current_layer = 2;
	obj_layer.palette_shift = 2;
	
	switch argument1 // Determines which tile index was selected
	{
		case 0: // Category
		
		if current_sprite == spr_category_colour = false 
		{
			current_sprite = spr_category_colour;
			primary_sprite = spr_category_colour;
			secondary_sprite = spr_category_colour;
		}
			else
		{
			current_sprite = spr_lever_colour;
			primary_sprite = spr_lever_colour;
			secondary_sprite = spr_lever_colour;
		}
		
		break;
		
		case 1: // Barrels
		
		if current_sprite == spr_category_colour
		{
			current_sprite = spr_barrels_colour;
			primary_sprite = spr_barrels_colour;
			secondary_sprite = spr_barrels_colour;
		}
	
		break;
		
		case 2: // Blocks
		
		if current_sprite == spr_category_colour
		{
			current_sprite = spr_blocks_colour;
			primary_sprite = spr_blocks_colour;
			secondary_sprite = spr_blocks_colour;
		}
	
		break;
	}
	
	// LOOPS THROUGH OBJECTS AND UNSTICKS THEM APART FROM SELECTED ONE
	
	for(i = 0; i < sprite_qty; i++) // loops through to number of tile availible
	{
		stuck[i] = false; // Unsticks current tile
	}
	
	sprite_qty = sprite_get_number(current_sprite); // Update sprite qty
	sprite_limit = sprite_qty; // Update sprite limit
}