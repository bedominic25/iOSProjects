//
//  BlogPost.h
//  blogReader2
//
//  Created by Benjamine Mutebi on 2/23/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlogPost : NSObject {
    NSString * title;
    NSString * author;
}

-(void) setTitle:(NSString *)title;
-(NSString *)title;

@end
