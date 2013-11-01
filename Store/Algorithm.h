//
//  Algorithm.h
//  Store
//
//  Created by Peter Wansch on 10/19/13.
//  Copyright (c) 2013 Peter Wansch. All rights reserved.
//

// Alogrithm defines
#define LINESY                  18
#define COLUMNSX                21
#define NUMBER_OF_LEVELS        50

// Type definitions for board
typedef struct {
	short location[COLUMNSX][LINESY];
} Board;

typedef Board *PBoard;

typedef struct {
    int x;
    int y;
} BoardLocation;

// Function prototypes

