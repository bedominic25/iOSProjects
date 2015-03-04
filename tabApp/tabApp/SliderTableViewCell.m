//
//  SliderTableViewCell.m
//  tabApp
//
//  Created by Benjamine Mutebi on 2/26/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "SliderTableViewCell.h"

@implementation SliderTableViewCell

-(IBAction)mySlider {
    mylabel.text = [NSString stringWithFormat:@"Value:%0.02f", slider.value];
}
@end
