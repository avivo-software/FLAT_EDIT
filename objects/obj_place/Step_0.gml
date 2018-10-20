/// @description Manipulate tiles

/***************************************************************************
*								MANIPULATE TILES						   *
***************************************************************************/

if obj_grid.mouse_in_grid == true // Ensures mouse cursor is still inside the grid.
{
	if mouse_check_button_pressed(global.controls[0]) // Checks for mouse action button click
	{
		ds_grid_set(collide_grid_index, obj_grid.x_pos, obj_grid.y_pos, obj_tiles.last_selection); // Sets tile index to last selection
		
		if global.rotate_enabled == true // Checks if rotation is enabled before rotating
		{
			current_rotation = ds_grid_get(collide_grid_angle, obj_grid.x_pos, obj_grid.y_pos); // Gets current rotation value for current tile
			if current_rotation + 90 < 360 then current_rotation = current_rotation + 90 else current_rotation = 0; // Adds to rotation by 90 degrees
			ds_grid_set(collide_grid_angle, obj_grid.x_pos, obj_grid.y_pos, current_rotation); // Set new rotation value
		}
		
		//if global.flip_horizontal_enabled == true // Checks if flip horizontal is enabled before flipping
		//{
			//current_flip = ds_grid_get(collide_grid_flip_horizontal, obj_grid.x_pos, obj_grid.y_pos);
			//show_message(current_flip);
			//ds_grid_set(collide_grid_flip_horizontal, obj_grid.x_pos, obj_grid.y_pos, current_flip * -1);
		//}
	}
	
	if mouse_check_button_pressed(global.controls[1]) // Checks for delete mouse click
	{
		ds_grid_set(collide_grid_index, obj_grid.x_pos, obj_grid.y_pos, 0); // Deletes selected tile by setting its index to zero
	}
}