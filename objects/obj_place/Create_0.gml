/// @description Initializes variables

/***************************************************************************
*							INITIALIZES VARIABLES						   *
***************************************************************************/

for(j = 0; j < obj_grid.hard_y_limit; j++) // Outer loop
{
	for(i = 0; i < obj_grid.hard_x_limit; i++) // Inner loop
	{
		// SET COLLIDE VARIABLES
		
		collide_index[i, j] = 0; // Set collide index
		collide_angle[i, j] = 0; // Set collide angle
		collide_flip_horizontal[i, j] = 1; // Set collide flip horizontal
		collide_flip_vertical[i, j] = 1; // Set collide flip vertical
		
		// SET DANGER VARIABLES
		
		danger_index[i, j] = 0; // Set danger index
		danger_angle[i, j] = 0; // Set danger angle
		danger_flip_horizontal[i, j] = 1; // Set danger flip horizontal
		danger_flip_vertical[i, j] = 1; // Set danger flip vertical
	}
}
