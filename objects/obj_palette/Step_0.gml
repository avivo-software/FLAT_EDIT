/****************************************************************************
*							PALETTE MANIPULATIONS			   				*
****************************************************************************/

if mouse_wheel_down() // Checks for mouse wheel down
{
	if palette_shift > 0 // Prevents negative number
	{
		palette_shift --; // Reduces palette_shift
	}
		else
	{
		palette_shift = sprite_limit; // Cycles to sprite limit
	}
}

if mouse_wheel_up() // Checks for mouse wheel up
{
	if palette_shift < sprite_limit // Prevents number from exeeding sprite limit 
	{
		palette_shift ++; // Increments palette_shift by one
	}
		else
	{
		palette_shift = 0; // Sets palette back to original state
	}
}					


/***********************************************************************
*                       EXPAND AND MOVE PALETTE                        *       
***********************************************************************/

// DETECTS IF MOUSE CURSOR IS IN MOVE ZONE

if global.edit_enabled == true // Checks if palettes can be manipulated
{
	if point_in_rectangle(mouse_x, mouse_y, x_offset - buffer, y_offset - buffer, x_offset + buffer, y_offset + buffer)
	{
		if global.border_selection_id == !unique_id // Prevents and active item from interfering with other moveable objects
		{
			window_set_cursor(cr_size_all); // Sets cursor to move cursor
			global.border_selection_id = unique_id;
		}
	}
}

// DETECTS IF MOUSEIS IN EXPAND VERTICALLY ZONE

x1 = x_offset; // Calculates X1 
y1 = y_offset + (current_sprite_height + y_gap) * outer_loop - buffer - y_gap; // Calculates Y1
x2 = x_offset + (current_sprite_width + x_gap) * inner_loop - x_gap * 2; // Calculates X2
y2 = y_offset + (current_sprite_height + y_gap) * outer_loop + buffer - y_gap; // Calculates Y2

if point_in_rectangle(mouse_x, mouse_y, x1, y1, x2, y2) // Check that mouse is in expand up, down area
{
    if global.border_selection_id == !unique_id // Prevents and active item from interfering  with other moveable objects
    {
        window_set_cursor(cr_size_ns); // Sets cursor to up, down arrow
        global.border_selection_id = unique_id; // Locks grid for editing
    }
}

// DETECTS IF MOUSEIS IN EXPAND HORIZONTALLY ZONE

x1 = x_offset + (current_sprite_width + x_gap) * inner_loop - buffer - x_gap; // Calculates X1
y1 = y_offset; // Calculates Y1 possition
x2 = x_offset + (current_sprite_width + x_gap) * inner_loop + buffer - x_gap; // Calculates X2 
y2 = y_offset + (current_sprite_height + y_gap) * outer_loop - y_gap * 2; // Calculates Y2

if point_in_rectangle(mouse_x, mouse_y, x1, y1, x2, y2) // Check that mouse is in expand up, down area
{
    if global.border_selection_id == !unique_id // Prevents and active item from interfering  with other moveable objects
    {
        window_set_cursor(cr_size_we); // Sets cursor to up, down arrow
        global.border_selection_id = unique_id; // Locks grid for editing
    }
}

// DETECTS IF MOUSEIS IN EXPAND DIAGONALLY ZONE

x1 = x_offset + (current_sprite_width + x_gap) * inner_loop - buffer; // Calculates X1
y1 = y_offset + (current_sprite_height + y_gap) * outer_loop - buffer; // Calculates Y1
x2 = x_offset + (current_sprite_width + x_gap) * inner_loop + buffer; // Calculates X2 
y2 = y_offset + (current_sprite_height + y_gap) * outer_loop + buffer; // Calculates Y2

if point_in_rectangle(mouse_x, mouse_y, x1, y1, x2, y2) // Check that mouse is in expand up, down area
{
    if global.border_selection_id == !unique_id // Prevents and active item from interfering  with other moveable objects
    {
        window_set_cursor(cr_size_nwse); // Sets cursor to up, down arrow
        global.border_selection_id = unique_id; // Locks grid for editing
    }
}

// EXPAND AND MOVE
	
if mouse_check_button(global.controls[0]) // Checks if mouse button is pressed
{
	if global.border_selection_id == unique_id // Prevents other objects being interacted with at same time
	{
		// MOVE OBJECT
		
		if window_get_cursor() == cr_size_all // Checks if move is enabled
		{
			if point_in_rectangle(mouse_x, mouse_y, 0, 0, room_width - (current_sprite_width + x_gap) * inner_loop, room_height - (current_sprite_height + y_gap) * outer_loop) // Prevents object from being moved outside the bounds of the room
			{
				x_offset = round(mouse_x / grid_snap) * grid_snap; // Snap X
				y_offset = round(mouse_y / grid_snap) * grid_snap; // Snap Y
			}
		}
	}

	// EXPAND GRID VERTICALLY
		
	if window_get_cursor() == cr_size_ns // Checks if current cursor is set to up, down cursor
	{	
		if floor((mouse_y - y_offset) / current_sprite_height) > 0 // Prevents grid from becoming invisible
		{
			outer_loop = floor((mouse_y - y_offset) / current_sprite_height); // Recalculates outer loop
			inner_loop = floor(sprite_limit / outer_loop) + 1; // Recalculates inner loop
		}
	}

	// EXPAND GRID HORIZONTALLY
		
	if window_get_cursor() == cr_size_we // Checks if current cursor is set to left, right cursor
	{	
		if floor((mouse_x - x_offset) / current_sprite_width) > 0 // Prevents grid from becoming invisible
		{
			inner_loop = floor((mouse_x - x_offset) / current_sprite_width); // Recalculates outer loop
			outer_loop = floor(sprite_limit / inner_loop) + 1; // Recalculates inner loop
		}
	}

	// EXPAND GRID DIAGONALLY
		
	if window_get_cursor() == cr_size_nwse // Checks if current cursor is set to diagonal cursor
	{	
		show_message("");
	}
}