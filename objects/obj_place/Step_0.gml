/// @description Manipulate tiles

/***************************************************************************
*								MANIPULATE TILES						   *
***************************************************************************/

if obj_grid.mouse_in_grid == true // Checks mouse is inside grid to 
{
	switch global.current_layer
	{
		case 0:
	
			current_sprite = obj_tiles.current_sprite;
		
			current_index = collide_index;
			current_rotation = collide_angle;
			current_x_scale = collide_flip_horizontal;
			current_y_scale = collide_flip_vertical;
	
		break;
	
		case 1:
	
			current_sprite = spr_danger_tile_colour;
		
			current_index = danger_index;
			current_rotation = danger_angle;
			current_x_scale = danger_flip_horizontal;
			current_y_scale = danger_flip_vertical;
		
		break;
	}
	
	if mouse_check_button_pressed(global.controls[0])
	{
		current_index[obj_grid.x_pos, obj_grid.y_pos] = obj_tiles.last_selection;
		
		if global.rotate_enabled == true
		{
			if current_rotation[obj_grid.x_pos, obj_grid.y_pos] < 270 
			{
				current_rotation[obj_grid.x_pos, obj_grid.y_pos] = current_rotation[obj_grid.x_pos, obj_grid.y_pos] + 90;
			}
				else
			{
				current_rotation[obj_grid.x_pos, obj_grid.y_pos] = 0;
			}
		}
		
		if global.flip_horizontal_enabled == true
		{
			if current_rotation[obj_grid.x_pos, obj_grid.y_pos] == 0 or current_rotation[obj_grid.x_pos, obj_grid.y_pos] == 180 then
			{
				current_x_scale[obj_grid.x_pos, obj_grid.y_pos] = current_x_scale[obj_grid.x_pos, obj_grid.y_pos] * -1;
			}
				else
			{
				current_y_scale[obj_grid.x_pos, obj_grid.y_pos] = current_y_scale[obj_grid.x_pos, obj_grid.y_pos] * -1;
			}
		}
		
		if global.flip_vertical_enabled == true
		{
			if current_rotation[obj_grid.x_pos, obj_grid.y_pos] == 90 or current_rotation[obj_grid.x_pos, obj_grid.y_pos] == 270 then
			{
				current_x_scale[obj_grid.x_pos, obj_grid.y_pos] = current_x_scale[obj_grid.x_pos, obj_grid.y_pos] * -1;
			}
				else
			{
				current_y_scale[obj_grid.x_pos, obj_grid.y_pos] = current_y_scale[obj_grid.x_pos, obj_grid.y_pos] * -1;
			}
		}
	}
	
	if mouse_check_button_pressed(global.controls[1])
	{
		current_index[obj_grid.x_pos, obj_grid.y_pos] = 0;
	}
	
	switch global.current_layer
	{
		case 0:
		
			collide_index = current_index;
			collide_angle = current_rotation;
			collide_flip_horizontal = current_x_scale;
			collide_flip_vertical = current_y_scale;
	
		break;
	
		case 1:
		
			danger_index = current_index;
			danger_angle = current_rotation;
			danger_flip_horizontal = current_x_scale;
			danger_flip_vertical = current_y_scale;
		
		break;
	}
}
