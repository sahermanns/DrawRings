//
//  ScrollTableViewController.h
//  words-drawings
//
//  Created by Matthew McClure on 9/11/15.
//  Copyright © 2015 Matthew McClure. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WordsTableViewCell;
@interface ScrollTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong,nonatomic) NSString *seedPrompt;
- (void)showNextCell;
@property int counter;
@property (weak, nonatomic) UINavigationController *navController;

@end
