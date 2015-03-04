//
//  firstProjectTableViewCell.m
//  tabApp
//
//  Created by Benjamine Mutebi on 2/26/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "firstProjectTableViewCell.h"

@implementation firstProjectTableViewCell

-(IBAction)btnclick {
     label.text = [NSString stringWithFormat:@"Welcome, %@",mytextField.text];
}

@end
