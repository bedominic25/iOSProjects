//
//  FourthViewController.h
//  NavCodeApp
//
//  Created by Benjamine Mutebi on 2/27/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FourthViewController : UIViewController {
    IBOutlet UIButton * skype;
    IBOutlet UIButton * facebook;
    IBOutlet UIImageView * image;
}

- (IBAction)btnSkype;
-(IBAction)btnFacebook;

@end
