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
#define SIGN(x)					((x)>0?1:((x)<0?-1:0))

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
		memset(&p->base[i].velocity, 0, sizeof(Velocity));
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

static int setAcceleration(Particles *p) {
	for (int i = 0; i < p->number; i++) {
		for (int k = i + 1; k < p->number; k++) {
			Particle *p1 = &p->base[i], *p2 = &p->base[k];
			int distanceX = p2->origin.x - p1->origin.x;
			int distanceY = p2->origin.y - p1->origin.y;
			p1->accel.x = SIGN(distanceX)*GRAVITY_CONSTANT * p2->radius / (SQ(distanceX));
			p2->accel.x = -1*SIGN(distanceX)*GRAVITY_CONSTANT * p1->radius / (SQ(distanceX));
			p1->accel.y = SIGN(distanceX)*GRAVITY_CONSTANT * p2->radius / (SQ(distanceY));
			p2->accel.y = -1*SIGN(distanceX)*GRAVITY_CONSTANT * p1->radius / (SQ(distanceY));
		}
	}
	return 0;
}

static int checkBorderIntersection(Particle *p) {
	Origin o = p->origin;
	Radius r = p->radius;
	if (o.x <= r && p->velocity.x < 0)
		p->velocity->x *= -1;
	if (o.x + r >= window.x && p->velocity.x > 0)
		p->velocity->x *= -1;
	if (o.y <= r && p->velocity.y < 0)
		p->velocity->y *= -1;
	if (o.y + r >= window.y && p->velocity.y > 0)
		p->velocity->y *= -1;
	return 0;
}

static int setVelocity(Particles *p) {
	for (int i = 0; i < p->number; i++) {
		p->base[i].velocity.x += p->base[i].accel.x;
		p->base[i].velocity.y += p->base[i].accel.y;
		checkBorderIntersection(&p->base[i]);
	}
	return 0;
}

/*TODO Add checks if particle passed through another*/

static int setOrigin(Particles *p){

	for (int i=0; i< p->number; i++){
		p->base[i].origin.x+=p->base[i].velocity.x;
		p->base[i].origin.y+=p->base[i].velocity.y;
	}

	return 0;
}

static int mergeParticles(Particles* p){



	return 0;
}

int stepParticles(Particles *p) {
	setAcceleration(p);
	setVelocity(p);
	setOrigin(p);
	mergeParticles(p);
	return 0;
}
