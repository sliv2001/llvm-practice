/*
 * main.c
 *
 *  Created on: 14 окт. 2022 г.
 *      Author: ivans
 */

#include "Particles.h"
#include "SDL.h"
#include "stdio.h"

static Particles p;

int WinMain(int argc, char **argv) {

	initAll(&p, 0, 0, 0, 0);
	drawParticles(&p);
	for (;;){
		stepParticles(&p);
		drawParticles(&p);
		SDL_Delay(10);
	}
	return 0;
}
