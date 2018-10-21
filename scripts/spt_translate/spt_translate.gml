/***************************************************************************
*							TRANSLATE TILE SPRITES						   *
***************************************************************************/

if argument0 = 0 // Transforms sprites (Not tiles)
{
	cell_size = obj_grid.cell_size; // Stores cell size so obj.grid does not have to be called
	
	switch current_tile_angle
	{
		case 90:
	
		if current_tile_flip_horizontal = 1
		{
			if current_tile_flip_vertical = 1
			{
				temp_y = temp_y + cell_size;
			}
		}
	
		break;
	
		case 180:
	
		if current_tile_flip_horizontal = 1
		{
			if current_tile_flip_vertical = 1
			{
				temp_x = temp_x + cell_size;
				temp_y = temp_y + cell_size;
			}
		}
	
		break;
	
		case 270:
	
		if current_tile_flip_horizontal = 1
		{
			if current_tile_flip_vertical = 1
			{
				temp_x = temp_x + cell_size;
			}
		}
	
		break;
	}

	// Rotates about angle with both flips

	switch current_tile_angle
	{
		case 0:
	
		if current_tile_flip_horizontal = -1
		{
			if current_tile_flip_vertical = -1
			{
				temp_x = temp_x + cell_size;
				temp_y = temp_y + cell_size;
			}
		}
	

		break;
	
		case 90:
	
		if current_tile_flip_horizontal = -1
		{
			if current_tile_flip_vertical = -1
			{
				temp_x = temp_x + cell_size;
			}
		}
	
		break;
	
		case 180:
	
		if current_tile_flip_horizontal = -1
		{
			if current_tile_flip_vertical = -1
			{

			}
		}
	
		break;
	
		case 270:
	
		if current_tile_flip_horizontal = -1
		{
			if current_tile_flip_vertical = -1
			{
				temp_y = temp_y + cell_size;
			}
		}
	
		break;
	}

	// Vertical flip only

	switch current_tile_angle
	{
		case 0:
	
		if current_tile_flip_horizontal = -1
		{
			if current_tile_flip_vertical = 1
			{
				temp_x = temp_x + cell_size;
			}
		}

		break;
	
		case 90:
	
		if current_tile_flip_horizontal = 1
		{
			if current_tile_flip_vertical = -1
			{
				temp_x = temp_x + cell_size;
				temp_y = temp_y + cell_size;
			}
		}
	
		break;
	
		case 180:
	
		if current_tile_flip_horizontal = -1
		{
			if current_tile_flip_vertical = 1
			{
				temp_y = temp_y + cell_size;
			}
		}
	
		break;
	}

	// Horizontal flip only

	switch current_tile_angle
	{
		case 0:
	
		if current_tile_flip_horizontal = 1
		{
			if current_tile_flip_vertical = -1
			{
				temp_y = temp_y + cell_size;
			}
		}
	
		break;
	
		case 180:
	
		if current_tile_flip_horizontal = 1
		{
			if current_tile_flip_vertical = -1
			{
				temp_x = temp_x + cell_size;
			}
		}
	
		break;
	
		case 270:
	
		if current_tile_flip_horizontal = -1
		{
			if current_tile_flip_vertical = 1
			{
				temp_x = temp_x + cell_size;
				temp_y = temp_y + cell_size;
			}
		}
	
		break;
	}
}
