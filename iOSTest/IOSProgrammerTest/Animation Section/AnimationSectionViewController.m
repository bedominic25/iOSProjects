//
//  AnimationSectionViewController.m
//  IOSProgrammerTest
//
//  Created by Justin LeClair on 12/15/14.
//  Copyright (c) 2014 AppPartner. All rights reserved.
//

#import "AnimationSectionViewController.h"
#import "MainMenuViewController.h"

@interface AnimationSectionViewController ()

@end

@implementation AnimationSectionViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"Animation";

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSpin:(id)sender {
    
    
    [self.view addSubview:_icon];
    _icon.alpha = 0.0;

    
    [UIView animateWithDuration:5.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         _icon.alpha = 1.0;
                     } completion:NULL];
    
    }
@end
