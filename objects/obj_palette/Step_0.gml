/****************************************************************************
*							PALETTE MANIPULATIONS			   				*
****************************************************************************/

if mouse_wheel_down() // Checks for mouse wheel down
{
	if palette_shift > 0 // Prevents negative number
	{
		palette_shift --; // Reduces palette_shift
	}
		else
	{
		palette_shift = sprite_limit; // Cycles to sprite limit
	}
}

if mouse_wheel_up() // Checks for mouse wheel up
{
	if palette_shift < sprite_limit // Prevents number from exeeding sprite limit 
	{
		palette_shift ++; // Increments palette_shift by one
	}
		else
	{
		palette_shift = 0; // Sets palette back to original state
	}
}					

