//
//  FacebookLogin.h
//  words-drawings
//
//  Created by Sarah Hermanns on 9/21/15.
//  Copyright © 2015 Matthew McClure. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Accounts/Accounts.h>

@interface FacebookLogin : NSObject

+(void) LoginServiceForFacebook:(void(^)(ACAccount *))completionHandler;

@end
