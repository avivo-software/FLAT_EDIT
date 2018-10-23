/***************************************************************************
*							TRANSLATE TILE SPRITES						   *
***************************************************************************/

if obj_grid.cell_size = 64
{
	show_debug_message("x");
}

switch current_rotation
{
	case 0:
	
		if current_x_scale < 0 and current_y_scale < 0
		{
			x = x + obj_grid.cell_size;
			y = y + obj_grid.cell_size;
			
			show_debug_message(obj_grid.cell_size);
		}
		
		if current_x_scale < 0 and current_y_scale > 0
		{
			x = x + obj_grid.cell_size;
		}
		
		if current_x_scale > 0 and current_y_scale < 0
		{
			y = y + obj_grid.cell_size;
		}
		
	break;
	
	case 90:
		
		if current_x_scale > 0 and current_y_scale > 0
		{
			y = y + obj_grid.cell_size;
		}
		
		if current_x_scale < 0 and current_y_scale < 0
		{
			x = x + obj_grid.cell_size;
		}
		
		if current_x_scale > 0 and current_y_scale < 0
		{
			x = x + obj_grid.cell_size;
			y = y + obj_grid.cell_size;
		}
		
	break;
	
	
	case 180:

		if current_x_scale > 0 and current_y_scale > 0
		{
			x = x + obj_grid.cell_size;
			y = y + obj_grid.cell_size;
		}
		
		if current_x_scale < 0 and current_y_scale > 0
		{
			y = y + obj_grid.cell_size;
		}
		
		if current_x_scale > 0 and current_y_scale < 0
		{
			x = x + obj_grid.cell_size;
		}
		
	break;
	
	case 270:
		
		if current_x_scale > 0 and current_y_scale > 0
		{
			x = x + obj_grid.cell_size;
		}
		
		if current_x_scale < 0 and current_y_scale < 0
		{
			y = y + obj_grid.cell_size;
		}
		
		if current_x_scale < 0 and current_y_scale > 0
		{
			x = x + obj_grid.cell_size;
			y = y + obj_grid.cell_size;
		}
	
	break;
}
