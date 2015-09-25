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
#import "SouvenirCollectionViewCell.h"
#import "SketchGuess.h"
#import "ScrollTableViewController.h"

@interface EndOfGameViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) NSMutableArray *prompts;
@property (strong, nonatomic) NSMutableArray *sketches;

@property (weak, nonatomic) IBOutlet UIImageView *screenShotImage;


//@property (weak, nonatomic) IBOutlet UIImageView *gameTokenImage;
//@property (strong, nonatomic) NSMutableArray *gameTokenArray;
//

- (IBAction)cvScreenshot:(UIButton *)sender;



@end

@implementation EndOfGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
  _numberOfCells = (int)_sketchGuesses.count;
  
  for (SketchGuess *item in _sketchGuesses){
    NSLog(@"BING BONG: %@",item.description);
  }
  
//  ScrollTableViewController *scrollTVC = [[ScrollTableViewController alloc] init];
//  _sketchGuesses = scrollTVC.sketchGuesses;
//  
//  for (SketchGuess *thing in _sketchGuesses){
//    NSLog(@"Hiphophooray: %@", thing.description);
//  }
  
  _collectionView.dataSource = self;
  _collectionView.delegate = self;
  
  _prompts = [NSMutableArray arrayWithObjects: @"The Godfather", @"Woody Allen", @"Steven Spielberg", @"Rocky", @"Rushmore", @"Back to the Future II", @"Alice in Wonderland", nil];
  
  _sketches = [[NSMutableArray alloc] init];
  
  UIImage *image1 = [UIImage imageNamed:@"gradient2.jpg"];
  [_sketches addObject:image1];
  UIImage *image2 = [UIImage imageNamed:@"gradient2.jpg"];
  [_sketches addObject:image2];
  UIImage *image3 = [UIImage imageNamed:@"gradient2.jpg"];
  [_sketches addObject:image3];
  UIImage *image4 = [UIImage imageNamed:@"gradient2.jpg"];
  [_sketches addObject:image4];
  
  UINib *souvenirCell = [UINib nibWithNibName:@"souvenirCell" bundle:nil];
  [self.collectionView registerNib:souvenirCell forCellWithReuseIdentifier:@"collectionCell"];
  
//#pragma MARK - Animation 
//  self.gameTokenArray = [[NSMutableArray alloc] init];
//  for (int i = 0; i < self.gameTokenArray.count; i++) {
//    UIImage *screenShot = [UIImage imageNamed:[NSString stringWithFormat:@"screen_%d", i]];
//    [self.gameTokenArray addObject:screenShot];
//  }
//  
//  self.gameTokenImage.animationImages = self.gameTokenArray;
//  self.gameTokenImage.animationRepeatCount = 1;
//  self.gameTokenImage.animationDuration = .25;
  
//  self.gameTokenImage.image = self.gameTokenArray[0];
  
 
}

- (void)viewDidAppear:(BOOL)animated
{
  [super viewDidAppear:animated];
  //YOUR STUFF
  //GOES HERE
}

#pragma mark -

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return _numberOfCells;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  SouvenirCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
  if (indexPath.row == 0){
    cell.promptLabel.text = [_sketchGuesses[indexPath.row] prompt];
    cell.sketchImage.image = [[_sketchGuesses[indexPath.row] sketch] sketchImage];
  } else if ((indexPath.row > 0) && (indexPath.row < _sketchGuesses.count - 1)) {
    SketchGuess *previousSketchGuess = _sketchGuesses[indexPath.row-1];
    cell.promptLabel.text = previousSketchGuess.guess.guessString;
    cell.sketchImage.image = _sketchGuesses[indexPath.row];
  } else {
    cell.promptLabel.text = [[_sketchGuesses[indexPath.row] guess] guessString];
    cell.sketchImage.image = [[_sketchGuesses[indexPath.row] sketch] sketchImage];
  }
  return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
  
  CGFloat CVwidth = collectionView.frame.size.width;
  CGFloat CVheight = collectionView.frame.size.height;
  return CGSizeMake(CVwidth, CVheight);
}


//- (IBAction)animateGameGIF:(id)sender {
//  if (!self.gameTokenImage.isAnimating) {
//    [self.gameTokenImage startAnimating];
//    [self.gameTokenImage setImage:[self.gameTokenImage.animationImages lastObject]];
//    [self performSelector:@selector(gameTokenAnimationDidFinish) withObject:nil afterDelay:self.gameTokenImage.animationDuration];
//  }
//}

//-(void)gameTokenAnimationDidFinish {
//  NSArray *reversedImages = [[self.gameTokenImage.animationImages reverseObjectEnumerator] allObjects];
//  self.gameTokenImage.animationImages = reversedImages;
//}

//#pragma MARK- Export image as GIF
//-(void)exportGIF {
//  
//  UIImage *screen1 = [UIImage imageNamed:@"screen1.jpeg"];
//  UIImage *screen2 = [UIImage imageNamed:@"screen2.jpeg"];
//  
//  NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"animated.gif"];
//  CGImageDestinationRef destination = CGImageDestinationCreateWithURL((CFURLRef)[NSURL fileURLWithPath:path], kUTTypeGIF, self.gameTokenArray.count, NULL);
//  int count = (int)self.gameTokenArray.count;
//  
//  NSDictionary *frameProperties = [NSDictionary dictionaryWithObject:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:count] forKey:(NSString *)kCGImagePropertyGIFDelayTime]
//                                                              forKey:(NSString *)kCGImagePropertyGIFDictionary];
//  NSDictionary *gifProperties = [NSDictionary dictionaryWithObject:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:(NSString *)kCGImagePropertyGIFLoopCount]
//                                                            forKey:(NSString *)kCGImagePropertyGIFDictionary];
//  CGImageDestinationAddImage(destination, screen1.CGImage, (CFDictionaryRef)frameProperties);
//  CGImageDestinationAddImage(destination, screen2.CGImage, (CFDictionaryRef)frameProperties);
//  CGImageDestinationSetProperties(destination, (CFDictionaryRef)gifProperties);
//  CGImageDestinationFinalize(destination);
//  CFRelease(destination);
//  NSLog(@"animated GIF file created at %@", path);
// 
//}



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

- (IBAction)cvScreenshot:(UIButton *)sender {
  
  //this works
  CGRect rect = [_collectionView bounds];
  UIGraphicsBeginImageContextWithOptions(rect.size,YES,0.0f);
  CGContextRef context = UIGraphicsGetCurrentContext();
  [_collectionView.layer renderInContext:context];
  UIImage *capturedImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  _screenShotImage.image = capturedImage;
  
}
@end
