//
//  FourthViewController.m
//  TabBarCode
//
//  Created by Benjamine Mutebi on 3/2/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "FourthViewController.h"

@interface FourthViewController ()

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    facebookBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [facebookBtn setFrame:CGRectMake(self.view.frame.size.width /2 - 50, 20, 100, 20)];
    [facebookBtn setTitle:@"Facebook" forState:UIControlStateNormal];
    [facebookBtn addTarget:self action:@selector(changeImage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:facebookBtn ];
    
    skypeBtn= [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [skypeBtn setFrame:CGRectMake(self.view.frame.size.width /2 - 60, 70, 100, 20)];
    [skypeBtn setTitle:@"Skype" forState:UIControlStateNormal];
    [skypeBtn addTarget:self action:@selector(changeImage2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:skypeBtn ];
    
    image = [[UIImageView alloc ]initWithFrame:CGRectMake(20, 120, self.view.frame.size.width -40, 300)];
    [self.view addSubview:image];
    
    
    self.view.backgroundColor = [UIColor greenColor];
}

-(void) changeImage{
    image.image = [UIImage imageNamed:@"1.png"];

}

-(void)changeImage2 {
    image.image = [UIImage imageNamed:@"2.png"];

}
@end
