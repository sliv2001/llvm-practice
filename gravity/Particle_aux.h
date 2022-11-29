/*
 * Particle_aux.h
 *
 *  Created on: 24 окт. 2022 г.
 *      Author: ivans
 */

#ifndef PARTICLE_AUX_H_
#define PARTICLE_AUX_H_

int initParticles(Particles *p, Number n, Radius r_max);

int freeParticles(Particles *p);

void drawCircle(Origin o, Radius r, Brightness b);

bool exists(Particle *p);

int setAcceleration(Particles *p);

int setVelocity(Particles *p);

int setOrigin(Particles *p);

int collideParticles(Particles *p);

#endif /* PARTICLE_AUX_H_ */
