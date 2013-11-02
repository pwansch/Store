//
//  Algorithm.m
//  Store
//
//  Created by Peter Wansch on 10/19/13.
//  Copyright (c) 2013 Peter Wansch. All rights reserved.
//

#import "Algorithm.h"

BOOL vdBoardOK(Board board, short x, short y, short xTo, short yTo)
{
    if(board.location[x][y] < 4)
        return NO;
    if(board.location[x][y] == 7 || board.location[x][y] == 12)
    {
        if(board.location[xTo][yTo] == 4 || board.location[xTo][yTo] == 6)
            return YES;
        else
            return NO;
    }
    return YES;
}

BOOL vdWin(Board board)
{
    short x, y;
    
    for(x = 0; x < COLUMNSX; x++)
        for(y = 0; y < LINESY; y++)
        {
            if(board.location[x][y] == 6 || board.location[x][y] == 7)
                return NO;
        }
    return YES;
}

BOOL vdLose(Board board)
{
    short x, y;
    
    for(x = 0; x < COLUMNSX; x++)
        for(y = 0; y < LINESY; y++)
        {
            /* check die Kisten und Ihre Nachbarn */
            if(board.location[x][y] == 7)
            {
                /* ist die Kiste noch verschiebbar */
                if(board.location[x-1][y] < 4 && board.location[x][y+1] < 4)
                    return YES;
                if(board.location[x+1][y] < 4 && board.location[x][y+1] < 4)
                    return YES;
                if(board.location[x+1][y] < 4 && board.location[x][y-1] < 4)
                    return YES;
                if(board.location[x-1][y] < 4 && board.location[x][y-1] < 4)
                    return YES;
            }
        }
    return NO;
}