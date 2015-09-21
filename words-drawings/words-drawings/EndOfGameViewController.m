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

  if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
    
    SLComposeViewController *fbSheetOBJ = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    [fbSheetOBJ setInitialText:@"This is where I will add text with the post"];
    [fbSheetOBJ addImage:[UIImage imageNamed:@"my omage to share"]];
    
    [self presentViewController:fbSheetOBJ animated:YES completion:nil];
  }
  
}

@end
