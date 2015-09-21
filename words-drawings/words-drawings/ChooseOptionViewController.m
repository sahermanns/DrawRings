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

@interface ChooseOptionViewController ()

@property (weak, nonatomic) IBOutlet UILabel *chosenCategoryLabel;

- (IBAction)option1Pressed:(UIButton *)sender;
- (IBAction)option2Pressed:(UIButton *)sender;
- (IBAction)option3Pressed:(UIButton *)sender;
- (IBAction)option4Pressed:(UIButton *)sender;

@end

@implementation ChooseOptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  self.chosenCategoryLabel.text = @"[CATEGORY]";
  NSLog(@"%@", self.chosenCategory);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)option1Pressed:(UIButton *)sender {
  [self performSegueWithIdentifier:@"OptionChosenStartGame"sender:self];
}

- (IBAction)option2Pressed:(UIButton *)sender {
  [self performSegueWithIdentifier:@"OptionChosenStartGame"sender:self];
}

- (IBAction)option3Pressed:(UIButton *)sender {
  [self performSegueWithIdentifier:@"OptionChosenStartGame"sender:self];
}

- (IBAction)option4Pressed:(UIButton *)sender {
  [self performSegueWithIdentifier:@"OptionChosenStartGame"sender:self];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
  if([[segue identifier] isEqualToString:@"OptionChosenStartGame"]){
    PassItOnViewController *passItOnVC = (PassItOnViewController *)[segue destinationViewController];
//    cvc.contacts = self.contacts;
//    cvc.delegate = self;
  }
}



@end
