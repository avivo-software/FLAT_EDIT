/// @description Draw tiles

/***************************************************************************
*									DRAW TILES							   *
***************************************************************************/

for(j = 0; j < obj_grid.y_limit; j++) // Outer loop
{
	for(i = 0; i < obj_grid.x_limit; i++) // Inner loop
	{
		// DRAW DANGER DATA
		
		current_sprite = spr_danger_tile_colour; // Sets current sprite to collide layer tileset
		current_index = danger_index[i + obj_grid.x_shift, j + obj_grid.y_shift]; // Stores current index
		
		current_x_scale = danger_flip_horizontal[i + obj_grid.x_shift, j + obj_grid.y_shift] * obj_grid.x_scale; // Stores current X scale
		current_y_scale = danger_flip_vertical[i + obj_grid.x_shift, j + obj_grid.y_shift] * obj_grid.y_scale; // Stores current Y scale
		
		current_rotation = danger_angle[i + obj_grid.x_shift, j + obj_grid.y_shift]; // Stores current rotation
		
		x = obj_grid.x_offset + (i * obj_grid.cell_size); // Stores current X position
		y = obj_grid.y_offset + (j * obj_grid.cell_size); // Stores current Y position
		
		spt_translate(); // Recalculates X and Y positions based on rotation and flip values
		
		if global.current_layer == 1 then layer_alpha = selected_alpha else layer_alpha = non_selected_alpha;
		
		draw_sprite_ext(current_sprite, current_index, x, y, current_x_scale, current_y_scale, current_rotation, c_white, layer_alpha); // Draw danger layer
		
		// DRAW COLLIDE DATA
		
		current_sprite = obj_tiles.current_sprite; // Sets current sprite to danger layer tileset
		current_index = collide_index[i + obj_grid.x_shift, j + obj_grid.y_shift]; // Stores current index
		
		current_x_scale = collide_flip_horizontal[i + obj_grid.x_shift, j + obj_grid.y_shift] * obj_grid.x_scale; // Stores current X scale
		current_y_scale = collide_flip_vertical[i + obj_grid.x_shift, j + obj_grid.y_shift] * obj_grid.y_scale; // Stores current Y scale
		
		current_rotation = collide_angle[i + obj_grid.x_shift, j + obj_grid.y_shift]; // Stores current rotation
		
		x = obj_grid.x_offset + (i * obj_grid.cell_size); // Stores current X position
		y = obj_grid.y_offset + (j * obj_grid.cell_size); // Stores current Y position
		
		spt_translate(); // Recalculates X and Y positions based on rotation and flip values
		
		if global.current_layer == 0 then layer_alpha = selected_alpha else layer_alpha = non_selected_alpha;
		
		draw_sprite_ext(global.current_sprite, current_index, x, y, current_x_scale, current_y_scale, current_rotation, c_white, layer_alpha); // Draw collide layer
	}
}


/***************************************************************************
*								OBJECT PLACEMENT						   *
***************************************************************************/

array_length = ds_list_size(object_data_sprite); // Stores length of list array

current_width = (sprite_get_width(palette_conversion[obj_objects.current_sprite]) * obj_grid.x_scale * (object_x_scale));
current_height = (sprite_get_height(palette_conversion[obj_objects.current_sprite]) * obj_grid.y_scale * (object_y_scale));

if global.current_layer == 2
{
	if obj_grid.mouse_in_grid == true
	{
		if obj_objects.current_sprite == spr_category_colour = false
		{
			relative_x_pos = mouse_x - obj_grid.x_offset + obj_grid.x_shift * obj_grid.cell_size;
			relative_y_pos = mouse_y - obj_grid.y_offset + obj_grid.y_shift * obj_grid.cell_size;
			
			current_palette = palette_conversion[obj_objects.current_sprite];
			current_index = obj_objects.last_selection;

			current_x_pos = mouse_x - current_width / 2;
			current_y_pos = mouse_y - current_height / 2;

			current_x_scale = obj_grid.x_scale * object_x_scale;
			current_y_scale = obj_grid.y_scale * object_y_scale;

			current_rotation = object_angle;
			
			draw_sprite_ext(current_palette, current_index, current_x_pos, current_y_pos, current_x_scale, current_y_scale, current_rotation, c_white, object_alpha);

			if mouse_check_button_pressed(global.controls[0])
			{
				ds_list_add(object_data_sprite, palette_conversion[obj_objects.current_sprite]);
				ds_list_add(object_data_index, obj_objects.last_selection);
				ds_list_add(object_data_angle, object_angle);
				ds_list_add(object_data_x_pos, relative_x_pos / obj_grid.x_scale);
				ds_list_add(object_data_y_pos, relative_y_pos / obj_grid.y_scale);
				ds_list_add(object_data_x_scale, object_x_scale);
				ds_list_add(object_data_y_scale, object_y_scale);
			}
		}
	}
	
	for(i = 0; i < array_length; i++)
	{
		current_sprite = object_data_sprite[| i];
		current_index = object_data_index[| i];
	
		current_x_pos = object_data_x_pos[| i] * obj_grid.x_scale + obj_grid.x_offset - current_width / 2 - obj_grid.cell_size * obj_grid.x_shift;
		current_y_pos = object_data_y_pos[| i] * obj_grid.y_scale + obj_grid.y_offset - current_height / 2 - obj_grid.cell_size * obj_grid.y_shift;
	
		current_x_scale = object_data_x_scale[| i] * obj_grid.x_scale;
		current_y_scale = object_data_y_scale[| i] * obj_grid.y_scale;
	
		current_angle = object_data_angle[| i];
				
		draw_sprite_ext(current_sprite, current_index, current_x_pos, current_y_pos, current_x_scale, current_y_scale, current_angle, c_white, 1);
	}
}