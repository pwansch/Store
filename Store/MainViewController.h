//
//  MainViewController.h
//  Store
//
//  Created by Peter Wansch on 10/26/13.
//  Copyright (c) 2013 Peter Wansch. All rights reserved.
//

#import <AudioToolbox/AudioToolbox.h>
#import "FlipsideViewController.h"

#define kVersionKey			@"version"
#define kSoundKey			@"sound"
#define kLevelKey			@"level"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, UIPopoverControllerDelegate, UIActionSheetDelegate>

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;

@property (strong, nonatomic) IBOutlet UIButton *gameButton;
@property (strong, nonatomic) IBOutlet UIButton *undoButton;
@property (strong, nonatomic) IBOutlet UIButton *infoButton;
@property (assign, nonatomic) SystemSoundID newId;
@property (assign, nonatomic) BOOL m_sound;
@property (assign, nonatomic) short sLevel;
@property (assign, nonatomic) BOOL fGameOver;

- (IBAction)newGame:(id)sender;
- (void)playSound:(SystemSoundID)soundID;

@end
