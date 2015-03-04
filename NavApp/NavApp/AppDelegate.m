//
//  AppDelegate.m
//  NavApp
//
//  Created by Benjamine Mutebi on 3/1/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "fourthViewController.h"
#import "fifthViewController.h"
#import "SixthViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
    
-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
        
    
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    FirstViewController *First = [[FirstViewController alloc] init];
    First.title = @"First";
    
//    SecondViewController * second = [[SecondViewController alloc]init];
//    second.title = @"Second";
//    
//    ThirdViewController * third = [[ThirdViewController alloc]init];
//    third.title = @"Third";
//    
//    fourthViewController * fourth = [[fourthViewController alloc]init];
//    fourth.title = @"fourth";
//    
//    fifthViewController * fifth = [[fifthViewController alloc]init];
//    fifth.title = @"Fifth";
//    
//    SixthViewController * sixth = [[SixthViewController alloc]init];
//    sixth.title = @"Sixth";
//    
    
    
    
    
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:First];
    self.window.rootViewController = navController;
    
    
    return YES;
}
    
    
    

    



@end
