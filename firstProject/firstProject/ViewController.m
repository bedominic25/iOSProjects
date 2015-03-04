//
//  ViewController.m
//  firstProject
//
//  Created by Benjamine Mutebi on 2/23/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "ViewController.h"



@implementation ViewController


-(IBAction)btnClicked {
    mylabel.text = [NSString stringWithFormat:@"Welcome, %@",mytextfield.text];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
