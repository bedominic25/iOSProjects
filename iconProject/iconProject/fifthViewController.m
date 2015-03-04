//
//  fifthViewController.m
//  iconProject
//
//  Created by Benjamine Mutebi on 3/1/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "fifthViewController.h"



@implementation fifthViewController

-(IBAction)btnclick {
    NSURL *url = [NSURL URLWithString:textfield.text];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [web loadRequest:request];
    
    [textfield resignFirstResponder];
}


@end
