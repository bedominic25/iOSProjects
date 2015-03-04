//
//  ViewController.h
//  TheCrystalBall
//
//  Created by Benjamine Mutebi on 2/14/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class t

@interface TheCrystalBall : UIViewController
@property (strong, nonatomic) IBOutlet UIView *predictionLabel;

@property (strong,nonatomic) THCrystalball *crystalBall;

- (IBAction)buttonPressed:(id)sender;


@end

