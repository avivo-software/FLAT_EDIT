/// @description Draw tiles

/***************************************************************************
*									DRAW TILES							   *
***************************************************************************/

for(j = 0; j < obj_grid.y_limit; j++) // Outer loop
{
	for(i = 0; i < obj_grid.x_limit; i++) // Inner loop
	{
		x = obj_grid.x_offset + (i * obj_grid.cell_size);
		y = obj_grid.y_offset + (j * obj_grid.cell_size);
		
		current_index = collide_index[i, j];
		
		current_rotation = collide_angle[i, j];
		
		current_x_scale = collide_flip_horizontal[i, j];
		current_y_scale = collide_flip_vertical[i, j];
		
		spt_translate();
		
		draw_sprite_ext(obj_tiles.current_sprite, current_index, x, y, current_x_scale * obj_grid.x_scale, current_y_scale * obj_grid.y_scale, current_rotation, c_white, 1);
	}
}
