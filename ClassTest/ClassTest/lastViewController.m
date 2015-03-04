//
//  lastViewController.m
//  ClassTest
//
//  Created by Benjamine Mutebi on 3/2/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "lastViewController.h"




@implementation lastViewController

-(void)viewDidLoad {
    
}

-(IBAction)changeSlider {
    minimum.frame=CGRectMake(minimum.frame.origin.x,minimum.frame.origin.y, slider.value,slider.value);
    [minimum frameForAlignmentRect:CGRectMake(minimum.frame.origin.x, minimum.frame.origin.y, 175, 200)];
    
    
    
   
    
}

- (IBAction)changeStep {
    minimum.frame=CGRectMake(minimum.frame.origin.x, minimum.frame.origin.y, step.value, step.value);
    [minimum frameForAlignmentRect:CGRectMake(minimum.frame.origin.x, minimum.frame.origin.y, 175, 200)];
    }
@end
