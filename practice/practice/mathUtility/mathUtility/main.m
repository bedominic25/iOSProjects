//
//  main.m
//  mathUtility
//
//  Created by Benjamine Mutebi on 2/11/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        Player *playerObj = [[Player alloc]init];
//        NSLog(@"The score is %i", [playerObj score]);
//        
//        Player *secondPlayerObj = [[Player alloc ]initWithInteger:9999];
//        NSLog(@"The Score is %i", [secondPlayerObj score]);
//
        
        NSString *soundPath = @"/System/Library/Sounds";
        NSFileManager *fileManager = [[NSFileManager alloc]init];
        
        NSArray *soundFiles = [fileManager subpathsAtPath:soundPath];
        
        for (NSString *file in soundFiles) {
            NSLog(@"The file name is %@,", file );
        }
    }
    return 0;
}
