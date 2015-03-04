//
//  ViewController.m
//  SegmentedControlApp
//
//  Created by Benjamine Mutebi on 2/26/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController -(IBAction)segControl {
    //    if(segment.selectedSegmentIndex == 0) {
    //        lbl.text = @"First";
    //    } else if(segment.selectedSegmentIndex == 1){
    //        lbl.text = @"Second";
    //    } else if(segment.selectedSegmentIndex == 2){
    //        lbl.text = @"Third";
    //    } else if(segment.selectedSegmentIndex == 3){
    //        lbl.text = @"Fourth";
    //    }
    //
    
    switch (segment.selectedSegmentIndex) {
        case 0:
            label.text = @"First";
            break;
        case 1:
            label.text = @"Second";
            break;
        case 2:
            label.text = @"Third";
            break;
        case 3:
            label.text = @"Fourth";
            break;
            
        default:
            break;
    }
    
    
    
    
    
}

@end
