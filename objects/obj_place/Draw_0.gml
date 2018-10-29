/// @description Draw tiles

/***************************************************************************
*									DRAW TILES							   *
***************************************************************************/

for(j = 0; j < obj_grid.y_limit; j++) // Outer loop
{
	for(i = 0; i < obj_grid.x_limit; i++) // Inner loop
	{
		// DRAW COLLIDE DATA
		
		current_sprite = spr_city_tile_colour; // Sets current sprite to collide layer tileset
		current_index = danger_index[i + obj_grid.x_shift, j + obj_grid.y_shift]; // Stores current index
		
		current_x_scale = danger_flip_horizontal[i + obj_grid.x_shift, j + obj_grid.y_shift] * obj_grid.x_scale; // Stores current X scale
		current_y_scale = danger_flip_vertical[i + obj_grid.x_shift, j + obj_grid.y_shift] * obj_grid.y_scale; // Stores current Y scale
		
		current_rotation = danger_angle[i + obj_grid.x_shift, j + obj_grid.y_shift]; // Stores current rotation
		
		x = obj_grid.x_offset + (i * obj_grid.cell_size); // Stores current X position
		y = obj_grid.y_offset + (j * obj_grid.cell_size); // Stores current Y position
		
		spt_translate(); // Recalculates X and Y positions based on rotation and flip values
		
		draw_sprite_ext(spr_danger_tile_colour, danger_index[i + obj_grid.x_shift, j + obj_grid.y_shift], x, y, danger_flip_horizontal[i + obj_grid.x_shift, j + obj_grid.y_shift] * obj_grid.x_scale, danger_flip_vertical[i + obj_grid.x_shift, j + obj_grid.y_shift] * obj_grid.y_scale, danger_angle[i + obj_grid.x_shift, j + obj_grid.y_shift], c_white, 1); // Draw tile
		
		// DRAW DANGER
		
		current_sprite = obj_tiles.current_sprite; // Sets current sprite to danger layer tileset
		current_index = collide_index[i + obj_grid.x_shift, j + obj_grid.y_shift]; // Stores current index
		
		current_x_scale = collide_flip_horizontal[i + obj_grid.x_shift, j + obj_grid.y_shift] * obj_grid.x_scale; // Stores current X scale
		current_y_scale = collide_flip_vertical[i + obj_grid.x_shift, j + obj_grid.y_shift] * obj_grid.y_scale; // Stores current Y scale
		
		current_rotation = collide_angle[i + obj_grid.x_shift, j + obj_grid.y_shift]; // Stores current rotation
		
		x = obj_grid.x_offset + (i * obj_grid.cell_size); // Stores current X position
		y = obj_grid.y_offset + (j * obj_grid.cell_size); // Stores current Y position
		
		spt_translate(); // Recalculates X and Y positions based on rotation and flip values
		
		draw_sprite_ext(global.current_sprite, collide_index[i + obj_grid.x_shift, j + obj_grid.y_shift], x, y, collide_flip_horizontal[i + obj_grid.x_shift, j + obj_grid.y_shift] * obj_grid.x_scale, collide_flip_vertical[i + obj_grid.x_shift, j + obj_grid.y_shift] * obj_grid.y_scale, collide_angle[i + obj_grid.x_shift, j + obj_grid.y_shift], c_white, 1); // Draw tile
	}
}
