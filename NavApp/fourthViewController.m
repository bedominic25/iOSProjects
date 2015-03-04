//
//  fourthViewController.m
//  NavApp
//
//  Created by Benjamine Mutebi on 3/2/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "fourthViewController.h"
#import "fifthViewController.h"

@interface fourthViewController ()

@end

@implementation fourthViewController

- (void)goTofifth {
    
    fifthViewController *  fifthVC = [[fifthViewController alloc]init];
    fifthVC.title = @"fifth";
    [self.navigationController pushViewController:fifthVC animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"fifth" style:UIBarButtonItemStylePlain target:self action:@selector(goTofifth)];
    
    // Do any additional setup after loading the view.
}


@end
