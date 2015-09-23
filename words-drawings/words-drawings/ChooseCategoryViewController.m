//
//  ChooseCategoryViewController.m
//  words-drawings
//
//  Created by Matthew McClure on 9/20/15.
//  Copyright © 2015 Matthew McClure. All rights reserved.
//

#import "ChooseCategoryViewController.h"
#import "ChooseOptionViewController.h"
#import <stdlib.h>

@interface ChooseCategoryViewController ()

@property (strong,nonatomic) NSString *categoryPressed;

- (IBAction)goBack:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIButton *category1Button;
@property (weak, nonatomic) IBOutlet UIButton *category2Button;
@property (weak, nonatomic) IBOutlet UIButton *category3Button;

- (IBAction)category1Pressed:(UIButton *)sender;
- (IBAction)category2Pressed:(UIButton *)sender;
- (IBAction)category3Pressed:(UIButton *)sender;

@property (strong,nonatomic) NSMutableArray *categoriesArray;
@property (strong,nonatomic) NSMutableArray *thisRoundsArray;
@property (strong,nonatomic) NSMutableArray *selectedArray;
@property (strong,nonatomic) NSMutableArray *numArray;

@end

@implementation ChooseCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
  _thisRoundsArray = [[NSMutableArray alloc] init];
  
  _categoriesArray = [NSMutableArray arrayWithObjects: @"FILM", @"TV", @"THEATRE", @"MUSIC", @"SPORTS", @"HISTORY", @"SCIENCE", @"NATURE", @"GEOGRAPHY", @"ART", @"LITERATURE", @"ZANY MISCELLANY", nil];
  
  NSInteger j = [_categoriesArray count];
  
  NSLog(@"this round's array before: %lu", (unsigned long)_thisRoundsArray.count);
  int remaining = 3;
  
  if (_categoriesArray.count >= remaining) {
    while (remaining > 0) {
      NSInteger k = arc4random_uniform((u_int32_t)j) % 12;
      NSLog(@"k = %ld", (long)k);
      
      NSString *string = _categoriesArray[k];
      NSLog(@"%@", string);
      if (![_thisRoundsArray containsObject:string]){
        [_thisRoundsArray addObject:string];
        remaining--;
      }
    }
  }
  NSLog(@" thisRoundsArray after: %lu", (unsigned long)_thisRoundsArray.count);
  
  NSLog(@"%@",_thisRoundsArray[0]);
  
  //set text on buttons
  [_category1Button setTitle: _thisRoundsArray[0] forState: UIControlStateNormal];
  [_category2Button setTitle: _thisRoundsArray[1] forState: UIControlStateNormal];
  [_category3Button setTitle: _thisRoundsArray[2] forState: UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([[segue identifier] isEqualToString:@"ShowOptions"])
  {
    ChooseOptionViewController *chooseOptionVC = (ChooseOptionViewController *)[segue destinationViewController];
    chooseOptionVC.chosenCategory = self.categoryPressed;
    chooseOptionVC.numberOfPlayers = self.numberOfPlayers;
    chooseOptionVC.durationOfRound = self.durationOfRound;
  }
}

- (IBAction)goBack:(UIButton *)sender {
   [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)category1Pressed:(UIButton *)sender {
  NSLog(@"YOU PRESSED %@", sender.titleLabel.text);
  self.categoryPressed = sender.titleLabel.text;
  //NSLog(@"%@", self.categoryPressed);
  //[self selectArray:self.categoryPressed];
  //self.selectedArray = _filmArray;
  //NSLog(@"ARRAY WAS>>> %@", self.selectedArray);
 [self performSegueWithIdentifier:@"ShowOptions" sender:self];
}

- (IBAction)category2Pressed:(UIButton *)sender {
  self.categoryPressed = _thisRoundsArray[1];
  NSLog(@"%@", self.categoryPressed);
  //[self selectArray:self.categoryPressed];
  //self.selectedArray = _filmArray;
  //NSLog(@"ARRAY WAS>>> %@", self.selectedArray);
  [self performSegueWithIdentifier:@"ShowOptions" sender:self];
}
- (IBAction)category3Pressed:(UIButton *)sender {
  self.categoryPressed = _thisRoundsArray[2];
  NSLog(@"%@", self.categoryPressed);
  //[self selectArray:self.categoryPressed];
  //self.selectedArray = _filmArray;
  //NSLog(@"ARRAY WAS>>> %@", self.selectedArray);
  [self performSegueWithIdentifier:@"ShowOptions" sender:self];
}

@end
