//
//  EndOfGameViewController.m
//  words-drawings
//
//  Created by Matthew McClure on 9/20/15.
//  Copyright © 2015 Matthew McClure. All rights reserved.
//

#import "EndOfGameViewController.h"
#import <Social/Social.h>
#import <Accounts/Accounts.h>
#import "FacebookLogin.h"

@interface EndOfGameViewController ()

@end

@implementation EndOfGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)shareToFB:(id)sender {
  
  [FacebookLogin LoginServiceForFacebook:^(ACAccount *account) {
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
      if (!account) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Not logged into Facebook" message:@"Go into settings and log into Facebook." delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil];
        [alert show];
      } else {
        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
          
          SLComposeViewController *fbComposeVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
          [fbComposeVC setInitialText:@"This is where I will add text with the post"];
            //[fbComposeVC addImage:[UIImage imageNamed:@"my omage to share"]];
          
          [self presentViewController:fbComposeVC animated:YES completion:nil];
        }
      }
      }];
    }];

  
}

@end
