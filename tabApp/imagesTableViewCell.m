//
//  imagesTableViewCell.m
//  tabApp
//
//  Created by Benjamine Mutebi on 2/26/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "imagesTableViewCell.h"

@implementation imagesTableViewCell

-(IBAction)buttonChangefacebook {
     myImage.image = [UIImage imageNamed:@"1.png"];
}

-(IBAction)buttonChangeSkype {
    myImage.image = [UIImage imageNamed:@"2.png"];
}



@end
