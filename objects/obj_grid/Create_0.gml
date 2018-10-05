/// @description Initializes variables

/***************************************************************************
*							INITIALIZES VARIABLES						   *
***************************************************************************/

unique_id = instance_count; // Stores the unique ID number for this instance

cell_size = 128; // Sets size of each grid cell

x_offset = 512; // X offset of palette relative to window size
y_offset = 256; // Y offset of Palette realative to window size

x_shift = 0; // Determines number of cells to shift in the X direction
y_shift = 0; // Determines number of cells to shift in the Y direction

x_limit = 8; // Sets the number of rows to draw
y_limit = 4; // Sets the number of columns to draw

x_max = 0; // Stores the length of the X line
y_max = 0; // Stores the length of the Y line

x_pos  = 0; // Stores X coordinate of the selected cell
y_pos = 0; // Stores Y coordinate of the selected cell

x_scale = 1; // Sets X scale tile
y_scale = 1; // Sets Y scale tile

cell_min = 32; // Sets the minimum size of the grid
cell_max = 256; // Sets the maximum size of the grid

hard_x_limit = 32; // Sets a maximum size for the level in the x direction
hard_y_limit = 32; // Sets a maximum size for the level in the y direction

grid_visible = true; // Sets if grid is visible

grid_colour = c_black; // Sets grid line colour
current_number_colour = c_white; // 
number_select_colour = c_red; // Sets colour of selected number
number_non_select_colour = c_white; // Sets colour of non-selected numbers

//in_scope = false; // Determines if mouse is in grid or not
grid_enabled = true; // Determines if grid should be drawn
numbers_enabled = true; // Determines if grid numbers are visible
zoom_enabled = true; // Allows palette to be scrolled

grid_snap = 16; // Sets the amount to snap the grid by
numbers_gap = 16; // The distance from grid to draw numbers
buffer = 4; // Sets the distance in pixels that borders the action areas
line_thickness = 1; // Stores the thickness of the grid lines


