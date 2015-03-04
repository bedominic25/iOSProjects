//
//  firstViewController.m
//  TabBarCode
//
//  Created by Benjamine Mutebi on 3/1/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "firstViewController.h"

@interface firstViewController ()

@end

@implementation firstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    txt = [[UITextField alloc]initWithFrame:CGRectMake(20, 30, self.view.frame.size.width -40, 30)];
    txt.borderStyle = UITextBorderStyleRoundedRect;
    txt.placeholder = @"Enter Text here";
    [self.view addSubview:txt];
    
    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setFrame:CGRectMake(self.view.frame.size.width /2 - 50, 70, 100, 20)];
    [btn setTitle:@"Click Me" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(loadTextField) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn ];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, self.view.frame.size.width -40, 30)];
    lbl.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lbl];
    
    
    
    
    self.view.backgroundColor = [UIColor redColor];
   
}

-(void) loadTextField{
     lbl.text = [NSString stringWithFormat:@"Welcome, %@",txt.text];
}


@end
