//
//  ChooseOptionViewController.m
//  words-drawings
//
//  Created by Matthew McClure on 9/20/15.
//  Copyright © 2015 Matthew McClure. All rights reserved.
//

#import "ChooseOptionViewController.h"
#import "ChooseCategoryViewController.h"
#import "PassItOnViewController.h"
//#import "ScrollTableViewController.h"
#include <stdlib.h>

@interface ChooseOptionViewController ()

@property (weak, nonatomic) IBOutlet UILabel *chosenCategoryLabel;

- (IBAction)goBack:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIButton *option1Button;
@property (weak, nonatomic) IBOutlet UIButton *option2Button;
@property (weak, nonatomic) IBOutlet UIButton *option3Button;
@property (weak, nonatomic) IBOutlet UIButton *option4Button;

@property (strong, nonatomic) NSMutableArray *pickedObjects;
@property (strong, nonatomic) NSString *selectedOption;

@property (strong,nonatomic) NSMutableArray *filmArray;
@property (strong,nonatomic) NSMutableArray *tvArray;
@property (strong,nonatomic) NSMutableArray *theatreArray;
@property (strong,nonatomic) NSMutableArray *musicArray;
@property (strong,nonatomic) NSMutableArray *sportsArray;
@property (strong,nonatomic) NSMutableArray *historyArray;
@property (strong,nonatomic) NSMutableArray *scienceArray;
@property (strong,nonatomic) NSMutableArray *natureArray;
@property (strong,nonatomic) NSMutableArray *geographyArray;
@property (strong,nonatomic) NSMutableArray *artArray;
@property (strong,nonatomic) NSMutableArray *literatureArray;
@property (strong,nonatomic) NSMutableArray *zanyMiscellanyArray;

- (IBAction)option1Pressed:(UIButton *)sender;
- (IBAction)option2Pressed:(UIButton *)sender;
- (IBAction)option3Pressed:(UIButton *)sender;
- (IBAction)option4Pressed:(UIButton *)sender;

@end

@implementation ChooseOptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  NSLog(@"%ld %ld", (long)self.numberOfPlayers, (long)self.durationOfRound);
  self.chosenCategoryLabel.text = self.chosenCategory;

  _pickedObjects = [[NSMutableArray alloc] init];
  
  //_pickedObjects = _filmArray;
  
  if ([_chosenCategory isEqualToString:@"FILM"]){
    _pickedObjects = _filmArray;
  } else if ([_chosenCategory isEqualToString:@"TV"]){
    _pickedObjects = _tvArray;
  } else if ([_chosenCategory isEqualToString:@"THEATRE"]){
    _pickedObjects = _theatreArray;
  } else if ([_chosenCategory isEqualToString:@"MUSIC"]){
    _pickedObjects = _musicArray;
  } else if ([_chosenCategory isEqualToString:@"SPORTS"]){
    _pickedObjects = _sportsArray;
  } else if ([_chosenCategory isEqualToString:@"HISTORY"]){
    _pickedObjects = _historyArray;
  } else if ([_chosenCategory isEqualToString:@"SCIENCE"]){
    _pickedObjects = _scienceArray;
  } else if ([_chosenCategory isEqualToString:@"NATURE"]){
    _pickedObjects = _natureArray;
  } else if ([_chosenCategory isEqualToString:@"GEOGRAPHY"]){
    _pickedObjects = _geographyArray;
  } else if ([_chosenCategory isEqualToString:@"ART"]){
    _pickedObjects = _artArray;
  } else if ([_chosenCategory isEqualToString:@"LITERATURE"]){
    _pickedObjects = _literatureArray;
  } else if ([_chosenCategory isEqualToString:@"ZANY MISCELLANY"]){
    _pickedObjects = _zanyMiscellanyArray;
  }
  
  
  
  //int remaining = 4;
  
  //NSInteger arrayCount = [_passedArrayOfOptions count];
  /*
  if (_passedArrayOfOptions.count >= remaining) {
    while (remaining > 0) {
      id item = _passedArrayOfOptions[arc4random_uniform((u_int32_t)arrayCount)];
      
      if (![_pickedObjects containsObject:item]) {
        [_pickedObjects addObject:item];
        remaining--;
      }
    }
  }
  */
  //set text on buttons
  NSString *option1Text = (NSString *)[_pickedObjects objectAtIndex:0];
  [_option1Button setTitle: option1Text forState: UIControlStateNormal];
  NSString *option2Text = (NSString *)[_pickedObjects objectAtIndex:1];
  [_option2Button setTitle: option2Text forState: UIControlStateNormal];
  NSString *option3Text = (NSString *)[_pickedObjects objectAtIndex:2];
  [_option3Button setTitle: option3Text forState: UIControlStateNormal];
  NSString *option4Text = (NSString *)[_pickedObjects objectAtIndex:3];
  [_option4Button setTitle: option4Text forState: UIControlStateNormal];
  

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)option1Pressed:(UIButton *)sender {
  _selectedOption = sender.titleLabel.text;
  [self performSegueWithIdentifier:@"OptionChosenStartGame"sender:self];
}

- (IBAction)option2Pressed:(UIButton *)sender {
  _selectedOption = sender.titleLabel.text;
  [self performSegueWithIdentifier:@"OptionChosenStartGame"sender:self];
}

- (IBAction)option3Pressed:(UIButton *)sender {
  _selectedOption = sender.titleLabel.text;
  [self performSegueWithIdentifier:@"OptionChosenStartGame"sender:self];
}

- (IBAction)option4Pressed:(UIButton *)sender {
  _selectedOption = sender.titleLabel.text;
  [self performSegueWithIdentifier:@"OptionChosenStartGame"sender:self];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if([[segue identifier] isEqualToString:@"OptionChosenStartGame"]) {
    PassItOnViewController *passItOnVC = [segue destinationViewController];
    passItOnVC.stringToPass = _selectedOption;
    passItOnVC.numberOfPlayers = self.numberOfPlayers;
    passItOnVC.durationOfRound = self.durationOfRound;
//    cvc.contacts = self.contacts;
//    cvc.delegate = self;

  }
}



- (IBAction)goBack:(UIButton *)sender {
  [self.navigationController popViewControllerAnimated:YES];
}
@end
