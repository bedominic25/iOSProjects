//
//  firstViewController.m
//  iconProject
//
//  Created by Benjamine Mutebi on 3/1/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "firstViewController.h"

@implementation firstViewController

- (IBAction)btnClick {
    lbl.text = [NSString stringWithFormat:@"Welcome %@",txt.text ];

}


@end
