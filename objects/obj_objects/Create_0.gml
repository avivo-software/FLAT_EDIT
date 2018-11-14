/// @description Initialize Variables

/****************************************************************************
*								INITIALIZE VARIABLES						*
****************************************************************************/

unique_id = instance_count; // Stores the unique ID number for this instance
action_id = 4; // describes the type of palette | 0 = Buttons

last_selection = 0; // Stores ID of last selected sprite

current_sprite = spr_blocks_colour; // Determines the currently selected sprite
primary_sprite = spr_blocks_colour; // Determines primary sprite
secondary_sprite = spr_blocks_colour; // Determines secondary sprite

x_gap = 4; // Sets the distance in pixels between each sprite in the X direction
y_gap = 4; // Sets the distance in pixels between each sprite in the Y direction

current_x_scale = 0.5; // Determines current X scale
current_y_scale = 0.5; // Determines current Y scale

primary_x_scale = 0.5; // Determines the primary X scale
primary_y_scale = 0.5; // Determines the primary Y scale

secondary_x_scale = 0.49; // Determines the secondary X scale
secondary_y_scale = 0.49; // Determines the secondary Y scale

scale_differential = 0.01; // The difference in percentage between primary and secondary scale

min_scale = 0.0625; // Determines the minimum scale the palette size can be
max_scale = 0.5; // Determines the maximum scale the palette size can be

current_sprite_width = sprite_get_width(current_sprite) * primary_x_scale; // Stores actual width
current_sprite_height = sprite_get_height(current_sprite) * primary_y_scale; // Stores actual height

x_offset = 512; // Determines X offset relative to the far left hand side of the screen
y_offset = 800; // Determines Y offset relative to the top of the screen

sprite_qty = sprite_get_number(current_sprite); // Stores the number of sub images in current sprite
sprite_limit = sprite_qty; // Sets the maximum number of sprites to draw

grid_snap = 4; // Sets the amount to snap the grid by
buffer = 4; // Sets the distance in pixels the borders around the action areas

palette_shift_enabled = false; // Toggles palette shift enabled
expand_enabled = false; // Prevents palette from being expanded while sprites are being enlarged or shrunk

palette_shift = 0; // Determines how many positions to offset sub-image number by

// GENERATE STUCK AND STICKY ARRAY

for (i = 0; i < sprite_qty; i += 1) // Lopp until sprite qty has been reached
{
   stuck[i] = false; // Initialize stuck array
   sticky[i] = true; // Initialize sticky array
}

// STICKS PRE DEFINED SPRITES AS NEEDED

stuck[1] = true; // Sets default selection

// CALCULATES LOOPS

inner_loop = sprite_limit; // Sets inner loop to tile root
outer_loop = 1; // Number of sprites to draw in Y direction (Calculated from inner loop)
