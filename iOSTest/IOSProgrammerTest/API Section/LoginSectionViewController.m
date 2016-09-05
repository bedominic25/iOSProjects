//
//  APISectionViewController.m
//  IOSProgrammerTest
//
//  Created by Justin LeClair on 12/15/14.
//  Copyright (c) 2014 AppPartner. All rights reserved.
//

#import "LoginSectionViewController.h"
#import "MainMenuViewController.h"
#import "AFNetworking.h"
@interface LoginSectionViewController ()

@end

@implementation LoginSectionViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"Login";
    [self.navigationItem.backBarButtonItem setTitle:@" "];
    
    
    // Do any additional setup after loading the view from its nib.
//    NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//    AFURLSessionManager * manager = [[AFURLSessionManager alloc]initWithSessionConfiguration:configuration];
//   
//    NSURL * URL = [NSURL URLWithString:@"http://dev.apppartner.com/AppPartnerProgrammerTest/scripts/login.php"];
//    NSDictionary *parameters = @{@"username":@"AppPartner",@"password":@"querty"};
    
    
    
    

    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)logIn:(id)sender {
    //Start time
    NSDate * date = [[NSDate alloc]init];
    
    
     NSDictionary *parameters = @{@"username": self.user.text, @"password": self.password.text};
    
     AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
     manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
     [manager POST:@"http://dev.apppartner.com/AppPartnerProgrammerTest/scripts/login.php" parameters:parameters progress:nil success:^(NSURLSessionTask *task, id responseObject) {
         
         NSDate *methodFinish = [NSDate date];
         NSTimeInterval executionTime = [methodFinish timeIntervalSinceDate:date];
         
         NSString * myMessage = [NSString stringWithFormat:@" Time Response is %f", executionTime];
         
         UIAlertController * aleart = [UIAlertController alertControllerWithTitle:@"Successful Login"
                                                                          message:myMessage
                                                                   preferredStyle:UIAlertControllerStyleAlert];
         UIAlertAction * action = [UIAlertAction actionWithTitle:@"Ok"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * aleart) {
                                                             
                                                             NSLog(@"executionTime = %f", executionTime);
                                                             NSLog(@"JSON: %@", responseObject);
                                                             MainMenuViewController * mvc = [[MainMenuViewController alloc]initWithNibName:@"MainMenuViewController" bundle:nil];
                                                             [self.navigationController pushViewController:mvc animated:YES];

                                                         }];
         [aleart addAction:action ];
         [self presentViewController:aleart animated:YES completion:nil];

        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
        
}


@end
