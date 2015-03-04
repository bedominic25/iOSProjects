//
//  secondViewController.m
//  NavCodeApp
//
//  Created by Benjamine Mutebi on 2/27/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "secondViewController.h"

@implementation secondViewController

-(IBAction)mySlider {
    lbl.text = [NSString stringWithFormat:@"Value: %0.02f",slider.value];
}

@end
