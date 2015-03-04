//
//  NSObject+THCrystalball.m
//  TheCrystalBall
//
//  Created by Benjamine Mutebi on 2/14/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "NSObject+THCrystalball.h"

@implementation NSObject (THCrystalball)

-(NSArray *) predictions {
    if (_predictions == nil){
        _predictions = [[NSArray alloc] initWithObjects:@"it is Certain", @"It is Decidedly so", @"All signs say YES", @"The Stars are not aligned",
                        @"My reply is no", @"It is doubtful",@"Better not tell you now", @"Concetrate and ask again", @"Unable to answer now", nil];
    }
    return _predictions;
}

- (NSString *) randomPrediction {
    int random = arc4random_uniform(self.predictions.count);
    
    return [self.predictions objectAtIndex:random];
}

@end
