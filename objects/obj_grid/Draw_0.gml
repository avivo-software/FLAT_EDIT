/// @description Draw Grid

/************************************************************************
								X AND Y GRID LINES
*************************************************************************/

// LOOPS THROUGH X COORDINATES

if grid_visible == true // Checks if grid is visible to the user
{
	for(i = 0; i < x_limit + 1; i++) // Loops through and draws X numbers
	{
		x = x_offset + cell_size * i; // Calculates X coordinates

	    draw_line_colour(x, y_offset,x, y_max + y_offset, grid_colour, grid_colour); // Draws the line
		
		if i < x_limit // Prevents numbers from being drawn outside of visible grid area
		{
			if numbers_enabled == true // Determines if numbers should be displayed or not
			{
				if i == x_pos - x_shift // Checks if X possition is current number
				{
					draw_text_colour(x_offset + cell_size / 2 - font_width / 2 + i * cell_size, y_offset - numbers_gap - font_height, i + y_shift, number_select_colour, number_select_colour, number_select_colour, number_select_colour, 1); // Draws selected number
				}
					else
				{
					draw_text_colour(x_offset + cell_size / 2 - font_width / 2 + i * cell_size, y_offset - numbers_gap - font_height, i + y_shift, number_non_select_colour, number_non_select_colour, number_non_select_colour, number_non_select_colour, 1); // Draws unselected numbers
				}
			}
		}
	}

	// LOOPS THROUGH Y COORDINATES

	for(i = 0; i < y_limit + 1; i++) // Loops through and draws Y numbers
	{
		y = y_offset + cell_size * i; // Calculates Y coordinates
		
		draw_line_colour(x_offset, y, x_max + x_offset, y, grid_colour, grid_colour); // Draws the line
		
		if i < y_limit // Prevents numbers from being drawn outside of visible grid area
		{
			if numbers_enabled == true // Determines if numbers should be displayed or not
			{
				if i == y_pos - y_shift // Checks if Y possition is current number
				{
					draw_text_colour(x_offset - numbers_gap - font_width, y_offset + cell_size / 2 - font_height / 2 + i * cell_size, i + y_shift, number_select_colour, number_select_colour, number_select_colour, number_select_colour, 1); // Draws selected number
				}
					else
				{
					draw_text_colour(x_offset - numbers_gap - font_width, y_offset + cell_size / 2 - font_height / 2 + i * cell_size, i + y_shift, number_non_select_colour, number_non_select_colour, number_non_select_colour, number_non_select_colour, 1); // Draws unselected numbers
				}
			}
		}
	}
}



