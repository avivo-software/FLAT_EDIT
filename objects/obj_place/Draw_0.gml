/// @description Draw tiles

/***************************************************************************
*									DRAW TILES							   *
***************************************************************************/

for(j = 0; j < obj_grid.y_limit; j++) // Outer loop
{
	for(i = 0; i < obj_grid.x_limit; i++) // Inner loop
	{
		// DRAW DANGER DATA
		
		current_sprite = spr_danger_tile_colour; // Sets current sprite to collide layer tileset
		current_index = danger_index[i + obj_grid.x_shift, j + obj_grid.y_shift]; // Stores current index
		
		current_x_scale = danger_flip_horizontal[i + obj_grid.x_shift, j + obj_grid.y_shift] * obj_grid.x_scale; // Stores current X scale
		current_y_scale = danger_flip_vertical[i + obj_grid.x_shift, j + obj_grid.y_shift] * obj_grid.y_scale; // Stores current Y scale
		
		current_rotation = danger_angle[i + obj_grid.x_shift, j + obj_grid.y_shift]; // Stores current rotation
		
		x = obj_grid.x_offset + (i * obj_grid.cell_size); // Stores current X position
		y = obj_grid.y_offset + (j * obj_grid.cell_size); // Stores current Y position
		
		spt_translate(); // Recalculates X and Y positions based on rotation and flip values
		
		if global.current_layer == 1 then layer_alpha = selected_alpha else layer_alpha = non_selected_alpha;
		
		draw_sprite_ext(current_sprite, current_index, x, y, current_x_scale, current_y_scale, current_rotation, c_white, layer_alpha); // Draw danger layer
		
		// DRAW COLLIDE DATA
		
		current_sprite = obj_tiles.current_sprite; // Sets current sprite to danger layer tileset
		current_index = collide_index[i + obj_grid.x_shift, j + obj_grid.y_shift]; // Stores current index
		
		current_x_scale = collide_flip_horizontal[i + obj_grid.x_shift, j + obj_grid.y_shift] * obj_grid.x_scale; // Stores current X scale
		current_y_scale = collide_flip_vertical[i + obj_grid.x_shift, j + obj_grid.y_shift] * obj_grid.y_scale; // Stores current Y scale
		
		current_rotation = collide_angle[i + obj_grid.x_shift, j + obj_grid.y_shift]; // Stores current rotation
		
		x = obj_grid.x_offset + (i * obj_grid.cell_size); // Stores current X position
		y = obj_grid.y_offset + (j * obj_grid.cell_size); // Stores current Y position
		
		spt_translate(); // Recalculates X and Y positions based on rotation and flip values
		
		if global.current_layer == 0 then layer_alpha = selected_alpha else layer_alpha = non_selected_alpha;
		
		draw_sprite_ext(global.current_sprite, current_index, x, y, current_x_scale, current_y_scale, current_rotation, c_white, layer_alpha); // Draw collide layer
	}
}


/***************************************************************************
*								OBJECT PLACEMENT						   *
***************************************************************************/

array_length = ds_list_size(object_data_sprite); // Stores length of list array

current_width = (sprite_get_width(palette_conversion[obj_objects.current_sprite]) * obj_grid.x_scale * (object_x_scale)); // Stores width of current sprite
current_height = (sprite_get_height(palette_conversion[obj_objects.current_sprite]) * obj_grid.y_scale * (object_y_scale)); // Stores height of current sprite

if global.current_layer == 2 // Checks correct layer is selected
{
	if obj_grid.mouse_in_grid == true // Ensures mouseis in grid
	{
		if obj_objects.current_sprite == spr_category_colour = false // Ensures current object palette is not top level category
		{
			if place_enabled == true // Determines if object can be placed
			{
				// DISPLAY PLACEMENT ICON
			
				relative_x_pos = round((mouse_x - obj_grid.x_offset + obj_grid.x_shift * obj_grid.cell_size) / grid_snap) * grid_snap; // Calculates relative X pos
				relative_y_pos = round((mouse_y - obj_grid.y_offset + obj_grid.y_shift * obj_grid.cell_size) / grid_snap) * grid_snap; // Calculates relative Y pos
			
				current_palette = palette_conversion[obj_objects.current_sprite]; // Sets current palette
				current_index = obj_objects.last_selection; // Sets current index

				current_x_pos = round((mouse_x - current_width / 2) / grid_snap) * grid_snap; // Sets current X pos
				current_y_pos = round((mouse_y - current_height / 2) / grid_snap) * grid_snap; // Sets current Y pos
			
				current_x_scale = obj_grid.x_scale * object_x_scale; // Sets current X scale
				current_y_scale = obj_grid.y_scale * object_y_scale; // Sets current Y scale

				current_rotation = object_angle; // Sets current angle

				draw_sprite_ext(current_palette, current_index, current_x_pos + current_width / 2, current_y_pos + current_height / 2, current_x_scale, current_y_scale, current_rotation, c_white, object_alpha); // Draw sprite if place is enabled
			
				// SET OBJECT DATA
			
				if mouse_check_button_pressed(global.controls[0]) // Checks if mouse select button has been pressed
				{
					ds_list_add(object_data_sprite, palette_conversion[obj_objects.current_sprite]); // Add current sprite to sprite list
					ds_list_add(object_data_index, obj_objects.last_selection); // Add current index to index list
					ds_list_add(object_data_angle, object_angle); // Add current angle to angle list
					ds_list_add(object_data_x_pos, relative_x_pos / obj_grid.x_scale); // Add current X pos to X pos list
					ds_list_add(object_data_y_pos, relative_y_pos / obj_grid.y_scale); // Add current Y pos to Y pos list
					ds_list_add(object_data_x_scale, object_x_scale); // Add current X scale to X scale list
					ds_list_add(object_data_y_scale, object_y_scale); // Add current Y scale to Y scale list
				}
			}
		}
	}
}

// DRAW OBJECTS

for(i = 0; i < array_length; i++) // Start loop
{
	current_sprite = object_data_sprite[| i]; // Set current sprite to data sprite
	current_index = object_data_index[| i]; // Set current index to data index
	current_angle = object_data_angle[| i]; // Set current angle to data angle
	
	current_x_pos = object_data_x_pos[| i] * obj_grid.x_scale + obj_grid.x_offset - current_width / 2 - obj_grid.cell_size * obj_grid.x_shift; // Set current X pos to data X pos
	current_y_pos = object_data_y_pos[| i] * obj_grid.y_scale + obj_grid.y_offset - current_height / 2 - obj_grid.cell_size * obj_grid.y_shift; // Set current Y pos to data Y pos
	
	current_x_scale = object_data_x_scale[| i] * obj_grid.x_scale; // Set current X scale to data X scale
	current_y_scale = object_data_y_scale[| i] * obj_grid.y_scale; // Set current Y scale to data Y scale
	
	temp_x_scale = object_data_x_scale[| i]; // Set temp X scale to temp X scale
	temp_y_scale = object_data_y_scale[| i]; // Set temp Y scale to temp Y scale
	
	if temp_x_scale < 0 then temp_x_scale = temp_x_scale * -1; // If X scale is negative make it possitive
	if temp_y_scale < 0 then temp_y_scale = temp_y_scale * -1; // If Y scale is negative make it possitive
	
	current_width = sprite_get_width(current_sprite) * obj_grid.x_scale * temp_x_scale; // Calculates current object width
	current_height = sprite_get_height(current_sprite)* obj_grid.y_scale * temp_y_scale; // Calculates current object height
	
	place_enabled = true;
	
	if point_in_rectangle(mouse_x, mouse_y, current_x_pos, current_y_pos, current_x_pos + current_width, current_y_pos + current_height) // Checks if mouse is hovering over object
	{
		place_enabled = false;
		
		draw_rectangle(current_x_pos, current_y_pos, current_x_pos + current_width, current_y_pos + current_height, 1); // Draw rectangle border arround selected object
		
		if mouse_check_button_pressed(global.controls[0]) // Checks for mouse selection button
		{
			if global.flip_horizontal_enabled == true // Checks if flip horizontal is enabled
			{
				object_data_x_scale[| i] = object_data_x_scale[| i] * -1; // Flips polarity of object X scale thus flipping it
			}
			
			if global.flip_vertical_enabled == true // Checks if flip vertical is enabled
			{
				object_data_x_scale[| i] = object_data_x_scale[| i] * -1; // Flips polarity of object Y scale thus flipping it
			}
			
			if global.rotate_enabled == true // Checks if rotation is enabled
			{
				object_data_angle[| i] = object_data_angle[| i] + rotation_amount; // Rotate object by set amount
			}
		}
		
		if mouse_check_button_pressed(global.controls[1]) // Checks for context mouse button
		{
			ds_list_delete(object_data_sprite, i); // Removes entry for data sprite list
			ds_list_delete(object_data_index, i); // Removes entry for data index list
			ds_list_delete(object_data_angle, i); // Removes entry for data angle list
			
			ds_list_delete(object_data_x_pos, i); // Removes entry for data X pos list
			ds_list_delete(object_data_y_pos, i); // Removes entry for data Y pos list
			
			ds_list_delete(object_data_x_scale, i); // Removes entry for data X scale list
			ds_list_delete(object_data_y_scale, i); // Removes entry for data Y scale list
			
			array_length = ds_list_size(object_data_sprite); // Stores length of list array
			
			place_enabled = true;
		}
	}
	
	if rectangle_in_rectangle(current_x_pos, current_y_pos, current_x_pos + current_width, current_y_pos + current_height, obj_grid.x_offset + current_width, obj_grid.y_offset + current_height, obj_grid.x_offset + obj_grid.x_max - current_width, obj_grid.y_offset + obj_grid.y_max - current_height)
	{
		draw_sprite_ext(current_sprite, current_index, current_x_pos + current_width / 2, current_y_pos + current_height / 2, current_x_scale, current_y_scale, current_angle, c_white, 1); // Draw current sprite
	}
}
