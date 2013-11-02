//
//  MainView.h
//  Pegs
//
//  Created by Peter Wansch on 7/23/13.
//
//

#import <UIKit/UIKit.h>
#import "Algorithm.h"

#define WIDTHX              22
#define HEIGHTY             18
#define FONT_SIZE_IPHONE    14
#define FONT_SIZE_IPAD      28
#define FONT_INSET          3

@interface MainView : UIView

@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSMutableArray *hbmBoard;
@property (strong, nonatomic) NSMutableArray *hbmBoardRotated;
@property (assign, nonatomic) Board board;
@property (assign, nonatomic) unsigned long ulScore;

- (CGRect)scoreRect;
- (CGRect)levelRect;
- (CGRect)boardRect:(short)x :(short)y;
- (void)invalidateBoard:(short)x :(short)y;
- (void)invalidateScore;
- (void)invalidateLevel;
- (PBoard)getBoardPointer;

@end


