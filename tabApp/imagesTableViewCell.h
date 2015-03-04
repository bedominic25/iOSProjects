//
//  imagesTableViewCell.h
//  tabApp
//
//  Created by Benjamine Mutebi on 2/26/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface imagesTableViewCell : UITableViewCell
{
    IBOutlet UIButton * skype;
    IBOutlet UIButton * facebook;
    IBOutlet UIImageView * myImage;
}
-(IBAction)buttonChangeSkype;
-(IBAction)buttonChangefacebook;

@end
