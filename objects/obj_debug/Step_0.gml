/// @description Debug code

/***************************************************************************
*									DEBUG								   *
****************************************************************************/

if keyboard_check_pressed(vk_enter)
{
	ini_open("sav.ini");
	
	for(i = 0; i < ds_list_size(obj_place.object_data_sprite); i++) 
	{
		ini_write_real("object_data_qty", "qty", ds_list_size(obj_place.object_data_sprite));
		
		ini_write_real("object_data_sprite", i, obj_place.object_data_sprite[| i]);
		ini_write_real("object_data_index", i, obj_place.object_data_index[| i]);
		ini_write_real("object_data_angle", i, obj_place.object_data_angle[| i]);
		
		ini_write_real("object_data_x_pos", i, obj_place.object_data_x_pos[| i]);
		ini_write_real("object_data_y_pos", i, obj_place.object_data_y_pos[| i]);
		
		ini_write_real("object_data_x_scale", i, obj_place.object_data_x_scale[| i]);
		ini_write_real("object_data_y_scale", i, obj_place.object_data_y_scale[| i]);
	}
	
	ini_close();
}

if keyboard_check_pressed(vk_control)
{
	ini_open("sav.ini");

	ds_list_clear(obj_place.object_data_sprite);
	ds_list_clear(obj_place.object_data_index);
	ds_list_clear(obj_place.object_data_angle);
	
	ds_list_clear(obj_place.object_data_x_pos);
	ds_list_clear(obj_place.object_data_y_pos);
	
	ds_list_clear(obj_place.object_data_x_scale);
	ds_list_clear(obj_place.object_data_y_scale);
	
	array_size = ini_read_real("object_data_qty", "qty", "") - 1;
	
	for(i = 0; i < array_size + 1; i++) 
	{
		ds_list_add(obj_place.object_data_sprite, ini_read_real("object_data_sprite", i, ""));
		ds_list_add(obj_place.object_data_index, ini_read_real("object_data_index", i, ""));
		ds_list_add(obj_place.object_data_angle, ini_read_real("object_data_angle", i, ""));
	
		ds_list_add(obj_place.object_data_x_pos, ini_read_real("object_data_x_pos", i, ""));
		ds_list_add(obj_place.object_data_y_pos, ini_read_real("object_data_y_pos", i, ""));
	
		ds_list_add(obj_place.object_data_x_scale, ini_read_real("object_data_x_scale", i, ""));
		ds_list_add(obj_place.object_data_y_scale, ini_read_real("object_data_y_scale", i, ""));
	
	}
	
	ini_close();
}
