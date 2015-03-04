//
//  ViewController.h
//  SliderApp
//
//  Created by Benjamine Mutebi on 2/26/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    IBOutlet UISlider * mySlider;
    IBOutlet UILabel *myLabel;
}

-(IBAction)sliderSlide;



@end

