//
//  Player.m
//  mathUtility
//
//  Created by Benjamine Mutebi on 2/11/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "Player.h"

@implementation Player
- (instancetype)init
{
    self = [self initWithInteger:5000];
       return self;
}


-(id)initWithInteger:(int) initialScore
{
    self = [super  init];
    if(self) {
        //custom
        _score = initialScore;
    }
    return self;
}
@end
