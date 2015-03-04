//
//  webViewTableViewCell.h
//  tabApp
//
//  Created by Benjamine Mutebi on 2/26/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface webViewTableViewCell : UITableViewCell {
    IBOutlet UITextField *txt;
    IBOutlet UIButton * button;
    IBOutlet UIWebView * webView;
}

- (IBAction)btnClicked;


@end
