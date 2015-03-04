//
//  SecondViewController.m
//  NavApp
//
//  Created by Benjamine Mutebi on 3/2/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)gotothird {
    
    ThirdViewController * thirdVC = [[ThirdViewController alloc]init];
    thirdVC.title = @"Third";
    [self.navigationController pushViewController:thirdVC animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Third" style:UIBarButtonItemStylePlain target:self action:@selector(gotothird)];
    
    txt = [[UITextField alloc]initWithFrame:CGRectMake(20, 100, self.view.frame.size.width -40, 30)];
    txt.borderStyle = UITextBorderStyleRoundedRect;
    txt.placeholder = @"Enter Text here";
    [self.view addSubview:txt];
    
    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setFrame:CGRectMake(self.view.frame.size.width /2 - 20,150, 100, 20)];
    [btn setTitle:@"Click Me" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(loadTextField) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn ];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(20, 300, self.view.frame.size.width -40, 30)];
    lbl.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lbl];
    
    
    
    
    self.view.backgroundColor = [UIColor redColor];

}

-(void)loadTextField {
     lbl.text = [NSString stringWithFormat:@"Welcome, %@",txt.text];
}


@end
