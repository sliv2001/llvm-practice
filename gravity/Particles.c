/*
 * Particles.c
 *
 *  Created on: 14 окт. 2022 г.
 *      Author: ivans
 */

#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "Particles.h"
#include "Particle_aux.h"

Canva window;

int initAll(Particles *p, Number n, Radius r_max, int x, int y) {
	int res;
	if ((res = initDrawManager(&window, x, y, DEFAULT_WINDOW_CAPTION)))
		return res;
	if ((res = initParticles(p, n, r_max)))
		return res;
	return 0;
}

int freeAll(Particles* p){
	freeDrawManager();
	freeParticles(p);
	return 0;
}

int drawParticles(Particles *p) {
	for (int n = 0; n < p->number; n++) {
		if (!exists(&p->base[n]))
			continue;
		Origin o = p->base[n].origin;
		Radius r = p->base[n].radius;
		drawCircle(o, r, MAX_BRIGHTNESS);
	}
	flush();
	return 0;
}

int stepParticles(Particles *p) {
	setAcceleration(p);
	setVelocity(p);
	setOrigin(p);
	collideParticles(p);
	return 0;
}
