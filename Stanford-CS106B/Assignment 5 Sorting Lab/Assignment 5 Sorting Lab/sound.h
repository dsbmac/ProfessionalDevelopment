/*
 * File: sound.h
 * Last modified Sept 2011, by Colin
 *      modified on Wed Sep 18 14:34:59 2002 by zelenski
 *      modified on Sat Apr  4 09:38:41 1998 by eroberts
 * -----------------------------------------------------
 * This interface defines a function for playing a named
 * sound file.
 */

#ifndef _sound_h
#define _sound_h

#include "genlib.h"

/*
 * Function: PlayNamedSound
 * Usage: PlayNamedSound("beep.wav");
 * ----------------------------------
 * This function looks for a sound file with the given name
 * in the "Sounds" subdirectory of the project.
 * If a matching sound file is located, it is loaded and played.
 * The function generates an error if the file cannot be
 * found or the sound facility is unimplemented for the platform.
 */

void PlayNamedSound(string name);

/*
 * Function: SetSoundOn
 * Usage: SetSoundOn(false);
 * --------------------------
 * This function enables/disables the playing of sound.
 * If you call the function passing false, it will disable sound
 * and any subsequent calls to PlayNamedSound will be be ignored.
 * If you call the function passing true, it will enable sound
 * and any subsequent class to PlayNamedSound will operate normally.
 * The default is true.
 */

void SetSoundOn(bool on);

/*
 * Function: TestSound
 * Usage: bool haveSound = TestSound();
 * ----------------------------------------------------------------
 * On X11-based systems, playing sounds relies on the Network Audio
 * System (ftp://ftp.x.org/contrib/audio/nas/)
 * If missing, attempts to play sounds will fail silently.
 * You may wish to check in advance by calling TestSound()
 * It returns true if the necessary sound drivers are found,
 * otherwise false.
 */

bool TestSound();

#endif
