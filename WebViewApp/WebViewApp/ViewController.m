//
//  ViewController.m
//  WebViewApp
//
//  Created by Benjamine Mutebi on 2/26/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

-(IBAction)btnPressed {
    
    NSURL *url = [NSURL URLWithString:myTextField.text];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [webPage loadRequest:request];
    
    [myTextField resignFirstResponder];
    
}

@end
