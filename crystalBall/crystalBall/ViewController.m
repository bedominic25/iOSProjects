//
//  ViewController.m
//  crystalBall
//
//  Created by Benjamine Mutebi on 2/13/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.labelText.text = @"Hello, IOS";
    
    UITextField*textField = [[UITextField alloc]init];
    [self.view addSubview:textField];
    [textField becomeFirstResponder];
    [textField resignFirstResponder];
    [textField removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
   
}

- (IBAction)projectButton:(id)sender {
    
    self.labelText.text = self.textField.text;
    NSLog(@"Button Pressed");
}

    
    

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:TRUE];
}

@end
