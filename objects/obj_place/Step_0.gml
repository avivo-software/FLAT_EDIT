/// @description Manipulate tiles

/***************************************************************************
*								MANIPULATE TILES						   *
***************************************************************************/

if obj_grid.mouse_in_grid == true
{
	if mouse_check_button(global.controls[0])
	{
		tilemap_set("lyr_collide", obj_tiles.last_selection, obj_grid.x_pos, obj_grid.y_pos);
	}
}

