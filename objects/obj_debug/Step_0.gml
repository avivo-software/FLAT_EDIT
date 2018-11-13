/// @description Debug code

/***************************************************************************
*									DEBUG								   *
****************************************************************************/

if keyboard_check(vk_enter)
{
	ini_open("save.ini");
	
	ini_write_real("object_data", "qty", ds_list_size(obj_place.object_data_sprite));
	
	//for(i = 0; i < obj_place.object_data_sprite + 1; i++) 
	//{
		//ini_write_real("object_data_sprite", i, obj_place.object_data_sprite[| i]);
		//ini_write_real("object_data_index", i, obj_place.object_data_index[| i]);
		//ini_write_real("object_data_angle", i, obj_place.object_data_angle[| i]);
		
		//ini_write_real("object_data_x_pos", i, obj_place.object_data_x_pos[| i]);
		//ini_write_real("object_data_y_pos", i, obj_place.object_data_y_pos[| i]);
		
		//ini_write_real("object_data_x_scale", i, obj_place.object_data_x_scale[| i]);
		//ini_write_real("object_data_y_scale", i, obj_place.object_data_y_scale[| i]);
	//}
	
	//qty = ini_read_real("object_data", "qty", "");
	qty = 2;
	for(i = 0; i < qty + 1; i++) 
	{
		ds_list_replace(obj_place.object_data_sprite, i, ini_read_real("object_data_sprite", i, ""));
		ds_list_replace(obj_place.object_data_index, i, ini_read_real("object_data_index", i, ""));
		ds_list_replace(obj_place.object_data_angle, i, ini_read_real("object_data_angle", i, ""));
		
		ds_list_replace(obj_place.object_data_x_pos, i, ini_read_real("object_data_x_pos", i, ""));
		ds_list_replace(obj_place.object_data_y_pos, i, ini_read_real("object_data_y_pos", i, ""));
		
		ds_list_replace(obj_place.object_data_x_scale, i, ini_read_real("object_data_x_scale", i, ""));
		ds_list_replace(obj_place.object_data_y_scale, i, ini_read_real("object_data_y_scale", i, ""));
	}
	
	ini_close();
}