//
//  Employee.m
//  homeDirectory
//
//  Created by Benjamine Mutebi on 2/13/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "Employee.h"

@implementation Employee

-(NSString *) description {
    NSString *desc = [NSString stringWithFormat:@"\t Employee: %i \n \t Name: %@ %@ \n \t Was hired on: %@ \n ----",
                      [self employeeNumber], [self firstName], [self  lastName], [self hireDate]];
                      return desc;
}

@end
