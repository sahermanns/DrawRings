//
//  ChooseOptionViewController.h
//  words-drawings
//
//  Created by Matthew McClure on 9/20/15.
//  Copyright © 2015 Matthew McClure. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PassItOnViewController, ChooseCategoryViewController, PassItOnViewController;

@interface ChooseOptionViewController : UIViewController

@property NSInteger numberOfPlayers;
@property NSInteger durationOfRound;

@property (strong,nonatomic) NSString *chosenCategory;
//@property (strong,nonatomic) NSMutableArray *passedArrayOfOptions;

@end
