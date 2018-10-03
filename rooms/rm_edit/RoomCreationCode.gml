/************************************************************************
*                             CREATION CODE								*
************************************************************************/

global.edit_enabled = false; // Determines if objects can be resized or moved 
global.border_selection_id = 0; // Determines which palette has been selected


// INITIALIZE GLOBAL CONTROLS

global.controls[0] = mb_left; // Select item
global.controls[1] = mb_right; // Secondary selection

global.controls[2] = vk_left; // Move left
global.controls[3] = vk_right; // Move right
global.controls[4] = vk_up; // Move up
global.controls[5] = vk_down; // Move down


// GENERATE OBJECT INSTANCES

layer_id = layer_get_id("lyr_gui"); // Gets GUI layer ID

instance_create_layer(0, 0, layer_id, obj_grid); // Loads grid instance
instance_create_layer(0, 0, layer_id, obj_palette); // Loads palette instance
