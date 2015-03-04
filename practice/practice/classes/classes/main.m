//
//  main.m
//  classes
//
//  Created by Benjamine Mutebi on 2/11/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Employee.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Employee *fred = [[Employee alloc]init];
        
        //call a method of our new object
        [fred someMethod];
        
        //change a property of our new object
        [fred setName:@"Benji Bossed UP"];
        
    
    }
    return 0;
}
