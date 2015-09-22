//
//  PassViewController.h
//  words-drawings
//
//  Created by Kristen Kozmary on 9/21/15.
//  Copyright © 2015 Matthew McClure. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PassItOnViewController.h"

@interface PassViewController : PassItOnViewController
@property (weak, nonatomic) IBOutlet UIButton *button;
- (IBAction)button:(id)sender;

@end
