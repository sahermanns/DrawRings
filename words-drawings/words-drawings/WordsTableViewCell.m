//
//  WordsTableViewCell.m
//  words-drawings
//
//  Created by Matthew McClure on 9/21/15.
//  Copyright © 2015 Matthew McClure. All rights reserved.
//

#import "WordsTableViewCell.h"
#import "ScrollTableViewController.h"

@interface WordsTableViewCell ()

@end

@implementation WordsTableViewCell



- (IBAction)doneButtonPressed:(UIButton *)sender {
  ScrollTableViewController *scrollTableVC = [[ScrollTableViewController alloc] init];
  [scrollTableVC showNextCell];
  int thisCounter = [scrollTableVC counter];
  thisCounter++;
  NSLog(@"wordsXibButtonPressed");
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
