/// @description Grid Controls

/***********************************************************************
*							UPDATE VARIABLES						   *
***********************************************************************/

x1 = x_offset; // X1 border coordinate
y1 = y_offset; // Y1 border coordinate

x2 = x_offset + x_max; // X2 border coordinate
y2 = y_offset + y_max; // Y2 border coordinate

x_max = x_limit * cell_size; // Sets X coordinates to correct position
y_max = y_limit * cell_size; // Sets Y Coordinates to correct position


/***********************************************************************
*              DETERMINES GRID COORDINATES BASED ON MOUSE			   *	   
***********************************************************************/

x_pos = floor((mouse_x - x_offset) / cell_size) + x_shift; // Determines which grid number (X direction) is currently selected based on mouse possition
y_pos = floor((mouse_y - y_offset) / cell_size) + y_shift; // Determines which grid number (Y direction) is currently selected based on mouse possition


/***********************************************************************
*          DETERMINES IF MOUSE IS INSIDE OR OUTSIDE THE GRID		   *	   
***********************************************************************/

if point_in_rectangle(mouse_x,mouse_y,x_offset,y_offset,x_offset + x_max,y_offset + y_max)
{
	mouse_in_grid = true; // Sets mouse_in_grid_status to true
}
	else
{
	mouse_in_grid = false; // Sets mouse_in_grid_status to false
}


/***********************************************************************
*                              PANS GRID							   *
***********************************************************************/

// PAN GRID LEFT

if keyboard_check_released(global.controls[2])
{
	if x_shift > 0 then x_shift --; // Shift left by one
}

// PAN GRID RIGHT

if keyboard_check_released(global.controls[3])
{
	if x_shift + x_limit < hard_x_limit
	{
		x_shift ++; // Shift right by one
	}
}

// PAN GRID UP

if keyboard_check_released(global.controls[4])
{
	if y_shift > 0 then y_shift --; // Shift up by one 
}

// PAN GRID DOWN

if keyboard_check_released(global.controls[5])
{
	if y_shift + y_limit < hard_y_limit
	{
		y_shift ++; // Shift down by one
	}
}


/*****************************************************************************
*									ZOOM +/-								 *
******************************************************************************/

// ZOOM IN

if mouse_in_grid == true // Prevents grid from zooming in or out when mouse is not in grid area
{
	if mouse_wheel_up() // Checks to see if mouse was scrolled up
	{
		if cell_size * 2 < x_max // Prevents error (Can't zoom past hard Y limit)
		{
			if cell_size < cell_max // Ensures grid can't be zoomed outside of specified limits
			{
				cell_size = cell_size * 2; // Doubles cell size
				
				x_scale = x_scale * 2; // Double X scale
				y_scale = y_scale * 2; // Double Y scale
				
				x_limit = floor(x_limit / 2); // Half X limit
				y_limit = floor(y_limit / 2); // Half Y limit
			}
		}
	}

	// ZOOM OUT

	if mouse_wheel_down() // Checks to see if mouse was scrolled down
	{
		if x_shift + x_limit * 2 < hard_x_limit // Prevents error (Can't zoom past hard X limit)
		{
			if cell_size > cell_min // Ensures grid can't be zoomed outside of specified limits
			{
				cell_size = cell_size / 2; // Half cell size
			
				x_scale = x_scale / 2; // Half X scale
				y_scale = y_scale / 2; // Half Y scale
			
				x_limit = floor(x_limit * 2); // Double x_limit
				y_limit = floor(y_limit * 2); // Double y_limit
			}
		}
			else
		{
			show_message("Can't zoom to this level. Please increase grid size limit to zoom under these conditions"); // Display message if trying to scroll out of bounds
		}
	}
}


/***********************************************************************
*                       EXPAND AND REMOVE GRID						   *	   
***********************************************************************/

if global.edit_enabled == true
{
	if !mouse_check_button(global.controls[0]) then window_set_cursor(cr_arrow); // Sets cursor back to default as long as an operation is not active

	if point_in_rectangle(mouse_x, mouse_y, x_offset - buffer, y_offset - buffer, x_offset + buffer, y_offset + buffer)
	{
		if global.border_selection_id == !unique_id // Prevents and active item from interfering  with other moveable objects
		{
			window_set_cursor(cr_size_all);
			global.border_selection_id = unique_id;
		}
	}

	if point_in_rectangle(mouse_x, mouse_y, x1 + buffer, y2 - buffer, x2 - buffer, y2 + buffer)
	{
		if global.border_selection_id == !unique_id // Prevents and active item from interfering  with other moveable objects
		{
			window_set_cursor(cr_size_ns);
			global.border_selection_id = unique_id;
		}
	}

	if point_in_rectangle(mouse_x, mouse_y, x2 - buffer, y1 + buffer,x2 + buffer, y2 - buffer)
	{
		if global.border_selection_id == !unique_id // Prevents and active item from interfering  with other moveable objects
		{
			window_set_cursor(cr_size_we);
			global.border_selection_id = unique_id;
		}
	}

	if point_in_rectangle(mouse_x, mouse_y, x2 - buffer, y2 - buffer, x2 + buffer, y2 + buffer)
	{
		if global.border_selection_id == !unique_id // Prevents and active item from interfering  with other moveable objects
		{
			window_set_cursor(cr_size_nwse);
			global.border_selection_id = unique_id;
		}
	}
	
	if mouse_check_button(global.controls[0]) // Check if select button is pressed
	{
		if global.border_selection_id == unique_id // Prevents an active item from interfering with other moveable objects
		{
			if global.edit_enabled == true // Checks to see if grid is moveable
			{
				if window_get_cursor() == cr_size_all
				{
					if mouse_x > 0 and mouse_x < room_width - x_max // Prevents grid leaving the boundaries of the room
					{
						x_offset = round(mouse_x / grid_snap) * grid_snap; // Snap X
					}
				
					if mouse_y > 0 and mouse_y < room_height - y_max // Prevents grid leaving the boundaries of the room
					{
						y_offset = round(mouse_y / grid_snap) * grid_snap; // Snap Y
					}
				}
			}
		
			if window_get_cursor() == cr_size_ns
			{
				if global.edit_enabled == true
				{
					if mouse_y > y_offset + y_max + cell_size / 2
					{
						if y_limit * cell_size < room_height - cell_size then y_limit ++;
					}
	
					if mouse_y < y_offset + y_max - cell_size / 2
					{
						if y_limit > 1 then y_limit --;
					}
				}
			}
		
			if window_get_cursor() == cr_size_we
			{
				if global.edit_enabled == true
				{
					if mouse_x > x_offset + x_max + cell_size / 2
					{
						if x_limit * cell_size < room_width - cell_size then x_limit ++;
					}
	
					if mouse_x < x_offset + x_max - cell_size / 2
					{
						if x_limit > 1 then x_limit --;
					}
				}
			}
		
			if window_get_cursor() == cr_size_nwse
			{
				if global.edit_enabled == true
				{
					if mouse_x > x_offset + x_max + cell_size
					{
						if mouse_y > y_offset + y_max + cell_size
						{
							if x_limit < hard_x_limit
							{
								if x_limit * cell_size < room_width - cell_size then x_limit ++;
							}
						
							if y_limit < hard_y_limit
							{
								if y_limit * cell_size < room_height - cell_size then y_limit ++;
							}
						}
					}
						else
					{
						if mouse_x < x_offset + x_max - cell_size
						{
							if mouse_y < y_offset + y_max - cell_size
							{
								if x_limit > 1
								{
									if x_limit * cell_size < room_width - cell_size then x_limit --;
								}
							
								if y_limit > 1
								{
									if y_limit * cell_size < room_height - cell_size then y_limit --;
								}
							}
						}
					}
				}
			}
		}
	}
		else
	{
		global.border_selection_id = 0;
	}
}

/***********************************************************************
*                         SETS FONT VARIABLES						   *	   
***********************************************************************/

current_font = fnt_western_32;

if cell_size < 128 then current_font = fnt_western_12; // Sets current font
if cell_size > 128 then current_font = fnt_western_32; // Sets current font

draw_set_font(current_font); // Sets number font

font_width = string_width(0); // Stores width of current font in pixels
font_height = string_height(0); // Stores height of current font in pixels
