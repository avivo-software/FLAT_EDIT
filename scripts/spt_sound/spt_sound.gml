if global.edit_enabled == false
{
	if global.sound_fx_enabled == true
	{
		if argument0 == 0
		{
			switch argument1
			{
				case 0:
				{
					audio_play_sound(global.sounds[snd_click_on], 0, false); // Play mouse click sound provided palette is not currently being edited
			
					break;
				}
		
				case 1:
		
					audio_play_sound(global.sounds[snd_click_off], 0, false); // Play mouse click sound provided palette is not currently being edited
		
				break;
				
				case 2:
		
					audio_play_sound(global.sounds[snd_cancel], 0, false); // Play mouse click sound provided palette is not currently being edited
		
				break;
			}
		}
	}
	
	if global.music_enabled == true
	{
		if argument0 == 1
		{
			switch argument1
			{
				case 0:
				{
			
				}
			}
		}
	}
}