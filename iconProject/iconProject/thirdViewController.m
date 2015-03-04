//
//  thirdViewController.m
//  iconProject
//
//  Created by Benjamine Mutebi on 3/1/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "thirdViewController.h"


@implementation thirdViewController

-(IBAction)changeSeg {
    switch (seg.selectedSegmentIndex) {
        case 0:
            mylabel.text = @"First";
            break;
        case 1:
            mylabel.text = @"Second";
            break;
        case 2:
            mylabel.text = @"Third";
            break;
        case 3:
            mylabel.text = @"Fourth";
            break;
            
        default:
            break;
}
}

@end
