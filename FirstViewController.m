//
//  FirstViewController.m
//  NavApp
//
//  Created by Benjamine Mutebi on 3/1/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"


@implementation FirstViewController

- (void)goToSecond {
    
    SecondViewController * secondVC = [[SecondViewController alloc]init];
    secondVC.title = @"Second";
    [self.navigationController pushViewController:secondVC animated:YES];
}

-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Second" style:UIBarButtonItemStylePlain target:self action:@selector(goToSecond)];
    
    
    txt = [[UITextField alloc]initWithFrame:CGRectMake(20, 70, self.view.frame.size.width -40, 30)];
    txt.borderStyle = UITextBorderStyleRoundedRect;
    txt.placeholder = @"Enter Url";
    [self.view addSubview:txt];
    
    UIButton *myCommonButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [myCommonButton setFrame:CGRectMake(120, 105, 100,30)];
    [myCommonButton setTitle:@"Go" forState:UIControlStateNormal];
    [myCommonButton addTarget:self action:@selector(loadWebPage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:myCommonButton];
    
    webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 140, self.view.frame.size.width, self.view.frame.size.height - 100)];
    [self.view addSubview:webView];
    

    
    
}

-(void) loadWebPage {
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:txt.text]]];
    [txt resignFirstResponder];
}


@end
