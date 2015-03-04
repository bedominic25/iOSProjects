//
//  main.m
//  practice
//
//  Created by Benjamine Mutebi on 2/11/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import <Foundation/Foundation.h>
int myFunction(int x){
    
    NSLog(@"The value for x is %i", x);
    return x;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSString * mssge = @"HELLO";
        [mssge  uppercaseString];
        NSString * word =@"Practice";
        int myNumber = 9;
        myFunction(myNumber);
        
        NSDate *myDate = [NSDate date ];
        NSLog(@"The day today is: %@", myDate);
        
        NSDate *newDate = [[NSDate alloc] init];
        
        
    }
    return 0;
}
