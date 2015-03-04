//
//  NSObject+THCrystalball.h
//  TheCrystalBall
//
//  Created by Benjamine Mutebi on 2/14/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (THCrystalball)

@property (strong,nonatomic) NSArray *predictions;


-(NSString *) randomPrediction;

@end
