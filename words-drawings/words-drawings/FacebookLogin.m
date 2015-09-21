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


//import Foundation
//import Accounts
//
//class LoginService {
//  class func loginForTwitter (completionHandler : (String?, ACAccount?) -> (Void)) {
//    let accountStore = ACAccountStore()
//    let accountType = accountStore.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierTwitter)
//    accountStore.requestAccessToAccountsWithType(accountType, options: nil) { (successful, error) -> Void in
//      if let error = error {
//        completionHandler("there was an error while accessing your account", nil)
//      } else {
//        if successful {
//          if let account = accountStore.accountsWithAccountType(accountType).first as? ACAccount {
//            completionHandler(nil,account)
//          } else {
//            completionHandler("Twitter service is required for this app", nil)
//          }
//        }
//      }
//    }
//  }
//}