//
//  MainView.h
//  Pegs
//
//  Created by Peter Wansch on 7/23/13.
//
//

#import <UIKit/UIKit.h>
#import "Algorithm.h"

#define WIDTHX_IPHONE       22
#define HEIGHTY_IPHONE      18
#define WIDTHX_IPAD         44
#define HEIGHTY_IPAD        36
#define FONT_SIZE_IPHONE    14
#define FONT_SIZE_IPAD      28
#define FONT_INSET          5

@interface MainView : UIView

@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSMutableArray *hbmBoard;
@property (strong, nonatomic) NSMutableArray *hbmBoardRotated;
@property (assign, nonatomic) Board board;
@property (assign, nonatomic) unsigned long ulMoves;
@property (assign, nonatomic) short sLevel;
@property (assign, nonatomic) short WIDTHX;
@property (assign, nonatomic) short HEIGHTY;

- (CGRect)movesRect;
- (CGRect)levelRect;
- (CGRect)textRect;
- (CGRect)boardRect:(short)x :(short)y;
- (void)invalidateBoard:(short)x :(short)y;
- (void)invalidateMoves;
- (void)invalidateLevel;
- (void)invalidateText;
- (PBoard)getBoardPointer;
- (short)emptyBoardLines;
- (short)emptyBoardColumns;

@end


