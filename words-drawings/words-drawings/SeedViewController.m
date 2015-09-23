//
//  SeedViewController.m
//  words-drawings
//
//  Created by Matthew McClure on 9/11/15.
//  Copyright © 2015 Matthew McClure. All rights reserved.
//

#import "SeedViewController.h"
#import "PassItOnViewController.h"
#import "ChooseCategoryViewController.h"

@interface SeedViewController ()

@property (weak, nonatomic) IBOutlet UITextField *seedSentenceTextField;
- (IBAction)doneButton:(UIButton *)sender;

@end

@implementation SeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doneButton:(UIButton *)sender {
  self.seedSentence = [_seedSentenceTextField text];
  NSLog(@"%@", self.seedSentence);
  
  [self performSegueWithIdentifier:@"showPassItOnVC" sender:self];
}

 #pragma mark - Navigation

 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
   if ([segue.identifier isEqual: @"showPassItOnVC"]) {
     PassItOnViewController *passItOnVC = [segue destinationViewController];
     passItOnVC.stringToPass = self.seedSentence;
   }
 }
 
@end
