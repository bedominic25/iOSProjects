//
//  secondViewController.m
//  TabBarCode
//
//  Created by Benjamine Mutebi on 3/2/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "secondViewController.h"

@interface secondViewController ()

@end

@implementation secondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    mySwitch = [[UISwitch alloc]initWithFrame:CGRectMake(20, 60, self.view.frame.size.width -40, 30)];
    [mySwitch addTarget:self action:@selector(callMySwitch) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:mySwitch];
    self.view.backgroundColor = [UIColor blueColor];
    
    
   
}

- (void) callMySwitch {
    if(mySwitch.on){
        self.view.backgroundColor = [UIColor blueColor];
    } else {
        self.view.backgroundColor =[UIColor redColor];
        
    }

}
@end
