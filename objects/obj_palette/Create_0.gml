/// @description Initialize Variables

/****************************************************************************
*								INITIALIZE VARIABLES						*
****************************************************************************/

current_sprite = spr_buttons_orange; // Determines the currently selected sprite
primary_sprite = spr_buttons_orange; // Determines primary sprite
secondary_sprite = spr_buttons_grey; // Determines secondary sprite

action_id = 0; // describes the type of palette | 0 = Buttons
unique_id = instance_count; // Stores the unique ID number for this instance

x_gap = 4; // Sets the distance in pixels between each sprite in the X direction
y_gap = 4; // Sets the distance in pixels between each sprite in the Y direction

current_x_scale = 0.25; // Determines current X scale
current_y_scale = 0.25; // Determines current Y scale

primary_x_scale = 0.25; // Determines the primary X scale
primary_y_scale = 0.25; // Determines the primary Y scale

secondary_x_scale = 0.24; // Determines the secondary X scale
secondary_y_scale = 0.24; // Determines the secondary Y scale

tertiary_x_scale = 0.20; // Determines the secondary X scale
tertiary_y_scale = 0.20; // Determines the secondary Y scale

scale_differential = 0.01; // The difference in percentage between primary and secondary scale

min_scale = 0.0625; // Determines the minimum scale the palette size can be
max_scale = 0.5; // Determines the maximum scale the palette size can be

current_sprite_width = sprite_get_width(current_sprite) * primary_x_scale; // Stores actual width
current_sprite_height = sprite_get_height(current_sprite) * primary_y_scale; // Stores actual height

x_offset = 128; // Determines X offset relative to the far left hand side of the screen
y_offset = 128; // Determines Y offset relative to the top of the screen

sprite_qty = sprite_get_number(current_sprite); // Stores the number of sub images in current sprite
sprite_limit = sprite_qty; // Sets the maximum number of sprites to draw

grid_snap = 4; // Sets the amount to snap the grid by
buffer = 4; // Sets the distance in pixels the borders around the action areas

palette_shift_enabled = false; // Toggles palette shift enabled
expand_enabled = false; // Prevents palette from being expanded while sprites are being enlarged or shrunk

palette_shift = 0; // Determines how many positions to offset sub-image number by

for (i = 0; i < sprite_qty; i += 1)
{
   stuck[i] = false;
   sticky[i] = false;
}

stuck[0] = true;
sticky[0] = true;


// CALCULATES LOOPS

inner_loop = 4; // Sets inner loop to tile root
outer_loop = floor(sprite_limit / inner_loop); // Number of sprites to draw in Y direction (Calculated from inner loop)
