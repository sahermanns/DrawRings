//
//  ChooseCategoryViewController.m
//  words-drawings
//
//  Created by Matthew McClure on 9/20/15.
//  Copyright © 2015 Matthew McClure. All rights reserved.
//

#import "ChooseCategoryViewController.h"
#import "ChooseOptionViewController.h"

@interface ChooseCategoryViewController ()

@property (strong,nonatomic) NSString *categoryPressed;



- (IBAction)category1Pressed:(UIButton *)sender;
- (IBAction)category2Pressed:(UIButton *)sender;
- (IBAction)category3Pressed:(UIButton *)sender;

@end

@implementation ChooseCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
//    ExistingReservationsViewController *existingReservationsVC = [[ExistingReservationsViewController alloc] init];
//    [self.navigationController pushViewController:existingReservationsVC animated:YES];
    ChooseOptionViewController *chooseOptionVC = [[ChooseOptionViewController alloc] init];
    chooseOptionVC.chosenCategory = self.categoryPressed;
    //***i know this isn't correct:
    [self.navigationController pushViewController:chooseOptionVC animated:YES];
  }
}


- (IBAction)category1Pressed:(UIButton *)sender {
  self.categoryPressed = sender.titleLabel.text;
  NSLog(@"category1Pressed() %@", self.categoryPressed);
 [self performSegueWithIdentifier:@"ShowOptions" sender:self];
}

- (IBAction)category2Pressed:(UIButton *)sender {
}
- (IBAction)category3Pressed:(UIButton *)sender {
}
@end
