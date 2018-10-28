/// @description Draw Grid

/************************************************************************
								X AND Y GRID LINES
*************************************************************************/

x_max = x_limit * cell_size; //Sets X coordinates to correct position
y_max = y_limit * cell_size; //Sets Y Coordinates to correct position

// LOOPS THROUGH X COORDINATES

for(i = 0; i < x_limit + 1; i++) 
{
	x = x_offset + (cell_size * i); // Calculates current X position
		
	draw_set_color(grid_colour); // Sets colour to grid colour
	
	if grid_enabled == true then draw_line(x ,y_offset ,x , y_max + y_offset); // Draws the line

	if i == x_pos - x_shift // Check if current number is selected number
	{
		draw_set_color(number_select_colour); // Sets selected number colour X
	}
		else
	{
		draw_set_color(number_non_select_colour); // Sets non-selected number colour X
	}
		
	if i < x_limit // Prevents drawing numbers beyond visible grid
	{
		if numbers_enabled == true // Checks numbers are enabled before drawing
		{
			draw_text(x_offset + cell_size * i + (cell_size / 2) - 8,y_offset - font_height,i + x_shift); // Draws numbers
		}
	}
}

// LOOPS THROUGH Y COORDINATES

for(i = 0; i < y_limit+1; i++) 
{
	y = y_offset + (cell_size * i); // Calculates current Y position
		
	draw_set_color(grid_colour); // Sets colour to selected grid colour
	
	if grid_enabled == true then draw_line(x_offset, y, x_max + x_offset, y); //Draws the line

	if i == y_pos - y_shift // Check if current number is selected number
	{
		draw_set_color(number_select_colour); // Sets colour to selected number colour Y
	}
		else
	{
		draw_set_color(number_non_select_colour); // Sets colour to non-selected number colour Y
	}
	
	if i < y_limit // Prevents drawing numbers beyond visible grid
	{
		if numbers_enabled == true // Checks numbers are enabled before drawing
		{
			draw_text(x_offset - 24 - font_width , y_offset + cell_size * i + (cell_size / 2), i + y_shift); //Draws numbers
		}
	}
}


