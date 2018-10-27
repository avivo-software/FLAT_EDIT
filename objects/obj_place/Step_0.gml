/// @description Manipulate tiles

/***************************************************************************
*								MANIPULATE TILES						   *
***************************************************************************/

if obj_grid.mouse_in_grid == true
{
	if mouse_check_button(global.controls[0])
	{
		if global.current_layer == 0 then collide_index[obj_grid.x_pos, obj_grid.y_pos] = obj_tiles.last_selection;
		if global.current_layer == 1 then danger_index[obj_grid.x_pos, obj_grid.y_pos] = obj_tiles.last_selection;
	}
}