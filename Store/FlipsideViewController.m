//
//  FlipsideViewController.m
//  Store
//
//  Created by Peter Wansch on 10/26/13.
//  Copyright (c) 2013 Peter Wansch. All rights reserved.
//

#import "FlipsideViewController.h"
#import "MainViewController.h"

@interface FlipsideViewController ()

@end

@implementation FlipsideViewController

- (void)awakeFromNib
{
    self.preferredContentSize = CGSizeMake(320.0, 568.0);
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	// Load settings
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	self.soundSwitch.on = [defaults boolForKey:kSoundKey];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[defaults setBool:self.soundSwitch.on forKey:kSoundKey];
	[defaults synchronize];
    [self.delegate flipsideViewControllerDidFinish:self];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSRange r = {0,0};
    [self.textView scrollRangeToVisible:r];
    [super viewWillAppear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        return YES;
    } else {
        return (interfaceOrientation !=	UIInterfaceOrientationPortraitUpsideDown);
    }
}

@end
