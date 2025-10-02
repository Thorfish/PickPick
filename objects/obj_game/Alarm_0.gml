// Update window title once per second
window_set_caption("PickPick - FPS: " + string(round(fps_real)));

// Restart the alarm for the next second
alarm[0] = 60;