//
//  DrawingTableViewCell.h
//  words-drawings
//
//  Created by Matthew McClure on 9/21/15.
//  Copyright © 2015 Matthew McClure. All rights reserved.
//

#import <UIKit/UIKit.h>


@class ScrollTableViewController, PPSSignatureView, JotViewController;

@interface DrawingTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *promptLabel;
//@property (nonatomic, strong) JotViewController *jotVC;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UIView *drawingView;

//@property (strong, nonatomic) UIWindow *window;


@end
