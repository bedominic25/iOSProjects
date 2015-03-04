//
//  DetailViewController.m
//  StocksApp
//
//  Created by Benjamine Mutebi on 2/18/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) displayStockValue {
    
    NSString *str = [NSString stringWithFormat:@"http://finance.yahoo.com/webservice/v1/symbols/%@/quote?format=json", self.title];
    NSLog(@"%@", str);
    
    NSURL *url = [NSURL URLWithString:str];
    NSData *data = [ NSData dataWithContentsOfURL:url];
    
    NSString *dataString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@",dataString);
    
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"%@",[[[[[[dictionary objectForKey:@"list"] objectForKey:@"resources"] objectAtIndex:0] objectForKey:@"resource"] objectForKey:@"fields"] objectForKey:@"price"]);
    
    
    self.priceLabel.text = [NSString stringWithFormat:@"Price: %@", [[[[[[dictionary objectForKey:@"list"] objectForKey:@"resources"] objectAtIndex:0] objectForKey:@"resource"] objectForKey:@"fields"] objectForKey:@"price"]];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
