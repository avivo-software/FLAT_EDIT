/************************************************************************
*                             CREATION CODE								*
************************************************************************/

// SET CONSTANTS


// INITIALIZE GENERAL GLOBALS

global.edit_enabled = false; // Determines if objects can be resized or moved 
global.border_selection_id = 0; // Determines which palette has been selected

global.sound_fx_enabled = true; // Toggles Sound-FX
global.music_enabled = false; // Toggles music

// INITIALIZE GRID GLOBALS

global.current_sprite = spr_city_tile_colour; // Stores current tileset globally
global.primary_sprite = spr_city_tile_colour; // Stores primary tileset globally
global.secondary_sprite = spr_city_tile_grey; // Stores secondary tileset globally

global.current_layer = 0; // Stores current tile layer

global.rotate_enabled = false; // Determines if selected grid tile should be rotated

global.flip_vertical_enabled = false; // Determines if selected grid tile should be flipped vertically
global.flip_horizontal_enabled = false; // Determines if selected grid tile should be flipped horizontally

// INITIALIZE GLOBAL CONTROLS

global.controls[0] = mb_left; // Select item
global.controls[1] = mb_right; // Secondary selection

global.controls[2] = vk_left; // Move left
global.controls[3] = vk_right; // Move right
global.controls[4] = vk_up; // Move up
global.controls[5] = vk_down; // Move down

global.icon[0] = cr_arrow;
global.icon[1] = cr_size_we;
global.icon[2] = cr_size_ns;
global.icon[3] = cr_size_nwse;
global.icon[4] = cr_size_all;
global.icon[5] = cr_handpoint;


// GENERATE OBJECT INSTANCES

layer_id = layer_get_id("lyr_gui"); // Gets GUI layer ID

instance_create_layer(0, 0, layer_id, obj_grid); // Loads grid object
instance_create_layer(0, 0, layer_id, obj_buttons); // Loads palette object
instance_create_layer(0, 0, layer_id, obj_slides); // Loads slides object
instance_create_layer(0, 0, layer_id, obj_tiles); // Loads tiles object
instance_create_layer(0, 0, layer_id, obj_layer); // Loads layer object
instance_create_layer(0, 0, layer_id, obj_place); // Loads place object
instance_create_layer(0, 0, layer_id, obj_objects); // Loads place object
instance_create_layer(0, 0, layer_id, obj_debug); // Loads debug object

// INITIALIZE SOUND VARIABLES

global.sounds[0] = snd_click_on; // Button click on sound (palette)
global.sounds[1] = snd_click_off// Button click off sound (palette)
global.sounds[2] = snd_cancel; // Button cancel sound
global.sounds[3] = snd_delete; // Delete sound
global.sounds[4] = snd_place; // Delete sound
