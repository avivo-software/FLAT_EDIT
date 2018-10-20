/// @description Initializes variables

/***************************************************************************
*							INITIALIZES VARIABLES						   *
***************************************************************************/

collide_grid_index = ds_grid_create(obj_grid.hard_x_limit, obj_grid.hard_y_limit); // Creates index grid
collide_grid_angle = ds_grid_create(obj_grid.hard_x_limit, obj_grid.hard_y_limit); // Creates angle grid

collide_grid_flip_horizontal = ds_grid_create(obj_grid.hard_x_limit, obj_grid.hard_y_limit); // Creates horizontal flip grid
collide_grid_flip_vertical = ds_grid_create(obj_grid.hard_x_limit, obj_grid.hard_y_limit); // Creates vertical flip grid

for(j = 0; j < obj_grid.hard_y_limit + 1; j++) // Outer loop
{
	for(i = 0; i < obj_grid.hard_x_limit + 1; i++) // Inner loop
	{
		ds_grid_add(collide_grid_index, i, j, 0); // Sets tile index to zero (Invisible)
		ds_grid_add(collide_grid_angle, i, j, 0); // Sets tile angle to zero (zero degrees)
		
		ds_grid_add(collide_grid_flip_horizontal, i, j, 1); // Sets horizontal flip to 0
		ds_grid_add(collide_grid_flip_vertical, i, j, 1); // Sets vertical flip to 0
	}
}
