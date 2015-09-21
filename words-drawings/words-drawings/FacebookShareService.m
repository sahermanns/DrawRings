//
//  FacebookShareService.m
//  words-drawings
//
//  Created by Sarah Hermanns on 9/21/15.
//  Copyright © 2015 Matthew McClure. All rights reserved.
//

#import "FacebookShareService.h"
#import <Social/Social.h>
#import <Accounts/Accounts.h>

@implementation FacebookShareService

  
  if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
    
    SLComposeViewController *fbSheetOBJ = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    [fbSheetOBJ setInitialText:@"This is where I will add text with the post"];
    [fbSheetOBJ addImage:[UIImage imageNamed:@"my omage to share"]];
    
    [self presentViewController:fbSheetOBJ animated:YES completion:nil];
  }  


@end


//(IBAction)btnFacebookSharing_Clicked:(id)sender {
//  if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
//    SLComposeViewController * fbSheetOBJ = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
//    
//    [fbSheetOBJ setInitialText:@"Post from my iOS application"];
//    [fbSheetOBJ addURL:[NSURL URLWithString:@"http://www.weblineindia.com"]];
//    [fbSheetOBJ addImage:[UIImage imageNamed:@"my_image_to_share.png"]];
//    
//    [self presentViewController:fbSheetOBJ animated:YES completion:Nil];
//  }
//}