/// @description Initializes variables

/***************************************************************************
*							INITIALIZES VARIABLES						   *
***************************************************************************/

layer_alpha = 0; // Determines the opacity of non selected layers
non_selected_alpha = 0.5; // Sets opacity for non selected layer
selected_alpha = 1; // Sets opacityfor selected layer

for(j = 0; j < obj_grid.hard_y_limit; j++) // Outer loop
{
	for(i = 0; i < obj_grid.hard_x_limit; i++) // Inner loop
	{
		// SET COLLIDE VARIABLES
		
		collide_index[i, j] = 0; // Set collide index
		collide_angle[i, j] = 0; // Set collide angle
		collide_flip_horizontal[i, j] = 1; // Set collide flip horizontal
		collide_flip_vertical[i, j] = 1; // Set collide flip vertical
		
		collide_flip_data[i, j] = false;
		collide_mirror_data[i, j] = false;
		collide_rotate_data[i, j] = false;
		
		// SET DANGER VARIABLES
		
		danger_index[i, j] = 0; // Set danger index
		danger_angle[i, j] = 0; // Set danger angle
		danger_flip_horizontal[i, j] = 1; // Set danger flip horizontal
		danger_flip_vertical[i, j] = 1; // Set danger flip vertical
		
		danger_flip_data[i, j] = false;
		danger_mirror_data[i, j] = false;
		danger_rotate_data[i, j] = false;
	}
}

/***************************************************************************
*								CREATE DS GRIDS							   *
****************************************************************************/

collide_grid_index = ds_grid_create(obj_grid.hard_x_limit, obj_grid.hard_y_limit); // Creates ds grid for collide map
collide_grid_angle = ds_grid_create(obj_grid.hard_x_limit, obj_grid.hard_y_limit); // Creates ds grid for collide map
collide_grid_flip_horizontal = ds_grid_create(obj_grid.hard_x_limit, obj_grid.hard_y_limit); // Creates ds grid for collide map
collide_grid_flip_vertical = ds_grid_create(obj_grid.hard_x_limit, obj_grid.hard_y_limit); // Creates ds grid for collide map

danger_grid_index = ds_grid_create(obj_grid.hard_x_limit, obj_grid.hard_y_limit); // Creates ds grid for danger map
danger_grid_angle = ds_grid_create(obj_grid.hard_x_limit, obj_grid.hard_y_limit); // Creates ds grid for danger map
danger_grid_flip_horizontal = ds_grid_create(obj_grid.hard_x_limit, obj_grid.hard_y_limit); // Creates ds grid for danger map
danger_grid_flip_vertical = ds_grid_create(obj_grid.hard_x_limit, obj_grid.hard_y_limit); // Creates ds grid for danger map


