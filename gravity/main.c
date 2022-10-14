/*
 * main.c
 *
 *  Created on: 14 окт. 2022 г.
 *      Author: ivans
 */

#include "drawManager.h"

int WinMain(int argc, char **argv) {
	Canva c;
	initDrawManager(&c, 0, 0, "Hello world");
	freeDrawManager();
	return 0;
}
