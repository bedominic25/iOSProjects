//
//  SixthViewController.m
//  NavCodeApp
//
//  Created by Benjamine Mutebi on 2/27/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "SixthViewController.h"


@implementation SixthViewController
-(IBAction)btnGo {
{
    NSURL *url = [NSURL URLWithString:txt.text];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [web loadRequest:request];
    
    [txt resignFirstResponder];

}

}
@end
