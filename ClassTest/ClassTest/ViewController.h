//
//  ViewController.h
//  ClassTest
//
//  Created by Benjamine Mutebi on 3/2/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    IBOutlet UISegmentedControl * seg;
    IBOutlet UILabel * lbl;
    IBOutlet UISwitch * mySwitch;
    
}

-(IBAction)changeSwitch;
-(IBAction)callSegments;

@end

