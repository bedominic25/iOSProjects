//
//  ViewController.m
//  WeatherApp
//
//  Created by Benjamine Mutebi on 2/20/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *statesTable;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    stateCityArray = @[@"Massachusetts,Boston", @"Florida,Miami", @"NewYork, Brooklyn", @"Maryland, Greenbelt"];
    
  }

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [stateCityArray count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"stateCity"];
    
    cell.textLabel.text = [stateCityArray objectAtIndex:indexPath.row];
    
    return cell;
    
    
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSIndexPath *indexPath = [self.statesTable indexPathForSelectedRow];
    DetailViewController *details = segue.destinationViewController;
    details.title = [stateCityArray objectAtIndex:indexPath.row];
    
}

@end
