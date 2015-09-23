//
//  InstructionViewController.m
//  words-drawings
//
//  Created by Edrease Peshtaz on 9/21/15.
//  Copyright © 2015 Matthew McClure. All rights reserved.
//

#import "InstructionViewController.h"
#import "MainViewController.h"
@interface InstructionViewController ()
- (IBAction)closeInstructions:(id)sender;

@end

@implementation InstructionViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.alpha = 1;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)closeInstructions:(id)sender {
  
  [UIView animateWithDuration:0.4 animations:^{
    self.view.alpha = 0;
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
  }];
}
@end
