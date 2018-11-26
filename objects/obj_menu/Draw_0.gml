/// @description Draw menu

/***************************************************************************
*									MENU CODE							   *
****************************************************************************/

draw_text(room_width / 2, room_height / 2, "START");

if keyboard_check_released(vk_enter)
{
	room_goto_next();
}

