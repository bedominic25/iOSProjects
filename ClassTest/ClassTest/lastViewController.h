//
//  lastViewController.h
//  ClassTest
//
//  Created by Benjamine Mutebi on 3/2/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface lastViewController : UIViewController {
    IBOutlet UISlider * slider;
    IBOutlet UIImageView * minimum;
    IBOutlet UIStepper * step;
    
}

- (IBAction)changeSlider;

-(IBAction)changeStep;

@end
