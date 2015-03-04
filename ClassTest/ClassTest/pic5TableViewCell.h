//
//  pic5TableViewCell.h
//  ClassTest
//
//  Created by Benjamine Mutebi on 3/2/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface pic5TableViewCell : UITableViewCell {
    IBOutlet UIImageView * img;
    IBOutlet UILabel * lbl;
}

-(IBAction)setLabel;
-(IBAction)setImage;


@end
