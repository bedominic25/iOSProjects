//
//  ThirdViewController.m
//  NavApp
//
//  Created by Benjamine Mutebi on 3/2/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "ThirdViewController.h"
#import "fourthViewController.h"
@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)goTofourth {
    
    fourthViewController * fourthVC = [[fourthViewController alloc]init];
    fourthVC.title = @"fourth";
    [self.navigationController pushViewController:fourthVC animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"fourth" style:UIBarButtonItemStylePlain target:self action:@selector(goTofourth)];
    seg = [[UISegmentedControl alloc]initWithItems:@[@"first", @"second", @"third", @"fourth"]];
    seg.frame = CGRectMake(20, 30, self.view.frame.size.width -40, 30 );
    [seg addTarget:self action:@selector(loadSegment) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:seg];
    
    lbl = [[UILabel alloc ]initWithFrame:CGRectMake(20, 100,self.view.frame.size.width -40, 30)];
    lbl.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lbl];
    
    
    
    
    
    self.view.backgroundColor = [UIColor grayColor];
    

}

-(void) loadSegment {
    
if (seg.selectedSegmentIndex == 0){
    lbl.text = @"First";
}
else if  (seg.selectedSegmentIndex == 1) {
    lbl.text= @"Second";
}
else if (seg.selectedSegmentIndex==2) {
    lbl.text = @"Third";
}else if (seg.selectedSegmentIndex ==3) {
    lbl.text = @"Fourth";
}
}

@end
