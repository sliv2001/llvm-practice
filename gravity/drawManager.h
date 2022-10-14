/*
 * drawer.h
 *
 *  Created on: 14 окт. 2022 г.
 *      Author: ivans
 */

#ifndef DRAWMANAGER_H_
#define DRAWMANAGER_H_

#define DEFAULT_WIDTH	640
#define DEFAULT_HEIGHT	480

struct Canva {
	unsigned x;
	unsigned y;
/*TODO replace int to unsigned if needed everywhere*/
};
typedef struct Canva Canva;

/**
 * @fn int initDrawManager(Canva*)
 * @brief Initialize window to draw on it
 *
 * @param с Address of resulting canva
 * @param x If ==0 value is default
 * @param y See x
 * @return 0 in case of success
 */
int initDrawManager(Canva *c, int x, int y, char *windowCaption);

/**
 * @fn int putPixel(unsigned, unsigned, unsigned)
 * @brief Draws a pixel on buffer
 *
 * @param x
 * @param y
 * @param brightness
 * @return 0 in case of success
 */
int putPixel(unsigned x, unsigned y, unsigned brightness);

/**
 * @fn int flush()
 * @brief Flushes buffer to screen
 *
 * @return 0 in case of success
 */
int flush();

/*TODO Check docs for compliance*/

/**
 * @fn int freeDrawManager()
 * @brief Finalizes all works with display and frees resource
 *
 * @return 0 in case of success
 */
int freeDrawManager();

#endif /* DRAWMANAGER_H_ */
