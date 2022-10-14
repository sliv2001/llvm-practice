/*
 * Particles.c
 *
 *  Created on: 14 окт. 2022 г.
 *      Author: ivans
 */

#include <stdlib.h>
#include "Particles.h"

#define RANDOM_RANGE(from, to)	rand()%((to)-(from))+(from);
#define SQ(x)					(x)*(x)

static Canva window;

int initAll(Particles *p, Number n, Radius r_max, int x, int y) {
	int res;
	if ((res = initDrawManager(&window, x, y, DEFAULT_WINDOW_CAPTION)))
		return res;
	if ((res = initParticles(p, n, r_max)))
		return res;
	return 0;
}

int initParticles(Particles *p, Number n, Radius r_max) {
	if (p->number == 0)
		return 0;
	int nc = n ? n : DEFAULT_NUMBER_OF_PARTICLES;
	int r_maxc = r_max ? r_max : DEFAULT_MAXIMUM_RADIUS;
	if (nc > MAX_SIZE_OF_PARTICLES)
		return -1;
	p->base = (Particle*) malloc(nc * sizeof(Particle));
	for (int i = 0; i < nc; i++) {
		int r = RANDOM_RANGE(2, r_maxc)
		;
		p->base[i].radius = r;
		p->base[i].origin.x = RANDOM_RANGE(r, window.x - r - 1)
		;
		p->base[i].origin.y = RANDOM_RANGE(r, window.y - r - 1)
		;
	}
	p->number = nc;
	return 0;
}

int freeParticles(Particles *p) {
	if (p->number != 0 && p->base != NULL) {
		free(p->base);
		p->base = NULL;
		p->number = 0;
	}
	return 0;
}

void drawCircle(Origin o, Radius r, Brightness b) {
	for (int x = o.x - r; x <= o.x + r; x++) {
		for (int y = o.y - r; y <= o.y + r; y++) {
			if (SQ(y-o.y) + SQ(x - o.x) <= SQ(r))
				putPixel(x, y, b);
		}
	}
}

int drawParticles(Particles *p) {
	for (int n = 0; n < p->number; n++) {
		Origin o = p->base[n].origin;
		Radius r = p->base[n].radius;
		drawCircle(o, r, MAX_BRIGHTNESS);
	}
	return 0;
}

int stepParticles(Particles *p) {
	return 0;
}
