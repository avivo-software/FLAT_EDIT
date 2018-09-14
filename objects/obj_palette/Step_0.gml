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

	
// MOVE OBJECT
	
if mouse_check_button(global.controls[0]) // Checks if mouse button is pressed
{
	if global.border_selection_id == unique_id // Prevents other objects being interacted with at same time
	{
		if window_get_cursor() == cr_size_all // Checks if move is enabled
		{
			if point_in_rectangle(mouse_x, mouse_y, 0, 0, room_width - (current_sprite_width + x_gap) * inner_loop, room_height - (current_sprite_height + y_gap) * outer_loop) // Prevents object from being moved outside the bounds of the room
			{
				x_offset = round(mouse_x / grid_snap) * grid_snap; // Snap X
				y_offset = round(mouse_y / grid_snap) * grid_snap; // Snap Y
			}
		}
	}
}