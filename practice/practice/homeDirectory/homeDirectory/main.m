//
//  main.m
//  homeDirectory
//
//  Created by Benjamine Mutebi on 2/13/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Employee.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        NSString *homeDirectory = NSHomeDirectory();
//        NSLog(@"calling NSHomeDirectory() results in: %@", homeDirectory);
//        
//        NSFileManager *fileManager = [NSFileManager defaultManager];
//        
//        NSURL *docsDirectory = [fileManager URLForDirectory:NSMusicDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
//        
//        NSLog(@"The fileManager method returned: %@", docsDirectory);
        
        
//        NSURL *documentDir = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
//        
//        //create full path
//        NSURL *full = [documentDir URLByAppendingPathComponent:@"changes.txt"];
//        
//        //load the content
//        NSString *content = [[NSString alloc] initWithContentsOfURL:full encoding:NSUTF8StringEncoding error:nil];
//        
//        //Write it out
//        NSLog(@"The String is : %@", content);
        
        Employee *Benji = [[Employee alloc]init];
        [Benji setFirstName:@"B0Ss3edUp"];
        [Benji setLastName:@"Vision"];
        [Benji setEmployeeNumber:1800];
        [Benji setHireDate:[NSDate date]];
        
        Employee * alice  = [[Employee alloc]init];
        alice.firstName = @"Alice";
        alice.lastName = @"Wonderland";
        alice.employeeNumber = 1400;
        alice.hireDate = [NSDate dateWithString:@"2010-03-24 05:02:00 -0800a"];
        
        NSLog(@"First Employee: \n%@", [Benji description]);
        NSLog(@"Second Employee: \n%@", [alice description]);
        
        
        
        
    }
    return 0;
}
