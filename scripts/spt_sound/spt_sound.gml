if global.edit_enabled == false // Prevents Sound-FX from playing if edit mode is enabled
{
	if global.sound_fx_enabled == true // Stops Sound-FX playing if is disabled
	{
		if argument0 == 0
		{
			switch argument1
			{
				case 0: // Play click on
				{
					audio_play_sound(global.sounds[snd_click_on], 0, false); // Play mouse click sound provided palette is not currently being edited
			
					break;
				}
		
				case 1: // Play click off sound
		
					audio_play_sound(global.sounds[snd_click_off], 0, false); // Play mouse click sound provided palette is not currently being edited
		
				break;
				
				case 2: // Play cancel sound
		
					if !audio_is_playing(global.sounds[snd_cancel]) // Prevents sound from over lapping
					{
						audio_play_sound(global.sounds[snd_cancel], 0, false); // Play mouse click sound provided palette is not currently being edited
					}
					
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