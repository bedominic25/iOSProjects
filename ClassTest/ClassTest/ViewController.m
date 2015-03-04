//
//  ViewController.m
//  ClassTest
//
//  Created by Benjamine Mutebi on 3/2/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController

-(IBAction)changeSwitch {
    if (mySwitch.on  ) {
        self.view.backgroundColor = [UIColor redColor];
        
    }
    else {
        self.view.backgroundColor = [UIColor blueColor];
    }
}
-(IBAction)callSegments {
    if (seg.selectedSegmentIndex == 0 && mySwitch.on){
        lbl.text = @"Red";
    }
    else if  (seg.selectedSegmentIndex == 1) {
        lbl.text= @"Green";
    }
    else if (seg.selectedSegmentIndex==2) {
        lbl.text = @"Blue";
    }else if (seg.selectedSegmentIndex ==3) {
        lbl.text = @"Orange";
    }

    
}

@end
