//
//  AppDelegate.h
//  words-drawings
//
//  Created by Matthew McClure on 9/11/15.
//  Copyright © 2015 Matthew McClure. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <Accounts/Accounts.h>
#import "FacebookLogin.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

+(void) LoginServiceForFacebook:(void(^)(ACAccount *))completionHandler;

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

//@property (strong,nonatomic) NSString *seedSentence;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

