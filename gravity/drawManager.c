/*
 * drawManager.c
 *
 *  Created on: 14 окт. 2022 г.
 *      Author: ivans
 */

#include <SDL.h>
#include "drawManager.h"

/*TODO check all possible errors*/
/*TODO Manage errors*/

static SDL_Surface *surface;
static SDL_Window *window;

int initDrawManager(Canva *c, int x, int y, char *windowCaption) {
	int res;
	if ((res = SDL_Init(SDL_INIT_EVERYTHING)))
		return -1;
	int xc = x ? x : DEFAULT_WIDTH;
	int yc = y ? y : DEFAULT_HEIGHT;
	if ((window = SDL_CreateWindow(windowCaption, SDL_WINDOWPOS_UNDEFINED,
	SDL_WINDOWPOS_UNDEFINED, xc, yc, SDL_WINDOW_SHOWN)) == NULL)
		return -1;
	if ((surface = SDL_GetWindowSurface(window)) == NULL)
		return -1;
	SDL_FillRect(surface, NULL, SDL_MapRGB(surface->format, 0, 0, 0));
	SDL_UpdateWindowSurface(window);
	c->x = xc;
	c->y = yc;
	return 0;
}

int putPixel(unsigned x, unsigned y, unsigned brightness) {
	return 0;
}

int flush() {
	return 0;
}

int freeDrawManager() {
	SDL_DestroyWindow(window);
	SDL_Quit();
	return 0;
}
