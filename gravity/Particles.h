/*
 * graph.h
 *
 *  Created on: 14 окт. 2022 г.
 *      Author: ivans
 */

#ifndef PARTICLES_H_
#define PARTICLES_H_

#include "drawManager.h"
#include <stdbool.h>

#define	MAX_SIZE_OF_PARTICLES			1000
#define DEFAULT_NUMBER_OF_PARTICLES		25
#define DEFAULT_MAXIMUM_RADIUS			10
#define MAX_BRIGHTNESS					255
#define DEFAULT_WINDOW_CAPTION			"Gravity"
#define GRAVITY_CONSTANT				10000000
#define DYNAMIC_INERTIA					60000
#define MAX_VELOCITY					INT_MAX/2-1
#define KINEMATIC_INERTIA				280

#define RANDOM_RANGE(from, to)	rand()%((to)-(from))+(from);
#define SQ(x)					(x)*(x)
#define SIGN(x)					((x)>0?1:((x)<0?-1:0))

struct Vector {
	int x;
	int y;
};
typedef struct Vector Vector;
typedef Vector Origin;
typedef Vector Velocity;
typedef Vector Acceleration;
typedef int Radius;
typedef int Number;
typedef int Brightness;

struct Particle {
	Origin origin;
	Velocity velocity;
	Acceleration accel;
	Radius radius;
	bool exists;
};
typedef struct Particle Particle;

struct Particles {
	Number number;
	Particle *base;
};
typedef struct Particles Particles;

/**
 * @fn int initAll(Particles*, Number, Radius)
 * @brief Initialises particles as well as canva and display
 *
 * @param p Address of instance
 * @param n Maximum number of particles. If ==0 then default value is used
 * @param r_max Maximum initial radius of particle. If ==0 then default value is used
 * @param x If ==0 value is chosen by SDL2
 * @param y See x
 * @return 0 in case of success
 */
int initAll(Particles *p, Number n, Radius r_max, int x, int y);

/**
 * @fn int freeAll(Particles*)
 * @brief Frees all objects allocated in initAll()
 *
 * @param p particles to be freed
 * @return 0 in case of success
 */
int freeAll(Particles* p);

/**
 * @fn int drawParticles(Particles)
 * @brief Puts corresponding pixels into buffer
 *
 * @param p
 * @return 0 in case of success
 *
 * Checked.
 */
int drawParticles(Particles *p);

/**
 * @fn int stepParticles(Particles*)
 * @brief Gives new origins to all particles according to their motion
 * Merges particles as well
 *
 * @param p
 * @return 0 in case of success
 */
int stepParticles(Particles *p);

#endif /* PARTICLES_H_ */
