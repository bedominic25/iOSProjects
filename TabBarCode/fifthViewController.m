//
//  fifthViewController.m
//  TabBarCode
//
//  Created by Benjamine Mutebi on 3/2/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "fifthViewController.h"

@interface fifthViewController ()

@end

@implementation fifthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    mySlider = [[UISlider alloc]initWithFrame:CGRectMake(20, 100, self.view.frame.size.width -40, 30)];
    [mySlider addTarget:self action:@selector(changeValue) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:mySlider];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(20, 150, self.view.frame.size.width -40, 30)];
    lbl.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lbl];

   self.view.backgroundColor = [UIColor yellowColor];
}

- (void) changeValue {
    lbl.text = [NSString stringWithFormat:@"Value:%0.02f", mySlider.value];
}

@end
