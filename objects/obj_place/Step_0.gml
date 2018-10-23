/// @description Manipulate tiles

/***************************************************************************
*								MANIPULATE TILES						   *
***************************************************************************/

if obj_grid.mouse_in_grid == true // Ensures mouse cursor is still inside the grid.
{
	if mouse_check_button_pressed(global.controls[0]) // Checks for mouse action button click
	{
		ds_grid_set(collide_grid_index, obj_grid.x_pos, obj_grid.y_pos, obj_tiles.last_selection); // Sets tile index to last selection
		
		// ROTATE SELECTED TILE
		
		if global.rotate_enabled == true // Checks if rotation is enabled before rotating
		{
			current_rotation = ds_grid_get(collide_grid_angle, obj_grid.x_pos, obj_grid.y_pos); // Gets current rotation value for current tile
			
			if current_rotation + 90 < 360 then current_rotation = current_rotation + 90 else current_rotation = 0; // Adds to rotation by 90 degrees
			ds_grid_set(collide_grid_angle, obj_grid.x_pos, obj_grid.y_pos, current_rotation); // Set new rotation value
		}
		
		// FLIP SELECTED TILE HORIZONTALLY
		
		if global.flip_horizontal_enabled == true // Checks horizontal flipping is enabled before flipping
		{
			current_rotation = ds_grid_get(collide_grid_angle, obj_grid.x_pos, obj_grid.y_pos); // Stores rotation value for current tile
			
			current_flip_horizontal = ds_grid_get(collide_grid_flip_horizontal, obj_grid.x_pos, obj_grid.y_pos); // Stores horizontal flip value for current tile
			current_flip_vertical = ds_grid_get(collide_grid_flip_vertical, obj_grid.x_pos, obj_grid.y_pos); // Stores vertical flip value for current tile
			
			if current_rotation == 0 or current_rotation == 180 // Checks rotation value is set to 0 or 180
			{
				ds_grid_set(collide_grid_flip_horizontal, obj_grid.x_pos, obj_grid.y_pos,current_flip_horizontal * -1); // Flips selected tile horizontally
			}
			
			if current_rotation == 90 or current_rotation == 270 // Checks rotation value is set to 90 or 270
			{
				ds_grid_set(collide_grid_flip_vertical, obj_grid.x_pos, obj_grid.y_pos, current_flip_vertical * -1); // Flips selected tile vertically
			}
		}
		
		// FLIP SELECTED TILE VERTICALLY
		
		if global.flip_vertical_enabled == true // Checks vertical flipping is enabled before flipping
		{
			current_rotation = ds_grid_get(collide_grid_angle, obj_grid.x_pos, obj_grid.y_pos); // Stores rotation value for current tile
			
			current_flip_horizontal = ds_grid_get(collide_grid_flip_horizontal, obj_grid.x_pos, obj_grid.y_pos); // Stores horizontal flip value for current tile
			current_flip_vertical = ds_grid_get(collide_grid_flip_vertical, obj_grid.x_pos, obj_grid.y_pos); // Stores vertical flip value for current tile
			
			if current_rotation == 90 or current_rotation == 270 // Checks rotation value is set to 90 or 270
			{
				ds_grid_set(collide_grid_flip_horizontal, obj_grid.x_pos, obj_grid.y_pos,current_flip_horizontal * -1); // Flips selected tile horizontally
			}
			
			if current_rotation == 0 or current_rotation == 180 // Checks rotation value is set to 0 or 180
			{
				ds_grid_set(collide_grid_flip_vertical, obj_grid.x_pos, obj_grid.y_pos, current_flip_vertical * -1); // Flips selected tile vertically
			}
		}
	}
	
	// REMOVES SELECTED TILE
	
	if mouse_check_button_pressed(global.controls[1]) // Checks for delete mouse click
	{
		ds_grid_set(collide_grid_index, obj_grid.x_pos, obj_grid.y_pos, 0); // Deletes selected tile by setting its index to zero
		ds_grid_set(collide_grid_angle, obj_grid.x_pos, obj_grid.y_pos, 0); // Resets grid angle for selected tile
		ds_grid_set(collide_grid_flip_horizontal, obj_grid.x_pos, obj_grid.y_pos, 1); // Resets grid flip horizontal for selected tile
		ds_grid_set(collide_grid_flip_vertical, obj_grid.x_pos, obj_grid.y_pos, 1); // Resets grid vertical for selected tile
	}
}
