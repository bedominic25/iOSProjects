//
//  secondViewController.m
//  iconProject
//
//  Created by Benjamine Mutebi on 3/1/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "secondViewController.h"



@implementation secondViewController

-(IBAction)btnSlider {
    lbl.text = [NSString stringWithFormat:@"Value: %0.02f",slider.value];

}

@end
