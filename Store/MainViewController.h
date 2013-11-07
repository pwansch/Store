//
//  MainViewController.h
//  Store
//
//  Created by Peter Wansch on 10/26/13.
//  Copyright (c) 2013 Peter Wansch. All rights reserved.
//

#import <AudioToolbox/AudioToolbox.h>
#import "FlipsideViewController.h"
#import "Algorithm.h"

#define kVersionKey			@"version"
#define kSoundKey			@"sound"
#define kLevelKey			@"level"
#define kNewLevelKey		@"newLevel"
#define kMaximumVariance    5

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, UIPopoverControllerDelegate, UIActionSheetDelegate>

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;

@property (strong, nonatomic) IBOutlet UIButton *gameButton;
@property (strong, nonatomic) IBOutlet UIButton *undoButton;
@property (strong, nonatomic) IBOutlet UIButton *infoButton;
@property (assign, nonatomic) SystemSoundID newId;
@property (assign, nonatomic) SystemSoundID pushId;
@property (assign, nonatomic) SystemSoundID illegalId;
@property (assign, nonatomic) SystemSoundID undoId;
@property (assign, nonatomic) SystemSoundID wonId;
@property (assign, nonatomic) SystemSoundID lostId;
@property (assign, nonatomic) BOOL m_sound;
@property (assign, nonatomic) BOOL fGameOver;
@property (assign, nonatomic) BOOL fNextLevel;
@property (assign, nonatomic) short sLastDir;
@property (assign, nonatomic) Board boardUndo;
@property (assign, nonatomic) BoardLocation ptlWorker;
@property (assign, nonatomic) BoardLocation ptlWorkerUndo;
@property (assign, nonatomic) BOOL gesture;
@property (assign, nonatomic) CGPoint gestureStartPoint;

- (IBAction)newGame:(id)sender;
- (void)playSound:(SystemSoundID)soundID;

@end
