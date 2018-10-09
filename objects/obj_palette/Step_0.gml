/*************************************************************************
*							INITIALIZE VARIABLES			   			 *
*************************************************************************/

border_x1 = x_offset; // Stores X1 location in order to define border boundries
border_y1 = y_offset; // Stores Y1 location in order to define border boundries
border_x2 = x_offset + (current_sprite_width + x_gap) * inner_loop - x_gap; // Stores X2 location in order to define border boundries
border_y2 = y_offset + (current_sprite_height + y_gap) * outer_loop - y_gap; // Stores Y2 location in order to define border boundries

/*************************************************************************
*								PALETTE SHIFT			   				 *
*************************************************************************/

if point_in_rectangle(mouse_x, mouse_y, border_x1, border_y1, border_x2, border_y2) // Stops palette from scrolling when cursor is not inside 
{
	// SHIFT DOWN
	
	if mouse_wheel_up() // Checks for mouse wheel down
	{
		if palette_shift > 0 // Prevents negative number
		{
			palette_shift --; // Reduces palette_shift
		}
			else
		{
			palette_shift = sprite_qty; // Cycles to sprite limit
		}
	}
	
	// SHIFT UP
	
	if mouse_wheel_down() // Checks for mouse wheel up
	{
		if palette_shift < sprite_qty // Prevents number from exeeding sprite limit 
		{
			palette_shift ++; // Increments palette_shift by one
		}
			else
		{
			palette_shift = 0; // Sets palette back to original state
		}
	}					
}

/***********************************************************************
*								SET CURSOR							   *       
***********************************************************************/

if global.edit_enabled == true // Prevents palette from being manipulated when edit mode is disabled
{
	// DETECTS IF MOUSE CURSOR IS IN MOVE ZONE
	
	if point_in_rectangle(mouse_x, mouse_y, x_offset - buffer, y_offset - buffer, x_offset + buffer, y_offset + buffer) // Checks if cursor is in move palette area
	{
		if global.border_selection_id == !unique_id // Prevents and active item from interfering with obj_palette moveable objects
		{
			window_set_cursor(cr_size_all); // Sets cursor to move cursor
			global.border_selection_id = unique_id; // Prevents obj_palette objects being moved while current one is in use
		}
	}

	// DETECTS IF MOUSE IS IN EXPAND VERTICALLY ZONE

	if point_in_rectangle(mouse_x, mouse_y, x_offset, border_y2 - buffer, border_x2 - buffer, border_y2 + buffer) // Check that mouse is in expand up, down area
	{
	    if global.border_selection_id == !unique_id // Prevents and active item from interfering  with obj_palette moveable objects
	    {
	        window_set_cursor(cr_size_ns); // Sets cursor to up, down arrow
	        global.border_selection_id = unique_id; // Prevents obj_palette objects being moved while current one is in use
	    }
	}

	// DETECTS IF MOUSEIS IN EXPAND HORIZONTALLY ZONE

	if point_in_rectangle(mouse_x, mouse_y, border_x2 - buffer, y_offset, border_x2 + buffer, border_y2 - buffer) // Check that mouse is in expand up, down area
	{
	    if global.border_selection_id == !unique_id // Prevents and active item from interfering  with obj_palette moveable objects
	    {
	        window_set_cursor(cr_size_we); // Sets cursor to up, down arrow
	        global.border_selection_id = unique_id; // Prevents obj_palette objects being moved while current one is in use
	    }
	}

	// DETECTS IF MOUSE IS IN EXPAND DIAGONALLY ZONE

	if point_in_rectangle(mouse_x, mouse_y, border_x2 - buffer, border_y1 - buffer, border_x2 + buffer, border_y2 + buffer) // Check that mouse is in expand up, down area
	{
	    if global.border_selection_id == !unique_id // Prevents and active item from interfering  with obj_palette moveable objects
	    {
	        window_set_cursor(cr_size_nwse); // Sets cursor to up, down arrow
	        global.border_selection_id = unique_id; // Prevents obj_palette objects being moved while current one is in use
	    }
	}
}


/***********************************************************************
*                       EXPAND AND MOVE PALETTE                        *       
***********************************************************************/
	
if mouse_check_button(global.controls[0]) // Checks if mouse button is pressed
{
	if global.border_selection_id == unique_id // Prevents obj_palette objects being interacted with at same time
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

		// EXPAND GRID VERTICALLY
		
		if window_get_cursor() == cr_size_ns // Checks if current cursor is set to left, right cursor
		{
			if floor((mouse_y - y_offset) / current_sprite_height) > 0 // Prevents palette from freezing
			{
				temp_loop = floor((mouse_y - y_offset - y_gap) / (current_sprite_height + y_gap));
				
				if temp_loop > 0 // Prevents outer loop from becoming invisible
				{
					if temp_loop < sprite_limit + 1 then outer_loop = temp_loop; // Prevents border from being larger than the number of sprites
				
					inner_loop = ceil(sprite_limit / outer_loop); // Calculates inner loop preventing border from becoming too large
					outer_loop = ceil(sprite_limit / inner_loop); // Calculates outer loop preventing border from becoming too large
				}
			}
		}

		// EXPAND GRID HORIZONTALLY
		
		if window_get_cursor() == cr_size_we // Checks if current cursor is set to left, right cursor
		{	
			if floor((mouse_x - x_offset) / current_sprite_width) > 0 // Prevents palette from freezing
			{
				temp_loop = round((mouse_x - x_offset - x_gap) / (current_sprite_width + x_gap));
				
				if temp_loop < sprite_limit + 1 then inner_loop = temp_loop; // Prevents border from being larger than the number of sprites
				
				outer_loop = ceil(sprite_limit / inner_loop); // Calculates inner loop preventing border from becoming too large
				inner_loop = ceil(sprite_limit / outer_loop); // Calculates outer loop preventing border from becoming too large
			}
		}

		// EXPAND GRID DIAGONALLY
		
		if window_get_cursor() == cr_size_nwse // Checks if current cursor is set to diagonal cursor
		{	
			palette_hyp = point_distance(border_x1, border_y1, border_x2, border_y2); // Stores the hypotenuse of the palette
			external_hyp = point_distance(border_x1, border_y1, mouse_x, mouse_y); // Stores the distance between the top left corner to the mouse
			
			temp_scale = external_hyp / palette_hyp; // Stores the tempory scale based on new potential possition
			
			if primary_x_scale * temp_scale > min_scale // Prevents palette scale from becoming invisible or too small
			{
				if primary_x_scale * temp_scale < max_scale // Prevents palette scale from becoming to large
				{
					primary_x_scale = primary_x_scale * temp_scale; // Scales to new primary X based on temp scale
					primary_y_scale = primary_y_scale * temp_scale; // Scales to new primary Y based on temp scale
				
					secondary_x_scale = primary_x_scale - scale_differential; // Scales to new secondry X based on temp scale and differential
					secondary_y_scale = primary_y_scale - scale_differential; // Scales to new secondry Y based on temp scale differential
			
					current_sprite_width = sprite_get_width(current_sprite) * primary_x_scale; // Stores actual width
					current_sprite_height = sprite_get_height(current_sprite) * primary_y_scale; // Stores actual height
				}
			}
		}
	}
}

/***********************************************************************
*									DEBUG							   *       
***********************************************************************/

if keyboard_check_pressed(vk_space)
{
	global.edit_enabled = !global.edit_enabled;
}


