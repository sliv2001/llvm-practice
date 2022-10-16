/*
 * main.c
 *
 *  Created on: 14 окт. 2022 г.
 *      Author: ivans
 */

#include "Particles.h"
#include "SDL.h"
#include "stdio.h"

#define FPS 30

static Particles p;

int WinMain(int argc, char **argv) {

	initAll(&p, 0, 0, 800, 800);
	drawParticles(&p);

	Uint32 time_step_ms = 1000 / FPS;
	Uint32 next_game_step = SDL_GetTicks();
	for (;;){
		stepParticles(&p);
		drawParticles(&p);
		while (SDL_GetTicks()<next_game_step){
			SDL_Delay(time_step_ms);
		}
		next_game_step = SDL_GetTicks()+time_step_ms;
	}
	return 0;
}
