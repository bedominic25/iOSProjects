//
//  part2ViewController.m
//  ClassTest
//
//  Created by Benjamine Mutebi on 3/2/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "part2ViewController.h"


@implementation part2ViewController

-(IBAction)btnClick {
    
    NSURL *url = [NSURL URLWithString:txt.text];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [web loadRequest:request];
    
    [txt resignFirstResponder];

    
}


 
@end
