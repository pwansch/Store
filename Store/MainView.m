//
//  MainView.m
//  Pegs
//
//  Created by Peter Wansch on 7/23/13.
//
//

#import "MainView.h"

@interface MainView ()

- (CGPoint)ptlOffset;

@end

@implementation MainView

@synthesize board;

- (id)initWithCoder:(NSCoder *)coder {
	if ((self = [super initWithCoder:coder]))
	{
        // Initialization code
        self.text = nil;
        
        // Load images
        self.hbmBoard = [[NSMutableArray alloc] initWithCapacity:12];
        self.hbmBoardRotated = [[NSMutableArray alloc] initWithCapacity:12];
        for (short i = 0; i < 12; i++) {
            UIImage *boardImage = [UIImage imageNamed:[NSString stringWithFormat:@"%i.bmp", i]];
            [self.hbmBoard addObject:boardImage];
            UIImage *rotatedImage = [[UIImage alloc] initWithCGImage: boardImage.CGImage
                                                               scale: 1.0
                                                          orientation: UIImageOrientationRight];
            [self.hbmBoardRotated addObject:rotatedImage];
        }
        
        // Set the background color
        self.backgroundColor = [UIColor colorWithRed:0.0f green:0.5f blue:0.0f alpha:1.0f];
	}
    return self;
}

// Custom drawing
- (void)drawRect:(CGRect)rect
{
    CGRect rectPaint;
    
	// Obtain graphics context and set defaults
	CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0);
    UIFont *font;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        font = [UIFont systemFontOfSize:FONT_SIZE_IPHONE];
    } else {
        font = [UIFont systemFontOfSize:FONT_SIZE_IPAD];
    }
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    NSDictionary *dictionaryWhite = @{NSFontAttributeName: font,  NSParagraphStyleAttributeName: paragraphStyle, NSForegroundColorAttributeName: [UIColor whiteColor]};
    
	// Draw board
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    for(short x = 0; x < COLUMNSX; x++) {
        for(short y = 0; y < LINESY; y++) {
            rectPaint = [self boardRect:x :y];
            if (CGRectIntersectsRect(rectPaint, rect)) {
                short sTile;
                if(self.board.location[x][y] > 11)
                    sTile = self.board.location[x][y] - 5;
                else
                    sTile = self.board.location[x][y];
                UIImage *boardImage;
                if (UIInterfaceOrientationIsLandscape(orientation)) {
                    boardImage = [self.hbmBoard objectAtIndex:sTile];
                } else {
                    boardImage = [self.hbmBoardRotated objectAtIndex:sTile];
                }
                CGPoint ptl = {rectPaint.origin.x, rectPaint.origin.y};
                [boardImage drawAtPoint:ptl];
            }
        }
    }
    
    // Draw score
    CGRect scoreRect = [self scoreRect];
    if (CGRectIntersectsRect(scoreRect, rect)) {
        NSString *score = [NSString stringWithFormat:@"Score: 000000"];
        [score drawInRect:scoreRect withAttributes:dictionaryWhite];
    }
    
    // Draw level
    CGRect levelRect = [self levelRect];
    if (CGRectIntersectsRect(levelRect, rect)) {
        NSString *level = [NSString stringWithFormat:@"Level: 00"];
        [level drawInRect:levelRect withAttributes:dictionaryWhite];
    }
}

- (CGRect)scoreRect
{
    CGPoint ptlOffset = [self ptlOffset];
    CGRect rect;
    rect.origin.x = 0;
    rect.size.width = self.bounds.size.width / 2;
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        if (UIInterfaceOrientationIsLandscape(orientation)) {
            rect.origin.y = ptlOffset.y + HEIGHTY - FONT_SIZE_IPHONE - FONT_INSET;
        } else {
            rect.origin.y = ptlOffset.y + WIDTHX - FONT_SIZE_IPHONE - FONT_INSET;
        }
        rect.size.height = FONT_SIZE_IPHONE + FONT_INSET;
    } else {
        rect.origin.y = ptlOffset.y + HEIGHTY - FONT_SIZE_IPAD;
        if (UIInterfaceOrientationIsLandscape(orientation)) {
            rect.origin.y = ptlOffset.y + HEIGHTY - FONT_SIZE_IPAD - FONT_INSET;
        } else {
            rect.origin.y = ptlOffset.y + WIDTHX - FONT_SIZE_IPAD - FONT_INSET;
        }
        rect.size.height = FONT_SIZE_IPAD + FONT_INSET;
    }
    return rect;
}

- (CGRect)levelRect
{
    CGPoint ptlOffset = [self ptlOffset];
    CGRect rect;
    rect.origin.x = self.bounds.size.width / 2;
    rect.size.width = self.bounds.size.width / 2;
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        if (UIInterfaceOrientationIsLandscape(orientation)) {
            rect.origin.y = ptlOffset.y + HEIGHTY - FONT_SIZE_IPHONE - FONT_INSET;
        } else {
            rect.origin.y = ptlOffset.y + WIDTHX - FONT_SIZE_IPHONE - FONT_INSET;
        }
        rect.size.height = FONT_SIZE_IPHONE + FONT_INSET;
    } else {
        rect.origin.y = ptlOffset.y + HEIGHTY - FONT_SIZE_IPAD;
        if (UIInterfaceOrientationIsLandscape(orientation)) {
            rect.origin.y = ptlOffset.y + HEIGHTY - FONT_SIZE_IPAD - FONT_INSET;
        } else {
            rect.origin.y = ptlOffset.y + WIDTHX - FONT_SIZE_IPAD - FONT_INSET;
        }
        rect.size.height = FONT_SIZE_IPAD + FONT_INSET;
    }
    return rect;
}

- (CGPoint)ptlOffset
{
	// Calculate offset
    CGPoint ptlOffset;
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    if (UIInterfaceOrientationIsLandscape(orientation)) {
        ptlOffset = CGPointMake((self.bounds.size.width - (COLUMNSX * WIDTHX)) / 2, (self.bounds.size.height - (LINESY * HEIGHTY)) / 2);
    } else {
        ptlOffset = CGPointMake((self.bounds.size.width - (LINESY * HEIGHTY)) / 2, (self.bounds.size.height - (COLUMNSX * WIDTHX)) / 2);
    }
    return ptlOffset;
}


- (CGRect)boardRect:(short)x :(short)y
{
	// Calculate offset
    CGPoint ptlOffset = [self ptlOffset];
    CGRect boardRect;
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    if (UIInterfaceOrientationIsLandscape(orientation)) {
        boardRect = CGRectMake(ptlOffset.x + (x * WIDTHX), ptlOffset.y + ((LINESY - y - 1) * HEIGHTY), WIDTHX, HEIGHTY);
    } else {
        boardRect = CGRectMake(ptlOffset.x + (y * HEIGHTY), ptlOffset.y + (x * WIDTHX), HEIGHTY, WIDTHX);
    }
    return boardRect;
}

- (void)invalidateBoard:(short)x :(short)y
{
    [self setNeedsDisplayInRect:[self boardRect:x :y]];
}

- (void)invalidateScore
{
    [self setNeedsDisplayInRect:[self scoreRect]];
}

- (void)invalidateLevel
{
    [self setNeedsDisplayInRect:[self levelRect]];
}

- (CGRect)statusBarFrameViewRect
{
    CGRect statusBarFrame = [[UIApplication sharedApplication] statusBarFrame];
    CGRect statusBarWindowRect = [self.window convertRect:statusBarFrame fromWindow: nil];
    CGRect statusBarViewRect = [self convertRect:statusBarWindowRect fromView: nil];
    return statusBarViewRect;
}

- (PBoard)getBoardPointer
{
    return &board;
}

@end
