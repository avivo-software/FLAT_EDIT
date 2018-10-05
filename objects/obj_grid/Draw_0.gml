/// @description Draw Grid

/************************************************************************
							X AND Y GRID LINES
*************************************************************************/

for(j = 0; j < y_limit + 1; j++) // Outer loop (Vertical)
{
	for(i = 0; i < x_limit + 1; i++) // Inner loop (Horizontal)
	{
		if grid_enabled == true // Checks if grid is enabled before drawing grid
		{
			x = x_offset + cell_size * i; // Calculates X coordinates
			draw_line_width_colour(x + (line_thickness * i), y_offset, x + (line_thickness * i), y_max + y_offset + (line_thickness * y_limit), line_thickness, grid_colour, grid_colour); // Draws the line
	
			y = y_offset + cell_size * j; // Calculates Y coordinates
			draw_line_width_colour(x_offset, y + (line_thickness * j), x_max + x_offset + (line_thickness * x_limit), y + (line_thickness * j), line_thickness, grid_colour, grid_colour); // Draws the line
		}
		
		// DRAW GRID NUMBERS
		
		if numbers_enabled == true // Determines if numbers should be displayed or not
		{
			// Draw X line numbers
			
			x = x_offset + cell_size / 2 - font_width / 2 + i * cell_size + line_thickness / 2 + line_thickness * i; // Calculates X possition for next number 
			y = y_offset - numbers_gap - font_height; // Calculates Y position for next number
					
			if i == x_pos - x_shift then current_number_colour = number_select_colour else current_number_colour = number_non_select_colour; // Sets number colour to correct number
			if i < x_limit then draw_text_colour(x, y, i + x_shift, current_number_colour, current_number_colour, current_number_colour, current_number_colour, 1); // Draws selected number if is within grid size
			
			// Draw Y line numbers
			
			x = x_offset - numbers_gap - font_width; // Calculates X position for next number
			y = y_offset + cell_size / 2 - font_height / 2 + i * cell_size + (line_thickness / 2 + line_thickness * i); // Calculates Y possition for next number
				
			if i == y_pos - y_shift then current_number_colour = number_select_colour else current_number_colour = number_non_select_colour; // Sets number colour to correct number
			if i < y_limit then draw_text_colour(x, y, i + y_shift, current_number_colour, current_number_colour, current_number_colour, current_number_colour, 1); // Draws selected number if is within grid size
		}
	}
}

