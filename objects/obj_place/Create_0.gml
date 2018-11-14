/// @description Initializes variables

/***************************************************************************
*							INITIALIZES VARIABLES						   *
***************************************************************************/

layer_alpha = 0; // Determines the opacity of non selected layers
non_selected_alpha = 0.5; // Sets opacity for non selected layer
selected_alpha = 1; // Sets opacity for selected layer

object_sprite = 0;

object_x_scale = 1; // Determines X scale of selected object
object_y_scale = 1; // Determines X scale of selected object

object_alpha = 0.75; // Sets transperancy of selected object

object_angle = 0; // The default angle of object to place

place_enabled = true; // Determines if object can be placed
rotation_amount = 45; // Sets amount to rotate objects by
grid_snap = 8; // Determines amount to snap object to grid by
place_enabled = true; // Prevents objects being placed on top of other objects

// CREATE OBJECT DATA LISTS

object_data_sprite = ds_list_create(); // Create sprite data list
object_data_index = ds_list_create(); // Create index data list
object_data_angle = ds_list_create(); // Create data data list

object_data_x_pos = ds_list_create(); // Create X pos data list
object_data_y_pos = ds_list_create(); // Create Y pos data list

object_data_x_scale = ds_list_create(); // Create X scale data list
object_data_y_scale = ds_list_create(); // Create Y scale data list

// PALETTE CONVERSION ARRAY

palette_conversion[spr_barrels_colour] = spr_barrels; // Stores paleete conversion for barrels
palette_conversion[spr_blocks_colour] = spr_blocks; // Stores paleete conversion for blocks
palette_conversion[spr_lever_colour] = spr_levers; // Stores paleete conversion for levers

for(j = 0; j < obj_grid.hard_y_limit; j++) // Outer loop
{
	for(i = 0; i < obj_grid.hard_x_limit; i++) // Inner loop
	{
		// SET COLLIDE VARIABLES
		
		collide_index[i, j] = 0; // Set collide index data
		collide_angle[i, j] = 0; // Set collide angle data
		collide_flip_horizontal[i, j] = 1; // Set collide flip horizontal data
		collide_flip_vertical[i, j] = 1; // Set collide flip vertical data
		
		collide_flip_data[i, j] = false; // Set collide flip data 
		collide_mirror_data[i, j] = false; // Set collide mirror data
		collide_rotate_data[i, j] = false; // Set collide rotate data
		
		// SET DANGER VARIABLES
		
		danger_index[i, j] = 0; // Set danger index data
		danger_angle[i, j] = 0; // Set danger angle data
		danger_flip_horizontal[i, j] = 1; // Set danger flip horizontal data
		danger_flip_vertical[i, j] = 1; // Set danger flip vertical data
		
		danger_flip_data[i, j] = false; // Set danger flip data
		danger_mirror_data[i, j] = false; // Set danger mirror data
		danger_rotate_data[i, j] = false; // Set danger rotate data
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


