//
//  MainViewController.h
//  Store
//
//  Created by Peter Wansch on 10/26/13.
//  Copyright (c) 2013 Peter Wansch. All rights reserved.
//

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, UIPopoverControllerDelegate>

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;

@end
