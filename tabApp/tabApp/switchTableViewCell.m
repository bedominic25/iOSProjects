//
//  switchTableViewCell.m
//  tabApp
//
//  Created by Benjamine Mutebi on 2/26/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "switchTableViewCell.h"

@implementation switchTableViewCell







-(IBAction) switchChanged {
    if(myswitch.on){
        self.backgroundColor = [UIColor blueColor];
    } else {
        self.backgroundColor =[UIColor redColor];
    
    }
}

    
    
    
    @end

