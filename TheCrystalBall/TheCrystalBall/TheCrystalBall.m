//
//  ViewController.m
//  TheCrystalBall
//
//  Created by Benjamine Mutebi on 2/14/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "TheCrystalBall.h"
#import "THCrystalball.h"

@interface TheCrystalBall ()

@end

@implementation TheCrystalBall

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.crystalBall = [[THCrystalball alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {
    
    self.predictionLabel.text = [self.crystalBall randomPrediction];
}
@end
