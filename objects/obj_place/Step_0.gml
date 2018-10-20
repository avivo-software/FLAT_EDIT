/// @description Manipulate tiles

/***************************************************************************
*								MANIPULATE TILES						   *
***************************************************************************/

if obj_grid.mouse_in_grid == true // Ensures mouse cursor is still inside the grid.
{
	if mouse_check_button_pressed(global.controls[0]) // Checks for mouse action button click
	{
		ds_grid_set(collide_grid_index, obj_grid.x_pos, obj_grid.y_pos, obj_tiles.last_selection); // Sets tile index to last selection
	}
	
	if mouse_check_button_pressed(global.controls[1]) // Checks for delete mouse click
	{
		ds_grid_set(collide_grid_index, obj_grid.x_pos, obj_grid.y_pos, 0); // Deletes selected tile by setting its index to zero
	}
}