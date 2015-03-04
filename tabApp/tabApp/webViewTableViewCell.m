//
//  webViewTableViewCell.m
//  tabApp
//
//  Created by Benjamine Mutebi on 2/26/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "webViewTableViewCell.h"

@implementation webViewTableViewCell

- (IBAction)btnClicked {
    NSURL *url = [NSURL URLWithString:txt.text];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
    [txt resignFirstResponder];

}
@end
