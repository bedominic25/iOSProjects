//
//  fifthViewController.m
//  NavApp
//
//  Created by Benjamine Mutebi on 3/2/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "fifthViewController.h"
#import "SixthViewController.h"

@interface fifthViewController ()

@end

@implementation fifthViewController

- (void)goToSixth {
    
    SixthViewController * sixthVC = [[SixthViewController alloc]init];
    sixthVC.title = @"Sixth";
    [self.navigationController pushViewController:sixthVC animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
     
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Sixth" style:UIBarButtonItemStylePlain target:self action:@selector(goToSixth)];
    
}



@end
