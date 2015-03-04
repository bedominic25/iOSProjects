//
//  SliderTableViewCell.h
//  tabApp
//
//  Created by Benjamine Mutebi on 2/26/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SliderTableViewCell : UITableViewCell {
    IBOutlet UISlider *slider;
    IBOutlet UILabel *mylabel;
    
}

-(IBAction)mySlider;


@end
