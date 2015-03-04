//
//  ViewController.m
//  switchApp
//
//  Created by Benjamine Mutebi on 2/25/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController

-(IBAction)switchChanged {
    if (mySwitch.on) {
        self.view.backgroundColor = [UIColor blueColor];
    }else{
        self.view.backgroundColor = [UIColor redColor];
    }
}




@end
