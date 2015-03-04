//
//  segmentTableViewCell.m
//  tabApp
//
//  Created by Benjamine Mutebi on 2/26/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import "segmentTableViewCell.h"

@implementation segmentTableViewCell

-(IBAction)changeSegment {
//    switch (mysegment.selectedSegmentIndex ) {
//            
//        case 0:
//            mylabel.text = @"First";
//            break;
//        case 1:
//            mylabel.text = @"Second";
//            break;
//        case 2:
//            mylabel.text = @"Third";
//            break;
//        case 3:
//            mylabel.text = @"First";
//            break;
//            
//        default:
//            break;
//    }
    
    
    if (mysegment.selectedSegmentIndex == 0){
        mylabel.text = @"First";
    }
    else if  (mysegment.selectedSegmentIndex == 1) {
        mylabel.text= @"Second";
    }
    else if (mysegment.selectedSegmentIndex==2) {
        mylabel.text = @"Third";
    }else if (mysegment.selectedSegmentIndex ==3) {
        mylabel.text = @"Fourth";
    }
}
@end
