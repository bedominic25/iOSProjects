//
//  ThirdViewController.m
//  NavCodeApp
//
//  Created by Benjamine Mutebi on 2/27/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "ThirdViewController.h"



@implementation ThirdViewController

-(IBAction)changeSwitch {
    if (mySwitch.on) {
        self.view.backgroundColor = [UIColor redColor];
    
    }
    else {
        self.view.backgroundColor = [UIColor blueColor];
    }
}



@end
