//
//  ViewController.m
//  Fibonacci
//
//  Created by 1800 on 7/11/16.
//  Copyright © 2016 1800. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)PrintNumbers:(id)sender {
    
    int i =0;
    int j =1;
    int sum = i + j;
    int temp;
    
    
    NSLog(@"Print the first value %d", i);
    NSLog(@"Print the second value %d", j);
    
    for (temp = 0; temp < 10; temp++){
        
        i = j;
        j = sum;
        
        sum = i + j;
        
            NSLog(@"The sum in sequence is %d", sum);
       
        
        }
    }


@end
