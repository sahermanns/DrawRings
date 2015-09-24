//
//  DrawingTableViewCell.m
//  words-drawings
//
//  Created by Matthew McClure on 9/21/15.
//  Copyright © 2015 Matthew McClure. All rights reserved.
//

#import "DrawingTableViewCell.h"
#import "ScrollTableViewController.h"
#import "PPSSignatureView.h"
#import "JotViewController.h"

@interface DrawingTableViewCell ()


@end
@implementation DrawingTableViewCell

- (IBAction)doneButtonPressed:(UIButton *)sender {
  [[NSNotificationCenter defaultCenter] postNotificationName:@"doneDrawingNotification" object:self];
}

- (void)awakeFromNib {
  
  
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
