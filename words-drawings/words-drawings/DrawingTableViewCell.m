//
//  DrawingTableViewCell.m
//  words-drawings
//
//  Created by Matthew McClure on 9/21/15.
//  Copyright © 2015 Matthew McClure. All rights reserved.
//

#import "DrawingTableViewCell.h"
#import "ScrollTableViewController.h"

@implementation DrawingTableViewCell



- (IBAction)doneButtonPressed:(UIButton *)sender {
  [[NSNotificationCenter defaultCenter] postNotificationName:@"doneDrawingNotification" object:self];

//  int thisCounter = [scrollTableVC counter];
//  thisCounter++;
  NSLog(@"UFO");
  //NSLog(@"DSUFIODSUDIOFU");
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
