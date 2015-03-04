//
//  FifthViewController.m
//  NavCodeApp
//
//  Created by Benjamine Mutebi on 2/27/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "FifthViewController.h"

@interface FifthViewController ()

@end

@implementation FifthViewController


- (IBAction)mySegment {
    switch (seg.selectedSegmentIndex) {
        case 0:
            lbl.text = @"First";
            break;
        case 1:
            lbl.text = @"Second";
            break;
        case 2:
            lbl.text = @"Third";
            break;
        case 3:
            lbl.text = @"Fourth";
            break;
            
        default:
            break;
    }
    

}
@end
