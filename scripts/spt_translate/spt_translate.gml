/***************************************************************************
*							TRANSLATE TILE SPRITES						   *
***************************************************************************/

switch current_rotation // Checks for current tile rotation value
{
	case 0: // Checks if current rotation is 0
	
		if current_x_scale < 0 and current_y_scale < 0 // Checks if both directions are flipped
		{
			x = x + obj_grid.cell_size; // Shift selected tile one cell to the right
			y = y + obj_grid.cell_size; // Shift selected tile one cell down
		}
		
		if current_x_scale < 0 and current_y_scale > 0
		{
			x = x + obj_grid.cell_size; // Shift selected tile one cell to the right
		}
		
		if current_x_scale > 0 and current_y_scale < 0
		{
			y = y + obj_grid.cell_size; // Shift selected tile one cell down
		}
		
	break;
	
	case 90: // Checks if current rotation is 90
		
		if current_x_scale > 0 and current_y_scale > 0 // Checks if neither directions are flipped
		{
			y = y + obj_grid.cell_size; // Shift selected tile one cell down
		}
		
		if current_x_scale < 0 and current_y_scale < 0  // Checks if both directions are flipped 
		{
			x = x + obj_grid.cell_size; // Shift selected tile one cell to the right
		}
		
		if current_x_scale > 0 and current_y_scale < 0
		{
			x = x + obj_grid.cell_size; // Shift selected tile one cell to the right
			y = y + obj_grid.cell_size; // Shift selected tile one cell down
		}
		
	break;
	
	
	case 180: // Checks if current rotation is 180

		if current_x_scale > 0 and current_y_scale > 0 // Checks if neither directions are flipped
		{
			x = x + obj_grid.cell_size; // Shift selected tile one cell to the right
			y = y + obj_grid.cell_size; // Shift selected tile one cell down
		}
		
		if current_x_scale < 0 and current_y_scale > 0
		{
			y = y + obj_grid.cell_size; // Shift selected tile one cell down
		}
		
		if current_x_scale > 0 and current_y_scale < 0
		{
			x = x + obj_grid.cell_size; // Shift selected tile one cell to the right
		}
		
	break;
	
	case 270: // Checks if current rotation is 270
		
		if current_x_scale > 0 and current_y_scale > 0 // Checks if neither directions are flipped
		{
			x = x + obj_grid.cell_size; // Shift selected tile one cell to the right
		}
		
		if current_x_scale < 0 and current_y_scale < 0  // Checks if both directions are flipped
		{
			y = y + obj_grid.cell_size; // Shift selected tile one cell down
		}
		
		if current_x_scale < 0 and current_y_scale > 0
		{
			x = x + obj_grid.cell_size; // Shift selected tile one cell to the right
			y = y + obj_grid.cell_size; // Shift selected tile one cell down
		}
	
	break;
}
