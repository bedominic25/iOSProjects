//
//  ViewController.m
//  StocksApp
//
//  Created by Benjamine Mutebi on 2/18/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *stocksTable;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    stocksArray = @[@"YHOO", @"EBAY", @"GOOG", @"GPRO", @"AAPL", @"ZNGA", @"TWTR", @"FB", @"KING",@"GLUU"];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [stocksArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StocksCell"];
    
    cell.textLabel.text = [stocksArray objectAtIndex:indexPath.row];
    
    return cell;
}
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSIndexPath *indexPath = [self.stocksTable indexPathForSelectedRow];
    DetailViewController *details = segue.destinationViewController;
    details.title = [stocksArray objectAtIndex:indexPath.row];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
