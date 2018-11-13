/// @description Manipulate tiles

/***************************************************************************
*								MANIPULATE TILES						   *
***************************************************************************/

// SETS DEFAULT CURRENT VALUES

current_sprite = obj_tiles.current_sprite; // Set current sprite  
		
current_index = collide_index; // Set current index  
current_rotation = collide_angle; // Set current angle  
current_x_scale = collide_flip_horizontal; // Set current flip horizontal
current_y_scale = collide_flip_vertical; // Set current flip vertical

if obj_grid.mouse_in_grid == true // Checks mouse is inside grid to 
{
	switch global.current_layer // Determines current layer
	{
		case 0: // Sets collide layer
	
			current_sprite = obj_tiles.current_sprite; // Sets current sprite 
		
			current_index = collide_index; // Sets current index
			current_rotation = collide_angle; // Sets current angle
			current_x_scale = collide_flip_horizontal; // Sets current flip horizontal
			current_y_scale = collide_flip_vertical; // Sets current flip vertical
	
		break;
	
		case 1: // Set danger layer
	
			current_sprite = spr_danger_tile_colour; // Sets current sprite 
		
			current_index = danger_index; // Sets current index
			current_rotation = danger_angle; // Sets current angle
			current_x_scale = danger_flip_horizontal; // Sets current flip horizontal
			current_y_scale = danger_flip_vertical; // Sets current flip vertical
		
		break;
	}
	
	if mouse_check_button_pressed(global.controls[0]) // Checks for mouse click action button
	{
		current_index[obj_grid.x_pos, obj_grid.y_pos] = obj_tiles.last_selection; // Sets current_index to last selection
		
		if global.rotate_enabled == true // Ensure rotation is enabled before rotating
		{
			if current_rotation[obj_grid.x_pos, obj_grid.y_pos] < 270  // Checks if current rotation is less than 270
			{
				current_rotation[obj_grid.x_pos, obj_grid.y_pos] = current_rotation[obj_grid.x_pos, obj_grid.y_pos] + 90; // Add 90 degrees to angle
			}
				else
			{
				current_rotation[obj_grid.x_pos, obj_grid.y_pos] = 0; // Set angle back to zero
			}
		}
		
		if global.flip_horizontal_enabled == true // Ensure flip horizontal is enabled before rotating
		{
			if current_rotation[obj_grid.x_pos, obj_grid.y_pos] == 0 or current_rotation[obj_grid.x_pos, obj_grid.y_pos] == 180 // Checks angle is 0 or 180
			{
				current_x_scale[obj_grid.x_pos, obj_grid.y_pos] = current_x_scale[obj_grid.x_pos, obj_grid.y_pos] * -1; // Flip X
			}
				else
			{
				current_y_scale[obj_grid.x_pos, obj_grid.y_pos] = current_y_scale[obj_grid.x_pos, obj_grid.y_pos] * -1; // Flip Y
			}
		}
		
		if global.flip_vertical_enabled == true // Ensure flip vertical is enabled before rotating
		{
			if current_rotation[obj_grid.x_pos, obj_grid.y_pos] == 90 or current_rotation[obj_grid.x_pos, obj_grid.y_pos] == 270 // Checks angle is 90 or 270
			{
				current_x_scale[obj_grid.x_pos, obj_grid.y_pos] = current_x_scale[obj_grid.x_pos, obj_grid.y_pos] * -1; // Flip X
			}
				else
			{
				current_y_scale[obj_grid.x_pos, obj_grid.y_pos] = current_y_scale[obj_grid.x_pos, obj_grid.y_pos] * -1; // Flip Y
			}
		}
	}

	if mouse_check_button_pressed(global.controls[1]) // Checks if context mouse button has been pressed
	{
		current_index[obj_grid.x_pos, obj_grid.y_pos] = 0; // Sets current index
	}
	
	switch global.current_layer // Checks current layer value
	{
		case 0:
		
			collide_index = current_index; // Sets collide index to current index
			collide_angle = current_rotation;  // Sets collide angle to current rotation
			collide_flip_horizontal = current_x_scale; // Sets collide flip horizontal to current X scale
			collide_flip_vertical = current_y_scale; // Sets collide flip vertical to current Y scale
	
		break;
	
		case 1:
		
			danger_index = current_index; // Sets danger index to current index
			danger_angle = current_rotation; // Sets danger angle to current rotation
			danger_flip_horizontal = current_x_scale; // Sets danger flip horizontal to current X scale
			danger_flip_vertical = current_y_scale; // Sets danger flip vertical to current Y scale
		
		break;
	}
}
