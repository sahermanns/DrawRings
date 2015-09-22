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

- (IBAction)goBack:(UIButton *)sender;


- (IBAction)category1Pressed:(UIButton *)sender;
- (IBAction)category2Pressed:(UIButton *)sender;
- (IBAction)category3Pressed:(UIButton *)sender;

@property (strong,nonatomic) NSMutableArray *category1Array;
@property (strong,nonatomic) NSMutableArray *category2Array;
@property (strong,nonatomic) NSMutableArray *category3Array;
@property (strong,nonatomic) NSMutableArray *selectedArray;

@end

@implementation ChooseCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  //NSString *cat1item1 = @"The Godfather";
  
  _category1Array = [NSMutableArray arrayWithObjects: @"The Godfather", @"Rocky", @"Rushmore", @"Back to the Future II", @"Alice in Wonderland", @"Boogie Nights", @"Mission: Impossible", @"Annie Hall", @"Star Trek", nil];
  
  _category2Array = [NSMutableArray arrayWithObjects: @"Madonna", @"Beethoven", @"Heartbreak Hotel", @"U Can't Touch This", @"Thriller", @"The Sound of Silence", @"I Feel Pretty", @"November Rain", @"Paranoid Android", nil];
  
  _category3Array = [NSMutableArray arrayWithObjects: @"Donald Trump", @"The French Revolution", @"Neil Armstrong", @"Ed's Moustache", @"Gilligan's Island", @"Thomas Edison", @"1776", @"Elon Musk", @"World War I", nil];
  
  
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
    ChooseOptionViewController *chooseOptionVC = [segue destinationViewController];
    chooseOptionVC.chosenCategory = self.categoryPressed;
    chooseOptionVC.passedArrayOfOptions = self.selectedArray;
  }
}


- (IBAction)goBack:(UIButton *)sender {
   [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)category1Pressed:(UIButton *)sender {
  self.categoryPressed = sender.titleLabel.text;
  self.selectedArray = _category1Array;
 [self performSegueWithIdentifier:@"ShowOptions" sender:self];
}

- (IBAction)category2Pressed:(UIButton *)sender {
  self.categoryPressed = sender.titleLabel.text;
  self.selectedArray = _category2Array;
  [self performSegueWithIdentifier:@"ShowOptions" sender:self];
}
- (IBAction)category3Pressed:(UIButton *)sender {
  self.categoryPressed = sender.titleLabel.text;
  self.selectedArray = _category3Array;
  [self performSegueWithIdentifier:@"ShowOptions" sender:self];
}

@end
