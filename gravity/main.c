/*
 * main.c
 *
 *  Created on: 14 окт. 2022 г.
 *      Author: ivans
 */

#include "Particles.h"
#include "SDL.h"

static Particles p;

int WinMain(int argc, char **argv) {

	initAll(&p, 0, 0, 0, 0);
	for (int i=0; i<10000000; i++){
		drawParticles(&p);
		stepParticles(&p);
	}

	freeAll(&p);
	return 0;
}
