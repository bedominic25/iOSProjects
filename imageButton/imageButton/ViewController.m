//
//  ViewController.m
//  imageButton
//
//  Created by Benjamine Mutebi on 2/24/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController

- (IBAction)btnClicked1 {
    
    myImage.image = [UIImage imageNamed:@"1.png"];
    
}
-(IBAction)btnClicked2 {
    myImage.image = [UIImage imageNamed:@"2.png"];
    
}
@end
