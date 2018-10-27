/// @description Draw tiles

/***************************************************************************
*									DRAW TILES							   *
***************************************************************************/

for(j = 0; j < obj_grid.y_limit; j++) // Outer loop
{
	for(i = 0; i < obj_grid.x_limit; i++) // Inner loop
	{
		draw_sprite_ext(spr_danger_tile_colour, danger_index[i, j], obj_grid.x_offset + (i * obj_grid.cell_size), obj_grid.y_offset + (j * obj_grid.cell_size), danger_flip_horizontal[i, j] * obj_grid.x_scale, danger_flip_vertical[i, j] * obj_grid.y_scale, danger_angle[i, j], c_white, 1);
		draw_sprite_ext(global.current_sprite, collide_index[i, j], obj_grid.x_offset + (i * obj_grid.cell_size), obj_grid.y_offset + (j * obj_grid.cell_size), collide_flip_horizontal[i, j] * obj_grid.x_scale, collide_flip_vertical[i, j] * obj_grid.y_scale, collide_angle[i, j], c_white, 1);
	}
}