//
//  AppDelegate.m
//  TabBarCode
//
//  Created by Benjamine Mutebi on 3/1/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "AppDelegate.h"
#import "firstViewController.h"
#import "secondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "fifthViewController.h"
#import "SixthViewViewController.h"

@interface AppDelegate ()

@end


@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame: [[UIScreen mainScreen]bounds]];
    [self.window makeKeyAndVisible];
    
    firstViewController *firstVC = [[firstViewController alloc]init];
    firstVC.tabBarItem.title = @"first";
    firstVC.tabBarItem.image = [UIImage imageNamed:@"airport-32.png"];
    
    
    secondViewController *secondVC = [[secondViewController alloc]init];
    secondVC.tabBarItem.title = @"Second";
    secondVC.tabBarItem.image = [UIImage imageNamed:@"arena-32.png"];
    
    ThirdViewController * thirdVc = [[ThirdViewController alloc]init];
    thirdVc.tabBarItem.title = @"Third";
    thirdVc.tabBarItem.image = [UIImage imageNamed:@"bank-32.png"];
    
    FourthViewController * fourthVC = [[FourthViewController alloc]init];
    fourthVC.tabBarItem.title = @"Fourth";
    fourthVC.tabBarItem.image = [UIImage imageNamed:@"bust-32.png"];
                                 
    fifthViewController * fifthVC = [[fifthViewController alloc]init];
    fifthVC.tabBarItem.title = @"Fifth";
    fifthVC.tabBarItem.image = [UIImage imageNamed:@"bridge-32.png"];
                                 
    SixthViewViewController * sixthVC = [[SixthViewViewController alloc]init];
    sixthVC.tabBarItem.title = @"Sixth";
    sixthVC.tabBarItem.image = [UIImage imageNamed:@"car_theft-32.png"];
    
    UITabBarController *tabBarController = [[UITabBarController alloc]init];
    tabBarController.viewControllers = @[firstVC,secondVC,thirdVc, fourthVC, fifthVC, sixthVC];
    
    
    self.window.rootViewController = tabBarController;
    
    
    
    return YES;
}


@end
