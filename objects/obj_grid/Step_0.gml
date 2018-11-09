/// @description Grid Calculations

/***********************************************************************
*                            SETS VARIABLES					           *
***********************************************************************/

x1 = x_offset; // X1 border coordinate
y1 = y_offset; // Y1 border coordinate

x2 = x_offset + x_max; // X2 border coordinate
y2 = y_offset + y_max; // Y2 border coordinate


/***********************************************************************
*          DETERMINES IF MOUSE IS INSIDE OR OUTSIDE THE GRID		   *	   
***********************************************************************/

if point_in_rectangle(mouse_x, mouse_y, x_offset, y_offset, x_offset + x_max, y_offset + y_max) // Checks if mouse is inside grid
{
	mouse_in_grid = true; // Sets mouse in grid to true 
}
	else
{
	mouse_in_grid = false; // Sets mouse in grid to false 
}


/***********************************************************************
*              DETERMINES GRID COORDINATES BASED ON MOUSE			   *	   
***********************************************************************/

if mouse_in_grid == true
{
	x_pos = floor((mouse_x - x_offset) / cell_size) + x_shift; // Updates X position based on mouse location
	y_pos = floor((mouse_y - y_offset) / cell_size) + y_shift; // Updates Y position based on mouse location
}


/***********************************************************************
*                              PANS GRID							   *
***********************************************************************/


if keyboard_check_released(global.controls[2]) // Checks for pan left button
{
	spt_actions(0, 7); // Pan grid left
}

if keyboard_check_released(global.controls[3]) // Checks for pan right button
{
	spt_actions(0, 8); // Pan grid right
}

if keyboard_check_released(global.controls[4]) // Checks for pan up button
{
	spt_actions(0, 9); // Pan grid up
}

if keyboard_check_released(global.controls[5]) // Checks for pan down button
{
	spt_actions(0, 10); // Pan grid down
}


/*****************************************************************************
*									ZOOM +/-								 *
******************************************************************************/

if mouse_in_grid == true // Prevents grid from zooming when mouse is not in grid
{
	if mouse_wheel_down() // Checks for mouse wheel down
	{
		spt_actions(0, 5); // Zoom out
	}
	
	if mouse_wheel_up() // Checks for mouse wheel up
	{
		spt_actions(0, 6); // Zoom in
	}
}


/***********************************************************************
*                       EXPAND AND REMOVE GRID						   *	   
***********************************************************************/

if global.edit_enabled == true // Prevents grid from being manipulated if edit mode is disabled
{
	if !mouse_check_button(global.controls[0]) then window_set_cursor(global.icon[0]); // Sets cursor back to default as long as an operation is not active
	
	// SETS GRID MOVE
	
	if point_in_rectangle(mouse_x, mouse_y, x_offset - buffer, y_offset - buffer, x_offset + buffer, y_offset + buffer)
	{
		if global.border_selection_id == !unique_id // Prevents and active item from interfering  with other moveable objects
		{
			window_set_cursor(global.icon[4]); // Sets cursor to move icon
			global.border_selection_id = unique_id; // Locks grid for editing
		}
	}
	
	// SETS GRID TO EXPAND VERTICAL

	if point_in_rectangle(mouse_x, mouse_y, x1 + buffer, y2 - buffer, x2 - buffer, y2 + buffer)
	{
		if global.border_selection_id == !unique_id // Prevents and active item from interfering  with other moveable objects
		{
			window_set_cursor(global.icon[2]); // Sets cursor to expand vertical
			global.border_selection_id = unique_id; // Locks grid for editing
		}
	}
	
	// SETS GRID TO EXPAND HORIZONTL
	
	if point_in_rectangle(mouse_x, mouse_y, x2 - buffer, y1 + buffer,x2 + buffer, y2 - buffer)
	{
		if global.border_selection_id == !unique_id // Prevents and active item from interfering  with other moveable objects
		{
			window_set_cursor(global.icon[1]); // Sets cursor to expand horizontal
			global.border_selection_id = unique_id; // Locks grid for editing
		}
	}
	
	// SETS GRID TO EXPAND DIAGONAL

	if point_in_rectangle(mouse_x, mouse_y, x2 - buffer, y2 - buffer, x2 + buffer, y2 + buffer)
	{
		if global.border_selection_id == !unique_id // Prevents and active item from interfering  with other moveable objects
		{
			window_set_cursor(global.icon[3]); // Sets cursor to expand diagonal
			global.border_selection_id = unique_id; // Locks grid for editing
		}
	}
	
	if mouse_check_button(global.controls[0]) // Checks if mouse select button is pressed
	{
		if global.border_selection_id == unique_id // Prevents and active item from interfering with other moveable objects
		{
			// MOVE GRID
			
			if window_get_cursor() == global.icon[4] // Checks if grid can be moved
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
		
			// EXPAND GRID VERTICALLY
		
			if window_get_cursor() == global.icon[2] // Checks for expand vertical cursor
			{
				if mouse_y > y_offset + y_max + cell_size / 2 
				{
					if y_limit * cell_size < room_height - cell_size then y_limit ++; // Expand grid vertically
				}
	
				if mouse_y < y_offset + y_max - cell_size / 2 
				{
					if y_limit > 1 then y_limit --; // Prevents grid from being too small
				}
			}
			
			// EXPAND GRID HORIZONTALLY
		
			if window_get_cursor() == global.icon[1] // Checks for expand horizontal cursor
			{
				if mouse_x > x_offset + x_max + cell_size / 2 // 
				{
					if x_limit * cell_size < room_width - cell_size then x_limit ++; // Expand grid horizontally
				}
	
				if mouse_x < x_offset + x_max - cell_size / 2 // Prevents grid from being expanded beyond limit
				{
					if x_limit > 1 then x_limit --; // Prevents grid from being too small
				}
			}
			
			// EXPAND GRID DIAGONALLY
		
			if window_get_cursor() == global.icon[3] // Checks for expand diagonal cursor
			{
				if mouse_x > x_offset + x_max + cell_size 
				{
					if mouse_y > y_offset + y_max + cell_size
					{
						if x_limit < hard_x_limit // Prevents grid from being expanded out of bounds
						{
							if x_limit * cell_size < room_width - cell_size then x_limit ++; // Expand grid horizontally
						}
						
						if y_limit < hard_y_limit // Prevents grid from being expanded out of bounds
						{
							if y_limit * cell_size < room_height - cell_size then y_limit ++; // Expand grid vertically
						}
					}
				}
					else
				{
					if mouse_x < x_offset + x_max - cell_size
					{
						if mouse_y < y_offset + y_max - cell_size
						{
							if x_limit > 1 // Prevents grid from being expanded out of bounds
							{
								if x_limit * cell_size < room_width - cell_size then x_limit --; // Reduce grid horizontally
							}
							
							if y_limit > 1 // Prevents grid from being expanded out of bounds
							{
								if y_limit * cell_size < room_height - cell_size then y_limit --; // Reduce grid vertically
							}
						}
					}
				}
			}
		}
	}
		else
	{
		global.border_selection_id = 0; // Releases grid so other objects can be edited
	}
}


/***********************************************************************
*                         SETS FONT VARIABLES						   *	   
***********************************************************************/

current_font = fnt_arial_32;

if cell_size < 128 then current_font = fnt_arial_12; // Sets current font
if cell_size > 128 then current_font = fnt_arial_32; // Sets current font

draw_set_font(current_font); // Sets number font

font_width = string_width(0); // Stores width of current font in pixels
font_height = string_height(0); // Stores height of current font in pixels



/***********************************************************************
*									DEBUG							   *	   
***********************************************************************/

if keyboard_check_pressed(vk_space)
{
	global.edit_enabled = !global.edit_enabled;
}
