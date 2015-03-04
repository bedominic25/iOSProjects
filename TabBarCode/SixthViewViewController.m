//
//  SixthViewViewController.m
//  TabBarCode
//
//  Created by Benjamine Mutebi on 3/2/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "SixthViewViewController.h"

@interface SixthViewViewController ()

@end

@implementation SixthViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    txt = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, self.view.frame.size.width - 40, 30)];
    txt.borderStyle = UITextBorderStyleRoundedRect;
    txt.placeholder = @"Enter URL";
    [self.view addSubview:txt];
    
    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setFrame:CGRectMake(self.view.frame.size.width/2 - 150, 70, 100, 30)];
    [btn setTitle:@"GO" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(loadwebPage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    web = [[UIWebView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, self.view.frame.size.height - 100)];
    [self.view addSubview:web];

    self.view.backgroundColor = [UIColor redColor];
}

-(void) loadwebPage {
    [web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:txt.text]]];
    [txt resignFirstResponder];

}


@end
