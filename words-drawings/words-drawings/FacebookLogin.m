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
  NSDictionary *options = @{
                            @"ACFacebookAppIdKey" : @"1484481991878533",
                            @"ACFacebookPermissionsKey" : @[@"email"],
                            @"ACFacebookAudienceKey" : ACFacebookAudienceFriends};
  ACAccountType *faceBook= [store accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierFacebook];
  [store requestAccessToAccountsWithType:faceBook options: options completion:^(BOOL granted, NSError *error) {
    if (!granted) {
        completionHandler(nil);
      
    } else {
      NSArray *facebookAccounts = [store accountsWithAccountType:faceBook];
      ACAccount *facebookAccount = [facebookAccounts objectAtIndex:0];
      completionHandler(facebookAccount);
    }
  }];
}


@end
