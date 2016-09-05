//
//  ViewController.m
//  IOSProgrammerTest
//
//  Created by Justin LeClair on 12/15/14.
//  Copyright (c) 2014 AppPartner. All rights reserved.
//

#import "MainMenuViewController.h"
#import "ChatSectionViewController.h"
#import "LoginSectionViewController.h"
#import "AnimationSectionViewController.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:0.9]


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @"Coding Tasks";
    //#2c4556, 90%
    self.navigationController.navigationBar.barTintColor = UIColorFromRGB(0x2c4556);
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tableSectionAction:(id)sender
{
    ChatSectionViewController *tableSectionViewController = [[ChatSectionViewController alloc] init];
    [self.navigationController pushViewController:tableSectionViewController animated:YES];
}
- (IBAction)apiSectionAction:(id)sender
{
    LoginSectionViewController *apiSectionViewController = [[LoginSectionViewController alloc] init];
    [self.navigationController pushViewController:apiSectionViewController animated:YES];
}
- (IBAction)animationSectionAction:(id)sender
{
    AnimationSectionViewController *animationSectionViewController = [[AnimationSectionViewController alloc] init];
    [self.navigationController pushViewController:animationSectionViewController animated:YES];
}
@end
