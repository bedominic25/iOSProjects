//
//  ViewController.m
//  SliderApp
//
//  Created by Benjamine Mutebi on 2/26/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController

-(IBAction)sliderSlide {
    myLabel.text = [NSString stringWithFormat:@"Value:%0.02f", mySlider.value];
}

@end
