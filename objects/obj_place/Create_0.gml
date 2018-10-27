/// @description Initializes variables

/***************************************************************************
*							INITIALIZES VARIABLES						   *
***************************************************************************/

for(j = 0; j < obj_grid.hard_y_limit; j++) // Outer loop
{
	for(i = 0; i < obj_grid.hard_x_limit; i++) // Inner loop
	{
		collide_index[i, j] = 0;
		collide_angle[i, j] = 0;
		collide_flip_horizontal[i, j] = 1;
		collide_flip_vertical[i, j] = 1;
		
		danger_index[i, j] = 0;
		danger_angle[i, j] = 0;
		danger_flip_horizontal[i, j] = 1;
		danger_flip_vertical[i, j] = 1;
	}
}
