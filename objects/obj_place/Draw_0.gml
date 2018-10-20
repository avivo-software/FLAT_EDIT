/// @description Draw tiles

/***************************************************************************
*									DRAW TILES							   *
***************************************************************************/

for(j = 0; j < obj_grid.y_limit; j++) // Outer loop
{
	for(i = 0; i < obj_grid.x_limit; i++) // Inner loop
	{
		current_sprite = obj_tiles.current_sprite;
		current_index = ds_grid_get(collide_grid_index, i + obj_grid.x_shift, j + obj_grid.y_shift);
		
		x = obj_grid.x_offset + i * (obj_grid.cell_size) + i;
		y = obj_grid.y_offset + j * (obj_grid.cell_size) + j;
		
		x_scale = obj_grid.x_scale * ds_grid_get(collide_grid_flip_horizontal, i + obj_grid.x_shift, j + obj_grid.y_shift);
		y_scale = obj_grid.y_scale * ds_grid_get(collide_grid_flip_vertical, i + obj_grid.x_shift, j + obj_grid.y_shift);
		
		rotation = ds_grid_get(collide_grid_angle, i + obj_grid.x_shift, j + obj_grid.y_shift);
		
		draw_sprite_ext(current_sprite, current_index, x, y, x_scale, y_scale, rotation, c_white, 1);
	}
}