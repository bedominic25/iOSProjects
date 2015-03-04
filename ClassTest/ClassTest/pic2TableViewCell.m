//
//  pic2TableViewCell.m
//  ClassTest
//
//  Created by Benjamine Mutebi on 3/2/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "pic2TableViewCell.h"

@implementation pic2TableViewCell

-(IBAction)setLabel{
    self->lbl.text = [NSString stringWithFormat:@"Mickey Mouse, %@",lbl.text];
}

-( IBAction)setImage {
    self->img.image = [UIImage imageNamed:@"Mickey_Mouse.jpg"];
}

@end
