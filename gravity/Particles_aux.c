#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "Particles.h"
#include "Particle_aux.h"

extern Canva window;

bool exists(Particle *p) {
	return p->exists;
}

int initParticles(Particles *p, Number n, Radius r_max) {
	int nc = n ? n : DEFAULT_NUMBER_OF_PARTICLES;
	int r_maxc = r_max ? r_max : DEFAULT_MAXIMUM_RADIUS;
	if (nc > MAX_SIZE_OF_PARTICLES)
		return -1;
	p->base = (Particle*) malloc(nc * sizeof(Particle));
	for (int i = 0; i < nc; i++) {
		int r = RANDOM_RANGE(2, r_maxc);
		p->base[i].radius = r;
		p->base[i].origin.x = RANDOM_RANGE(r, window.x - r - 1);
		p->base[i].origin.y = RANDOM_RANGE(r, window.y - r - 1);
		memset(&p->base[i].velocity, 0, sizeof(Velocity));
		p->base[i].exists = true;
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

int setAcceleration(Particles *p) {
	for (int i = 0; i < p->number; i++) {
		if (!exists(&p->base[i]))
			continue;
		p->base[i].accel.x=0;
		p->base[i].accel.y=0;
		for (int k = 0; k < p->number; k++) {
			if (!exists(&p->base[k]))
				continue;
			if (i==k)
				continue;
			Particle *p1 = &p->base[i], *p2 = &p->base[k];
			int distanceX = p2->origin.x - p1->origin.x;
			int distanceY = p2->origin.y - p1->origin.y;
			int dsq=SQ(distanceX)+SQ(distanceY);
			if (dsq==0) dsq=1;
			int module = GRAVITY_CONSTANT * p2->radius / (dsq);
			p1->accel.x += (p2->origin.x-p1->origin.x)*module;
			p1->accel.y += (p2->origin.y-p1->origin.y)*module;
		}
	}
	return 0;
}

static int checkBorderIntersection(Particle *p) {
	Origin o = p->origin;
	Radius r = p->radius;
	if (!exists(p))
		return 0;
	if (o.x - r <= 0  && p->velocity.x < 0){
		p->velocity.x *= -1;
	}
	if (o.x + r >= window.x && p->velocity.x > 0){
		p->velocity.x *= -1;
	}
	if (o.y - r <= 0 && p->velocity.y < 0){
		p->velocity.y *= -1;
	}
	if (o.y + r >= window.y && p->velocity.y > 0)
		p->velocity.y *= -1;
	if (o.x < 0)
		p->origin.x=r+1;
	if (o.y < 0)
		p->origin.y=r+1;
	return 0;
}

/*Checked except for checkBorderIntersection*/
int setVelocity(Particles *p) {
	for (int i = 0; i < p->number; i++) {
		if (!exists(&p->base[i]))
			continue;
		p->base[i].velocity.x += p->base[i].accel.x/DYNAMIC_INERTIA;
		p->base[i].velocity.y += p->base[i].accel.y/DYNAMIC_INERTIA;
		if (p->base[i].velocity.x>MAX_VELOCITY){
			p->base[i].velocity.y = MAX_VELOCITY*p->base[i].velocity.y/p->base[i].velocity.x;
			p->base[i].velocity.x=MAX_VELOCITY;
		}
		if (p->base[i].velocity.y>MAX_VELOCITY){
			p->base[i].velocity.x = MAX_VELOCITY*p->base[i].velocity.x/p->base[i].velocity.y;
			p->base[i].velocity.y=MAX_VELOCITY;
		}
		checkBorderIntersection(&p->base[i]);
	}
	return 0;
}

/*TODO Add checks if particle passed through another*/

int setOrigin(Particles *p) {

	for (int i = 0; i < p->number; i++) {
		if (!exists(&p->base[i]))
			continue;
		p->base[i].origin.x += p->base[i].velocity.x/KINEMATIC_INERTIA;
		p->base[i].origin.y += p->base[i].velocity.y/KINEMATIC_INERTIA;
	}

	return 0;
}

static bool intersectParticles(Particle *p1, Particle *p2) {
	int rsum = p1->radius + p2->radius, dx = p2->origin.x - p1->origin.x, dy =
			p2->origin.y - p1->origin.y;
	return (dx * dx + dy * dy) <= (rsum * rsum);
}

static int collideParticle(Particle *p1, Particle *p2) {
	Velocity v=p1->velocity;
	p1->velocity.x = p2->velocity.x*p2->radius/p1->radius;
	p1->velocity.y = p2->velocity.y*p2->radius/p1->radius;
	p2->velocity.x = v.x*p1->radius/p2->radius;
	p2->velocity.y = v.y*p1->radius/p2->radius;
	return 0;
}

int collideParticles(Particles *p) {

	for (int i = 0; i < p->number; i++) {
		if (!exists(&p->base[i]))
			continue;
		for (int k = i+1; i < p->number; i++) {
			if (!exists(&p->base[k]))
				continue;
			Particle *p1 = &p->base[i], *p2 = &p->base[k];
			if (intersectParticles(p1, p2))
				collideParticle(p1, p2);
		}
	}

	return 0;
}
