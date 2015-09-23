//
//  PassItOnViewController.h
//  words-drawings
//
//  Created by Matthew McClure on 9/11/15.
//  Copyright © 2015 Matthew McClure. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ChooseOptionViewController, ScrollTableViewController;

@interface PassItOnViewController : UIViewController

@property NSInteger numberOfPlayers;
@property NSInteger durationOfRound;

@property (strong,nonatomic) NSString *stringToPass;
//@property (strong,nonatomic) some kind of file that'll hold a drawing

@end
