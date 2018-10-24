/// @description Draw tiles

/***************************************************************************
*									DRAW TILES							   *
***************************************************************************/

for(j = 0; j < obj_grid.y_limit; j++) // Outer loop
{
	for(i = 0; i < obj_grid.x_limit; i++) // Inner loop
	{
		current_sprite = obj_tiles.current_sprite; // Loads current tileset into local variable
		current_index = ds_grid_get(collide_grid_index, i + obj_grid.x_shift, j + obj_grid.y_shift); // Loads current sprite index into local variable
		
		x = obj_grid.x_offset + i * (obj_grid.cell_size); // Sets current X position
		y = obj_grid.y_offset + j * (obj_grid.cell_size); // Sets current Y position
		
		current_x_scale = obj_grid.x_scale * ds_grid_get(collide_grid_flip_horizontal, i + obj_grid.x_shift, j + obj_grid.y_shift); // Loads current X scale into local variable
		current_y_scale = obj_grid.y_scale * ds_grid_get(collide_grid_flip_vertical, i + obj_grid.x_shift, j + obj_grid.y_shift); // Loads current Y scale into local variable
		
		current_rotation = ds_grid_get(collide_grid_angle, i + obj_grid.x_shift, j + obj_grid.y_shift); // Loads current rotation into local variable
		
		spt_translate(); // Tranlates tiles to correct position
		
		draw_sprite_ext(current_sprite, current_index, x, y, current_x_scale, current_y_scale, current_rotation, c_white, 1); // Draw current tiles based on above variables
	}
}