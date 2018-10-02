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

	    draw_line_width_colour(x + (line_thickness * i), y_offset, x + (line_thickness * i), y_max + y_offset + (line_thickness * y_limit), line_thickness, grid_colour, grid_colour); // Draws the line
	
		if i < x_limit // Prevents numbers from being drawn outside of visible grid area
		{
			if numbers_enabled == true // Determines if numbers should be displayed or not
			{
				x = x_offset + cell_size / 2 - font_width / 2 + i * cell_size + line_thickness / 2 + line_thickness * i; // Calculates X possition for next number 
				y = y_offset - numbers_gap - font_height; // Calculates Y possition for next number
					
				if i == x_pos - x_shift // Checks if X possition is current number
				{
					draw_text_colour(x, y, i + y_shift, number_select_colour, number_select_colour, number_select_colour, number_select_colour, 1); // Draws selected number
				}
					else
				{
					draw_text_colour(x, y, i + y_shift, number_non_select_colour, number_non_select_colour, number_non_select_colour, number_non_select_colour, 1); // Draws unselected numbers
				}
			}
		}
	}

	// LOOPS THROUGH Y COORDINATES

	for(i = 0; i < y_limit + 1; i++) // Loops through and draws Y numbers
	{
		y = y_offset + cell_size * i; // Calculates Y coordinates
		
		draw_line_width_colour(x_offset, y + (line_thickness * i), x_max + x_offset + (line_thickness * x_limit), y + (line_thickness * i), line_thickness, grid_colour, grid_colour); // Draws the line
		
		if i < y_limit // Prevents numbers from being drawn outside of visible grid area
		{
			if numbers_enabled == true // Determines if numbers should be displayed or not
			{
				x = x_offset - numbers_gap - font_width; // Calculates X possition for next number
				y = y_offset + cell_size / 2 - font_height / 2 + i * cell_size + (line_thickness / 2 + line_thickness * i); // Calculates Y possition for next number
				
				if i == y_pos - y_shift // Checks if Y possition is current number
				{
					draw_text_colour(x, y, i + x_shift, number_select_colour, number_select_colour, number_select_colour, number_select_colour, 1); // Draws selected number
				}
					else
				{
					draw_text_colour(x, y, i + x_shift, number_non_select_colour, number_non_select_colour, number_non_select_colour, number_non_select_colour, 1); // Draws unselected numbers
				}
			}
		}
	}
}
