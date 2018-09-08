/// @description Initializes Variables

/***************************************************************************
*							INITIALIZES VARIABLES						   *
***************************************************************************/

unique_id = instance_count; // Stores the unique ID number for this instance

cell_size = 128; // Sets size of each grid cell

x_offset = 512; // X offset of palette
y_offset = 256; // Y offset of Palette

x_shift = 0; // Stores the pan X position of the grid
y_shift = 0; // Stores the pan Y position of the grid

x_limit = 8; // Sets the number of rows to draw
y_limit = 4; // Sets the number of columns to draw

x_max = 0; // Stores the length of the X line
y_max = 0; // Stores the length of the Y line

x_pos  = 0; // Stores X coordinate of the selected cell
y_pos = 0; // Stores Y coordinate of the selected cell

x_scale = 1; // Sets X scale tile
y_scale = 1; // Sets Y scale tile

x1 = x_offset; // Stores X1 coordinate for grid
y1 = y_offset; // Stores Y1 coordinate for grid

x2 = x1 + x_max; // Stores X2 coordinate for grid 
y2 = y1 + y_max; // Stores Y2 coordinate for grid

cell_min = 32; // Sets the minimum size of the grid
cell_max = 256; // Sets the maximum size of the grid

hard_x_limit = 128; // Sets a maximum size for the level in the x direction
hard_y_limit = 128; // Sets a maximum size for the level in the y direction

grid_visible = true; // Sets if grid is visible

grid_colour = c_black; // Sets grid line colour
number_select_colour = c_red; // Sets colour of selected number
number_non_select_colour = c_white; // Sets colour of non-selected numbers

in_scope = false; // Determines if mouse is in grid or not

numbers_enabled = true; // Determines if grid numbers are visible

grid_snap = 16; // Sets the amount to snap the grid by
numbers_gap = 16; // The distance from grid to draw numbers
buffer = 4; // Sets the distance in pixels the borders around the action areas
