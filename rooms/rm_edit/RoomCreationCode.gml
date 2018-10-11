/************************************************************************
*                             CREATION CODE								*
************************************************************************/

// SET CONSTANTS


// INITIALIZE GENERAL GLOBALS

global.edit = true; // Determines if objects can be resized or moved 
global.border_selection_id = 0; // Determines which palette has been selected

global.sound_fx_enabled = true; // Toggles Sound-FX
global.music_enabled = false; // Toggles music

// INITIALIZE GRID GLOBALS

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


// GENERATE OBJECT INSTANCES

layer_id = layer_get_id("lyr_gui"); // Gets GUI layer ID

instance_create_layer(0, 0, layer_id, obj_grid); // Loads grid object
instance_create_layer(0, 0, layer_id, obj_buttons); // Loads palette object
instance_create_layer(0, 0, layer_id, obj_slides); // Loads slides object
instance_create_layer(0, 0, layer_id, obj_tiles); // Loads tiles object

// INITIALIZE SOUND VARIABLES

global.sounds[0] = snd_click_on; // Button click on sound (palette)
global.sounds[1] = snd_click_off// Button click off sound (palette)
global.sounds[2] = snd_cancel; // Button cancel sound
