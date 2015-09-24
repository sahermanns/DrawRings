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
#import <ImageIO/ImageIO.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface EndOfGameViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *gameTokenImage;
@property (strong, nonatomic) NSMutableArray *gameTokenArray;



@end

@implementation EndOfGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  self.gameTokenArray = [[NSMutableArray alloc] init];
  for (int i = 0; i < self.gameTokenArray.count; i++) {
    UIImage *screenShot = [UIImage imageNamed:[NSString stringWithFormat:@"screen_%d", i]];
    [self.gameTokenArray addObject:screenShot];
  }
  
  self.gameTokenImage.animationImages = self.gameTokenArray;
  self.gameTokenImage.animationRepeatCount = 1;
  self.gameTokenImage.animationDuration = .25;
  
//  self.gameTokenImage.image = self.gameTokenArray[0];
  
 
}

- (IBAction)animateGameGIF:(id)sender {
  if (!self.gameTokenImage.isAnimating) {
    [self.gameTokenImage startAnimating];
    [self.gameTokenImage setImage:[self.gameTokenImage.animationImages lastObject]];
    [self performSelector:@selector(gameTokenAnimationDidFinish) withObject:nil afterDelay:self.gameTokenImage.animationDuration];
  }
}

-(void)gameTokenAnimationDidFinish {
  NSArray *reversedImages = [[self.gameTokenImage.animationImages reverseObjectEnumerator] allObjects];
  self.gameTokenImage.animationImages = reversedImages;
}

-(void)exportGIF {
  
  UIImage *screen1 = [UIImage imageNamed:@"screen1.jpeg"];
  UIImage *screen2 = [UIImage imageNamed:@"screen2.jpeg"];
  
  NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"animated.gif"];
  CGImageDestinationRef destination = CGImageDestinationCreateWithURL((CFURLRef)[NSURL fileURLWithPath:path], kUTTypeGIF, self.gameTokenArray.count, NULL);
  int count = (int)self.gameTokenArray.count;
  
  NSDictionary *frameProperties = [NSDictionary dictionaryWithObject:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:count] forKey:(NSString *)kCGImagePropertyGIFDelayTime]
                                                              forKey:(NSString *)kCGImagePropertyGIFDictionary];
  NSDictionary *gifProperties = [NSDictionary dictionaryWithObject:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:(NSString *)kCGImagePropertyGIFLoopCount]
                                                            forKey:(NSString *)kCGImagePropertyGIFDictionary];
  CGImageDestinationAddImage(destination, screen1.CGImage, (CFDictionaryRef)frameProperties);
  CGImageDestinationAddImage(destination, screen2.CGImage, (CFDictionaryRef)frameProperties);
  CGImageDestinationSetProperties(destination, (CFDictionaryRef)gifProperties);
  CGImageDestinationFinalize(destination);
  CFRelease(destination);
  NSLog(@"animated GIF file created at %@", path);
 
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
            //[fbComposeVC addImage:[UIImage imageNamed:@"my image to share"]];
          
          [self presentViewController:fbComposeVC animated:YES completion:nil];
        }
      }
      }];
    }];

  
}

@end
