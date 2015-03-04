//
//  part3ViewController.m
//  ClassTest
//
//  Created by Benjamine Mutebi on 3/2/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "part3ViewController.h"



@implementation part3ViewController

-(IBAction)btnMickey {
    myImage.image = [ UIImage imageNamed:@"Mickey_Mouse.jpg"];
    
}
-(IBAction)btnMinnie {
    myImage.image = [ UIImage imageNamed:@"minnie_Mouse.jpeg"];
    
}
-(IBAction)btnDonald {
    myImage.image = [ UIImage imageNamed:@"donald_duck.gif"];
    
}
-(IBAction)btnFred {
    myImage.image = [ UIImage imageNamed:@"fred_flintstone.jpg"];
}
@end
