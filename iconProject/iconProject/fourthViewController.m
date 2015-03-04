//
//  fourthViewController.m
//  iconProject
//
//  Created by Benjamine Mutebi on 3/1/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "fourthViewController.h"



@implementation fourthViewController

-(IBAction)changeSwitch {
    if (mySwitch.on) {
        self.view.backgroundColor = [ UIColor redColor];
    }
    else{
        self.view.backgroundColor = [UIColor blueColor];
    }
}

@end
