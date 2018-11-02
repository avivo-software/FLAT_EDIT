/***************************************************************************
*							TRANSLATE TILE SPRITES						   *
***************************************************************************/

switch current_rotation // Checks for current tile rotation value
{
	case 0: // Checks if current rotation is 0
		
		if current_x_scale > 0 and current_y_scale > 0 // Checks if both directions are flipped
		{
			collide_flip_data[i, j] = false; // Set collide flip data to false
			collide_mirror_data[i, j] = false; // Set collide mirror data to false
			collide_rotate_data[i, j] = false; // Set collide rotate data to false
			
			danger_flip_data[i, j] = false; // Set danger flip data to false
			danger_mirror_data[i, j] = false; // Set danger mirror data to false
			danger_rotate_data[i, j] = false; // Set danger rotate data to false
		}
		
		if current_x_scale < 0 and current_y_scale < 0 // Checks if both directions are flipped
		{
			x = x + obj_grid.cell_size; // Shift selected tile one cell to the right
			y = y + obj_grid.cell_size; // Shift selected tile one cell down
			
			collide_flip_data[i, j] = true; // Set collide flip data to true
			collide_mirror_data[i, j] = true; // Set collide mirror data to true
			collide_rotate_data[i, j] = false; // Set collide rotate data to false
			
			danger_flip_data[i, j] = true; // Set danger flip data to true
			danger_mirror_data[i, j] = true; // Set danger mirror data to true
			danger_rotate_data[i, j] = false; // Set danger rotate flip data to false
		}
		
		if current_x_scale < 0 and current_y_scale > 0
		{
			x = x + obj_grid.cell_size; // Shift selected tile one cell to the right
			
			collide_flip_data[i, j] = false; // Set collide flip data to false
			collide_mirror_data[i, j] = true; // Set collide mirror data to true
			collide_rotate_data[i, j] = false; // Set collide rotate data to false
			
			danger_flip_data[i, j] = false; // Set danger flip data to false
			danger_mirror_data[i, j] = true; // Set danger mirror data to true
			danger_rotate_data[i, j] = false; // Set danger rotate flip data to false
		}
		
		if current_x_scale > 0 and current_y_scale < 0
		{
			y = y + obj_grid.cell_size; // Shift selected tile one cell down
			
			collide_flip_data[i, j] = true; // Set collide flip data to true
			collide_mirror_data[i, j] = false; // Set collide mirror data to false
			collide_rotate_data[i, j] = false; // Set collide rotate data to false
			
			danger_flip_data[i, j] = true; // Set danger flip data to true
			danger_mirror_data[i, j] = false; // Set danger mirror data to false
			danger_rotate_data[i, j] = false; // Set danger rotate data to false
		}
		
	break;
	
	case 90: // Checks if current rotation is 90
		
		if current_x_scale > 0 and current_y_scale > 0 // Checks if neither directions are flipped
		{
			y = y + obj_grid.cell_size; // Shift selected tile one cell down
			
			collide_flip_data[i, j] = true; // Set collide flip data to true
			collide_mirror_data[i, j] = true; // Set collide mirror data to true
			collide_rotate_data[i, j] = true; // Set collide rotate data to true
			
			danger_flip_data[i, j] = true; // Set danger flip data to true
			danger_mirror_data[i, j] = true; // Set danger mirror data to true
			danger_rotate_data[i, j] = true; // Set danger rotate data to true
		}
		
		if current_x_scale < 0 and current_y_scale < 0  // Checks if both directions are flipped 
		{
			x = x + obj_grid.cell_size; // Shift selected tile one cell to the right
			
			collide_flip_data[i, j] = false; // Set collide flip data to false
			collide_mirror_data[i, j] = false; // Set collide mirror data to false
			collide_rotate_data[i, j] = true; // Set collide rotate data to true
			
			danger_flip_data[i, j] = false; // Set danger flip data to false
			danger_mirror_data[i, j] = false; // Set danger mirror data to false
			danger_rotate_data[i, j] = true; // Set danger rotate data to true
		}
				
		if current_x_scale < 0 and current_y_scale > 0
		{
			collide_flip_data[i, j] = true; // Set collide flip data to true
			collide_mirror_data[i, j] = false; // Set collide mirror data to false
			collide_rotate_data[i, j] = true; // Set collide rotate data to true
			
			danger_flip_data[i, j] = true; // Set danger flip data to true
			danger_mirror_data[i, j] = false; // Set danger mirror data to false
			danger_rotate_data[i, j] = true; // Set danger rotate data to true
		}
		
		if current_x_scale > 0 and current_y_scale < 0
		{
			x = x + obj_grid.cell_size; // Shift selected tile one cell to the right
			y = y + obj_grid.cell_size; // Shift selected tile one cell down
			
			collide_flip_data[i, j] = false; // Set collide flip data to false
			collide_mirror_data[i, j] = true; // Set collide mirror data to true
			collide_rotate_data[i, j] = true; // Set collide rotate data to true
			
			danger_flip_data[i, j] = false; // Set danger flip data to false
			danger_mirror_data[i, j] = true; // Set danger mirror data to true
			danger_rotate_data[i, j] = true; // Set danger rotate data to true
		}
		
	break;
	
	
	case 180: // Checks if current rotation is 180

		if current_x_scale > 0 and current_y_scale > 0 // Checks if neither directions are flipped
		{
			x = x + obj_grid.cell_size; // Shift selected tile one cell to the right
			y = y + obj_grid.cell_size; // Shift selected tile one cell down
			
			collide_flip_data[i, j] = true; // Set collide flip data to true
			collide_mirror_data[i, j] = true; // Set collide mirror data to true
			collide_rotate_data[i, j] = false; // Set collide rotate data to false
			
			danger_flip_data[i, j] = true; // Set danger flip data to true
			danger_mirror_data[i, j] = true; // Set danger mirror data to true
			danger_rotate_data[i, j] = false; // Set rotate flip data to false
		}
		
		if current_x_scale < 0 and current_y_scale < 0 // Checks if neither directions are flipped
		{
			collide_flip_data[i, j] = false; // Set collide flip data to false
			collide_mirror_data[i, j] = false; // Set collide mirror data to false
			collide_rotate_data[i, j] = false; // Set collide flip data to false
			
			danger_flip_data[i, j] = false; // Set danger filp data to false
			danger_mirror_data[i, j] = false; // Set danger mirror mirror to false
			danger_rotate_data[i, j] = false; // Set rotate rotate data to false
		}
		
		if current_x_scale < 0 and current_y_scale > 0
		{
			y = y + obj_grid.cell_size; // Shift selected tile one cell down
			
			collide_flip_data[i, j] = true; // Set collide flip data to true
			collide_mirror_data[i, j] = false; // Set collide mirror data to false
			collide_rotate_data[i, j] = false; // Set collide rotate data to false
			
			danger_flip_data[i, j] = true; // Set danger flip data to true
			danger_mirror_data[i, j] = false; // Set danger mirror data to false
			danger_rotate_data[i, j] = false; // Set danger rotate flip data to false
		}
		
		if current_x_scale > 0 and current_y_scale < 0
		{
			x = x + obj_grid.cell_size; // Shift selected tile one cell to the right
			
			collide_flip_data[i, j] = false; // Set collide flip data to false
			collide_mirror_data[i, j] = true; // Set collide mirror data to true
			collide_rotate_data[i, j] = false; // Set collide rotate data to false
			
			danger_flip_data[i, j] = false; // Set danger flip data to false
			danger_mirror_data[i, j] = true; // Set danger mirror data to false
			danger_rotate_data[i, j] = false; // Set danger rotate data to false
		}
		
	break;
	
	case 270: // Checks if current rotation is 270
		
		if current_x_scale > 0 and current_y_scale > 0 // Checks if neither directions are flipped
		{
			x = x + obj_grid.cell_size; // Shift selected tile one cell to the right
			
			collide_flip_data[i, j] = false; // Set collide flip data to false
			collide_mirror_data[i, j] = false; // Set collide mirror data to false
			collide_rotate_data[i, j] = true; // Set collide rotate data to false
			
			danger_flip_data[i, j] = false; // Set danger flip data to false
			danger_mirror_data[i, j] = false; // Set collide mirror data to false
			danger_rotate_data[i, j] = true; // Set rotate flip data to true
		}
		
		if current_x_scale < 0 and current_y_scale < 0  // Checks if both directions are flipped
		{
			y = y + obj_grid.cell_size; // Shift selected tile one cell down
			
			collide_flip_data[i, j] = true; // Set collide flip data to true
			collide_mirror_data[i, j] = true; // Set collide mirror data to true
			collide_rotate_data[i, j] = true; // Set collide rotate data to true
			
			danger_flip_data[i, j] = true; // Set danger flip data to true
			danger_mirror_data[i, j] = true; // Set danger mirror data to true
			danger_rotate_data[i, j] = true; // Set danger rotate data to true
		}
		
		if current_x_scale < 0 and current_y_scale > 0
		{
			x = x + obj_grid.cell_size; // Shift selected tile one cell to the right
			y = y + obj_grid.cell_size; // Shift selected tile one cell down
			
			collide_flip_data[i, j] = false; // Set collide flip data to false
			collide_mirror_data[i, j] = true; // Set collide mirror data to true
			collide_rotate_data[i, j] = true; // Set collide rotate data to true
			
			danger_flip_data[i, j] = false; // Set danger flip data to false
			danger_mirror_data[i, j] = true; // Set danger mrror data to false
			danger_rotate_data[i, j] = true; // Set danger rotate data to false
		}
		
		if current_x_scale > 0 and current_y_scale < 0
		{
			collide_flip_data[i, j] = true; // Set collide flip data to true
			collide_mirror_data[i, j] = false; // Set collide flip data to false
			collide_rotate_data[i, j] = true; // Set collide rotate data to true
			
			danger_flip_data[i, j] = true; // Set danger flip data to true
			danger_mirror_data[i, j] = false; // Set danger mirror data to false
			danger_rotate_data[i, j] = true; // Set danger rotate data to true
		}
		
	break;
}
