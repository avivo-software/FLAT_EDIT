/// @description Grid Controls

/***********************************************************************
*                            UPDATE VARIABLES                          *
***********************************************************************/

x1 = x_offset; // X1 border coordinate
y1 = y_offset; // Y1 border coordinate

x2 = x_offset + x_max; // X2 border coordinate
y2 = y_offset + y_max; // Y2 border coordinate

x_max = x_limit * cell_size; // Sets X coordinates to correct position
y_max = y_limit * cell_size; // Sets Y Coordinates to correct position


/***********************************************************************
*              DETERMINES GRID COORDINATES BASED ON MOUSE              *       
***********************************************************************/

x_pos = floor((mouse_x - x_offset) / (cell_size + line_thickness)) + x_shift; // Determines which grid number (X direction) is currently selected based on mouse possition
y_pos = floor((mouse_y - y_offset) / (cell_size + line_thickness)) + y_shift; // Determines which grid number (Y direction) is currently selected based on mouse possition


/***********************************************************************
*          DETERMINES IF MOUSE IS INSIDE OR OUTSIDE THE GRID           *       
***********************************************************************/

if point_in_rectangle(mouse_x, mouse_y, x_offset, y_offset, x_offset + x_max, y_offset + y_max) // Checks if mouse is inside grid
{
    mouse_in_grid = true; // Sets mouse_in_grid_status to true
}
    else
{
    mouse_in_grid = false; // Sets mouse_in_grid_status to false
}


/***********************************************************************
*                              PANS GRID                               *
***********************************************************************/

// PAN GRID LEFT

if keyboard_check_released(global.controls[2]) // Checks if shift left key has been pressed
{
    if x_shift > 0 then x_shift --; // Shift left by one
}

// PAN GRID RIGHT

if keyboard_check_released(global.controls[3]) // Checks if shift right key has been pressed
{
    if x_shift + x_limit < hard_x_limit
    {
        x_shift ++; // Shift right by one
    }
}

// PAN GRID UP

if keyboard_check_released(global.controls[4]) // Checks if shift up key has been pressed
{
    if y_shift > 0 then y_shift --; // Shift up by one 
}

// PAN GRID DOWN

if keyboard_check_released(global.controls[5]) // Checks if shift down key has been pressed
{
    if y_shift + y_limit < hard_y_limit
    {
        y_shift ++; // Shift down by one
    }
}


/*****************************************************************************
*                                    ZOOM +/-                                *
******************************************************************************/

// ZOOM IN

if mouse_in_grid == true // Prevents grid from zooming in or out when the mouse is not in the grid area
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
            show_debug_message("Can't zoom to this level. Please increase grid size limit to zoom under these conditions"); // Display message if trying to scroll out of bounds
        }
    }
}


/***********************************************************************
*                       EXPAND AND REMOVE GRID                         *       
***********************************************************************/

if global.edit_enabled == true // Ensures grid can be modified
{
    if !mouse_check_button(global.controls[0]) then window_set_cursor(cr_arrow); // Sets cursor back to default as long as an operation is not active

    if point_in_rectangle(mouse_x, mouse_y, x_offset - buffer, y_offset - buffer, x_offset + buffer, y_offset + buffer) // Check that mouse is in move grid area
    {
        if global.border_selection_id == !unique_id // Prevents and active item from interfering  with other moveable objects
        {
            window_set_cursor(cr_size_all); // Sets cursor to move cursor
            global.border_selection_id = unique_id; // Locks grid for editing
        }
    }

    if point_in_rectangle(mouse_x, mouse_y, x_offset, y_offset + y_max + line_thickness * y_limit - buffer + line_thickness / 2, x_offset + x_max + line_thickness * x_limit, y_offset + y_max + line_thickness * y_limit + buffer + line_thickness / 2) // Check that mouse is in expand up, down area
    {
        if global.border_selection_id == !unique_id // Prevents and active item from interfering  with other moveable objects
        {
            window_set_cursor(cr_size_ns); // Sets cursor to up, down arrow
            global.border_selection_id = unique_id; // Locks grid for editing
        }
    }

    if point_in_rectangle(mouse_x, mouse_y, x_offset + x_max + line_thickness * x_limit - buffer + line_thickness / 2, y_offset, x_offset + x_max + line_thickness * x_limit + buffer + line_thickness / 2, y_offset + y_max + line_thickness * y_limit) // Check that mouse is in expand left, right area
    {
        if global.border_selection_id == !unique_id // Prevents and active item from interfering  with other moveable objects
        {
            window_set_cursor(cr_size_we); // Sets cursor to left, right arrow
            global.border_selection_id = unique_id; // Locks grid for editing
        }
    }

    if point_in_rectangle(mouse_x, mouse_y, x_offset - buffer + x_max + x_limit * line_thickness, y_offset - buffer + y_max + y_limit * line_thickness, x_offset + buffer + x_max + x_limit * line_thickness, y_offset + buffer + y_max + y_limit * line_thickness) // Check that mouse is in expand diagonal area
    {
        if global.border_selection_id == !unique_id // Prevents and active item from interfering  with other moveable objects
        {
            window_set_cursor(cr_size_nwse); // Sets cursor to diagonal top left
            global.border_selection_id = unique_id; // Locks grid for editing
        }
    }
    
    if mouse_check_button(global.controls[0]) // Check if select button is pressed
    {
        if global.border_selection_id == unique_id // Prevents other objects from being moved while grid is being moved
        {
            if window_get_cursor() == cr_size_all // Checks if current cursor is set to move cursor
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
		
	        if window_get_cursor() == cr_size_ns // Checks if current cursor is set to up, down cursor
	        {
				check_y_limit = round((mouse_y - y_offset) / cell_size); // Stores new y_limit
						
				if check_y_limit > 0
				{
					y_limit = round((mouse_y - y_offset) / cell_size); // Recalculates Y Limit based on mouse Y possition
				}
	        }
			
			// EXPAND GRID HORIZONTAL
        
	        if window_get_cursor() == cr_size_we // Checks if current cursor is set to left, right cursor
	        {
				check_x_limit = round((mouse_x - x_offset) / cell_size); // Stores new y_limit
						
				if check_x_limit > 0
				{
					x_limit = round((mouse_x - x_offset) / cell_size); // Recalculates Y Limit based on mouse Y possition
				}
	        }
        
            if window_get_cursor() == cr_size_nwse // Checks if current cursor is set to top, left cursor
            {
                check_y_limit = round((mouse_y - y_offset) / cell_size); // Stores new y_limit
						
				if check_y_limit > 0
				{
					y_limit = round((mouse_y - y_offset) / cell_size); // Recalculates Y Limit based on mouse Y possition
				}
				
				check_x_limit = round((mouse_x - x_offset) / cell_size); // Stores new x_limit
						
				if check_x_limit > 0
				{
					x_limit = round((mouse_x - x_offset) / cell_size); // Recalculates X Limit based on mouse X possition
				}
            }
        }
    }
        else
    {
        global.border_selection_id = 0; // Frees up other objects to be moved and manipulated
    }
}

/***********************************************************************
*                         SETS FONT VARIABLES                          *       
***********************************************************************/

current_font = fnt_western_32;

if cell_size < 128 then current_font = fnt_western_12; // Sets current font
if cell_size > 128 then current_font = fnt_western_32; // Sets current font

draw_set_font(current_font); // Sets font to draw numbers with

font_width = string_width(0); // Stores width of current font in pixels
font_height = string_height(0); // Stores height of current font in pixels