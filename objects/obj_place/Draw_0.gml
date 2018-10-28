/// @description Draw tiles

/***************************************************************************
*									DRAW TILES							   *
***************************************************************************/

for(j = 0; j < obj_grid.y_limit; j++) // Outer loop
{
	for(i = 0; i < obj_grid.x_limit; i++) // Inner loop
	{
		current_sprite = spr_city_tile_colour;
		current_index = danger_index[i, j];
		
		current_x_scale = danger_flip_horizontal[i, j] * obj_grid.x_scale;
		current_y_scale = danger_flip_vertical[i, j] * obj_grid.y_scale;
		
		current_rotation = danger_angle[i, j];
		
		x = obj_grid.x_offset + (i * obj_grid.cell_size);
		y = obj_grid.y_offset + (j * obj_grid.cell_size);
		
		spt_translate();
		
		draw_sprite_ext(spr_danger_tile_colour, danger_index[i, j], x, y, danger_flip_horizontal[i, j] * obj_grid.x_scale, danger_flip_vertical[i, j] * obj_grid.y_scale, danger_angle[i, j], c_white, 1);
		
		current_sprite = obj_tiles.current_sprite;
		current_index = collide_index[i, j];
		
		current_x_scale = collide_flip_horizontal[i, j] * obj_grid.x_scale;
		current_y_scale = collide_flip_vertical[i, j] * obj_grid.y_scale;
		
		current_rotation = collide_angle[i, j];
		
		x = obj_grid.x_offset + (i * obj_grid.cell_size);
		y = obj_grid.y_offset + (j * obj_grid.cell_size);
		
		spt_translate();
		
		draw_sprite_ext(global.current_sprite, collide_index[i, j], x, y, collide_flip_horizontal[i, j] * obj_grid.x_scale, collide_flip_vertical[i, j] * obj_grid.y_scale, collide_angle[i, j], c_white, 1);
	}
}
