//
//  MasterViewController.m
//  BlogReader
//
//  Created by Benjamine Mutebi on 2/20/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

@interface MasterViewController ()


@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titlesArray = [NSArray arrayWithObjects:@"Getting Started with WordPress",@"WhiteSpace in web Design",
                                             @"What Is and Why You should Use It", @"Adaptive Images and Responsive SVGs -Treehouse Show Episode 15", @"Productivity is About Constraints and Concetration", @"A Guide to Becoming the Smartest Developer on the Planet",
                       @"Teacher Spotlight: Zac Gordon", @"Do You Love What You Do?", @"Applying Normalize.css Reset - Quick Tip", @"How I Wrote a Book in 3 Days", @"Responsive Techniques, JavaScript MVC Frameworks, Firefox 16 | Treehouse Show Episode 14", nil];
    
   
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSString *title = self.titlesArray[indexPath.row];
        [[segue destinationViewController] setDetailItem:title];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.titlesArray count];
    
}

// creating tableview cells 
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSString * object = self.titlesArray[indexPath.row];
    cell.textLabel.text = object ;
    return cell;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    //Return No is you do not want the Specified Item to be editable;
    return YES;
}



@end
