//
//  FacebookLogin.m
//  words-drawings
//
//  Created by Sarah Hermanns on 9/21/15.
//  Copyright © 2015 Matthew McClure. All rights reserved.
//

#import "FacebookLogin.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>

@interface FacebookLogin ()

@end

@implementation FacebookLogin

+(void) LoginServiceForFacebook:(void(^)(ACAccount *))completionHandler {
  ACAccountStore *store = [[ACAccountStore alloc] init];
  ACAccountType *faceBook= [store accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierFacebook];
  [store requestAccessToAccountsWithType:faceBook options: nil completion:^(BOOL granted, NSError *error) {
    if (granted) {
      NSArray *facebookAccounts = [store accountsWithAccountType:faceBook];
      if (facebookAccounts == nil || [facebookAccounts count] == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Not logged into Facebook" message:@"Go into settings and log into Facebook." delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil];
        [alert show];
      } else {
        ACAccount *facebookAccount = [facebookAccounts objectAtIndex:0];
        completionHandler(facebookAccount);
      }
    }
  }];
}


@end
