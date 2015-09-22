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

- (IBAction)option1Pressed:(UIButton *)sender;
- (IBAction)option2Pressed:(UIButton *)sender;
- (IBAction)option3Pressed:(UIButton *)sender;
- (IBAction)option4Pressed:(UIButton *)sender;

@end

@implementation ChooseOptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
  self.chosenCategoryLabel.text = self.chosenCategory;
//  NSLog(@"chosen category %@", self.chosenCategory);
  NSLog(@"PASSED ARRAY COUNT IN CHOOSE OPTION VC: %lu", (unsigned long)_passedArrayOfOptions.count);
  _pickedObjects = [NSMutableArray new];
  
  int remaining = 4;
  
  if (_passedArrayOfOptions.count >= remaining) {
    while (remaining > 0) {
      id item = _passedArrayOfOptions[arc4random_uniform(_passedArrayOfOptions.count)];
      
      if (![_pickedObjects containsObject:item]) {
        [_pickedObjects addObject:item];
        remaining--;
      }
    }
  }
  
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
  if([[segue identifier] isEqualToString:@"OptionChosenStartGame"]){
    PassItOnViewController *passItOnVC = (PassItOnViewController *)[segue destinationViewController];
    passItOnVC.stringToPass = _selectedOption;
//    cvc.contacts = self.contacts;
//    cvc.delegate = self;
  }
}



- (IBAction)goBack:(UIButton *)sender {
  [self.navigationController popViewControllerAnimated:YES];
}
@end
